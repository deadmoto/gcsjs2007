unit fond;

interface

uses
  Classes,
  Controls,
  Dialogs,
  ExtCtrls,
  Forms,
  Graphics,
  Grids,
  Messages,
  StdCtrls,
  SysUtils,
  Variants,
  Windows;

type
  TForm6 = class(TForm)
    Panel1:      TPanel;
    StringGrid1: TStringGrid;
    Panel2:      TPanel;
    Label1:      TLabel;
    Label3:      TLabel;
    Edit1:       TEdit;
    Edit2:       TEdit;
    FlowPanel1:  TFlowPanel;
    Button1:     TButton;
    Button2:     TButton;
    Button3:     TButton;
    Button4:     TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
  private
    { Private declarations }
    oldid: integer;//������� �������� ����� �� ���������
    procedure SetDefault;
  public
    { Public declarations }
    status: integer;//0 - ������ ��� ������, 1 - ������
  end;

var
  Form6: TForm6;

implementation

uses
  datamodule, main, service, MyTypes;

{$R *.dfm}

procedure TForm6.SetDefault;
{ ������� �� ��������� �� ������� �������� ������ }
var
  i: integer;
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from fond');
    SQL.Add('order by id_fond');
    Open;
    First;
  end;

  FormerStringGrid(StringGrid1, TStringArray.Create('���', '������������'),
    TIntArray.Create(25, 270), DModule.Query1.RecordCount + 1);

  for i := 0 to DModule.Query1.RecordCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := DModule.Query1.FieldByName('id_fond').Value;
    StringGrid1.Cells[1, i + 1] := DModule.Query1.FieldByName('namefond').Value;
    DModule.Query1.Next;
  end;

end;

procedure TForm6.StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  if ARow <> 0 then
  begin
    Edit1.Text := StringGrid1.Cells[1, ARow];
    Edit2.Text := StringGrid1.Cells[0, ARow];
    if Edit2.Text <> '' then
      oldid := StrToInt(Edit2.Text);
  end;
end;

procedure TForm6.Button4Click(Sender: TObject);
{ ����� }
begin
  Form6.Close;
end;

procedure TForm6.Button1Click(Sender: TObject);
{ �������� ���� }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_fond');
      SQL.Add('from fond');
      SQL.Add('where (id_fond=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_fond');
        SQL.Add('from fond');
        SQL.Add('where (namefond = :name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty then
          flag := True
        else
          flag := False;
        Close;
      end
      else
      begin
        flag := False;
        Close;
      end;
      if flag then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into fond');
        SQL.Add('values (:id, :name)');
        ParamByName('id').AsInteger  := StrToInt(Edit2.Text);
        ParamByName('name').AsString := Edit1.Text;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else
      begin
        ShowMessage('������������ ����� � ��� ������ ���� ���������!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('��� ���� ����� ������ ���� ���������!');
end;

procedure TForm6.Button2Click(Sender: TObject);
{ �������� ���� }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_fond');
      SQL.Add('from fond');
      SQL.Add('where (id_fond=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty or not IsEmpty and
        (FieldByName('id_fond').AsInteger = oldid) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_fond');
        SQL.Add('from fond');
        SQL.Add('where (namefond = :name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_fond').AsInteger = oldid) then
          flag := True
        else
          flag := False;
        Close;
      end
      else
      begin
        flag := False;
        Close;
      end;
      if flag then
      begin
        Close;
        SQL.Clear;
        SQL.Add('update fond');
        SQL.Add('set namefond = :name');
        SQL.Add('where id_fond = :id');
        ParamByName('id').AsInteger  := oldid;
        ParamByName('name').AsString := Edit1.Text;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else
      begin
        ShowMessage('������������ ����� � ��� ������ ���� ���������!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('��� ���� ����� ������ ���� ���������!');
end;

procedure TForm6.Button3Click(Sender: TObject);
{ ������� ���� }
begin
  with DModule.Query1 do
  begin
    if not IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from fond');
      SQL.Add('where id_fond = :id');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
      Open;
    end;
  end;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  SetDefault;
  if status = 0 then
  begin
    Button1.Enabled := False;
    Button2.Enabled := False;
    Button3.Enabled := False;
  end
  else
  begin
    Button1.Enabled := True;
    Button2.Enabled := True;
    Button3.Enabled := True;
  end;
end;

procedure TForm6.Edit2Exit(Sender: TObject);
begin
  CheckInt(Edit2);
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DModule.Query1.Close;
end;

procedure TForm6.Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckInt(edit2);
end;

procedure TForm6.Edit1Exit(Sender: TObject);
begin
  CheckRus(Edit1);
end;

procedure TForm6.Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckRus(Edit1);
end;

end.
