unit stat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ExcelXP, Math;

type TRepMode = (mStat, mPriv);
type
  TStats = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    lFamcount: TLabel;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    lFamCLMin: TLabel;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label11: TLabel;
    MenCount: TLabel;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Label12: TLabel;
    FlowPanel1: TFlowPanel;
    Button2: TButton;
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    mode: TRepMode;
    procedure StatReport(Sender: TObject);
    procedure PrivReport(Sender: TObject);
  end;

var
  Stats: TStats;

implementation

{$R *.dfm}

uses DataModule, main;

procedure TStats.FormShow(Sender: TObject);
begin
  case mode of
    mStat: begin
 {     GroupBox1.Caption:= 'Соц. статус';
      GroupBox2.Visible:= TRUE;
      GroupBox3.Visible:= TRUE;
      GroupBox4.Visible:= TRUE;
      GroupBox5.Visible:= TRUE;}
      Button1.OnClick:= StatReport;
  //    Stats.Width:=306;
    end;
    mPriv: begin
      GroupBox1.Caption:= 'Льготы';
      GroupBox2.Visible:= FALSE;
      GroupBox3.Visible:= FALSE;
      GroupBox4.Visible:= FALSE;
      GroupBox5.Visible:= FALSE;
      Button1.OnClick:= PrivReport;
      Stats.Width:= 430;
      Stats.Height:= 420;
      GroupBox1.Align:= alClient;
    end;
  end;
end;

procedure TStats.PrivReport(Sender: TObject);
var List: TStringList;
    i, ListIndex: Integer;
begin
  List := TStringList.Create;
  ListIndex := 0;
  with datamodule1 do
  begin
    Query1.SQL.Clear;
    if CheckBox1.Checked then begin
      Query1.SQL.Text:= 'SELECT Priv.namepriv ''Льгота'', COUNT(Fam.id_priv) ''Кол-во'''+#13+
                        'FROM Fam INNER JOIN'+#13+
                          'Hist ON Fam.regn = Hist.regn INNER JOIN'+#13+
                          '(SELECT regn, MAX(bdate) AS bdate'+#13+
                            'FROM hist'+#13+
                            'WHERE (bdate <= CONVERT(smalldatetime, :d, 104))'+#13+
                            'GROUP BY regn) sb ON Hist.regn = sb.regn AND Hist.bdate = sb.bdate INNER JOIN'+#13+
                              'Priv ON Fam.id_priv = Priv.id_priv'+#13+
                        'WHERE (Hist.bdate <= CONVERT(smalldatetime, :d, 104)) AND (Hist.edate > CONVERT(smalldatetime,:d, 104))'+#13+                        'GROUP BY Priv.namepriv';
      Query1.ParamByName('d').Value:= StrToDate(Form1.rdt);
    end
    else begin
      Query1.SQL.Text:= 'SELECT Priv.namepriv ''Льгота'', COUNT(Fam.id_status) ''Кол-во'' '+#13+
                        'FROM Priv INNER JOIN'+#13+
                          'Fam ON Priv.id_priv = Fam.id_priv'+#13+
                        'GROUP BY Priv.namepriv';
    end;
    Query1.Open;
    List.Add('Льгота =  ');
    Query1.First;
    while not Query1.Eof do begin
      List.Add(Query1.Fields.Fields[0].AsString + ' = ' + Query1.Fields.Fields[1].AsString);
      Query1.Next;
    end;
  end;
    with Form1.ExcelApplication1 do begin
      Visible[0] := true;

      Workbooks.Add(Form1.reports_path + 'stats.xlt', 0);
      for i := 0 to List.Count - 1 do
      begin
         Range['a' + IntToStr(i + 1),  'a' + IntToStr(i + 1)].Value2 := List.Names[i];
         Range['b' + IntToStr(i + 1),  'b' + IntToStr(i + 1)].Value2 := List.ValueFromIndex[i];
      end;
    end;
end;

procedure TStats.StatReport(Sender: TObject);
var s: string;
    i, ListIndex: integer;
    List: TStringList;
begin
  List := TStringList.Create;
  ListIndex := 0;
  with datamodule1 do
  begin
    Query1.SQL.Clear;
    if CheckBox1.Checked then begin
      Query1.SQL.Text:= 'SELECT Stat.namestatus ''Статус'', COUNT(Fam.id_status) ''Кол-во'''+#13+
                        'FROM Fam INNER JOIN'+#13+
                          'Hist ON Fam.regn = Hist.regn INNER JOIN'+#13+
                          '(SELECT     regn, MAX(bdate) AS bdate'+#13+
                            'FROM          hist'+#13+
                            'WHERE      (bdate <= CONVERT(smalldatetime, :d, 104))'+#13+
                            'GROUP BY regn) sb ON Hist.regn = sb.regn AND Hist.bdate = sb.bdate INNER JOIN'+#13+
                            'Stat ON Fam.id_status = Stat.id_status'+#13+
                        'WHERE     (Hist.bdate <= CONVERT(smalldatetime, :d, 104)) AND (Hist.edate > CONVERT(smalldatetime, :d, 104))'+#13+
                        'GROUP BY Stat.namestatus';
      Query1.ParamByName('d').Value:= StrToDate(Form1.rdt);
    end
    else begin
      Query1.SQL.Add('select namestatus ''Статус'', count(fam.id_status) ''Кол-во'' from stat, fam');
      Query1.SQL.Add('where fam.id_status = stat.id_status');
      Query1.SQL.Add('group by namestatus');
    end;
    Query1.Open;
    List.Add('Соц. Статус =  ');
    Query1.First;
    while not Query1.Eof do begin
      List.Add(Query1.Fields.Fields[0].AsString + ' = ' + Query1.Fields.Fields[1].AsString);
      Query1.Next;
    end;


    Query2.SQL.Clear;
    if CheckBox1.Checked then begin
      Query2.SQL.Text:= 'SELECT     COUNT(Fam.id_mem) AS Expr1'+#13+
                        'FROM         Fam INNER JOIN'+#13+
                          'Hist ON Fam.regn = Hist.regn INNER JOIN'+#13+
                          '(SELECT     regn, MAX(bdate) AS bdate'+#13+
                            'FROM          hist'+#13+
                            'WHERE      (bdate <= CONVERT(smalldatetime, :d, 104))'+#13+
                            'GROUP BY regn) sb ON Hist.regn = sb.regn AND Hist.bdate = sb.bdate'+#13+
                        'WHERE     (Hist.bdate <= CONVERT(smalldatetime, :d, 104)) AND (Hist.edate > CONVERT(smalldatetime, :d, 104)) AND '+#13+
                          '(Fam.mid >= :p1) AND (Fam.mid <= :p2)';
      Query2.ParamByName('d').Value:= StrToDate(Form1.rdt);
    end
    else begin
      Query2.SQL.Add('select count(id_mem) from fam where mid >= :p1 and mid <= :p2');
    end;
    Query2.ParamByName('p1').AsFloat := StrToFloat(Edit1.Text);
    Query2.ParamByName('p2').AsFloat := StrToFloat(Edit2.Text);
    Query2.Open;
    lFamCount.Caption := Query2.Fields[0].AsString;
    List.Add('Доход='+' ' );
    List.Add('От=' + Edit1.Text); List.Add('До=' + Edit2.Text);
    List.Add('Кол-во семей='+lFamCount.Caption);

    Query2.Close;
    Query2.SQL.Clear;
    Query2.SQL.Add('select count(regn) from hist where income / mcount < pmin and edate > :p1');
    Query2.Params[0].AsDateTime := Now;
    Query2.Open;
    lFamCLMin.Caption := Query2.Fields[0].AsString + ' (активные клиенты)';
    List.Add('Семьи с доходом ниже ПМ='  + lFamCLMin.Caption);
    Query2.SQL.Clear;
    Query2.SQL.Add('select count(regn) from (' +
                   ' select hist.regn as regn, sum(sub) as sub from hist, sub where hist.regn = sub.regn '+
                   ' and sdate = :p1 group by hist.regn having sum(sub) >= :p2 and sum(sub) <= :p3 ) t ');
    s := DateToStr(Date);
    s[1] := '0'; s[2] := '1';

    Query2.Params[0].AsDateTime := StrToDateTime(s);
    Query2.Params[1].AsFloat := StrToFloat(Edit3.Text);
    Query2.Params[2].AsFloat := StrToFloat(Edit4.Text);
    Query2.Open;
     List.Add('Субсидия='+' ' );
    List.Add('От=' + Edit1.Text); List.Add('До=' + Edit2.Text);
    MenCount.Caption := Query2.Fields[0].AsString;
    List.Add('Кол-во семей='+MenCount.Caption);
    Query2.SQL.Clear;
    Query2.SQL.Add('SELECT SUM(Sub.sub) / t.c AS Expr1 FROM Sub CROSS JOIN (SELECT COUNT(regn) AS c FROM hist WHERE edate > :p1) t WHERE Sub.sdate = :p1 GROUP BY t.c');
    Query2.Params[0].AsDateTime := StrToDateTime(s);
    Query2.Open;
    Label12.Caption := FloatToStr(SimpleRoundTo(Query2.Fields[0].AsFloat, -2));
    List.Add('Средняя субсидия=' + Label12.Caption);
    with Form1.ExcelApplication1 do begin
      Visible[0] := true;

      Workbooks.Add(Form1.reports_path + 'stats.xlt', 0);
      for i := 0 to List.Count - 1 do
      begin
         Range['a' + IntToStr(i + 1),  'a' + IntToStr(i + 1)].Value2 := List.Names[i];
         Range['b' + IntToStr(i + 1),  'b' + IntToStr(i + 1)].Value2 := List.ValueFromIndex[i];
      end;
    end;
  end;
end;

procedure TStats.Button2Click(Sender: TObject);
begin
  close;
end;

end.
