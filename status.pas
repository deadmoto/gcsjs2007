unit status;

interface

uses
  Classes,
  Controls,
  Dialogs,
  ExtCtrls,
  Forms,
  Graphics,
  Grids,
  Mask,
  Messages,
  StdCtrls,
  SysUtils,
  Variants,
  Windows;

type
  TForm14 = class(TForm)
    Panel1:      TPanel;
    StringGrid1: TStringGrid;
    Panel2:      TPanel;
    Edit2:       TEdit;
    Label3:      TLabel;
    Edit1:       TEdit;
    Label1:      TLabel;
    ComboBox1:   TComboBox;
    Label2:      TLabel;
    FlowPanel1:  TFlowPanel;
    Button1:     TButton;
    Button2:     TButton;
    Button3:     TButton;
    Button4:     TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
  private
    { Private declarations }
    oldid:   integer;//������� id
    min:     array of integer;//������ id_min
    namemin: array of string;//������ ������������ ���-������.�����
    function SearchMin(s: string): integer;
    procedure SetDefault;
    procedure Fill;
    procedure Clear;
  public
    { Public declarations }
    status: integer;//������ �������� �����: 0 - ������ ��� ������, 1 - ������
  end;

var
  Form14: TForm14;

implementation

uses
  datamodule,
  main,
  service;

{$R *.dfm}

procedure TForm14.Clear;
{*******************************************************************************
  ��������� Clear ������� ���������� ������ Combobox1 � ����� �����.
*******************************************************************************}
begin
  Combobox1.Clear;
  Edit1.Text := '';
  Edit2.Text := '';
end;

procedure TForm14.Fill;
{*******************************************************************************
  ��������� Fill ��������� Combobox1 �������������� ���-������ �����.
*******************************************************************************}
var
  l: integer;
begin
  with Datamodule1.Query4 do
  begin
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select * from "curlmin.dbf" sbros');
    SQL.Add('order by sbros.namemin');
    Open;
    First;
    while not EOF do
    begin
      SetLength(min, Length(min) + 1);
      SetLength(namemin, Length(namemin) + 1);
      Combobox1.Items.Add(FieldByName('namemin').AsString);
      min[l] := FieldByName('id_min').AsInteger;
      namemin[l] := FieldByName('namemin').AsString;
      Next;
      Inc(l);
    end;
    Close;
  end;
end;

function TForm14.SearchMin(s: string): integer;
{*******************************************************************************
  ������� SearchMin ��������� ����� ������ s � ������ Combobox1 � ���������� ��
  ������ � ������. ���� ������ �� �������, �� ������������ -1.
*******************************************************************************}
var
  i: integer;
begin
  for i := 0 to combobox1.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox1.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox1.Items.Count then
    Result := i
  else
    Result := -1;
end;

procedure TForm14.SetDefault;
{*******************************************************************************
  ��������� SetDefault ������� ������ ��� ������� ���� ������� �� ������� ��������.
  ��� ���� ���������� ��� � ������������ ���-������. ������ ��� ����������� � DBGrid1.
*******************************************************************************}
var
  i: integer;
begin
  with Datamodule1.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select id_status,namestatus,');
    SQL.Add('case when id_min=1 then :v1');
    SQL.Add('when id_min=2 then :v2');
    SQL.Add('when id_min=3 then :v3 end as namemin');
    SQL.Add('from stat');
    SQL.Add('order by id_status');
    ParamByName('v1').AsString := namemin[0];
    ParamByName('v2').AsString := namemin[1];
    ParamByName('v3').AsString := namemin[2];
    Open;
    First;
  end;

  FormerStringGrid(StringGrid1, TStringArray.Create('���', '������������', '������'),
    TIntArray.Create(25, 190, 190), Datamodule1.Query1.RecordCount + 1);

  for i := 0 to Datamodule1.Query1.RecordCount + 1 do
  begin
    with StringGrid1 do
    begin
      Cells[0, i + 1] := Datamodule1.Query1.FieldByName('id_status').AsString;
      Cells[1, i + 1] := Datamodule1.Query1.FieldByName('namestatus').AsString;
      Cells[2, i + 1] := Datamodule1.Query1.FieldByName('namemin').AsString;
    end;
    Datamodule1.Query1.Next;
  end;
end;

procedure TForm14.StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
{*******************************************************************************
  ��������� StringGrid1SelectCell ������������ ����� ������ � StringGrid1.
  � ���������� � ����� ����� ���������� ���������� �� ��������� ������ �
  ��������������� ������� �������� id.
*******************************************************************************}
begin
  if ARow <> 0 then
  begin
    Edit1.Text := StringGrid1.Cells[1, ARow];
    Edit2.Text := StringGrid1.Cells[0, ARow];
    Combobox1.Text := StringGrid1.Cells[2, ARow];
    if Edit2.Text <> '' then
      oldid := StrToInt(Edit2.Text);
  end;
end;

procedure TForm14.Button4Click(Sender: TObject);
{*******************************************************************************
  ��������� Button4Click ������������ ������� ������� ����� �� �����. �����������
  �������� �������� �����.
*******************************************************************************}
begin
  Form14.Close;
end;

procedure TForm14.Button1Click(Sender: TObject);
{*******************************************************************************
  ��������� Button1Click ������������ ������� ������� �������� �� �����.
  ���� ��� ���� ����� ��������� � � ������� ��� ������ � ������ �������, ��
  ���������� ���������� ������ � ������� ��������.
  ���� ���� �� ���� ���� ����� �� ��������� ��� � ������� ���������� ������ �
  ������ �������, �� ���������� �� ���������� � �������� ��������������� ���������.
*******************************************************************************}
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Combobox1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_status');
      SQL.Add('from stat');
      SQL.Add('where (id_status=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_status');
        SQL.Add('from stat');
        SQL.Add('where (namestatus = :name)');
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
        SQL.Add('insert into stat');
        SQL.Add('values (:id, :name, :min)');
        ParamByName('id').AsInteger  := StrToInt(Edit2.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('min').AsInteger := min[Combobox1.ItemIndex];
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('������������ ������� � ��� ������ ���� ���������!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('��� ���� ����� ������ ���� ���������!');
end;

procedure TForm14.Button2Click(Sender: TObject);
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
  if (Edit1.Text <> '') and (Combobox1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_status');
      SQL.Add('from stat');
      SQL.Add('where (id_status=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty or not IsEmpty and
        (FieldByName('id_status').AsInteger = oldid) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_status');
        SQL.Add('from stat');
        SQL.Add('where (namestatus = :name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_status').AsInteger = oldid) then
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
        SQL.Add('update stat');
        SQL.Add('set namestatus = :name, id_min = :min');
        SQL.Add('where (id_status = :st)');
        ParamByName('st').AsInteger  := oldid;
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('min').AsInteger := min[Combobox1.ItemIndex];
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('������������ ������� � ��� ������ ���� ���������!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('��� ���� ����� ������ ���� ���������!');
end;

procedure TForm14.Button3Click(Sender: TObject);
{*******************************************************************************
  ��������� Button3Click ������������ ������� ������� ������� �� �����. �� �������
  ��������� ������, ������� ������������� �������� id.
*******************************************************************************}
begin
  with DataModule1.Query1 do
  begin
    if not IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from stat');
      SQL.Add('where (id_status = :id)');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
    end;
  end;
end;

procedure TForm14.ComboBox1Change(Sender: TObject);
{*******************************************************************************
  ��������� ������������ ��������� � ���� ����� Combobox1.
*******************************************************************************}
var
  ind: integer;
begin
  ind := SearchMin(Combobox1.Text);
  if ind <> -1 then
    Combobox1.ItemIndex := ind
  else
    Combobox1.ItemIndex := 0;
end;

procedure TForm14.FormShow(Sender: TObject);
{*******************************************************************************
  ��������� FormShow ������������ ������� OnShow �����. � DBGrid1 ����������� ������,
  � ����� ����� ���������� �������� 1 ������. � ����������� �� ������� ��������
  ����� ����������� ������ ���������� ������������(������) ��� ����������(������)
  ��� �������.
*******************************************************************************}
begin
  Clear;
  Fill;
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

procedure TForm14.Edit2Exit(Sender: TObject);
{*******************************************************************************
  ��������� Edit2Exit ������������ ������ ������ ����� �����. ���� ������ ��
  �������� ����� ������, �� ��������������� ����.
*******************************************************************************}
begin
  CheckInt(Edit2);
end;

procedure TForm14.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  ��������� FormClose ��������� Query1 � Query4, ������� ������������ ��� ������
  � ���� unit.
*******************************************************************************}
begin
  Datamodule1.Query1.Close;
  Datamodule1.Query4.Close;
end;

procedure TForm14.Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{*******************************************************************************
  ��������� Edit2KeyDown ������������ ������� ������� enter. ���� ������ ��
  �������� ����� ������, �� ��������������� ����.
*******************************************************************************}
begin
  if Key = (vk_return) then
    CheckInt(Edit2);
end;

procedure TForm14.Edit1Exit(Sender: TObject);
{*******************************************************************************
  ��������� Edit1Exit ������������ ������ ������ ����� �����. ���� ������ ��������
  ��������������� �������, �� �������� ���������, � ������ ���������� ������.
*******************************************************************************}
begin
  CheckRus(Edit1);
end;

procedure TForm14.Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{*******************************************************************************
  ��������� Edit1KeyDown ������������ ������� ������� enter. ���� ������ ��������
  ��������������� �������, �� �������� ���������, � ������ ���������� ������.
*******************************************************************************}
begin
  if Key = (vk_return) then
    CheckRus(Edit1);
end;

end.
