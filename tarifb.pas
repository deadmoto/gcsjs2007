unit tarifb;

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
  TForm19 = class(TForm)
    Panel1:      TPanel;
    Panel2:      TPanel;
    FlowPanel1:  TFlowPanel;
    StringGrid1: TStringGrid;
    Button4:     TButton;
    Button3:     TButton;
    Button2:     TButton;
    Button1:     TButton;
    Label3:      TLabel;
    Label1:      TLabel;
    Label2:      TLabel;
    Label4:      TLabel;
    Edit3:       TEdit;
    Edit1:       TEdit;
    Edit2:       TEdit;
    Edit4:       TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
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
  Form19: TForm19;

implementation

uses
  datamodule,
  service,
  main;

{$R *.dfm}

procedure TForm19.SetDefault;
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

  FormerStringGrid(StringGrid1, TStringArray.Create('���', '������������', '����.�/������', '����.�/������'),
    TIntArray.Create(30, 237, 78, 48), DataModule1.Query4.RecordCount + 1);

  for i := 0 to DataModule1.Query4.RecordCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := DataModule1.Query4.FieldByName('id_' + nam).Value;
    StringGrid1.Cells[1, i + 1] := DataModule1.Query4.FieldByName('name' + nam).Value;
    StringGrid1.Cells[2, i + 1] := DataModule1.Query4.FieldByName('tarif1').Value;
    StringGrid1.Cells[3, i + 1] := DataModule1.Query4.FieldByName('tarif2').Value;
    DataModule1.Query4.Next;
  end;
end;

procedure TForm19.StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
{*******************************************************************************
  ��������� StringGrid1SelectCell ������������ ����� ������ � StringGrid1.
  � ���������� � ����� ����� ���������� ���������� �� ��������� ������ �
  ��������������� ������� �������� id.
*******************************************************************************}
begin
  if ARow <> 0 then
  begin
    Edit1.Text := StringGrid1.Cells[1, ARow];// DBGrid1.Fields[1].AsString;
    Edit2.Text := StringGrid1.Cells[2, ARow];// FlToStr(DBGrid1.Fields[2].AsFloat);
    Edit4.Text := StringGrid1.Cells[3, ARow];// FlToStr(DBGrid1.Fields[3].AsFloat);
    Edit3.Text := StringGrid1.Cells[0, ARow];// DBGrid1.Fields[0].AsString;
    if Edit3.Text <> '' then
      oldid := StrToInt(Edit3.Text);
  end;
end;

procedure TForm19.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  ��������� FormClose ��������� Query1 � Query4, ������� ������������ ��� ������
  � ���� unit.
*******************************************************************************}
begin
  Datamodule1.Query1.Close;
  Datamodule1.Query4.Close;
end;

procedure TForm19.Button4Click(Sender: TObject);
{*******************************************************************************
  ��������� Button4Click ������������ ������� ������� ����� �� �����. �����������
  �������� �������� �����.
*******************************************************************************}
begin
  Close;
end;

procedure TForm19.Button1Click(Sender: TObject);
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
  if (Edit1.Text <> '') and (Edit2.Text <> '') and
    (Edit3.Text <> '') and (Edit4.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_' + nam);
      SQL.Add('from ' + nam);
      SQL.Add('where (id_' + nam + '=:id)and(id_dist=:idd)');
      ParamByName('id').AsInteger  := StrToInt(Edit3.Text);
      ParamByName('idd').AsInteger := Form1.dist;
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
        SQL.Add('values (:idd,Convert(smalldatetime,:d,104),:id,:name,:t1,:t2)');
        ParamByName('idd').AsInteger := Form1.dist;
        ParamByName('d').AsString := Form1.rdt;
        ParamByName('id').AsInteger := StrToInt(Edit3.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('t1').AsFloat := StrToFloat(Edit2.Text);
        ParamByName('t2').AsFloat := StrToFloat(Edit4.Text);
        ExecSQL;
        FillTarifb(Form1.bpath, nam, Form1.rdt, Form1.dist, Form1.codedbf);
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

procedure TForm19.Button2Click(Sender: TObject);
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
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') and (Edit4.Text <> '') then
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
            SQL.Add('values (:idd,Convert(smalldatetime,:d,104),:id,:name,:t1,:t2)');
            ParamByName('id').AsInteger := StrToInt(Edit3.Text);
          end
          else
          begin
            Close;
            SQL.Clear;
            SQL.Add('update ' + nam);
            SQL.Add('set name' + nam + '=:name,tarif1=:t1,tarif2=:t2');
            SQL.Add('where (id_' + nam + ' = :id)and(sdate=Convert(smalldatetime,:d,104))and(id_dist=:idd)');
            ParamByName('id').AsInteger := oldid;
          end;
          ParamByName('idd').AsInteger := Form1.dist;
          ParamByName('d').AsString := Form1.rdt;
          ParamByName('name').AsString := Edit1.Text;
          ParamByName('t1').AsFloat := StrToFloat(Edit2.Text);
          ParamByName('t2').AsFloat := StrToFloat(Edit4.Text);
          ExecSQL;
          FillTarifb(Form1.bpath, nam, Form1.rdt, Form1.dist, Form1.codedbf);
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

procedure TForm19.Button3Click(Sender: TObject);
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
    FillTarifb(Form1.bpath, nam, Form1.rdt, Form1.dist, Form1.codedbf);
  end;
  SetDefault;
{  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := FlToStr(DBGrid1.Fields[2].AsFloat);
  Edit4.Text := FlToStr(DBGrid1.Fields[3].AsFloat);
  Edit3.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit3.Text);}
end;

procedure TForm19.FormShow(Sender: TObject);
{*******************************************************************************
  ��������� FormShow ������������ ������� OnShow �����. ��������������� ��������
  �����, ������� �������� DBGrid1, � ���� ����������� ������, � ����� ����� ����������
  �������� 1 ������. � ����������� �� ������� �������� ����� ����������� ������
  ���������� ������������(������) ��� ����������(������) ��� �������.
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

procedure TForm19.Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
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

procedure TForm19.Edit2Exit(Sender: TObject);
{*******************************************************************************
  ��������� Edit2Exit ������������ ������ ������ ����� �����. �������������, ����
  ���������� ������� � �����. ���� ������ �� �������� ������, �� ���������������
  ����.
*******************************************************************************}
begin
  SetPoint(TEdit(Sender));
end;

procedure TForm19.Edit3KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{*******************************************************************************
  ��������� Edit3KeyDown ������������ ������� ������� enter. ���� ������ ��
  �������� ����� ������, �� ��������������� ����.
*******************************************************************************}
begin
  if Key = (vk_return) then
    CheckInt(Edit3);
end;

procedure TForm19.Edit3Exit(Sender: TObject);
{*******************************************************************************
  ��������� Edit3Exit ������������ ������ ������ ����� �����. ���� ������ ��
  �������� ����� ������, �� ��������������� ����.
*******************************************************************************}
begin
  CheckInt(Edit3);
end;

end.
