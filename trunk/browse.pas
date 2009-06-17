unit browse;                  

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl;

type
  TForm36 = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    Button2: TButton;
    Button1: TButton;
    Edit1: TEdit;
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    path: string;
  end;

var
  Form36: TForm36;

implementation

uses imexp;

{$R *.dfm}

procedure TForm36.DirectoryListBox1Change(Sender: TObject);
begin
  Edit1.Text := DirectoryListBox1.Directory + '\';
end;

procedure TForm36.Button1Click(Sender: TObject);
begin
  path := Edit1.Text;
  Close;
end;

procedure TForm36.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm36.FormShow(Sender: TObject);
begin
  DirectoryListBox1.Directory := ExtractFilePath(Application.ExeName)+'out\';
  path := ExtractFilePath(Application.ExeName)+'out\';
end;

end.
