unit shpriv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids;

type
  TForm22 = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form22: TForm22;

implementation

uses datamodule;

{$R *.dfm}

procedure TForm22.FormShow(Sender: TObject);
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('execute getpriv');
    Open;
    First;
  end;
end;

procedure TForm22.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.Query1.Close;
end;

end.
