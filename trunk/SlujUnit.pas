unit SlujUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls,DateUtils, ExtCtrls;

type
  TForm44 = class(TForm)
    sluj_grid: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    procedure Button2Click(Sender: TObject);
    procedure sluj_gridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cl_regn: string;
    mode: integer;
    procedure FillSlujGrid;
  end;

var
  Form44: TForm44;

implementation

uses datamodule, main;

{$R *.dfm}


procedure TForm44.FillSlujGrid;
var i: integer;
begin
  with DataModule1 do
    begin
      sluj_q.Close;
      case mode of
      0: begin
          sluj_q.SQL.Text:=('SELECT Sluj.sdate, Sluj.regn, Cl.fio, Sluj.sub AS sluj_sum, Sub.sub AS Expr1, Sub.service, Serv.nameserv AS nameserv'+#13+
                            'FROM Sluj INNER JOIN'+#13+
                            'Cl ON Sluj.regn = Cl.regn INNER JOIN'+#13+
                            'Sub ON Sluj.sdate = Sub.sdate AND Sluj.regn = Sub.regn AND Sluj.service = Sub.service INNER JOIN'+#13+
                            'Serv ON Sub.service = Serv.id_serv'+#13+
                            'WHERE (Sluj.sdate = CONVERT(smalldatetime, :rdt, 104))'+#13+
                            'GROUP BY Sluj.sdate, Sluj.regn, Cl.fio, Sub.sub, Sub.service, Serv.nameserv, Sluj.sub'+#13+
                            'ORDER BY Cl.fio');
         end;
      1: begin
          sluj_q.SQL.Text:=('SELECT Sluj.sdate, Sluj.regn, Cl.fio, SUM(Sluj.sub) AS sluj_sum, SUM(Sub.sub) AS Expr1'+#13+
                            'FROM Sluj INNER JOIN'+#13+
                            'Cl ON Sluj.regn = Cl.regn INNER JOIN'+#13+
                            'Sub ON Sluj.sdate = Sub.sdate '+#13+
                            'AND Sluj.regn = Sub.regn AND Sluj.service = Sub.service'+#13+
                            'WHERE (Sluj.sdate = CONVERT(smalldatetime, :rdt, 104))'+#13+
                            'GROUP BY Sluj.sdate, Sluj.regn, Cl.fio'+#13+
                            'ORDER BY Cl.fio');
         end;
      end;
      sluj_q.ParamByName('rdt').Value:= form1.rdt;
      sluj_q.Open;
    end;

  if DataModule1.sluj_q.recordcount>0 then
    begin
      case mode of
        0: begin
            with sluj_grid do
              begin
                RowCount:= DataModule1.sluj_q.RecordCount+1;
                colcount:= DataModule1.sluj_q.FieldCount;
                cells[0,0]:='sdate';
                cells[1,0]:='Рег. №';
                cells[2,0]:='ФИО';
                cells[3,0]:='Сумм. служ.';
                cells[4,0]:='Субсидия';
                cells[5,0]:='Услуга';
                colwidths[1]:=13*6;
                colwidths[2]:=255;
                colwidths[3]:=13*6;
                colwidths[4]:=13*6;
                colwidths[5]:=13*8;
              end;
              DataModule1.sluj_q.first;
              with DataModule1.sluj_q do
              for i:=0 to recordcount do
              begin
                sluj_grid.Cells[0,i+1]:= fieldbyname('sdate').Value;
                sluj_grid.cells[1,i+1]:= fieldbyname('regn').Value;
                sluj_grid.cells[2,i+1]:= fieldbyname('fio').Value;
                sluj_grid.cells[3,i+1]:= fieldbyname('sluj_sum').Value;
                sluj_grid.cells[4,i+1]:= fieldbyname('Expr1').Value;
                sluj_grid.Cells[5,i+1]:= fieldbyname('nameserv').Value;
                DataModule1.sluj_q.next;
              end;
           GroupBox1.Caption:= 'Подробно по тарифам:';
           end;
      1: begin
          with sluj_grid do
            begin
              RowCount:= DataModule1.sluj_q.RecordCount+1;
              colcount:= DataModule1.sluj_q.FieldCount;
              cells[0,0]:='sdate';
              cells[1,0]:='Рег. №';
              cells[2,0]:='ФИО';
              cells[3,0]:='Сумм. служ.';
              cells[4,0]:='Субсидия';
              colwidths[0]:=13*6;
              colwidths[2]:=255;
              colwidths[1]:=13*6;
              colwidths[3]:=13*6;
            end;
            DataModule1.sluj_q.first;
            with DataModule1.sluj_q do
            for i:=0 to recordcount do
              begin
                sluj_grid.Cells[0,i+1]:= fieldbyname('sdate').Value;
                sluj_grid.cells[1,i+1]:= fieldbyname('regn').Value;
                sluj_grid.cells[2,i+1]:= fieldbyname('fio').Value;
                sluj_grid.cells[3,i+1]:= fieldbyname('sluj_sum').Value;
                sluj_grid.cells[4,i+1]:= fieldbyname('Expr1').Value;
                DataModule1.sluj_q.next;
              end;
          GroupBox1.Caption:= 'Общая сумма за месяц:';    
          end;
      end;
    end
    else
    begin
      ShowMessage('В текушем месяце нет подобных записей.');
    end;
end;

procedure TForm44.Button2Click(Sender: TObject);
begin
  Form44.Close;
end;

procedure TForm44.sluj_gridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  cl_regn:= sluj_grid.cells[1,arow];
end;

procedure TForm44.Button1Click(Sender: TObject);
begin
  DataModule1.sluj_q.Close;
  DataModule1.sluj_q.sql.Text:= 'DELETE FROM Sluj'+#13+
                                'WHERE (sdate = CONVERT(smalldatetime, :rdt, 104)) AND (regn = '+cl_regn+')';
  DataModule1.sluj_q.ParamByName('rdt').Value:= form1.rdt;
  DataModule1.sluj_q.execsql;
  FillSlujGrid;
end;

end.

