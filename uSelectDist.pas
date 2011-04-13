unit uSelectDist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls;

type
  TSelectDistFrm = class(TForm)
    Label3: TLabel;
    ComboBox2: TComboBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    FlowPanel1: TFlowPanel;
    Button2: TButton;
    Button1: TButton;
    LabeledEdit1: TLabeledEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    insp: array of integer;//список id_insp
    dist: array of integer;//список id_dist
    procedure Fill;
    procedure Clear;
    function SelInsp(n: integer): string;
    function SearchInsp(s: string): integer;
  public
    { Public declarations }
  end;

var
  SelectDistFrm: TSelectDistFrm;

implementation

uses datamodule, main, service, md5, appregistry;

{$R *.dfm}

procedure TSelectDistFrm.Fill;
var
  l: integer;
begin
  with DModule.Query1 do begin
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from dist');
    SQL.Add('order by namedist');
    Open;
    First;
    while not EOF do begin
      SetLength(dist, Length(dist)+1);
      Combobox2.Items.Add(FieldByName('namedist').AsString);
      dist[l] := FieldByName('id_dist').AsInteger;
      if dist[l]=MainForm.dist then begin
        Combobox2.ItemIndex := l;
        Combobox2.Text := FieldByName('namedist').AsString;
      end;
      Next;
      inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_insp, nameinsp');
    SQL.Add('from insp');
    SQL.Add('where (status = :st) and (id_dist = :id)');
    SQL.Add('order by nameinsp');
    ParamByName('st').AsInteger := 1;//только активные инспекторы
    ParamByName('id').AsInteger := dist[Combobox2.ItemIndex];
    Open;
    First;
    Combobox1.Text := FieldByName('nameinsp').AsString;
    while not EOF do begin
      SetLength(insp, Length(insp)+1);
      Combobox1.Items.Add(FieldByName('nameinsp').AsString);
      insp[l] := FieldByName('id_insp').AsInteger;
      if insp[l]=MainForm.insp then begin
        Combobox1.ItemIndex := l;
        Combobox1.Text := FieldByName('nameinsp').AsString;
      end;
      Next;
      inc(l);
    end;
    Close;
  end;
end;

procedure TSelectDistFrm.Clear;
begin
  Combobox1.Clear;
  Combobox2.Clear;
end;

procedure TSelectDistFrm.Button2Click(Sender: TObject);
{ выйти }
begin
  Close;
end;

procedure TSelectDistFrm.Button1Click(Sender: TObject);
{войти}
var
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
  if Combobox1.Text <> '' then
    with DModule.Query1 do begin
      Close;
      SQL.Clear;
      SQL.Add('select *');
      SQL.Add('from insp');
      SQL.Add('where (id_insp = :id)and(id_dist=:idd)');
      ParamByName('id').AsInteger := insp[Combobox1.ItemIndex];
      ParamByName('idd').AsInteger := dist[Combobox2.ItemIndex];
      Open;
      if not IsEmpty then begin
        MainForm.insp := insp[Combobox1.ItemIndex];
        MainForm.dist := dist[Combobox2.ItemIndex];
        MainForm.LoginMode := lInsp;
        SelectDistFrm.Close;
      end
      else
        ShowMessage('Вход невозможен! Введите другое ФИО!');
    end
  else
    ShowMessage('Поле ФИО должно быть заполнено!');
  end
  else
  begin
    MessageDlg('Error! Password incorrect!', mtError, [mbOK], 0);
    exit;
  end;
end;

procedure TSelectDistFrm.FormShow(Sender: TObject);
begin
  Clear;
  Fill;
end;

procedure TSelectDistFrm.LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Button1Click(Sender);
end;

procedure TSelectDistFrm.ComboBox1Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchInsp(Combobox1.Text);
  if ind <> -1 then
    Combobox1.ItemIndex := ind
  else begin
    Combobox1.ItemIndex := 0;
    Combobox1.Text := SelInsp(insp[0]);
  end;
end;

function TSelectDistFrm.SearchInsp(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox1.Items.Count-1 do begin
    if Combobox1.Items.Strings[i]=s then
      break;
  end;
  if i<combobox1.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TSelectDistFrm.SelInsp(n: integer): string;
begin
  with DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select nameinsp');
    SQL.Add('from insp');
    SQL.Add('where (id_insp = :id)and(id_dist=:dist)');
    ParamByName('id').AsInteger := n;
    ParamByName('dist').AsInteger := dist[Combobox2.ItemIndex];
    Open;
    Result := FieldByName('nameinsp').AsString;
    Close;
  end;
end;

procedure TSelectDistFrm.ComboBox2Change(Sender: TObject);
var
  l: integer;
begin
  with DModule.Query1 do begin
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_insp, nameinsp');
    SQL.Add('from insp');
    SQL.Add('where (status = :st) and (id_dist = :id)');
    SQL.Add('order by nameinsp');
    ParamByName('st').AsInteger := 1;//только активные инспекторы
    ParamByName('id').AsInteger := dist[Combobox2.ItemIndex];
    Open;
    First;
    Combobox1.Clear;
    Combobox1.Text := FieldByName('nameinsp').AsString;
    while not EOF do begin
      SetLength(insp, Length(insp)+1);
      Combobox1.Items.Add(FieldByName('nameinsp').AsString);
      insp[l] := FieldByName('id_insp').AsInteger;
      Next;
      inc(l);
    end;
    Close;
    Combobox1.ItemIndex := 0;
  end;
end;

end.
