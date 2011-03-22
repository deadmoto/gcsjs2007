unit chinsp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm17 = class(TForm)
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    FlowPanel1: TFlowPanel;
    Button2: TButton;
    Button1: TButton;
    LabeledEdit1: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
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

uses datamodule, main, md5, connection_module;

{$R *.dfm}

procedure TForm17.FormShow(Sender: TObject);
var
  l: integer;
begin
  ComboBox1.Clear;
  l:=0;
  With DModule.Query1 do begin
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
      ComboBox1.Items.Add(FieldByName('nameinsp').AsString);
      insp[l] := FieldByName('id_insp').AsInteger;
      if insp[l]=Form1.insp then
        ComboBox1.ItemIndex := l
      else
        ComboBox1.ItemIndex := 0;
      Next;
      inc(l);
    end;
    Close;
  end;
  ac := false;
  nameinsp := ComboBox1.Items[ComboBox1.ItemIndex];
end;

procedure TForm17.LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Button1Click(Sender);
end;

procedure TForm17.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DModule.Query1.Close;
end;

procedure TForm17.Button1Click(Sender: TObject);
var
  i: integer;
  tmp_pass: string;
begin
  with DModule.Query1 do begin
    SQL.Clear;
    SQL.Text := 'SELECT password FROM Insp' + #13 +
      'WHERE (id_insp = :idinsp)';
    ParamByName('idinsp').AsInteger := insp[ComboBox1.ItemIndex];
    Open;
  end;

  tmp_pass :=  DModule.Query1.FieldByName('password').Value;

  if GenMD5Password(LabeledEdit1.Text) = tmp_pass then
  begin
    Form1.insp := insp[ComboBox1.ItemIndex];
    ac := true;
    nameinsp := ComboBox1.Items[ComboBox1.ItemIndex];
    Form1.Statusbar1.Panels[1].Text := 'Инспектор: '+ ComboBox1.Items[ComboBox1.ItemIndex];
    Form1.LoginMode := lInsp;
    Close;
  end
  else
  begin
    MessageDlg('Error! Password incorrect!', mtError, [mbOK], 0);
    exit;
  end;
end;

procedure TForm17.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
