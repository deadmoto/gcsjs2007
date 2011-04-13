unit chtarifs;

interface

uses
  Classes, Controls, Dialogs, Forms, Graphics, Messages, StdCtrls, SysUtils,
  Variants, Windows;

type
  TForm42 = class(TForm)
    Button1:  TButton;
    Button2:  TButton;
    Button3:  TButton;
    Button4:  TButton;
    Button5:  TButton;
    Button6:  TButton;
    Button7:  TButton;
    Button8:  TButton;
    Button9:  TButton;
    Button10: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    status: integer;
    procedure CreateTarifFrm15(frmNam: string; frmNum, frmStatus: integer; frmCaption: string; Norm: boolean);
    procedure CreateTarifFrm19(frmNam: string; frmNum, frmStatus: integer; frmCaption: string);
  end;

var
  Form42: TForm42;

implementation

uses
  tarif, tarifb, elpower, main;

{$R *.dfm}

procedure TForm42.CreateTarifFrm15(frmNam: string; frmNum, frmStatus: integer; frmCaption: string; Norm: boolean);
begin
  Form15 := TForm15.Create(Application);
  with Form15 do
  begin
    nam := frmNam;
    num := frmNum;
    status := frmStatus;
    Caption := frmCaption;
    isNorm := Norm;
    ShowModal;
    Free;
  end;
end;

procedure TForm42.CreateTarifFrm19(frmNam: string; frmNum, frmStatus: integer; frmCaption: string);
begin
  Form19 := TForm19.Create(Application);
  with Form19 do
  begin
    nam := frmNam;
    num := frmNum;
    status := frmStatus;
    Caption := frmCaption;
    ShowModal;
    Free;
  end;
end;

procedure TForm42.Button1Click(Sender: TObject);
{ ���������� ������� �� ���������� ����� }
begin
  CreateTarifFrm15('cont', 0, status, '������ �� ���������� �����(���./��.�.)', False);
end;

procedure TForm42.Button2Click(Sender: TObject);
{ ���������� ������� �� ������� ������ }
begin
  CreateTarifFrm15('rep', 1, status, '������ ��� ��������� ���', False);
end;

procedure TForm42.Button3Click(Sender: TObject);
{ ���������� ������� �� ��������������� }
begin
  CreateTarifFrm19('cold', 2, status, '������ �� ���������������(���./���.)');
end;

procedure TForm42.Button4Click(Sender: TObject);
{ ���������� ������� �� ������� ���� }
begin
  CreateTarifFrm19('hot', 3, status, '������ �� ������� ����(���./���.)');
end;

procedure TForm42.Button5Click(Sender: TObject);
{*******************************************************************************
  ��������� �������� ����� �������� � �������� �� �������������
*******************************************************************************}
begin
  CreateTarifFrm15('canal', 4, status, '������ �� �������������(���./���.)', True);
end;

procedure TForm42.Button6Click(Sender: TObject);
{ ���������� ������� �� ��������� }
begin
  CreateTarifFrm15('heat', 5, status, '������ �� ���������(���./��.�.)', True);
end;

procedure TForm42.Button7Click(Sender: TObject);
{ ����������  ������� �� ���}
begin
  CreateTarifFrm15('gas', 6, status, '������ �� ���(���./���.)', True);
end;

procedure TForm42.Button8Click(Sender: TObject);
{ ����������  ������� �� ��������������}
begin
  Form23.status := status;
  Form23.num := 7;
  Form23.ShowModal;
end;

procedure TForm42.Button9Click(Sender: TObject);
{ ���������� ������� �� ����� }
begin
  CreateTarifFrm15('wood', 12, status, '������ �� �����(���./��.�.)', False);
end;

procedure TForm42.Button10Click(Sender: TObject);
{ ���������� ������� �� ����� }
begin
  CreateTarifFrm15('coal', 13, status, '������ �� �����(���./��.�.)', False);
end;

procedure TForm42.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.SetTarifs;
end;

end.
