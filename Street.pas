unit Street;

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
  TForm5 = class(TForm)
    Panel1:      TPanel;
    StringGrid1: TStringGrid;
    Panel2:      TPanel;
    Label3:      TLabel;
    Edit2:       TEdit;
    Edit1:       TEdit;
    Label1:      TLabel;
    CheckBox1:   TCheckBox;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit2Exit(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
  private
    { Private declarations }
    oldid: integer;//������� �������� ���� ���
    procedure SetDefault;
  public
    { Public declarations }
    status: integer;//������ �������� �����: 0 - ������ ��� ������, 1 - ������
  end;

var
  Form5: TForm5;

implementation

uses
  datamodule, main, service, MyTypes;

{$R *.dfm}

procedure TForm5.SetDefault;
{*******************************************************************************
  ��������� SetDefault ������� ������ ��� ������� ���� ������� �� ������� ����.
*******************************************************************************}
var
  i: integer;
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from strt');
    SQL.Add('order by id_street');
    Open;
    First;
  end;

  FormerStringGrid(StringGrid1, TStringArray.Create('���', '������������', '������'),
    TIntArray.Create(25, 275, 40), DModule.Query1.RecordCount + 1);

  for i := 0 to DModule.Query1.RecordCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := DModule.Query1.FieldByName('id_street').Value;
    StringGrid1.Cells[1, i + 1] := DModule.Query1.FieldByName('namestreet').Value;
    StringGrid1.Cells[2, i + 1] := DModule.Query1.FieldByName('status').Value;
    DModule.Query1.Next;
  end;
end;

procedure TForm5.StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  if ARow <> 0 then
  begin
    Edit1.Text := StringGrid1.Cells[1, ARow];
    Edit2.Text := StringGrid1.Cells[0, ARow];
    if StringGrid1.Cells[2, ARow] <> '' then
      CheckBox1.Checked := variant(StringGrid1.Cells[2, ARow]);
    if Edit2.Text <> '' then
      oldid := StrToInt(Edit2.Text);
  end;
end;

procedure TForm5.Button4Click(Sender: TObject);
{*******************************************************************************
  ��������� Button4Click ������������ ������� ������� ����� �� �����. �����������
  �������� �������� �����.
*******************************************************************************}
begin
  Form5.Close;
end;

procedure TForm5.Button1Click(Sender: TObject);
{*******************************************************************************
  ��������� Button1Click ������������ ������� ������� �������� �� �����.
  ���� ��� ���� ����� ��������� � � ������� ��� ������ � ������ �������, ��
  ���������� ���������� ������ � ������� ����.
  ���� ���� �� ���� ���� ����� �� ��������� ��� � ������� ���������� ������ �
  ������ �������, �� ���������� �� ���������� � �������� ��������������� ���������.
*******************************************************************************}
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_street');
      SQL.Add('from strt');
      SQL.Add('where (id_street=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_street');
        SQL.Add('from strt');
        SQL.Add('where (namestreet = :name)');
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
        SQL.Add('insert into strt');
        SQL.Add('values (:id, :name,:st)');
        ParamByName('id').AsInteger  := StrToInt(Edit2.Text);
        ParamByName('name').AsString := Edit1.Text;
        if CheckBox1.Checked then
          ParamByName('st').AsInteger := 1
        else
          ParamByName('st').AsInteger := 0;
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('������������ ����� � ��� ������ ���� ���������!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('��� ���� ����� ������ ���� ���������!');
end;

procedure TForm5.Button2Click(Sender: TObject);
{*******************************************************************************
  ��������� Button2Click ������������ ������� ������� �������� �� �����.
  ���� ��� ���� ����� ���������, �� ����������� ���������� �� � ������� ������ �
  ������ �������. ���� �� ����������, �� ���������� ���������� ������ � �������.
  ���� � ������� ���������� ������ � ����� �� id, �� ������������ ������ � ��
  ��������� � ������������ ������ �������, �� ���������� ��������� ������.
  ���� ���� �� ���� ���� ����� �� ��������� ��� � ������� ������������ ���������
  � ������������� ������ ������, �� ��������� �� ���������� � ��������
  ��������������� ���������.
*******************************************************************************}
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_street');
      SQL.Add('from strt');
      SQL.Add('where (id_street=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty or not IsEmpty and
        (FieldByName('id_street').AsInteger = oldid) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_street');
        SQL.Add('from strt');
        SQL.Add('where (namestreet = :name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_street').AsInteger = oldid) then
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
        SQL.Add('update strt');
        SQL.Add('set namestreet = :name,status=:st');
        SQL.Add('where id_street = :id');
        ParamByName('id').AsInteger  := oldid;
        ParamByName('name').AsString := Edit1.Text;
        if CheckBox1.Checked then
          ParamByName('st').AsInteger := 1
        else
          ParamByName('st').AsInteger := 0;
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('������������ ����� � ��� ������ ���� ���������!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('��� ���� ����� ������ ���� ���������!');
end;

procedure TForm5.Button3Click(Sender: TObject);
{*******************************************************************************
  ��������� Button3Click ������������ ������� ������� ������� �� �����. �� �������
  ��������� ������, ������� ������������� �������� id.
*******************************************************************************}
begin
  with DModule.Query1 do
  begin
    if not IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from strt');
      SQL.Add('where (id_street = :id)');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
    end;
  end;
end;

procedure TForm5.FormShow(Sender: TObject);
{*******************************************************************************
  ��������� FormShow ������������ ������� OnShow �����. � StringGrid1 �����������
  ������, � ����� ����� ���������� �������� 1 ������. � ����������� �� �������
  �������� ����� ����������� ������ ���������� ������������(������) ���
  ����������(������) ��� �������.
*******************************************************************************}
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

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  ��������� FormClose ��������� Query1, ������� ������������ ��� ������
  � ���� unit.
*******************************************************************************}
begin
  DModule.Query1.Close;
end;

procedure TForm5.Edit2Exit(Sender: TObject);
{*******************************************************************************
  ��������� Edit2Exit ������������ ������ ������ ����� �����. ���� ������ ��
  �������� ����� ������, �� ��������������� ����.
*******************************************************************************}
begin
  CheckInt(Edit2);
end;

procedure TForm5.Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{*******************************************************************************
  ��������� Edit2KeyDown ������������ ������� ������� enter. ���� ������ ��
  �������� ����� ������, �� ��������������� ����.
*******************************************************************************}
begin
  if Key = (vk_return) then
    CheckInt(Edit2);
end;

procedure TForm5.Edit1Exit(Sender: TObject);
{*******************************************************************************
  ��������� Edit1Exit ������������ ������ ������ ����� �����. ���� ������ ��������
  ��������������� �������, �� �������� ���������, � ������ ���������� ������.
*******************************************************************************}
begin
  CheckRus(Edit1);
end;

procedure TForm5.Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{*******************************************************************************
  ��������� Edit1KeyDown ������������ ������� ������� enter. ���� ������ ��������
  ��������������� �������, �� �������� ���������, � ������ ���������� ������.
*******************************************************************************}
begin
  if Key = (vk_return) then
    CheckRus(Edit1);
end;

end.
