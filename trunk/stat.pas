unit stat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ExcelXP, Math;

type
  TStats = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    lFamcount: TLabel;
    Label7: TLabel;
    lFamCLMin: TLabel;
    Bevel4: TBevel;
    Label8: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    MenCount: TLabel;
    Bevel2: TBevel;
    Bevel5: TBevel;
    Label2: TLabel;
    Label12: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Stats: TStats;

implementation

{$R *.dfm}

uses DataModule, main;

procedure TStats.FormCreate(Sender: TObject);
begin
///
end;
procedure TStats.ButtonClick(Sender: TObject);

var
  s, p: string;
  i: integer;
  RangeE: ExcelRange;
  List: TStringList;
  ListIndex: Integer;
begin
  p := ExtractFilePath(Application.ExeName);
  List := TStringList.Create;
  ListIndex := 0;
  with datamodule1 do
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('select namestatus ''Статус'', count(fam.id_status) ''Кол-во'' from stat, fam');
    Query1.SQL.Add('where fam.id_status = stat.id_status');
    Query1.SQL.Add('group by namestatus');
    Query1.Open;
    List.Add('Соц. Статус =  ');
    Query1.First;
    while not Query1.Eof do begin
      List.Add(Query1.Fields.Fields[0].AsString + ' = ' + Query1.Fields.Fields[1].AsString);
      Query1.Next;
    end;
    Query2.SQL.Clear;
    Query2.SQL.Add('select count(id_mem) from fam where mid >= :p1 and mid <= :p2');
    Query2.Params[0].AsFloat := StrToFloat(Edit1.Text);
    Query2.Params[1].AsFloat := StrToFloat(Edit2.Text);
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
    ShowMessage(s);
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

      Workbooks.Add(p + '\reports\stats.xlt', 0);
      for i := 0 to List.Count - 1 do
      begin

         Range['a' + IntToStr(i + 1),  'a' + IntToStr(i + 1)].Value2 := List.Names[i];
         Range['b' + IntToStr(i + 1),  'b' + IntToStr(i + 1)].Value2 := List.ValueFromIndex[i];
      end;

    end;
  end;
end;

end.
