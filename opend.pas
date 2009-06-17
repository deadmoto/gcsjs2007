unit opend;    

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm26 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    procedure ComboBox2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
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
  if (StrToInt(Edit1.Text)=Form1.by) and
     (m[Combobox2.ItemIndex]>=Form1.bm) or
     (StrToInt(Edit1.Text)>Form1.by) {and
     (StrToInt(Edit1.Text)<=Form1.ey+1) and
     (m[Combobox2.ItemIndex]<=Form1.em+1)} then begin
    if m[Combobox2.ItemIndex]>=10 then
      Form1.rdt := '01.'+IntToStr(m[Combobox2.ItemIndex])+'.'+Edit1.Text
    else
      Form1.rdt := '01.'+'0'+IntToStr(m[Combobox2.ItemIndex])+'.'+Edit1.Text;
    Close;
  end
  else
    ShowMessage('�������� ������ ������!');
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
  Combobox2.Items.Add('������');
  Combobox2.Items.Add('�������');
  Combobox2.Items.Add('����');
  Combobox2.Items.Add('������');
  Combobox2.Items.Add('���');
  Combobox2.Items.Add('����');
  Combobox2.Items.Add('����');
  Combobox2.Items.Add('������');
  Combobox2.Items.Add('��������');
  Combobox2.Items.Add('�������');
  Combobox2.Items.Add('������');
  Combobox2.Items.Add('�������');
  Combobox2.ItemIndex := 0;
end;

procedure TForm26.FormShow(Sender: TObject);
var
  i: integer;
begin
  i := StrToInt(Copy(Form1.rdt, 4, 2));
  Edit1.Text := Copy(Form1.rdt, 7, 4);
  Combobox2.Text := SelMonth(i-1);
  Combobox2.OnChange(combobox2);
end;

function TForm26.SelMonth(n: integer): string;
begin
  case n of
    0: Result := '������';
    1: Result := '�������';
    2: Result := '����';
    3: Result := '������';
    4: Result := '���';
    5: Result := '����';
    6: Result := '����';
    7: Result := '������';
    8: Result := '��������';
    9: Result := '�������';
    10: Result := '������';
    11: Result := '�������';
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

procedure TForm26.Edit1Exit(Sender: TObject);
begin
  if not IsInt(Edit1.Text) then begin
    ShowMessage('� ���� ���� ����� ���� ������ ����� �����, ���������� ���!');
    Edit1.Text := '2006';
  end
  else
    if StrToInt(Edit1.Text)<2006 then
      Edit1.Text := '2006';
end;

procedure TForm26.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then begin
    if not IsInt(Edit1.Text) then begin
      ShowMessage('� ���� ���� ����� ���� ������ ����� �����, ���������� ���!');
      Edit1.Text := '2006';
    end
    else
      if StrToInt(Edit1.Text)<2006 then
        Edit1.Text := '2006';
  end;
end;

end.
