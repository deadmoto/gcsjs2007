unit chtarifs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm42 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
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
    procedure FormClose( Sender: TObject;var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    status: integer;
  end;

var
  Form42: TForm42;

implementation

uses tarif, tarifb, elpower, main;

{$R *.dfm}

procedure TForm42.Button1Click(Sender: TObject);
{ справочник тарифов на содержание жилья }
begin
  Form15.status := status;
  Form15.nam := 'cont';
  Form15.num := 0;
  Form15.Caption := 'Тарифы на содержание жилья(руб./кв.м.)';
  Form15.ShowModal;
end;

procedure TForm42.Button2Click(Sender: TObject);
{ справочник тарифов на текущий ремонт }
begin
  Form15.status := status;
  Form15.nam := 'rep';
  Form15.num := 1;
  Form15.Caption := 'Тарифы для освещения МОП';
  Form15.ShowModal;
end;

procedure TForm42.Button3Click(Sender: TObject);
{ справочник тарифов на водопотребление }
begin
  Form19.status := status;
  Form19.nam := 'cold';
  Form19.num := 2;
  Form19.Caption := 'Тарифы на водопотребление(руб./чел.)';
  Form19.ShowModal;                                               
end;

procedure TForm42.Button4Click(Sender: TObject);
{ справочник тарифов на горячую воду }
begin
  Form19.status := status;
  Form19.nam := 'hot';
  Form19.num := 3;
  Form19.Caption := 'Тарифы на горячую воду(руб./чел.)';
  Form19.ShowModal;
end;

procedure TForm42.Button5Click(Sender: TObject);
{*******************************************************************************
  Процедура вызывает форму операций с тарифами на водоотведение
*******************************************************************************}
begin
  Form15.status := status;
  Form15.nam := 'canal';
  Form15.num := 4;
  Form15.Caption := 'Тарифы на водоотведение(руб./чел.)';
  Form15.ShowModal;
end;

procedure TForm42.Button6Click(Sender: TObject);
{ справочник тарифов на отопление }
begin
  Form15.status := status;
  Form15.nam := 'heat';
  Form15.num := 5;
  Form15.Caption := 'Тарифы на отопление(руб./кв.м.)';
  Form15.ShowModal;
end;

procedure TForm42.Button7Click(Sender: TObject);
{ справочник  тарифов на газ}
begin
  Form15.status := status;
  Form15.nam := 'gas';
  Form15.num := 6;
  Form15.Caption := 'Тарифы на газ(руб./чел.)';
  Form15.ShowModal;
end;

procedure TForm42.Button8Click(Sender: TObject);
{ справочник  тарифов на электроэнергию}
begin
  Form23.status := status;
  Form23.num := 7;
  Form23.ShowModal;
end;

procedure TForm42.Button9Click(Sender: TObject);
{ справочник тарифов на дрова }
begin
  Form15.status := status;
  Form15.nam := 'wood';
  Form15.num := 12;
  Form15.Caption := 'Тарифы на дрова(руб./кв.м.)';
  Form15.ShowModal;
end;

procedure TForm42.Button10Click(Sender: TObject);
{ справочник тарифов на уголь }
begin
  Form15.status := status;
  Form15.nam := 'coal';
  Form15.num := 13;
  Form15.Caption := 'Тарифы на уголь(руб./кв.м.)';
  Form15.ShowModal;
end;

procedure TForm42.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  Form1.SetTarifs;
end;

end.
