unit status;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TForm14 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    oldid: integer;//������� id
    min: array of integer;//������ id_min
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

uses datamodule, main, service;

{$R *.dfm}

procedure TForm14.Clear;
{*******************************************************************************
  ��������� Clear ������� ���������� ������ Combobox1 � ����� �����.
*******************************************************************************}
begin
  Combobox1.Clear;
  Edit1.Text := '';Edit2.Text := '';
end;

procedure TForm14.Fill;
{*******************************************************************************
  ��������� Fill ��������� Combobox1 �������������� ���-������ �����.
*******************************************************************************}
var
  l: integer;
begin
  with Datamodule1.Query4 do begin
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select * from "curlmin.dbf" sbros');
    SQL.Add('order by sbros.namemin');
    Open;
    First;
    while not EOF do begin
      SetLength(min, Length(min)+1);
      SetLength(namemin, Length(namemin)+1);
      Combobox1.Items.Add(FieldByName('namemin').AsString);
      min[l] := FieldByName('id_min').AsInteger;
      namemin[l] := FieldByName('namemin').AsString;
      Next;
      inc(l);
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
  for i:=0 to combobox1.Items.Count-1 do begin
    if AnsiLowerCase(Combobox1.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox1.Items.Count then
    Result := i
  else
    Result := -1;
end;

procedure TForm14.SetDefault;
{*******************************************************************************
  ��������� SetDefault ������� ������ ��� ������� ���� ������� �� ������� ��������.
  ��� ���� ���������� ��� � ������������ ���-������. ������ ��� ����������� � DBGrid1.
*******************************************************************************}
begin
  with Datamodule1.Query1 do begin
    Close;
    SQl.Clear;
    SQL.Add('select id_status,namestatus,');
    SQL.Add('case when id_min=1 then :v1');
    SQL.Add('when id_min=2 then :v2');
    SQL.Add('when id_min=3 then :v3 end as namemin');
	  SQL.Add('from stat');
	  SQL.Add('order by id_status');
    ParamByName('v1').AsString := namemin[0];
    ParamByName('v2').AsString := namemin[1];
    ParamByName('v3').AsString := namemin[2];
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

procedure TForm14.DBGrid1CellClick(Column: TColumn);
{*******************************************************************************
  ��������� DBGrid1CellClick ������������ ����� ������ � DBGrid1.
  � ���������� � ����� ����� ���������� ���������� �� ��������� ������ �
  ��������������� ������� �������� id.
*******************************************************************************}
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[0].AsString;
  Combobox1.Text := DBGrid1.Fields[2].AsString;
  oldid := StrToInt(Edit2.Text);
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
  if (Edit1.Text<>'') and (Combobox1.Text <> '')and(Edit2.Text<>'')  then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_status');
      SQl.Add('from stat');
      SQl.Add('where (id_status=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_status');
        SQl.Add('from stat');
        SQl.Add('where (namestatus = :name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty then
          flag := true
        else
          flag := false;
        Close;
      end
      else begin
        flag := false;
        Close;
      end;
      if flag then begin
        Close;
        SQL.Clear;
        SQL.Add('insert into stat');
        SQL.Add('values (:id, :name, :min)');
        ParamByName('id').AsInteger := StrToInt(Edit2.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('min').AsInteger := min[Combobox1.ItemIndex];
        ExecSQL;
        SetDefault;
        Open;
        oldid := FieldByName('id_status').AsInteger;
      end
      else begin
        ShowMessage('������������ ������� � ��� ������ ���� ���������!');
        SetDefault;
        Open;
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
  if (Edit1.Text <> '') and (Combobox1.Text <> '')and(Edit2.Text<>'') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_status');
      SQl.Add('from stat');
      SQl.Add('where (id_status=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty or not IsEmpty and
          (FieldByName('id_status').AsInteger = oldid) then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_status');
        SQl.Add('from stat');
        SQl.Add('where (namestatus = :name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_status').AsInteger = oldid) then
          flag := true
        else
          flag := false;
        Close;
      end
      else begin
        flag := false;
        Close;
      end;
      if flag then begin
        Close;
        SQL.Clear;
        SQL.Add('update stat');
        SQL.Add('set namestatus = :name, id_min = :min');
        SQL.Add('where (id_status = :st)');
        ParamByName('st').AsInteger := oldid;
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('min').AsInteger := min[Combobox1.ItemIndex];
        ExecSQL;
        SetDefault;
        Open;
        oldid := FieldByName('id_status').AsInteger;
      end
      else begin
        ShowMessage('������������ ������� � ��� ������ ���� ���������!');
        SetDefault;
        Open;
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
  with DataModule1.Query1 do begin
    if not IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Add('delete from stat');
      SQL.Add('where (id_status = :id)');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
      Open;
      Edit1.Text := DBGrid1.Fields[1].AsString;
      Edit2.Text := DBGrid1.Fields[0].AsString;
      Combobox1.Text := DBGrid1.Fields[2].AsString;
      oldid := FieldByName('id_status').AsInteger;
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
  with DataModule1.Query1 do begin
    SetDefault;
    Open;
    Edit1.Text := FieldByName('namestatus').AsString;
    Edit2.Text := FieldByName('id_status').AsString;
    Combobox1.Text := FieldByName('namemin').AsString;
    oldid := FieldByName('id_status').AsInteger;
    Combobox1.OnChange(combobox1);
  end;
  if status=0 then begin
    Button1.Enabled := false;
    Button2.Enabled := false;
    Button3.Enabled := false;
  end
  else begin
    Button1.Enabled := true;
    Button2.Enabled := true;
    Button3.Enabled := true;
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

procedure TForm14.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

procedure TForm14.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{*******************************************************************************
  ��������� Edit1KeyDown ������������ ������� ������� enter. ���� ������ ��������
  ��������������� �������, �� �������� ���������, � ������ ���������� ������.
*******************************************************************************}
begin
  if Key = (vk_return) then
    CheckRus(Edit1);
end;

end.
