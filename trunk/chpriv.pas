unit chpriv;                                         

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TForm11 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    priv: integer;
    status: integer;//0 - только дл€ чтени€, 1 - запись
  end;

var
  Form11: TForm11;

implementation

uses datamodule, privilege, main;

{$R *.dfm}

procedure TForm11.Button2Click(Sender: TObject);
{ изменить/просмотр }
begin
  Form12.status := 1;
  Form12.sec := status;
  Form12.ShowModal;
end;

procedure TForm11.Button1Click(Sender: TObject);
{ добавить льготу }
begin
  Form12.status := 0;
  Form12.sec := status;
  Form12.ShowModal;
end;

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
{ закрытие формы }
begin
  Datamodule1.Query1.Close;
end;

procedure TForm11.Button4Click(Sender: TObject);
{ закрытие формы }
begin
  Close;
end;

procedure TForm11.Button3Click(Sender: TObject);
begin
  Form12.status := 2;
  Form12.sec := status;
  Form12.ShowModal;
end;

procedure TForm11.FormPaint(Sender: TObject);
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('execute getpriv');
    Open;
    First;
  end;
  priv := DBGrid1.Fields[0].AsInteger;
end;

procedure TForm11.FormShow(Sender: TObject);
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('execute getpriv');
    Open;
    First;
  end;
  priv := DBGrid1.Fields[0].AsInteger;
  if status=0 then begin
    Button1.Enabled := false;
    Button2.Enabled := false;
    Button3.Enabled := false;
    Button2.Caption := 'ѕросмотр';
  end
  else begin
    Button1.Enabled := true;
    Button2.Enabled := true;
    Button3.Enabled := true;
    Button2.Caption := '»зменить';
  end;
end;

procedure TForm11.DBGrid1CellClick(Column: TColumn);
begin
  priv := DBGrid1.Fields[0].AsInteger;
end;

procedure TForm11.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then begin
    Form12.status := 1;
    Form12.sec := status;
    Form12.ShowModal;
  end;
  if key=vk_insert then begin
    Form12.status := 0;
    Form12.sec := status;
    Form12.ShowModal;
  end;
end;

procedure TForm11.DBGrid1DblClick(Sender: TObject);
begin
  priv := DBGrid1.Fields[0].AsInteger;
  Form12.status := 1;
  Form12.sec := status;
  Form12.ShowModal;
end;

end.
