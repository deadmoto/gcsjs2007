unit FactSumUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Tabs, Grids, ExtCtrls;

type
  TFactSumFrm = class(TForm)
    TabControl1: TTabControl;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Button1: TButton;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Button2: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    begindate,enddate: TDateTime;
    function AddAnyMonth(BD,ED: TDateTime):TStringList;
    procedure ChangePeriod(BD,ED:TDateTime);
    procedure ClearGrids();
    function GetColSum(StrGrid: TStringGrid; Col:integer):double;
    procedure CheckDifferenceSum;
  end;

var
  FactSumFrm: TFactSumFrm;

implementation

uses main, Client, datamodule, service;

{$R *.dfm}
var c: Tclient;

function TFactSumFrm.AddAnyMonth(BD,ED: TDateTime):TStringList;
var tmpDate: TDateTime;
    StrList: TStringList;
    i: integer;
    tmp: byte;
begin
  StrList:= TStringList.Create;
  tmpDate:= BD;
      StrList.Add(DateToStr(tmpdate));
      for i:=1 to GetMonthsCount(BD,ED,tmp)-1 do
        begin
          tmpdate:=IncMonth(tmpdate,1);
          StrList.Add(DateToStr(tmpdate));
        end;
  result:= StrList;
end;

procedure TFactSumFrm.ClearGrids;
var
  i: integer;
begin
  with StringGrid1 do begin
    for i := 0 to RowCount-1 do
      Rows[i].Clear;
    cells[0,0]:='�����';
    cells[1,0]:='��������';
    cells[0,1]:='';
    cells[1,1]:='';
    RowCount:=2;
  end;

  with StringGrid2 do begin
    for i := 0 to RowCount-1 do
      Rows[i].Clear;
    cells[0,0]:='����. ������';
    cells[0,1]:='';
    RowCount:=2;
  end;

  ComboBox1.Text:='';
  CheckBox1.Checked:= FALSE;
end;

procedure TFactSumFrm.ChangePeriod(BD,ED:TDateTime);
var i,j: integer;
    tmp: byte;
begin
  StringGrid1.RowCount:= GetMonthsCount(BD,ED,tmp)+1;
  StringGrid2.RowCount:= GetMonthsCount(BD,ED,tmp)+1;
  for i:=0 to (AddAnyMonth(BD,ED)).Count-1 do begin
    StringGrid1.Cells[0,i+1]:= AddanyMonth(BD,ED)[i];
    StringGrid1.Cells[1,i+1]:= '0';
    StringGrid2.Cells[0,i+1]:= '0';
  end;

  //-------------

  with datamodule1 do begin
    Query1.Close;
    Query1.SQL.Text:= 'exec factSum :bdate, :edate, :regn';
    Query1.ParamByName('bdate').Value:= DateToStr(BD);
    Query1.ParamByName('edate').Value:= DateToStr(ED);
    Query1.ParamByName('regn').Value:= c.data.regn;
    Query1.Open;
  end;

  datamodule1.Query1.First;
  for i:=0 to datamodule1.Query1.RecordCount-1 do begin
    for j:=0 to StringGrid1.RowCount-1 do
      if StringGrid1.Cells[0,j+1]=datamodule1.Query1.FieldByName('sd').asString then
        StringGrid1.Cells[1,j+1]:=datamodule1.Query1.FieldValues['sum_sub'];
    datamodule1.Query1.Next;
  end;

  //-------------

  if TabControl1.TabIndex=1 then begin

  with datamodule1 do begin
    Query1.Close;
    Query1.SQL.Text:= 'SELECT sdate, regn, bdate, factsum'+#13+
                      'FROM FactSale'+#13+
                      'WHERE (regn = :regn) AND (bdate = CONVERT(smalldatetime, :bdate, 104))'+#13+
                      'ORDER BY sdate';
    Query1.ParamByName('regn').Value:= c.data.regn;
    Query1.ParamByName('bdate').Value:= DateToStr(BD);
    Query1.Open;
  end;

  datamodule1.Query1.First;
  for i:=0 to datamodule1.Query1.RecordCount-1 do begin
    StringGrid2.Cells[0,i+1]:= datamodule1.Query1.FieldValues['factsum'];
    datamodule1.Query1.Next;
  end;

    StringGrid1.RowCount:= StringGrid1.RowCount+1;
    StringGrid2.RowCount:= StringGrid2.RowCount+1;
    StringGrid1.Cells[0,StringGrid1.RowCount-1]:= '�����:';
    StringGrid1.Cells[1,StringGrid1.RowCount-1]:= FloatToStr(GetColSum(StringGrid1,1));
    StringGrid2.Cells[0,StringGrid2.RowCount-1]:= FloatToStr(GetColSum(StringGrid2,0));
  end;
end;

function TFactSumFrm.GetColSum(StrGrid: TStringGrid; Col:integer):double;
var
  i:integer;
begin
  Result:=0;
  for i:=0 to StrGrid.RowCount-3 do
    Result:= Result + StrToFloat(StrGrid.Cells[Col,i+1]);
end;

procedure TFactSumFrm.Button1Click(Sender: TObject);
var i: integer;
begin
  case TabControl1.TabIndex of
    0: begin
  if (ComboBox1.Items.Count=0) and (not CheckBox1.Checked) then showmessage('��� ��������� �������� ��� ����������')
    else if ComboBox1.Text='' then showmessage('�� ������ ������ ��� ����������')
      else

      with datamodule1 do begin
        for i:=0 to StringGrid1.RowCount-2 do begin
          try
            Query1.Close;
            Query1.SQL.Text:= 'INSERT INTO FactSale'+#13+
                              'VALUES (convert(smalldatetime,:sdate,104),:regn,'+
                              'convert(smalldatetime,:bdate,104),convert(smalldatetime,:edate,104),:sub,:factsum)';
            Query1.ParamByName('sdate').Value:=StringGrid1.Cells[0,i+1];
            Query1.ParamByName('regn').Value:=c.data.regn;
            Query1.ParamByName('bdate').Value:=DateToStr(begindate);
            Query1.ParamByName('edate').Value:=DateToStr(enddate);
            Query1.ParamByName('sub').Value:=StrToFloat(StringGrid1.Cells[1,i+1]);
            Query1.ParamByName('factsum').Value:=StrToFloat(StringGrid2.Cells[0,i+1]);
            Query1.ExecSQL;
          except
            showmessage('������ ��� ����������! ��������� ������������ ����� ������.')
          end;
        end;
      end;
    end;

    1: begin
      with datamodule1 do begin
        if ComboBox1.Text='' then showmessage('�� ������ ������ ��� ���������')
        else
        for i:=0 to StringGrid1.RowCount-3 do begin
          try
            Query1.Close;
            Query1.SQL.Text:= 'UPDATE FactSale'+#13+
                              'SET factsum = :factsum, sub=:sub'+#13+
                              'WHERE (regn = :regn) AND (bdate = CONVERT(smalldatetime, :bdate, 104)) '+
                              'AND (sdate = CONVERT(smalldatetime, :sdate, 104))';
            Query1.ParamByName('factsum').Value:=StrToFloat(StringGrid2.Cells[0,i+1]);
            Query1.ParamByName('sub').Value:=StrToFloat(StringGrid1.Cells[1,i+1]);
            Query1.ParamByName('regn').Value:=c.data.regn;
            Query1.ParamByName('bdate').Value:=DateToStr(begindate);
            Query1.ParamByName('sdate').Value:=StringGrid1.Cells[0,i+1];
            Query1.ExecSQL;
          except
            showmessage('������ ��� ���������! ��������� ������������ ����� ������.')
          end;
        end;
      end;
    end;
  end;
  ClearGrids();
  ComboBox1.SetFocus;
  TabControl1.OnChange(self);
end;

procedure TFactSumFrm.Button2Click(Sender: TObject);
begin
  if ComboBox1.Text='' then showmessage('�� ������ ������ ��� ��������')
  else
  if MessageDlg('������� ��������� ������?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    try
      with datamodule1 do begin
        Query1.Close;
        Query1.SQL.Text:= 'DELETE FROM FactSale'+#13+
                          'WHERE (regn=:regn) AND (bdate = CONVERT(smalldatetime, :bdate, 104))';
        Query1.ParamByName('regn').Value:= c.data.regn;
        Query1.ParamByName('bdate').Value:= DateToStr(begindate);
        Query1.ExecSQL;
      end;
    except
      showmessage('������ ��� ��������');
    end;

    ClearGrids();
    TabControl1.OnChange(self);
  end;
end;

procedure TFactSumFrm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then begin
    ComboBox1.Text:= DateToStr(c.cdata.begindate)+' - '+DateToStr(c.cdata.enddate);
    ComboBox1.Enabled:= FALSE;
    ComboBox1.OnChange(self);
  end
  else begin
    ComboBox1.Text:= '';
    ComboBox1.Enabled:= TRUE;
    ClearGrids();
  end;
end;

procedure TFactSumFrm.CheckDifferenceSum;
begin
  if TabControl1.TabIndex=1 then begin
    if StrToFloat(StringGrid1.Cells[1,StringGrid1.RowCount-1]) <= StrToFloat(StringGrid2.Cells[0,StringGrid1.RowCount-1]) then
      label1.Caption:= '������ �������� �� ��������� ����������� ��������'
    else
      label1.Caption:= '������ �������� ��������� ����������� ������� �� +'+
                        FloatToStr(StrToFloat(StringGrid1.Cells[1,StringGrid1.RowCount-1])-StrToFloat(StringGrid2.Cells[0,StringGrid1.RowCount-1]));
  end;
end;

procedure TFactSumFrm.ComboBox1Change(Sender: TObject);
begin
  if CheckBox1.Checked then begin
    begindate:= StrToDate(copy(ComboBox1.Text,1,10));
    enddate:= StrToDate(copy(ComboBox1.Text,14,23));
  end
  else begin
    begindate:= StrToDate(copy(ComboBox1.Items[ComboBox1.ItemIndex],1,10));
    enddate:= StrToDate(copy(ComboBox1.Items[ComboBox1.ItemIndex],14,23));
  end;
  ChangePeriod(begindate, enddate);
  CheckDifferenceSum;
end;

procedure TFactSumFrm.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  key:= #0;
end;

procedure TFactSumFrm.FormShow(Sender: TObject);
begin
  c:= TClient.Create(Empty,EmptyC);
  c.SetClient(Form1.client,Form1.rdt);
  c.SetCalc(Form1.client,Form1.rdt);

  ClearGrids();
  TabControl1.TabIndex:=0;
  TabControl1.OnChange(self);
end;

procedure TFactSumFrm.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Buf: array[byte] of char;
begin
  if State = [gdFixed] then Exit;

  with StringGrid1 do
  begin
    Canvas.Font := Font;
    Canvas.Font.Color := clWindowText;
    Canvas.Brush.Color := clWindow;
    Canvas.FillRect(Rect);

    StrPCopy(Buf, Cells[ACol, ARow]);
    Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Cells[aCol, aRow]);
  end;

  if TabControl1.TabIndex=1 then
    if aRow= StringGrid1.RowCount-1 then
      with StringGrid1 do begin
        Canvas.Font := Font;
        Canvas.Font.Color := clWindowText;
        Canvas.Brush.Color := clMoneyGreen;
        Canvas.FillRect(Rect);
        StrPCopy(Buf, Cells[ACol, ARow]);
        Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Cells[aCol, aRow]);
      end;
end;

procedure TFactSumFrm.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Buf: array[byte] of char;
begin
  if TabControl1.TabIndex=1 then
    if aRow= StringGrid2.RowCount-1 then
      with StringGrid2 do begin
        Canvas.Font := Font;
        Canvas.Font.Color := clWindowText;
        Canvas.Brush.Color := clMoneyGreen;
        Canvas.FillRect(Rect);
        StrPCopy(Buf, Cells[ACol, ARow]);
        Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Cells[aCol, aRow]);
      end;
end;

procedure TFactSumFrm.StringGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if TabControl1.TabIndex=1 then begin
    if ARow=StringGrid2.RowCount-1 then
      StringGrid2.Options := StringGrid2.Options - [goEditing, goAlwaysShowEditor]
    else
      StringGrid2.Options := StringGrid2.Options + [goEditing, goAlwaysShowEditor];

    StringGrid1.Cells[1,StringGrid1.RowCount-1]:= FloatToStr(GetColSum(StringGrid1,1));
    StringGrid2.Cells[0,StringGrid2.RowCount-1]:= FloatToStr(GetColSum(StringGrid2,0));
    CheckDifferenceSum;
  end
  else begin
    StringGrid2.Options := StringGrid2.Options + [goEditing, goAlwaysShowEditor];
  end;
end;

procedure TFactSumFrm.TabControl1Change(Sender: TObject);
var
  i: integer;
begin
  ClearGrids();
  ComboBox1.SetFocus;
  Label1.Caption:= '';

  case TabControl1.TabIndex of
    0: begin
      with datamodule1 do begin
        Query1.Close;
        Query1.SQL.Text:= 'SELECT bdate'+#13+
                          'FROM FactSale'+#13+
                          'WHERE regn=:regn and bdate < :bdate'+#13+
                          'ORDER BY bdate';
        Query1.ParamByName('bdate').Value:= DateToStr(c.cdata.begindate);
        Query1.ParamByName('regn').Value:= c.data.regn;
        Query1.Open;

        if Query1.RecordCount=0 then begin
          Query1.Close;
          Query1.SQL.Text:= 'SELECT regn, bdate, edate'+#13+
                            'FROM Hist'+#13+
                            'WHERE (regn = :regn) AND (bdate <> CONVERT(smallDATETIME, :bdate, 104))'+#13+
                            'ORDER BY bdate';
          Query1.ParamByName('regn').Value:= c.data.regn;
          Query1.ParamByName('bdate').Value:= DateToStr(c.cdata.begindate);
        end
        else begin
          Query1.Close;
          Query1.SQL.Text:= 'SELECT regn, bdate, edate'+#13+
                            'FROM Hist'+#13+
                            'WHERE (regn = :regn) AND (bdate <> CONVERT(smallDATETIME, :bdate, 104)) AND (bdate NOT IN'+#13+
                              '(SELECT bdate'+#13+
                              'FROM FactSale'+#13+
                              'WHERE (regn = :regn) AND (bdate < CONVERT(smallDATETIME, :bdate, 104))'+#13+
                              'GROUP BY bdate))'+#13+
                            'GROUP BY regn, bdate, edate';
{'SELECT Hist.regn, Hist.bdate, Hist.edate'+#13+
                            'FROM Hist INNER JOIN'+#13+
                              '(SELECT bdate'+#13+
                                'FROM FactSale'+#13+
                                'WHERE (regn = :regn) AND (bdate < CONVERT(smallDATETIME, :bdate, 104))'+#13+
                                'GROUP BY bdate) tt ON Hist.bdate <> tt.bdate'+#13+
                            'WHERE (Hist.regn = :regn) AND (Hist.bdate <> CONVERT(smallDATETIME, :bdate, 104))'+#13+
                            'GROUP BY Hist.regn, Hist.bdate, Hist.edate';}

{           'SELECT regn, bdate, edate'+#13+
              'FROM Hist'+#13+
              'WHERE     (bdate NOT IN'+#13+
              '(SELECT Hist.bdate'+#13+
              'FROM          Hist INNER JOIN'+#13+
              'FactSale ON Hist.regn = FactSale.regn AND Hist.bdate = FactSale.bdate AND Hist.edate = FactSale.edate'+#13+
              'GROUP BY Hist.bdate)) AND (regn = :regn) AND (bdate <> CONVERT(smallDATETIME, :bdate, 104))';}

          Query1.ParamByName('regn').Value:= c.data.regn;
          Query1.ParamByName('bdate').Value:= DateToStr(c.cdata.begindate);
        end;
      Query1.Open;
      Query1.First;
      ComboBox1.Items.Clear;
      for i:=0 to Query1.RecordCount-1 do begin
        ComboBox1.Items.Add(Query1.FieldByName('bdate').AsString+' - '+Query1.FieldByName('edate').AsString);
        Query1.Next;
      end;
      end;
      Button1.Caption:= '��������';
      Button2.Visible:= FALSE;
      CheckBox1.Visible:= TRUE;
    end;

    //----------

    1: begin
      with datamodule1 do begin
        Query1.SQL.Text:= 'SELECT regn, bdate, edate'+#13+
                          'FROM FactSale'+#13+
                          'GROUP BY bdate, regn, edate'+#13+
                          'HAVING (regn = :regn)'+#13+
                          'ORDER BY bdate';
        Query1.ParamByName('regn').Value:= c.data.regn;
        Query1.Open;
        Query1.First;
        Combobox1.Items.Clear;
        for i:=0 to Query1.RecordCount-1 do begin
          Combobox1.Items.Add(Query1.FieldByName('bdate').AsString+' - '+Query1.FieldByName('edate').AsString);
          Query1.Next;
        end;
        Query1.Close;
      end;
      Button1.Caption:= '��������';
      Button2.Visible:= TRUE;
      CheckBox1.Visible:= FALSE;
    end;
  end;
end;

end.