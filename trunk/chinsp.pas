unit chinsp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm17 = class(TForm)
    GroupBox1: TGroupBox;
    Button2: TButton;
    Button1: TButton;
    ListBox1: TListBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    insp: array of integer;
  public
    { Public declarations }
    ac: boolean;
    nameinsp: string;
  end;

var
  Form17: TForm17;

implementation

uses datamodule, main;

{$R *.dfm}

procedure TForm17.FormShow(Sender: TObject);
var
  l: integer;
begin
  ListBox1.Clear;
  l:=0;
  With Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select id_insp, nameinsp');
    SQL.Add('from insp');
    SQL.Add('where (status = :st) and (id_dist = :id)');
    SQL.Add('order by nameinsp');
    ParamByName('st').AsInteger := 1;//только активные инспекторы
    ParamByName('id').AsInteger := Form1.dist;
    Open;
    First;
    while not EOF do begin
      SetLength(insp, Length(insp)+1);
      ListBox1.Items.Add(FieldByName('nameinsp').AsString);
      insp[l] := FieldByName('id_insp').AsInteger;
      if insp[l]=Form1.insp then
        Listbox1.ItemIndex := l
      else
        Listbox1.ItemIndex := 0;
      Next;
      inc(l);
    end;
    Close;
  end;
  ac := false;
  nameinsp := ListBox1.Items[Listbox1.ItemIndex];
end;

procedure TForm17.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.Query1.Close;
end;

procedure TForm17.Button1Click(Sender: TObject);
begin
  Form1.insp := insp[ListBox1.ItemIndex];
  ac := true;
  nameinsp := ListBox1.Items[Listbox1.ItemIndex];
  Form1.Statusbar1.Panels[1].Text := 'Инспектор: '+ ListBox1.Items[Listbox1.ItemIndex];
  Close;
end;

procedure TForm17.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
