unit shtarif;

interface

uses
  Classes,
  Controls,
  DateUtils,
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
  TForm37 = class(TForm)
    Panel1:      TPanel;
    StringGrid1: TStringGrid;
    FlowPanel1:  TFlowPanel;
    Button2:     TButton;
    Button1:     TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: char);
  private
    { Private declarations }
    procedure SetDefault;
  public
    { Public declarations }
    nam:   string;//�������� ������
    namet: string;//�������� �������� ������
    ac:    boolean;//������� ���������� ��������: 0 - �� ���� ��������, 1 - ���������
  end;

var
  Form37: TForm37;

implementation

uses
  datamodule,
  main,
  service,
  MyTypes;

{$R *.dfm}

procedure TForm37.FormShow(Sender: TObject);
{*******************************************************************************
  ��������� FormShow ������������ ������� OnShow �����. ��������������� ��������
  �����, ������� �������� DBGrid1, � ���� ����������� ������,� ����� �����
  ���������� �������� 1 ������.
*******************************************************************************}
begin
  ac := False;
  SetDefault;
end;

procedure TForm37.SetDefault;
var
  i: integer;
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from "cur' + nam + '.dbf" sbros');
    SQL.Add('order by sbros.id_' + nam);
    Open;
  end;

  FormerStringGrid(StringGrid1, TStringArray.Create('���', '������������', '�����'),
    TIntArray.Create(30, 290, 64), DModule.qTarif.RecordCount + 1);

  for i := 0 to DModule.qTarif.RecordCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := DModule.qTarif.FieldByName('id_' + nam).Value;
    StringGrid1.Cells[1, i + 1] := DModule.qTarif.FieldByName('name' + nam).Value;
    StringGrid1.Cells[2, i + 1] := DModule.qTarif.FieldByName('tarif' + nam).Value;
    DModule.qTarif.Next;
  end;
end;

procedure TForm37.StringGrid1DblClick(Sender: TObject);
begin
  Button1.OnClick(Self);
end;

procedure TForm37.StringGrid1DrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
begin
  SGDrawCell(Sender, ACol, ARow, Rect, State);
end;

procedure TForm37.StringGrid1KeyPress(Sender: TObject; var Key: char);
var
  s: word;
begin
  s := MilliSecondsBetween(Time, LastTime);
  if (s > 1000) then//����� �����
    searchbuf := Key
  else
  begin
    Dec(ItemIndex);
    searchbuf := searchbuf + Key;
  end;
  LastTime  := Time;
  ItemIndex := SG_Find(StringGrid1, searchbuf, 2);
  if (ItemIndex <> -1) then
    StringGrid1.Row := ItemIndex;

end;

procedure TForm37.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  ��������� FormClose ��������� Query1 � Query4, ������� ������������ ��� ������
  � ���� unit.
*******************************************************************************}
begin
  DModule.Query1.Close;
  DModule.qTarif.Close;
end;

procedure TForm37.Button2Click(Sender: TObject);
{*******************************************************************************
  ��������� Button2Click ������������ ������� ������� ������ �� �����. �����������
  �������� �������� �����.
*******************************************************************************}
begin
  Close;
end;

procedure TForm37.Button1Click(Sender: TObject);
{*******************************************************************************
  ��������� Button1Click ������������ ������� ������� ������� �� �����. ��������
  ��������� ����������� � ����� �����������.
*******************************************************************************}
begin
  namet := StringGrid1.Cells[1, StringGrid1.Row];
  ac := True;
  Close;
end;

end.
