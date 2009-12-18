unit loop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm16 = class(TForm)
    GroupBox10: TGroupBox;
    Label58: TLabel;
    Label59: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label67: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label54: TLabel;
    Label53: TLabel;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Edit21: TEdit;
    Edit22: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Button2: TButton;
    CheckBox2: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit23Exit(Sender: TObject);
    procedure Edit23KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    wrt: boolean;//просмотр или изменение
    values1,values2,values3: array of real;//начисления и субсидия
    procedure SumV;
  public
    { Public declarations }
    status: integer;//0 - открыта для просмотра, 1 - для изменения
  end;

var
  Form16: TForm16;

implementation

uses service, datamodule, main, curhist,math;

{$R *.dfm}

procedure TForm16.SumV;
{ Процедура суммирует начисления и субсидию по всем услугам }
var
  v: real;
begin
  if (Edit1.Text<>'')and(Edit3.Text<>'')and(Edit5.Text<>'')and
      (Edit7.Text<>'')and(Edit9.Text<>'')and(Edit11.Text<>'')and
      (Edit13.Text<>'')and(Edit15.Text<>'')and(Edit17.Text<>'')and
      (Edit19.Text<>'') then begin
    v := StrToFloat(Edit1.Text)+StrToFloat(Edit3.Text)+StrToFloat(Edit5.Text)+
        StrToFloat(Edit7.Text)+StrToFloat(Edit9.Text)+StrToFloat(Edit11.Text)+
        StrToFloat(Edit13.Text)+StrToFloat(Edit15.Text)+StrToFloat(Edit17.Text)+
        StrToFloat(Edit19.Text);
    Edit21.Text := FlToStr(v);
  end
  else
    Edit21.Text := '';
  if (Edit2.Text<>'')and(Edit4.Text<>'')and(Edit6.Text<>'')and
      (Edit8.Text<>'')and(Edit10.Text<>'')and(Edit12.Text<>'')and
      (Edit14.Text<>'')and(Edit16.Text<>'')and(Edit18.Text<>'')and
      (Edit20.Text<>'') then begin
    v := StrToFloat(Edit2.Text)+StrToFloat(Edit4.Text)+StrToFloat(Edit6.Text)+
        StrToFloat(Edit8.Text)+StrToFloat(Edit10.Text)+StrToFloat(Edit12.Text)+
        StrToFloat(Edit14.Text)+StrToFloat(Edit16.Text)+StrToFloat(Edit18.Text)+
        StrToFloat(Edit20.Text);
    Edit22.Text := FlToStr(v);
  end
  else
    Edit22.Text := '';
  if (Edit23.Text<>'')and(Edit24.Text<>'')and(Edit25.Text<>'')and
      (Edit26.Text<>'')and(Edit27.Text<>'')and(Edit28.Text<>'')and
      (Edit29.Text<>'')and(Edit30.Text<>'')and(Edit31.Text<>'')and
      (Edit32.Text<>'') then begin
    v := StrToFloat(Edit23.Text)+StrToFloat(Edit24.Text)+StrToFloat(Edit25.Text)+
        StrToFloat(Edit26.Text)+StrToFloat(Edit27.Text)+StrToFloat(Edit28.Text)+
        StrToFloat(Edit29.Text)+StrToFloat(Edit30.Text)+StrToFloat(Edit31.Text)+
        StrToFloat(Edit32.Text);
    Edit33.Text := FlToStr(v);
  end
  else
    Edit33.Text := '';
end;

procedure TForm16.Button1Click(Sender: TObject);
{
  Процедура сохраняет изменения, сделанные на форме, в служебную таблицу. Т.о.
  таблица субсидий не меняется, а изменения появляются только в отчетах.
  После сохранения изменений форма закрывается, и открывается форма текущих субсидий,
  на которой отображены последние изменения.
}
var
  i, isFact: integer;
begin
  if CheckBox1.Checked then
  begin
  for i:=0 to numbtarif-1 do
  begin
    if CheckBox2.Checked then
      isFact := 1
    else
      isFact := 0;

    with Datamodule1.Query1 do
    begin
      Close;
      Close;
      SQL.Clear;
      SQL.Add('select regn from sluj');
      SQL.Add('where (regn=:r)and(sdate=CONVERT(smalldatetime,:s,104))');
      SQL.Add('and(service=:serv)');
      ParamByName('r').AsInteger := Form18.client;
      ParamByName('s').AsString := Form1.rdt;
      ParamByName('serv').AsInteger := i;
      Open;
      If IsEmpty or not IsEmpty and
        (FieldByName('regn').AsInteger=Form18.client) then
        begin
        If IsEmpty then
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into sluj');
          SQL.Add('values (CONVERT(smalldatetime,:s,104),:r,:serv,:pm,:snp,:sub,:fact)');
        end
        else
        begin
          Close;
          SQL.Clear;
          SQL.Add('update sluj');
          SQL.Add('set pm=:pm,snpm=:snp,sub=:sub, factminus = :fact');
          SQL.Add('where (regn=:r)and(sdate=CONVERT(smalldatetime,:s,104))');
          SQL.Add('and(service=:serv)');
        end;
        ParamByName('s').AsString := Form1.rdt;
        ParamByName('r').AsInteger := Form18.client;
        ParamByName('fact').AsInteger := isFact;
        ParamByName('serv').AsInteger := i;
        case i of
        0://содержание жилья
          begin
            ParamByName('pm').AsFloat := Rnd(values3[i]-StrToFloat(Edit23.Text));
            ParamByName('snp').AsFloat := Rnd(values1[i]-StrToFloat(Edit1.Text));
            ParamByName('sub').AsFloat := Rnd(values2[i]-StrToFloat(Edit2.Text));
            ExecSQL;
          end;
        1://ремонт
          begin
            ParamByName('pm').AsFloat := Rnd(values3[i]-StrToFloat(Edit24.Text));
            ParamByName('snp').AsFloat := Rnd(values1[i]-StrToFloat(Edit3.Text));
            ParamByName('sub').AsFloat := Rnd(values2[i]-StrToFloat(Edit4.Text));
            ExecSQL;
          end;
        2://х.вода
          begin
            ParamByName('pm').AsFloat := Rnd(values3[i]-StrToFloat(Edit25.Text));
            ParamByName('snp').AsFloat := Rnd(values1[i]-StrToFloat(Edit5.Text));
            ParamByName('sub').AsFloat := Rnd(values2[i]-StrToFloat(Edit6.Text));
            ExecSQL;
          end;
        3://г.вода
          begin
            ParamByName('pm').AsFloat := Rnd(values3[i]-StrToFloat(Edit26.Text));
            ParamByName('snp').AsFloat := Rnd(values1[i]-StrToFloat(Edit7.Text));
            ParamByName('sub').AsFloat := Rnd(values2[i]-StrToFloat(Edit8.Text));
            ExecSQL;
          end;
        4://водоотведение
          begin
            ParamByName('pm').AsFloat := Rnd(values3[i]-StrToFloat(Edit27.Text));
            ParamByName('snp').AsFloat := Rnd(values1[i]-StrToFloat(Edit9.Text));
            ParamByName('sub').AsFloat := Rnd(values2[i]-StrToFloat(Edit10.Text));
            ExecSQL;
          end;
        5://отопление
          begin
            ParamByName('pm').AsFloat := Rnd(values3[i]-StrToFloat(Edit28.Text));
            ParamByName('snp').AsFloat := Rnd(values1[i]-StrToFloat(Edit11.Text));
            ParamByName('sub').AsFloat := Rnd(values2[i]-StrToFloat(Edit12.Text));
            ExecSQL;
          end;
        6://газ
          begin
            ParamByName('pm').AsFloat := Rnd(values3[i]-StrToFloat(Edit29.Text));
            ParamByName('snp').AsFloat := Rnd(values1[i]-StrToFloat(Edit13.Text));
            ParamByName('sub').AsFloat := Rnd(values2[i]-StrToFloat(Edit14.Text));
            ExecSQL;
          end;
        7://э/э
          begin
            ParamByName('pm').AsFloat := Rnd(values3[i]-StrToFloat(Edit30.Text));
            ParamByName('snp').AsFloat := Rnd(values1[i]-StrToFloat(Edit15.Text));
            ParamByName('sub').AsFloat := Rnd(values2[i]-StrToFloat(Edit16.Text));
            ExecSQL;
          end;
        12://дрова
          begin
            ParamByName('pm').AsFloat := Rnd(values3[i]-StrToFloat(Edit31.Text));
            ParamByName('snp').AsFloat := Rnd(values1[i]-StrToFloat(Edit17.Text));
            ParamByName('sub').AsFloat := Rnd(values2[i]-StrToFloat(Edit18.Text));
            ExecSQL;
          end;
        13://уголь
          begin
            ParamByName('pm').AsFloat := Rnd(values3[i]-StrToFloat(Edit32.Text));
            ParamByName('snp').AsFloat := Rnd(values1[i]-StrToFloat(Edit19.Text));
            ParamByName('sub').AsFloat := Rnd(values2[i]-StrToFloat(Edit20.Text));
            ExecSQL;
          end;
        end;
        Close;
      end;
    end;
  end;
    Form18.ModSub(Form18.client,StrToFloat(Edit22.Text));
  end;
  Close;
  Form18.changes := True;
end;

procedure TForm16.FormShow(Sender: TObject);
{
  Процедура устанавливает первоначальные настройки: ячейки закрыты для редактирования.
  Данные о начислениях и субсидии загружаются в ячейки. Согласно статусу формы
  гасится(0) или нет(1) кнопка "изменить".
}
var
  snpm,sub,pm: real;
  serv: integer;
begin
  Label3.Caption := Form18.fio;
  wrt := false;
  CheckBox1.Checked := wrt;
  SetLength(values1,numbtarif);
  SetLength(values2,numbtarif);
  SetLength(values3,numbtarif);
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select sub.service,sub.pm as pm1,sub.snpm as sn1,sub.sub as s1,');
    SQL.Add('sluj.pm as pm2,sluj.snpm as sn2,sluj.sub as s2');
    SQL.Add('from sub left join sluj on sub.regn=sluj.regn');
    SQL.Add('and sub.service=sluj.service and sub.sdate=sluj.sdate');
    SQL.Add('where (sub.regn=:id)and(sub.sdate=convert(smalldatetime,:d,104))');
    ParamByName('id').AsInteger := Form18.client;
    ParamByName('d').AsString := Form1.rdt;
    Open;
    while not eof do begin    
      serv := FieldByName('service').AsInteger;
      values1[serv] := FieldByName('sn1').AsFloat;
      values2[serv] := FieldByName('s1').AsFloat;
      values3[serv] := FieldByName('pm1').AsFloat;
      pm := FieldByName('pm1').AsFloat-FieldByName('pm2').AsFloat;
      snpm := FieldByName('sn1').AsFloat-FieldByName('sn2').AsFloat;
      sub := FieldByName('s1').AsFloat-FieldByName('s2').AsFloat;
      case serv of
      0://содержание жилья
        begin
          Edit23.Text := FlToStr(pm);
          Edit1.Text := FlToStr(snpm);
          Edit2.Text := FlToStr(sub);
        end;
      1://Освещение МОП
        begin
          Edit24.Text := FlToStr(pm);
          Edit3.Text := FlToStr(snpm);
          Edit4.Text := FlToStr(sub);
        end;
      2://х.вода
        begin
          Edit25.Text := FlToStr(pm);
          Edit5.Text := FlToStr(snpm);
          Edit6.Text := FlToStr(sub);
        end;
      3://г.вода
        begin
          Edit26.Text := FlToStr(pm);
          Edit7.Text := FlToStr(snpm);
          Edit8.Text := FlToStr(sub);
        end;
      4://водоотведение
        begin
          Edit27.Text := FlToStr(pm);
          Edit9.Text := FlToStr(snpm);
          Edit10.Text := FlToStr(sub);
        end;
      5://отопление
        begin
          Edit28.Text := FlToStr(pm);
          Edit11.Text := FlToStr(snpm);
          Edit12.Text := FlToStr(sub);
        end;
      6://газ
        begin
          Edit29.Text := FlToStr(pm);
          Edit13.Text := FlToStr(snpm);
          Edit14.Text := FlToStr(sub);
        end;
      7://э/э
        begin
          Edit30.Text := FlToStr(pm);
          Edit15.Text := FlToStr(snpm);
          Edit16.Text := FlToStr(sub);
        end;
      12://дрова
        begin
          Edit31.Text := FlToStr(pm);
          Edit17.Text := FlToStr(snpm);
          Edit18.Text := FlToStr(sub);
        end;
      13://уголь
        begin
          Edit32.Text := FlToStr(pm);
          Edit19.Text := FlToStr(snpm);
          Edit20.Text := FlToStr(sub);
        end;
      end;
      Next;
    end;
    Close;
  end;
  SumV;
  if status=0 then
    Button1.Enabled := false
  else
    Button1.Enabled := true;
end;

procedure TForm16.FormClose(Sender: TObject; var Action: TCloseAction);
{ Процедура закрытия формы }
begin
  Datamodule1.Query1.Close;
  wrt := false;
end;

procedure TForm16.CheckBox1Click(Sender: TObject);
{
  Процедура обрабатывает нажатие CheckBox. Если позволяет статус, то можно
  редактировать, а значит открываются ячейки для редактирования.
}
begin
  if not wrt and (status=1) and CheckBox1.Checked then begin
    wrt := true;
    Edit1.ReadOnly := false;Edit2.ReadOnly := false;
    Edit3.ReadOnly := false;Edit4.ReadOnly := false;
    Edit5.ReadOnly := false;Edit6.ReadOnly := false;
    Edit7.ReadOnly := false;Edit8.ReadOnly := false;
    Edit9.ReadOnly := false;Edit10.ReadOnly := false;
    Edit11.ReadOnly := false;Edit12.ReadOnly := false;
    Edit13.ReadOnly := false;Edit14.ReadOnly := false;
    Edit15.ReadOnly := false;Edit16.ReadOnly := false;
    Edit17.ReadOnly := false;Edit18.ReadOnly := false;
    Edit19.ReadOnly := false;Edit20.ReadOnly := false;
    Edit23.ReadOnly := false;Edit24.ReadOnly := false;
    Edit25.ReadOnly := false;Edit26.ReadOnly := false;
    Edit27.ReadOnly := false;Edit28.ReadOnly := false;
    Edit29.ReadOnly := false;Edit30.ReadOnly := false;
    Edit31.ReadOnly := false;Edit32.ReadOnly := false;
    Edit1.Color := clWindow;Edit2.Color := clWindow;
    Edit3.Color := clWindow;Edit4.Color := clWindow;
    Edit5.Color := clWindow;Edit6.Color := clWindow;
    Edit7.Color := clWindow;Edit8.Color := clWindow;
    Edit9.Color := clWindow;Edit10.Color := clWindow;
    Edit11.Color := clWindow;Edit12.Color := clWindow;
    Edit13.Color := clWindow;Edit14.Color := clWindow;
    Edit15.Color := clWindow;Edit16.Color := clWindow;
    Edit17.Color := clWindow;Edit18.Color := clWindow;
    Edit19.Color := clWindow;Edit20.Color := clWindow;
    Edit23.Color := clWindow;Edit24.Color := clWindow;
    Edit25.Color := clWindow;Edit26.Color := clWindow;
    Edit27.Color := clWindow;Edit28.Color := clWindow;
    Edit29.Color := clWindow;Edit30.Color := clWindow;
    Edit31.Color := clWindow;Edit32.Color := clWindow;
    CheckBox2.Enabled := True;
  end
  else begin
    wrt := false;
    Edit1.ReadOnly := true;Edit2.ReadOnly := true;
    Edit3.ReadOnly := true;Edit4.ReadOnly := true;
    Edit5.ReadOnly := true;Edit6.ReadOnly := true;
    Edit7.ReadOnly := true;Edit8.ReadOnly := true;
    Edit9.ReadOnly := true;Edit10.ReadOnly := true;
    Edit11.ReadOnly := true;Edit12.ReadOnly := true;
    Edit13.ReadOnly := true;Edit14.ReadOnly := true;
    Edit15.ReadOnly := true;Edit16.ReadOnly := true;
    Edit17.ReadOnly := true;Edit18.ReadOnly := true;
    Edit19.ReadOnly := true;Edit20.ReadOnly := true;
    Edit23.ReadOnly := true;Edit24.ReadOnly := true;
    Edit25.ReadOnly := true;Edit26.ReadOnly := true;
    Edit27.ReadOnly := true;Edit28.ReadOnly := true;
    Edit29.ReadOnly := true;Edit30.ReadOnly := true;
    Edit31.ReadOnly := true;Edit32.ReadOnly := true;
    Edit1.Color := clBtnFace;Edit2.Color := clBtnFace;
    Edit3.Color := clBtnFace;Edit4.Color := clBtnFace;
    Edit5.Color := clBtnFace;Edit6.Color := clBtnFace;
    Edit7.Color := clBtnFace;Edit8.Color := clBtnFace;
    Edit9.Color := clBtnFace;Edit10.Color := clBtnFace;
    Edit11.Color := clBtnFace;Edit12.Color := clBtnFace;
    Edit13.Color := clBtnFace;Edit14.Color := clBtnFace;
    Edit15.Color := clBtnFace;Edit16.Color := clBtnFace;
    Edit17.Color := clBtnFace;Edit18.Color := clBtnFace;
    Edit19.Color := clBtnFace;Edit20.Color := clBtnFace;
    Edit23.Color := clBtnFace;Edit24.Color := clBtnFace;
    Edit25.Color := clBtnFace;Edit26.Color := clBtnFace;
    Edit27.Color := clBtnFace;Edit28.Color := clBtnFace;
    Edit29.Color := clBtnFace;Edit30.Color := clBtnFace;
    Edit31.Color := clBtnFace;Edit32.Color := clBtnFace;
    CheckBox2.Enabled := False;
    CheckBox2.Checked := False;
  end;
end;

procedure TForm16.Edit23Exit(Sender: TObject);
{
  Процедура обрабатывает содержимое ячейки, устанавливает запятую, если надо, и
  суммирует начисления и считает субсидию.
}
begin
  SetPoint(TEdit(Sender));
  SumV;
end;

procedure TForm16.Edit23KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{
  Процедура обрабатывает содержимое ячейки, устанавливает запятую, если надо, и
  суммирует начисления и считает субсидию, в случае нажатия клавиши Enter.
}
begin
  if Key = (vk_return) then begin
    SetPoint(TEdit(Sender));
    SumV;
  end;
end;

procedure TForm16.Button2Click(Sender: TObject);
{ Закрытие формы }
begin
  Close;
end;

end.
