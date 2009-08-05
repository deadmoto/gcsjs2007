unit Street;

interface                                                            

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TForm5 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2Exit(Sender: TObject);
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

uses datamodule, main, service;

{$R *.dfm}

procedure TForm5.SetDefault;
{*******************************************************************************
  ��������� SetDefault ������� ������ ��� ������� ���� ������� �� ������� ����.
*******************************************************************************}
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from strt');
    SQL.Add('order by id_street');
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

procedure TForm5.DBGrid1CellClick(Column: TColumn);
{*******************************************************************************
  ��������� DBGrid1CellClick ������������ ����� ������ � DBGrid1.
  � ���������� � ����� ����� ���������� ���������� �� ��������� ������ �
  ��������������� ������� �������� id.
*******************************************************************************}
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[0].AsString;
  CheckBox1.Checked := (DBGrid1.Fields[2].AsInteger=1);
  oldid := StrToInt(Edit2.Text);
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
  if (Edit1.Text <> '')and(Edit2.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_street');
      SQl.Add('from strt');
      SQl.Add('where (id_street=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_street');
        SQl.Add('from strt');
        SQl.Add('where (namestreet = :name)');
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
        SQL.Add('insert into strt');
        SQL.Add('values (:id, :name,:st)');
        ParamByName('id').AsInteger := StrToInt(Edit2.Text);
        ParamByName('name').AsString := Edit1.Text;
        if CheckBox1.Checked then
          ParamByName('st').AsInteger := 1
        else
          ParamByName('st').AsInteger := 0;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
        ShowMessage('������������ ����� � ��� ������ ���� ���������!');
        SetDefault;
        Open;
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
  if (Edit1.Text <> '')and(Edit2.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_street');
      SQl.Add('from strt');
      SQl.Add('where (id_street=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty or not IsEmpty and
          (FieldByName('id_street').AsInteger = oldid) then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_street');
        SQl.Add('from strt');
        SQl.Add('where (namestreet = :name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_street').AsInteger = oldid) then
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
        SQL.Add('update strt');
        SQL.Add('set namestreet = :name,status=:st');
        SQL.Add('where id_street = :id');
        ParamByName('id').AsInteger := oldid;
        ParamByName('name').AsString := Edit1.Text;
        if CheckBox1.Checked then
          ParamByName('st').AsInteger := 1
        else
          ParamByName('st').AsInteger := 0;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
        ShowMessage('������������ ����� � ��� ������ ���� ���������!');
        SetDefault;
        Open;
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
  with DataModule1.Query1 do begin
    if not IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Add('delete from strt');
      SQL.Add('where (id_street = :id)');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
      Open;
      Edit1.Text := DBGrid1.Fields[1].AsString;
      Edit2.Text := DBGrid1.Fields[0].AsString;
      CheckBox1.Checked := (DBGrid1.Fields[2].asInteger=1);
      oldid := StrToInt(Edit2.Text);
    end;
  end;
end;

procedure TForm5.FormShow(Sender: TObject);
{*******************************************************************************
  ��������� FormShow ������������ ������� OnShow �����. � DBGrid1 �����������
  ������, � ����� ����� ���������� �������� 1 ������. � ����������� �� �������
  �������� ����� ����������� ������ ���������� ������������(������) ���
  ����������(������) ��� �������.
*******************************************************************************}
begin
  with DataModule1.Query1 do begin
    SetDefault;
    Open;
  end;
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[0].AsString;
  CheckBox1.Checked := (DBGrid1.Fields[2].asInteger=1);
  oldid := StrToInt(Edit2.Text);
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

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  ��������� FormClose ��������� Query1, ������� ������������ ��� ������
  � ���� unit.
*******************************************************************************}
begin
  Datamodule1.Query1.Close;
end;

procedure TForm5.Edit2Exit(Sender: TObject);
{*******************************************************************************
  ��������� Edit2Exit ������������ ������ ������ ����� �����. ���� ������ ��
  �������� ����� ������, �� ��������������� ����.
*******************************************************************************}
begin
  CheckInt(Edit2);
end;

procedure TForm5.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

procedure TForm5.Edit1KeyDown(Sender: TObject; var Key: Word;
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
