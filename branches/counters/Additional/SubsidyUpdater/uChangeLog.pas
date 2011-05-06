unit uChangeLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TChangeLogFrm = class(TForm)
    PageControl1: TPageControl;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangeLogFrm: TChangeLogFrm;

implementation

uses
  uMain;

{$R *.dfm}

procedure TChangeLogFrm.FormCreate(Sender: TObject);
var
  newPage: TTabSheet;
  i: integer;
  mChangeLog: TMemo;
begin
  for i := 0 to MainFrm.verList.Count - 1 do
  begin
    if FileExists('updates\release\' + MainFrm.verList[i] + '\' + 'release.txt') then
    begin
      newPage := TTabSheet.Create(PageControl1);
      with newPage do
      begin
        Parent  := PageControl1;
        Visible := True;
        Caption := MainFrm.verList[i];
        PageControl := PageControl1;
      end;

      mChangeLog := TMemo.Create(newPage);
      with mChangeLog do
      begin
        Parent := newPage;
        Visible := True;
        Align := alClient;
        BorderStyle := bsNone;  
        ScrollBars := ssVertical;
        Lines.LoadFromFile('updates\release\' + MainFrm.verList[i] + '\' + 'release.txt');
      end;
    end;
  end;
end;

end.
