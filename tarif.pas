unit tarif;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Grids,
  ExtCtrls;

type
  TForm15 = class(TForm)
    Label1:      TLabel;
    Label2:      TLabel;
    Button1:     TButton;
    Button2:     TButton;
    Button3:     TButton;
    Button4:     TButton;
    Edit1:       TEdit;
    Edit2:       TEdit;
    Label3:      TLabel;
    Edit3:       TEdit;
    Panel1:      TPanel;
    StringGrid1: TStringGrid;
    FlowPanel1:  TFlowPanel;
    Panel2:      TPanel;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
  private
    { Private declarations }
    oldid: integer;//������� �������� ���� ���
    procedure SetDefault;
  public
    { Public declarations }
    status: integer;//������ �������� �����: 0 - ������ ��� ������, 1 - ������
    nam:    string;//�������� ������, ��� ������� ����������� �����
    num:    integer;//����� ������
  end;

var
  Form15: TForm15;

implementation

uses
  datamodule,
  service,
  main,
  progress;

{$R *.dfm}

procedure TForm15.SetDefault;
{*******************************************************************************
  ��������� SetDefault ������� � ��������� ������ ��� ������� ���� ������� ��
  �������, ��������������� ������� ������� �� ������, ������������ ��� nam.
*******************************************************************************}
var
  i: integer;
begin
  with DataModule1.Query4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from "cur' + nam + '.dbf" sbros');
    SQL.Add('order by sbros.id_' + nam);
    Open;
    First;
  end;

  FormerStringGrid(StringGrid1, TStringArray.Create('���', '������������', '�����'),
    TIntArray.Create(30, 305, 45), DataModule1.Query4.RecordCount + 1);

  for i := 0 to DataModule1.Query4.RecordCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := DataModule1.Query4.FieldByName('id_' + nam).Value;
    StringGrid1.Cells[1, i + 1] := DataModule1.Query4.FieldByName('name' + nam).Value;
    StringGrid1.Cells[2, i + 1] := DataModule1.Query4.FieldByName('tarif' + nam).Value;
    DataModule1.Query4.Next;
  end;
end;

procedure TForm15.StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
{*******************************************************************************
  ��������� StringGrid1SelectCell ������������ ����� ������ � StringGrid1.
  � ���������� � ����� ����� ���������� ���������� �� ��������� ������ �
  ��������������� ������� �������� id.
*******************************************************************************}
begin
  if ARow <> 0 then
  begin
    Edit1.Text := StringGrid1.Cells[1, ARow];//Fields[1].AsString;
    Edit2.Text := StringGrid1.Cells[2, ARow];//FlToStr(DBGrid1.Fields[2].AsFloat);
    Edit3.Text := StringGrid1.Cells[0, ARow];//DBGrid1.Fields[0].AsString;}
    if Edit3.Text <> '' then
      oldid := StrToInt(Edit3.Text);
  end;
end;

procedure TForm15.Button4Click(Sender: TObject);
{*******************************************************************************
  ��������� Button4Click ������������ ������� ������� ����� �� �����. �����������
  �������� �������� �����.
*******************************************************************************}
begin
  Close;
end;

procedure TForm15.Button1Click(Sender: TObject);
{*******************************************************************************
  ��������� Button1Click ������������ ������� ������� �������� �� �����.
  ���� ��� ���� ����� ��������� � � ������� ��� ������ � ������ �������, ��
  ���������� ���������� ������ � ��������������� �������.
  ���� ���� �� ���� ���� ����� �� ��������� ��� � ������� ���������� ������ �
  ������ �������, �� ���������� �� ���������� � �������� ��������������� ���������.
  ����� ���������� ������ ���������� ������������ ����� ������� ������� �������
  �� ������ ������.
*******************************************************************************}
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_' + nam);
      SQL.Add('from ' + nam);
      SQL.Add('where (id_' + nam + '=:id)and(id_dist=:idd)');
      ParamByName('idd').AsInteger := Form1.dist;
      ParamByName('id').AsInteger  := StrToInt(Edit3.Text);
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_' + nam);
        SQL.Add('from ' + nam);
        SQL.Add('where (name' + nam + '=:name)and(id_dist=:idd)');
        ParamByName('idd').AsInteger := Form1.dist;
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
        SQL.Add('insert into ' + nam);
        SQL.Add('values (:idd,Convert(smalldatetime,:d,104), :id, :name, :tarif)');
        ParamByName('idd').AsInteger := Form1.dist;
        ParamByName('d').AsString := Form1.rdt;
        ParamByName('id').AsInteger := StrToInt(Edit3.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('tarif').AsFloat := StrToFloat(Edit2.Text);
        ExecSQL;
        FillTarif(Form1.bpath, nam, Form1.rdt, Form1.dist, Form1.codedbf);
        oldid := StrToInt(Edit3.Text);
      end
      else
        ShowMessage('������������ ������ � ��� ������ ���� ���������!');
    end;
    SetDefault;
  end
  else
    ShowMessage('��� ���� ����� ������ ���� ���������!');
end;

procedure TForm15.Button2Click(Sender: TObject);
{*******************************************************************************
  ��������� Button2Click ������������ ������� ������� �������� �� �����.
  ���� ��� ���� ����� ���������, �� ����������� ���������� �� � ������� ������ �
  ������ �������. ���� �� ����������, �� ���������� ���������� ������ � �������.
  ���� � ������� ���������� ������ � ����� �� id, �� ������������ ������ � ��
  ��������� � ������������ ������ �������, �� ���������� ��������� ������.
  ���� ���� �� ���� ���� ����� �� ��������� ��� � ������� ������������ ���������
  � ������������� ������ ������, �� ��������� �� ���������� � ��������
  ��������������� ���������.
  ����� ��������� ������ ���������� ������������ ����� ������� ������� �������
  �� ������ ������.
*******************************************************************************}
var
  flag: boolean;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_' + nam);
      SQL.Add('from ' + nam);
      SQL.Add('where (id_' + nam + '=:id)and(id_dist=:idd)');
      ParamByName('idd').AsInteger := Form1.dist;
      ParamByName('id').AsInteger  := StrToInt(Edit3.Text);
      Open;
      if IsEmpty or not IsEmpty and (FieldByName('id_' + nam).AsInteger = oldid) then
      begin
        if IsEmpty then
          flag := False
        else
        begin
          Close;
          SQL.Clear;
          SQL.Add('select id_' + nam);
          SQL.Add('from ' + nam);
          SQL.Add('where (id_' + nam + '=:id)and(id_dist=:idd)and(sdate=Convert(smalldatetime,:d,104))');
          ParamByName('idd').AsInteger := Form1.dist;
          ParamByName('id').AsInteger := StrToInt(Edit3.Text);
          ParamByName('d').AsString := Form1.rdt;
          Open;
          if IsEmpty then
            flag := False
          else
            flag := True;
        end;
        Close;
        SQL.Clear;
        SQL.Add('select id_' + nam);
        SQL.Add('from ' + nam);
        SQL.Add('where (name' + nam + ' = :name)and(id_dist=:idd)');
        ParamByName('idd').AsInteger := Form1.dist;
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_' + nam).AsInteger = oldid) then
        begin
          if not flag then
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert into ' + nam);
            SQL.Add('values (:idd,Convert(smalldatetime,:d,104), :id, :name, :tarif)');
            ParamByName('id').AsInteger := StrToInt(Edit3.Text);
          end
          else
          begin
            Close;
            SQL.Clear;
            SQL.Add('update ' + nam);
            SQL.Add('set name' + nam + ' = :name, tarif' + nam + ' = :tarif');
            SQL.Add('where (id_' + nam + ' = :id)and(sdate=Convert(smalldatetime,:d,104))and(id_dist=:idd)');
            ParamByName('id').AsInteger := oldid;
          end;
          ParamByName('idd').AsInteger := Form1.dist;
          ParamByName('d').AsString := Form1.rdt;
          ParamByName('name').AsString := Edit1.Text;
          ParamByName('tarif').AsFloat := StrToFloat(Edit2.Text);
          ExecSQL;
          FillTarif(Form1.bpath, nam, Form1.rdt, Form1.dist, Form1.codedbf);
          oldid := StrToInt(Edit3.Text);
        end
        else
          ShowMessage('������������ ������ � ��� ������ ���� ���������!');
      end
      else
        ShowMessage('������������ ������ � ��� ������ ���� ���������!');
    end;
    SetDefault;
  end
  else
    ShowMessage('��� ���� ����� ������ ���� ���������!');
end;

procedure TForm15.Button3Click(Sender: TObject);
{*******************************************************************************
  ��������� Button3Click ������������ ������� ������� ������� �� �����. �� �������
  ��������� ������, ������� ������������� �������� ������, � ������� ����� ���������
  ������� � ������� id.
  ���� ����� ��������� ��� ���������, �� ���������� �������� ������ � ��� ����������
  �����������, � ������� ������ ������ �������������� �������������� ���������.
  ����� ��������� ������� �����, ����� ������� ��� ������ ��� ���������.
  ����� �������� ������ ���������� ������������ ����� ������� ������� �������
  �� ������ ������.
*******************************************************************************}
begin
  with DataModule1.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('delete from ' + nam);
    SQL.Add('where (id_' + nam + '=:id)and(sdate=Convert(smalldatetime,:d,104))and(id_dist=:idd)');
    ParamByName('idd').AsInteger := Form1.dist;
    ParamByName('d').AsString := Form1.rdt;
    ParamByName('id').AsInteger := oldid;
    ExecSQL;
    FillTarif(Form1.bpath, nam, Form1.rdt, Form1.dist, Form1.codedbf);
  end;
  SetDefault;
{  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := FlToStr(DBGrid1.Fields[2].AsFloat);
  Edit3.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit3.Text);}
end;

procedure TForm15.FormShow(Sender: TObject);
{*******************************************************************************
  ��������� FormShow ������������ ������� OnShow �����. ��������������� ��������
  �����, ������� �������� DBGrid1, � ���� ����������� ������, � ����� ����� ����������
  �������� 1 ������. � ����������� �� ������� �������� ����� ����������� ������
  ���������� ������������(������) ��� ����������(������) ��� �������.
*******************************************************************************}
begin
  //  DBGrid1.Columns[0].FieldName := 'id_' + nam;
  //  DBGrid1.Columns[1].FieldName := 'name' + nam;
  //  DBGrid1.Columns[2].FieldName := 'tarif' + nam;

  //  Edit1.Text := DBGrid1.Fields[1].AsString;
  //  Edit2.Text := FlToStr(DBGrid1.Fields[2].AsFloat);
  //  Edit3.Text := DBGrid1.Fields[0].AsString;
  //  oldid := StrToInt(Edit3.Text);

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

procedure TForm15.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  ��������� FormClose ��������� Query1 � Query4, ������� ������������ ��� ������
  � ���� unit.
*******************************************************************************}
begin
  Datamodule1.Query1.Close;
  Datamodule1.Query4.Close;
end;

procedure TForm15.Edit3Exit(Sender: TObject);
{*******************************************************************************
  ��������� Edit3Exit ������������ ������ ������ ����� �����. ���� ������ ��
  �������� ����� ������, �� ��������������� ����.
*******************************************************************************}
begin
  CheckInt(Edit3);
end;

procedure TForm15.Edit3KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{*******************************************************************************
  ��������� Edit3KeyDown ������������ ������� ������� enter. ���� ������ ��
  �������� ����� ������, �� ��������������� ����.
*******************************************************************************}
begin
  if Key = (vk_return) then
    CheckInt(Edit3);
end;

procedure TForm15.Edit2Exit(Sender: TObject);
{*******************************************************************************
  ��������� Edit2Exit ������������ ������ ������ ����� �����. �������������, ����
  ���������� ������� � �����. ���� ������ �� �������� ������, �� ���������������
  ����.
*******************************************************************************}
begin
  SetPoint(TEdit(Sender));
end;

procedure TForm15.Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{*******************************************************************************
  ��������� Edit2KeyDown ������������ ������� ������� enter. �������������, ����
  ���������� ������� � �����. ���� ������ �� �������� ������, �� ���������������
  ����.
*******************************************************************************}
begin
  if Key = (vk_return) then
  begin
    SetPoint(TEdit(Sender));
  end;
end;

end.
