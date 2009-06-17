unit shtarifb;                                                

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm39 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nam: string;//�������� ������
    namet: string;//�������� �������� ������
    ac: boolean;//������� ���������� ��������: 0 - �� ���� ��������, 1 - ���������
  end;

var
  Form39: TForm39;

implementation

uses datamodule;

{$R *.dfm}

procedure TForm39.FormShow(Sender: TObject);
{*******************************************************************************
  ��������� FormShow ������������ ������� OnShow �����. ��������������� ��������
  �����, ������� �������� DBGrid1, � ���� ����������� ������,� ����� �����
  ���������� �������� 1 ������.
*******************************************************************************}
begin
  DBGrid1.Columns[0].FieldName := 'id_'+nam;
  DBGrid1.Columns[1].FieldName := 'name'+nam;
  DBGrid1.Columns[2].FieldName := 'tarif1';
  DBGrid1.Columns[3].FieldName := 'tarif2';
  with DataModule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from "cur'+nam+'.dbf" sbros');
    SQL.Add('order by sbros.id_'+nam);
    Open;
  end;
  namet := DBGrid1.Fields[1].AsString;
  ac := false;
end;

procedure TForm39.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  ��������� FormClose ��������� Query1 � Query4, ������� ������������ ��� ������
  � ���� unit.
*******************************************************************************}
begin
  Datamodule1.Query1.Close;
  Datamodule1.Query4.Close;
end;

procedure TForm39.Button2Click(Sender: TObject);
{*******************************************************************************
  ��������� Button2Click ������������ ������� ������� ������ �� �����. �����������
  �������� �������� �����.
*******************************************************************************}
begin
  ac := false;
  Close;
end;

procedure TForm39.Button1Click(Sender: TObject);
{*******************************************************************************
  ��������� Button1Click ������������ ������� ������� ������� �� �����. ��������
  ��������� ����������� � ����� �����������.
*******************************************************************************}
begin
  namet := DBGrid1.Fields[1].AsString;
  ac := true;
  Close;
end;

end.
