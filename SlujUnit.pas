unit SlujUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls,DateUtils, ExtCtrls;

type TSlujMode = (mSum, mDetail);

type
  TForm44 = class(TForm)
    sluj_grid: TStringGrid;
    GroupBox1: TGroupBox;
    FlowPanel1: TFlowPanel;
    Button2: TButton;
    Button1: TButton;
    procedure Button2Click(Sender: TObject);
    procedure sluj_gridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cl_regn: string;
    mode: TSlujMode;
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
      Query1.Close;
      case mode of
      mDetail: begin
          Query1.SQL.Text:=('SELECT Sluj.sdate, Sluj.regn, Cl.fio, Sluj.sub AS sluj_sum, Sub.sub AS Expr1, Sub.service, Serv.nameserv AS nameserv'+#13+
                            'FROM Sluj INNER JOIN'+#13+
                            'Cl ON Sluj.regn = Cl.regn INNER JOIN'+#13+
                            'Sub ON Sluj.sdate = Sub.sdate AND Sluj.regn = Sub.regn AND Sluj.service = Sub.service INNER JOIN'+#13+
                            'Serv ON Sub.service = Serv.id_serv'+#13+
                            'WHERE (Sluj.sdate = CONVERT(smalldatetime, :rdt, 104))'+#13+
                            'GROUP BY Sluj.sdate, Sluj.regn, Cl.fio, Sub.sub, Sub.service, Serv.nameserv, Sluj.sub'+#13+
                            'ORDER BY Cl.fio');
         end;
      mSum: begin
          Query1.SQL.Text:=('SELECT Sluj.sdate, Sluj.regn, Cl.fio, SUM(Sluj.sub) AS sluj_sum, SUM(Sub.sub) AS Expr1'+#13+
                            'FROM Sluj INNER JOIN'+#13+
                            'Cl ON Sluj.regn = Cl.regn INNER JOIN'+#13+
                            'Sub ON Sluj.sdate = Sub.sdate '+#13+
                            'AND Sluj.regn = Sub.regn AND Sluj.service = Sub.service'+#13+
                            'WHERE (Sluj.sdate = CONVERT(smalldatetime, :rdt, 104))'+#13+
                            'GROUP BY Sluj.sdate, Sluj.regn, Cl.fio'+#13+
                            'ORDER BY Cl.fio');
         end;
      end;
      Query1.ParamByName('rdt').Value:= form1.rdt;
      Query1.Open;
    end;

  if DataModule1.Query1.recordcount>0 then
    begin
      case mode of
        mDetail: begin
            Form44.Width:= 670;
            with sluj_grid do
              begin
                RowCount:= DataModule1.Query1.RecordCount+1;
                colcount:= DataModule1.Query1.FieldCount-1;
                cells[0,0]:='sdate';
                cells[1,0]:='���. �';
                cells[2,0]:='���';
                cells[3,0]:='����. ����.';
                cells[4,0]:='��������';
                cells[5,0]:='������';
                colwidths[1]:=75;
                colwidths[2]:=255;
                colwidths[3]:=75;
                colwidths[4]:=75;
                colwidths[5]:=100;
              end;
              DataModule1.Query1.first;
              with DataModule1.Query1 do
              for i:=0 to recordcount do
              begin
                sluj_grid.Cells[0,i+1]:= fieldbyname('sdate').Value;
                sluj_grid.cells[1,i+1]:= fieldbyname('regn').Value;
                sluj_grid.cells[2,i+1]:= fieldbyname('fio').Value;
                sluj_grid.cells[3,i+1]:= fieldbyname('sluj_sum').Value;
                sluj_grid.cells[4,i+1]:= fieldbyname('Expr1').Value;
                sluj_grid.Cells[5,i+1]:= fieldbyname('nameserv').Value;
                DataModule1.Query1.next;
              end;
           GroupBox1.Caption:= '�������� �� �������:';
           end;
      mSum: begin
          Form44.Width:= 580;
          with sluj_grid do
            begin
              RowCount:= DataModule1.Query1.RecordCount+1;
              colcount:= DataModule1.Query1.FieldCount;
              cells[0,0]:='sdate';
              cells[1,0]:='���. �';
              cells[2,0]:='���';
              cells[3,0]:='����. ����.';
              cells[4,0]:='��������';
              colwidths[0]:=75;
              colwidths[2]:=255;
              colwidths[1]:=75;
              colwidths[3]:=75;
            end;
            DataModule1.Query1.first;
            with DataModule1.Query1 do
            for i:=0 to recordcount do
              begin
                sluj_grid.Cells[0,i+1]:= fieldbyname('sdate').Value;
                sluj_grid.cells[1,i+1]:= fieldbyname('regn').Value;
                sluj_grid.cells[2,i+1]:= fieldbyname('fio').Value;
                sluj_grid.cells[3,i+1]:= fieldbyname('sluj_sum').Value;
                sluj_grid.cells[4,i+1]:= fieldbyname('Expr1').Value;
                DataModule1.Query1.next;
              end;
          GroupBox1.Caption:= '����� ����� �� �����:';
          end;
      end;
    end
    else
    begin
      ShowMessage('� ������� ������ ��� �������� �������.');
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
  DataModule1.Query1.Close;
  DataModule1.Query1.sql.Text:= 'DELETE FROM Sluj'+#13+
                                'WHERE (sdate = CONVERT(smalldatetime, :rdt, 104)) AND (regn = '+cl_regn+')';
  DataModule1.Query1.ParamByName('rdt').Value:= form1.rdt;
  DataModule1.Query1.execsql;
  FillSlujGrid;
end;

end.

