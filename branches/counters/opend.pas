unit opend;    

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DateUtils;

type
  TForm26 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ComboBox2: TComboBox;
    GroupBox1: TGroupBox;
    FlowPanel1: TFlowPanel;
    Button2: TButton;
    Button1: TButton;
    ComboBox1: TComboBox;
    procedure ComboBox2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    m: array of integer;
    function SelMonth(n: integer): string;
    function SearchMonth(s: string): integer;
  public
    { Public declarations }
  end;

var
  Form26: TForm26;

implementation

uses main, datamodule, service;

{$R *.dfm}

procedure TForm26.ComboBox1Exit(Sender: TObject);
begin
  if not IsInt(ComboBox1.Text) then begin
    ShowMessage('¬ этом поле может быть только целое число, означающее год!');
    ComboBox1.Text := '2006';
  end
  else
    if StrToInt(ComboBox1.Text)<2006 then
      ComboBox1.Text := '2006';
end;

procedure TForm26.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then begin
    if not IsInt(ComboBox1.Text) then begin
      ShowMessage('¬ этом поле может быть только целое число, означающее год!');
      ComboBox1.Text := '2006';
    end
    else
      if StrToInt(ComboBox1.Text)<2006 then
        ComboBox1.Text := '2006';
  end;

end;

procedure TForm26.ComboBox2Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchMonth(Combobox2.Text);
  if ind <> -1 then
    Combobox2.ItemIndex := ind
  else begin
    Combobox2.ItemIndex := 0;
    Combobox2.Text := SelMonth(m[0]);
  end;
end;

procedure TForm26.Button1Click(Sender: TObject);
begin
  if (StrToInt(ComboBox1.Text)=MainForm.by) and (m[Combobox2.ItemIndex]>=MainForm.bm) or
    (StrToInt(ComboBox1.Text)>MainForm.by) {and
     (StrToInt(Edit1.Text)<=MainForm.ey+1) and
     (m[Combobox2.ItemIndex]<=MainForm.em+1)} then begin
    if m[Combobox2.ItemIndex]>=10 then
      MainForm.rdt := '01.'+IntToStr(m[Combobox2.ItemIndex])+'.'+ComboBox1.Text
    else
      MainForm.rdt := '01.'+'0'+IntToStr(m[Combobox2.ItemIndex])+'.'+ComboBox1.Text;
    Close;
  end
  else
    ShowMessage('¬ыберите другой период!');
end;

procedure TForm26.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm26.FormCreate(Sender: TObject);
var
  i: integer;
begin
  SetLength(m, 12);
  Combobox2.Clear;
  for i:=0 to 11 do
    m[i] := i+1;
  Combobox2.Items.Add('€нварь');
  Combobox2.Items.Add('февраль');
  Combobox2.Items.Add('март');
  Combobox2.Items.Add('апрель');
  Combobox2.Items.Add('май');
  Combobox2.Items.Add('июнь');
  Combobox2.Items.Add('июль');
  Combobox2.Items.Add('август');
  Combobox2.Items.Add('сент€брь');
  Combobox2.Items.Add('окт€брь');
  Combobox2.Items.Add('но€брь');
  Combobox2.Items.Add('декабрь');
  Combobox2.ItemIndex := 0;
end;

procedure TForm26.FormShow(Sender: TObject);
var
  i,ii: integer;
  tmp_by: integer;
begin
  ComboBox1.Clear;
  tmp_by:= MainForm.by;
  ii := StrToInt(Copy(MainForm.rdt, 4, 2));
  ComboBox1.Text := Copy(MainForm.rdt, 7, 4);

  for i:=0 to (YearOf(Date)-MainForm.by) do begin
    ComboBox1.Items.Add(IntToStr(tmp_by));
    inc(tmp_by);
  end;

  Combobox2.Text := SelMonth(ii-1);
  Combobox2.OnChange(combobox2);
end;

function TForm26.SelMonth(n: integer): string;
begin
  case n of
    0: Result := '€нварь';
    1: Result := 'февраль';
    2: Result := 'март';
    3: Result := 'апрель';
    4: Result := 'май';
    5: Result := 'июнь';
    6: Result := 'июль';
    7: Result := 'август';
    8: Result := 'сент€брь';
    9: Result := 'окт€брь';
    10: Result := 'но€брь';
    11: Result := 'декабрь';
  end;
end;

function TForm26.SearchMonth(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox2.Items.Count-1 do begin
    if Combobox2.Items.Strings[i]=s then
      break;
  end;
  if i<combobox2.Items.Count then
    Result := i
  else
    Result := -1;
end;

end.
