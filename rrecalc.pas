unit rrecalc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComObj;

type
  TForm43 = class(TForm)
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form43: TForm43;

implementation

uses datamodule, main, progress, service, MyTypes;

{$R *.dfm}

procedure TForm43.Button1Click(Sender: TObject);
{
  ��������� ��������� ������ ����������� �������� � ����������� ��������. ������
  ������� � ���� MS Excel.
}
var
  n, otdel: string;
  k, cnt: integer;
  pr: TAboutBox1;
  ExcelApp, Sheet: OleVariant;
begin
  pr := TAboutBox1.Create(Application);
  pr.Label1.Caption := '������������ ����������� � ����������� ��������';
  pr.Label2.Caption := '���������� �������:';
  pr.Label3.Caption := '';
  pr.Show;
  pr.Update;
  SendMessage(pr.Handle, wm_paint, 0, 0);
  pr.ProgressBar1.Step := 1;
  cnt := 0;
  k := 1;

  case MainForm.dist of
    2: otdel := '����������';
    3: otdel := '������������';
    4: otdel := '����������';
    6: otdel := '������������';
    7: otdel := '����������';
  end;

  try
    ExcelApp:=CreateOleObject('Excel.Application');
    ExcelApp.Visible:=False;
    ExcelApp.WorkBooks.Open(MainForm.reports_path + 'recalc.xlt');
  except
    on E: Exception do
      raise Exception.Create('������ �������� ������� Excel: ' + E.Message);
  end;

  Sheet := ExcelApp.ActiveWorkBook.WorkSheets[1];

  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('execute getclinfo_office :id,:d,:office');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'id', MainForm.dist);
    SetParam(Parameters, 'd', MainForm.rdt);
    SetParam(Parameters, 'office', MainForm.office);
    Open;
    pr.ProgressBar1.Max := RecordCount;
    while not eof do
    begin
      n := IntToStr(k);
      Sheet.Range['b'+n,'b'+n] := '�� ����� ���������� ������ � �����������-������������ ����������� �� �.�����';
      Sheet.Range['b'+n,'b'+n].HorizontalAlignment := -4108;//center
      inc(k);
      n := IntToStr(k);
      Sheet.Range['b'+n,'b'+n] := '����������� �0'+FieldByName('regn').AsString + ' �� ' + otdel + ' ������';
      Sheet.Range['b'+n,'b'+n].HorizontalAlignment := -4108;//center
      inc(k,2);n := IntToStr(k);
      Sheet.Range['a'+n,'a'+n] := '���������';
      Sheet.Range['b'+n,'b'+n] := FieldByName('fio').AsString;
      inc(k);n := IntToStr(k);
      Sheet.Range['a'+n,'a'+n] := '�����, �������';
      Sheet.Range['b'+n,'b'+n] := MainForm.GenAddr(FieldByName('namestreet').AsString,
                                            FieldByName('nhouse').AsString,
                                            FieldByName('corp').AsString,
                                            FieldByName('apart').AsString);
      inc(k);n := IntToStr(k);
      Sheet.Range['a'+n,'a'+n] := '�������������';
      Sheet.Range['b'+n,'b'+n] := FieldByName('namemng').AsString;
      inc(k);n := IntToStr(k);
      Sheet.Range['a'+n,'a'+n] := '����� �������������� ��������';
      Sheet.Range['b'+n,'b'+n] := '� '+FieldByName('bdate').AsString+
                                    ' �� '+FieldByName('edate').AsString;
      inc(k);n := IntToStr(k);
      Sheet.Range['a'+n,'a'+n] := '����� �������� � '+MainForm.rdt+'�. ���������� '+FormatFloat('0.00', FieldByName('sub').AsFloat)+'���. � ����� � ����������';
      inc(k);n := IntToStr(k);
      if CheckBox1.Checked then
        Sheet.Range['a'+n,'a'+n] := CheckBox1.Caption;
      if CheckBox2.Checked then
        Sheet.Range['a'+n,'a'+n] := String(Sheet.Range['a'+n,'a'+n]) + ', '+CheckBox2.Caption;
      if CheckBox3.Checked then
        Sheet.Range['a'+n,'a'+n] := String(Sheet.Range['a'+n,'a'+n]) + ', '+CheckBox3.Caption;
      if CheckBox4.Checked then
        Sheet.Range['a'+n,'a'+n] := String(Sheet.Range['a'+n,'a'+n]) + ', '+Memo1.Text;
      inc(k,2);n := IntToStr(k);
      Sheet.Range['a'+n,'a'+n] := '��������� �������';
      Sheet.Range['c'+n,'c'+n] := FieldByName('boss').AsString;
      inc(k,2);n := IntToStr(k);
      Sheet.Range['a'+n,'a'+n] := '����������� ������� "   " ____________ '+Copy(MainForm.rdt,7,4)+'�.';
      Sheet.Range['c'+n,'c'+n] := '/������� �������/';
      inc(cnt);
      if cnt mod 5 = 0 then
        k := 71*((k div 71)+1)+1
      else
        inc(k,2);
      pr.ProgressBar1.StepIt;
      pr.Label3.Caption := IntToStr(cnt);
      pr.Update;
      SendMessage(pr.Handle, wm_paint, 0, 0);
      Next;
    end;
    Close;
  end;
  pr.Close;
  pr.Release;
  ExcelApp.Visible:=True;

  Close;
end;
//end;

procedure TForm43.FormCreate(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

end.
