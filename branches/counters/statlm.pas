unit statlm;

interface

uses
  Classes,
  Contnrs,
  Controls,
  Dialogs,
  Forms,
  Graphics,
  Messages,
  StdCtrls,
  SysUtils,
  Variants,
  Windows;

type
  TForm40 = class(TForm)
    GroupBox1: TGroupBox;
    Label1:    TLabel;
    Label2:    TLabel;
    Label3:    TLabel;
    Edit1:     TEdit;
    Edit3:     TEdit;
    GroupBox2: TGroupBox;
    Label4:    TLabel;
    Label5:    TLabel;
    Edit4:     TEdit;
    Edit5:     TEdit;
    Label6:    TLabel;
    Edit6:     TEdit;
    Button1:   TButton;
    Button3:   TButton;
    Edit2:     TEdit;
    Button2:   TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    oldmin, oldmdd, newmin, newmdd: array of string;
    lcl: TObjectList;
    function Recalc: integer;
  public
    { Public declarations }
  end;

var
  Form40: TForm40;

implementation

uses
  datamodule,
  service,
  main,
  Client,
  progress,
  dbf, MyTypes;

{$R *.dfm}

procedure TForm40.FormShow(Sender: TObject);
var
  i: integer;
begin
  Edit6.Text := '0';
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from curmdd.dbf sbros');
    SQL.Add('order by sbros.namegroup');
    Open;
    SetLength(oldmdd, RecordCount);
    SetLength(newmdd, RecordCount);
    i := 0;
    while not EOF do
    begin
      oldmdd[i] := FieldByName('vmdd').AsString;
      newmdd[i] := oldmdd[i];
      Next;
      Inc(i);
    end;
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from curlmin.dbf sbros');
    SQL.Add('order by sbros.namemin');
    Open;
    SetLength(oldmin, RecordCount);
    SetLength(newmin, RecordCount);
    i := 0;
    while not EOF do
    begin
      oldmin[i] := FieldByName('minim').AsString;
      newmin[i] := oldmin[i];
      Next;
      Inc(i);
    end;
    Close;
  end;
  Edit1.Text := oldmin[0] + ',00';
  Edit2.Text := oldmin[1] + ',00';
  Edit3.Text := oldmin[2] + ',00';
  Edit4.Text := oldmdd[0];
  Edit5.Text := oldmdd[1];
  lcl.Clear;
end;

procedure TForm40.FormClose(Sender: TObject; var Action: TCloseAction);
var
  path: string;
  i: integer;
begin
  DModule.Query1.Close;
  //  lcl.Clear;
  path := ExtractFilePath(Application.ExeName) + 'database\';
  with DModule.DBF1 do
  begin
    if Active then
      Close;
    TableName := path + 'curlmin.dbf';
    Open;
    First;
    for i := 0 to Length(oldmin) - 1 do
    begin
      SetFieldData(FieldCount, oldmin[i]);
      Post;
      Next;
    end;
    Close;
    TableName := path + 'curmdd.dbf';
    Open;
    First;
    for i := 0 to Length(oldmdd) - 1 do
    begin
      SetFieldData(FieldCount, oldmdd[i]);
      Post;
      Next;
    end;
    Close;
  end;
  with DModule.norm1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from norm');
    Open;
  end;
end;

function TForm40.Recalc: integer;
var
  c: TClient;
  i, j, cnt, ncl: integer;
  odt: string;
  pr: TAboutBox1;
  val: real;
  t:  array of integer;
begin
  odt := DateToStr(IncMonth(StrToDate(MainForm.rdt), -1));
  pr  := TAboutBox1.Create(Application);
  pr.Label1.Caption := 'Перерасчет субсидий клиентов';
  pr.Label2.Caption := 'Обработано записей:';
  pr.Label3.Caption := '';
  pr.Show;
  pr.Update;

  SendMessage(pr.Handle, wm_paint, 0, 0);
  pr.ProgressBar1.Step := 1;
  c := TClient.Create(Empty, EmptyC);
  cnt := 0;
  ncl := 0;
  val := 0;
  lcl.Clear;
  try
    DModule.Database1.StartTransaction;
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('execute getfcl :idd,:nd');
      ParamByName('idd').AsInteger := MainForm.dist;
      ParamByName('nd').AsString := MainForm.rdt;
      Open;
      pr.ProgressBar1.Max := RecordCount;
      if not EOF then
      begin
        SetLength(t, RecordCount);
        for i := 0 to Length(t) - 1 do
        begin
          t[i] := FieldByName('regn').AsInteger;
          Next;
        end;
        Close;
        for j := 0 to Length(t) - 1 do
        begin
          c.SetClient(t[j], MainForm.rdt);
          c.SetCalc(t[j], MainForm.rdt);
          //c.cdata.rstnd := 0;//!
          c.Calc(0);
          val := 0;
          for i := 0 to numbtarif - 1 do
            if (i < 8) or (i > 11) then
              val := val + c.cdata.sub[i];
          if (StrToFloat(FormatFloat('0.00', val)) = 0) and (c.cdata.stop < 2) then
          begin
            Inc(ncl);
            lcl.Add(c.Copy);
          end;
          Inc(cnt);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(cnt);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        Close;
      end;
    end;
    DModule.Database1.Commit;
    Result := ncl;
  except
    DModule.Database1.Rollback;
    Result := -1;
  end;
  pr.Close;
  pr.Release;
end;

procedure TForm40.Button3Click(Sender: TObject);
{*******************************************************************************
  Сброс результатов поиска людей с нулевой субсидией с учетом указанных значений
  прожиточного минимума и мдд для различных социальных групп в dbf
*******************************************************************************}
var
  path:  string;
  i{,j}: integer;
begin
  if StrToInt(Edit6.Text) <> 0 then
  begin
    path := ExtractFilePath(Application.ExeName) + 'out\';
    with DModule do
    begin
      if Dbf1.Active then
        Dbf1.Close;
      Dbf1.AddFieldDefs('fio', bfString, 41, 0);
      Dbf1.AddFieldDefs('bdate', bfDate, 8, 0);
      Dbf1.AddFieldDefs('edate', bfDate, 8, 0);
      Dbf1.AddFieldDefs('mcount', bfNumber, 2, 0);
      Dbf1.AddFieldDefs('calc', bfNumber, 20, 0);
      Dbf1.AddFieldDefs('sub', bfNumber, 20, 2);
      Dbf1.TableName := path + 'nullsublm.dbf';
      Dbf1.CreateTable;
      Dbf1.CodePage := MainForm.codedbf;
      DModule.Query1.Close;
      DModule.Query1.SQL.Clear;
      DModule.Query1.SQL.Add('select sum(sub) as ex from sub where sdate =:d and regn =:r');
      DModule.Query1.ParamByName('d').AsDateTime := StrToDate(MainForm.rdt);
      if lcl.Count <> 0 then
      begin
        for i := 1 to lcl.Count do
        begin
          dbf1.Append;
          DModule.Query1.ParamByName('r').AsInteger := (TClient(lcl.Items[i - 1]).Data.regn);
          DModule.Query1.Open;
          EditField(TClient(lcl.Items[i - 1]).Data.fio, DBF1.CodePage, 1);
          EditField(DateToStr(TClient(lcl.Items[i - 1]).cdata.begindate), DBF1.CodePage, 2);
          EditField(DateToStr(TClient(lcl.Items[i - 1]).cdata.enddate), DBF1.CodePage, 3);
          EditField(IntToStr(TClient(lcl.Items[i - 1]).cdata.mcount), DBF1.CodePage, 4);
          EditField(IntToStr(TClient(lcl.Items[i - 1]).cdata.calc), DBF1.CodePage, 5);
          EditField(DModule.Query1.FieldByName('ex').AsString, DBF1.CodePage, 6);
          Dbf1.Post;
          DModule.Query1.Close;
        end;
      end;
      dbf1.Close;
    end;
  end;
end;

procedure TForm40.Button1Click(Sender: TObject);
{*******************************************************************************
  Поиск и расчет количества людей с нулевой субсидией с учетом указанных значений
  прожиточного минимума и мдд для различных социальных групп
*******************************************************************************}
var
  i, n: integer;
  path: string;
begin
  path := ExtractFilePath(Application.ExeName) + 'database\';
  with DModule.DBF1 do
  begin
    if Active then
      Close;
    TableName := path + 'curlmin.dbf';
    Open;
    First;
    for i := 0 to Length(oldmin) - 1 do
    begin
      SetFieldData(FieldCount, newmin[i]);
      Post;
      Next;
    end;
    Close;
    TableName := path + 'curmdd.dbf';
    Open;
    First;
    for i := 0 to Length(oldmdd) - 1 do
    begin
      SetFieldData(FieldCount, newmdd[i]);
      Post;
      Next;
    end;
    Close;
  end;
  n := Recalc;
  if n <> -1 then
    Edit6.Text := IntToStr(n)
  else
    ShowMessage('Ошибка при пересчете субсидий!');
end;

procedure TForm40.Edit4KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    CheckInt(tedit(Sender));
    if Sender = Edit4 then
      newmdd[0] := Edit4.Text;
    if Sender = Edit5 then
      newmdd[1] := Edit5.Text;
  end;
end;

procedure TForm40.Edit4Exit(Sender: TObject);
begin
  CheckInt(tedit(Sender));
  if Sender = Edit4 then
    newmdd[0] := Edit4.Text;
  if Sender = Edit5 then
    newmdd[1] := Edit5.Text;
end;

procedure TForm40.Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    SetPoint(TEdit(Sender));
    if Sender = Edit1 then
      newmin[0] := Edit1.Text;
    if Sender = Edit2 then
      newmin[1] := Edit2.Text;
    if Sender = Edit3 then
      newmin[2] := Edit3.Text;
  end;
end;

procedure TForm40.Edit1Exit(Sender: TObject);
begin
  SetPoint(TEdit(Sender));
  if Sender = Edit1 then
    newmin[0] := Edit1.Text;
  if Sender = Edit2 then
    newmin[1] := Edit2.Text;
  if Sender = Edit3 then
    newmin[2] := Edit3.Text;
end;

procedure TForm40.FormCreate(Sender: TObject);
begin
  lcl := TObjectList.Create;
end;

procedure TForm40.Button2Click(Sender: TObject);
begin
  with DModule.norm1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select id_norm, countp, snorm, phnorm, hnorm, phnorm from norm');
    Open;
  end;
end;

end.
