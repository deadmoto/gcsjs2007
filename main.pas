unit main;

interface

uses
  Buttons, Classes, ComCtrls, comobj, Controls, DB, DBTables, Dialogs, Windows,
  ExtCtrls, Forms, frxClass, frxDBSet, Graphics, Grids, ImgList, Menus,
  Messages, Registry, StdCtrls, SysUtils, Variants, dbf, ActnList, XPStyleActnCtrls,
  ActnMan, ActnCtrls, ActnMenus, ToolWin, SevenZipVCL, Math, StrUtils, frxExportXLS;

type
  PAdditionRepData = ^TAdditionRepData;

  TAdditionRepData = packed record
    Num1, Num2, toNum, soluteNum, zipCode, spec2, StartDate, sumBeg: string;
    basetext: WideString;
    insp: boolean;
    procedure Clear();
  end;

  { ��� CQuery ������������ ��� ������������ ������� �� ������� Search }
  CQuery = packed record
    SQL:     string;
    parname: array of string;
    parval:  array of string;
  end;

  TForm1 = class(TForm)
    StatusBar1:   TStatusBar;
    ImageList1:   TImageList;
    ImageList2:   TImageList;
    PopupMenu1:   TPopupMenu;
    N73:          TMenuItem;
    N74:          TMenuItem;
    N75:          TMenuItem;
    N91:          TMenuItem;
    N92:          TMenuItem;
    N93:          TMenuItem;
    Panel1:       TPanel;
    SGCl:         TStringGrid;
    frxReport1:   TfrxReport;
    frxData:      TfrxDBDataset;
    frxData2:     TfrxDBDataset;
    frxData1:     TfrxDBDataset;
    Panel2:       TPanel;
    GridPanel1:   TGridPanel;
    Image1:       TImage;
    Memo1:        TMemo;
    Image2:       TImage;
    Memo2:        TMemo;
    Image3:       TImage;
    Memo3:        TMemo;
    Panel4:       TPanel;
    Label1:       TLabel;
    Edit1:        TEdit;
    Label2:       TLabel;
    Edit2:        TEdit;
    GridPanel2:   TGridPanel;
    Button1:      TButton;
    Button2:      TButton;
    Button3:      TButton;
    Button8:      TButton;
    Panel3:       TPanel;
    Panel5:       TPanel;
    Panel6:       TPanel;
    Label3:       TLabel;
    Edit3:        TEdit;
    Button4:      TButton;
    Button5:      TButton;
    Button6:      TButton;
    Button9:      TButton;
    Panel7:       TPanel;
    Panel8:       TPanel;
    Label4:       TLabel;
    Edit4:        TEdit;
    GroupBox1:    TGroupBox;
    Label5:       TLabel;
    Label6:       TLabel;
    Label7:       TLabel;
    Label8:       TLabel;
    Edit5:        TEdit;
    Edit9:        TEdit;
    Edit10:       TEdit;
    Edit6:        TEdit;
    Edit7:        TEdit;
    Edit11:       TEdit;
    Edit12:       TEdit;
    Edit8:        TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Label9: TLabel;
    Bevel1: TBevel;
    ActionManager1: TActionManager;
    aOpenMount: TAction;
    aReload: TAction;
    aFilter: TAction;
    aCodePage: TAction;
    aMerge: TAction;
    aBackup: TAction;
    aExportForCentr: TAction;
    aExport: TAction;
    aImport: TAction;
    aOpenExcel: TAction;
    aExportDBF: TAction;
    aExit: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    aFormSubsidy: TAction;
    aRecalcSubsidy: TAction;
    aRepRecalcSubsidy: TAction;
    aCurHist: TAction;
    aUpdate: TAction;
    aAbout: TAction;
    aClAdd: TAction;
    aClEdit: TAction;
    aClDel: TAction;
    aSelServer: TAction;
    aSelDist: TAction;
    aSelInsp: TAction;
    aConf: TAction;
    aEditClCert: TAction;
    aEditTrafCl: TAction;
    aSetActiveAllInsp: TAction;
    aSetActiveAllStrt: TAction;
    aSetActiveUseStrt: TAction;
    aRepEditor: TAction;
    ActionToolBar1: TActionToolBar;
    aShowLegend: TAction;
    aRunCalc: TAction;
    aSvodNach: TAction;
    aStatMinMdd: TAction;
    aStatAge: TAction;
    aStatPriv: TAction;
    aRepNach: TAction;
    aRepRealize: TAction;
    aSQLQuery: TAction;
    aRepFact: TAction;
    aSlujSumTarif: TAction;
    aSlujSumAll: TAction;
    aClAddMount: TAction;
    aClDelCurPeriod: TAction;
    aClDelAllNull: TAction;
    aRepUvedom: TAction;
    aRepKarta: TAction;
    aRepVedomost: TAction;
    aRepPause: TAction;
    aRepPlay: TAction;
    aRepStop: TAction;
    aClStopSubsidy: TAction;
    aClCancelStop: TAction;
    aClPause: TAction;
    aClStop: TAction;
    aClPlay: TAction;
    aClUndo: TAction;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    Action12: TAction;
    Action13: TAction;
    Action14: TAction;
    Action15: TAction;
    Action16: TAction;
    Action17: TAction;
    Action18: TAction;
    Action19: TAction;
    Action20: TAction;
    Action21: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SGClDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
    procedure SGClSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
    procedure SGClDblClick(Sender: TObject);
    procedure SGClKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure SGClKeyPress(Sender: TObject; var Key: char);
    procedure FormResize(Sender: TObject);
    procedure N73Click(Sender: TObject);
    procedure N75Click(Sender: TObject);
    procedure N74Click(Sender: TObject);
    procedure N93Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SGClMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure aOpenMountExecute(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure aExportDBFExecute(Sender: TObject);
    procedure aOpenExcelExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aAboutExecute(Sender: TObject);
    procedure aSelServerExecute(Sender: TObject);
    procedure aSelDistExecute(Sender: TObject);
    procedure aSelInspExecute(Sender: TObject);
    procedure aConfExecute(Sender: TObject);
    procedure aFilterExecute(Sender: TObject);
    procedure aCodePageExecute(Sender: TObject);
    procedure aReloadExecute(Sender: TObject);
    procedure aMergeExecute(Sender: TObject);
    procedure aExportExecute(Sender: TObject);
    procedure aImportExecute(Sender: TObject);
    procedure aBackupExecute(Sender: TObject);
    procedure aExportForCentrExecute(Sender: TObject);
    procedure aClAddExecute(Sender: TObject);
    procedure aClEditExecute(Sender: TObject);
    procedure aClDelExecute(Sender: TObject);
    procedure aFormSubsidyExecute(Sender: TObject);
    procedure aRecalcSubsidyExecute(Sender: TObject);
    procedure aRepRecalcSubsidyExecute(Sender: TObject);
    procedure aCurHistExecute(Sender: TObject);
    procedure aEditClCertExecute(Sender: TObject);
    procedure aEditTrafClExecute(Sender: TObject);
    procedure aSetActiveAllInspExecute(Sender: TObject);
    procedure aSetActiveAllStrtExecute(Sender: TObject);
    procedure aSetActiveUseStrtExecute(Sender: TObject);
    procedure aRepEditorExecute(Sender: TObject);
    procedure aRunCalcExecute(Sender: TObject);
    procedure aShowLegendExecute(Sender: TObject);
    procedure aSvodNachExecute(Sender: TObject);
    procedure aStatMinMddExecute(Sender: TObject);
    procedure aStatAgeExecute(Sender: TObject);
    procedure aStatPrivExecute(Sender: TObject);
    procedure aRepNachExecute(Sender: TObject);
    procedure aRepRealizeExecute(Sender: TObject);
    procedure aSQLQueryExecute(Sender: TObject);
    procedure aRepFactExecute(Sender: TObject);
    procedure aSlujSumTarifExecute(Sender: TObject);
    procedure aSlujSumAllExecute(Sender: TObject);
    procedure aClAddMountExecute(Sender: TObject);
    procedure aClDelCurPeriodExecute(Sender: TObject);
    procedure aClDelAllNullExecute(Sender: TObject);
    procedure aRepUvedomExecute(Sender: TObject);
    procedure aRepKartaExecute(Sender: TObject);
    procedure aRepVedomostExecute(Sender: TObject);
    procedure aRepPauseExecute(Sender: TObject);
    procedure aRepPlayExecute(Sender: TObject);
    procedure aRepStopExecute(Sender: TObject);
    procedure aClStopSubsidyExecute(Sender: TObject);
    procedure aClCancelStopExecute(Sender: TObject);
    procedure aClPauseExecute(Sender: TObject);
    procedure aClStopExecute(Sender: TObject);
    procedure aClPlayExecute(Sender: TObject);
    procedure aClUndoExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure Action9Execute(Sender: TObject);
    procedure Action10Execute(Sender: TObject);
    procedure Action11Execute(Sender: TObject);
    procedure Action12Execute(Sender: TObject);
    procedure Action13Execute(Sender: TObject);
    procedure Action14Execute(Sender: TObject);
    procedure Action15Execute(Sender: TObject);
    procedure Action16Execute(Sender: TObject);
    procedure Action17Execute(Sender: TObject);
    procedure Action18Execute(Sender: TObject);
    procedure Action19Execute(Sender: TObject);
    procedure Action20Execute(Sender: TObject);
    procedure Action21Execute(Sender: TObject);
  private
    FShaderForm: TForm;
    ccl, acl:     integer;//���������� ���� � �������� �������� � ����
    sec1:         integer;//������������: 0 - �������� ������, 1 - �������� �����
    subs:         real;//������� �������� �������
    cl:           array of integer;//�������
    st:           array of integer;//������� ��������(1 �����,��������,����.�����,����������)
    sub:          array of real;//������� ����� �������� ��������
    stop:         array of integer;//������� �������� �� ������(���,������������,�����������,�������������)
    reg:          integer;//���.����� ��� ������
    fdate, ldate: TDate;  //���� �������� ��� ������
    subr:         real;   //�������� ��� ������
    procedure InsertCl(i1, i2: integer);
    procedure DelRow(i: integer);
    procedure PrintVedCr(f, ad, rd, mng: string);
    procedure ClearSG;
    procedure Load(q: CQuery; rsel: boolean);
    procedure ReloadConfig;
    procedure SaveSubsidyCfg;

    function GenPer(b, e: TDate): string;
    function GenCalc(c: integer): string;
    function NewPlace(id: integer; s1, s2: string): integer;
    function ACount: integer;
    function ASub: real;
    function CheckP1: bool;
    function SetSumSub: real;
  protected
    procedure WMEnable(var Message: TWMEnable); message WM_ENABLE;
  public
    normc, normw: real;//��������� ������� ���� � ���� � ���
    normsc, normsw: integer;//����� ������� ���� � ���� � ���
    insp:         integer;//������� ���������
    dist:         integer;//������� �����
    client:       integer;//������� ������
    status:       integer;//������� ������ �������
    rdt:          string;//���� ������ �������� ��������� ������� 01.08.05
    by, ey, em, bm: integer;//������ ��������� �����
    qr:           CQuery;//����� ������� ��� �������
    Idate:        TDate;//���� ������� ��������� � �������������
    bpath:        string;
    codedbf:      TCodePage;
    reports_path: string;//���� � ����� � ��������
    curServer : string;//������� ������ � �����
    ARepData:     PAdditionRepData; //������ ��� ������(� �������, � ����������)
    procedure AddCl(id: integer);
    procedure ModCl(id: integer);
    procedure DelCl(id: integer);
    procedure Reload;
    procedure SetPer(per1: string; var per2: string);
    procedure SetPer2(per1: string; var per2: string);
    procedure RecalcSelectedRows;
    procedure SetTarifs;
    procedure ReportsFillDistInfo;
    procedure ReportsFillAdditionData(nameInsp: string);

    function GenAddr(s, n, c, a: string): string;
    function GetStatus(b, e: TDate): integer;
    function CheckP2: bool;
    function SG_FindCl(SG: TStringGrid; s: string): integer;
  end;

var
  Form1:     TForm1;
  searchbuf: string;//�������� ����� ����, ������� ������������ ��� ������ ��� �������
  LastTime:  TTime;  //����� ���������� ������� �������
  ItemIndex: integer;//������������ ��� ������ ��� �������
  curregn:   integer;

implementation

uses
  sclient, inspector, district, street, fond, manager, privilege, minimum, status,
  tarif, elpower, uSelectDist, opend, houses, norm, chpriv, chhouse, bank, about,
  datamodule, search, service, fstruct, imexp, SQL, progress, Contnrs, DateUtils,
  rstnd, loop, tarifb, chinsp, curhist, chserv, Client, merge, mdd, statage,
  statlm, codedbf, chtarifs, rrecalc, stat, padegFIO, uSluj, uConnection,
  uSettings, uReportData, uGenRefBook, uReportEdit, uShade;

{$R *.dfm}
{$I Revision.inc}

procedure TForm1.WMEnable(var Message: TWMEnable);
begin
  inherited;
  if Message.Enabled then
    FreeAndNil(FShaderForm)
  else
    FShaderForm:= TShadeForm.Execute(Self);
end;

procedure TForm1.SetTarifs;
begin
  with DModule do
  begin
    pv.DatabaseName  := 'Subsidy';
    norm1.DatabaseName := 'Subsidy';

    t1.Connection := DModule.dbfConnection;
    t2.Connection := DModule.dbfConnection;
    t3.Connection := DModule.dbfConnection;
    t4.Connection := DModule.dbfConnection;
    t5.Connection := DModule.dbfConnection;
    t6.Connection := DModule.dbfConnection;
    t7.Connection := DModule.dbfConnection;
    t8.Connection := DModule.dbfConnection;
    t9.Connection := DModule.dbfConnection;
    t10.Connection := DModule.dbfConnection;

    t1.SQL.Text := 'select * from "curcont"';
    t2.SQL.Text := 'select * from "currep"';
    t3.SQL.Text := 'select * from "curcold"';
    t4.SQL.Text := 'select * from "curhot"';
    t5.SQL.Text := 'select * from "curcanal"';
    t6.SQL.Text := 'select * from "curheat"';
    t7.SQL.Text := 'select * from "curgas"';
    t8.SQL.Text := 'select * from "curel"';
    t9.SQL.Text := 'select * from "curwood"';
    t10.SQL.Text := 'select * from "curcoal"';

    pv.SQL.Text := 'select * from priv';
    norm1.SQL.Text := 'select * from norm';

    t1.Open;
    t2.Open;
    t3.Open;
    t4.Open;
    t5.Open;
    t6.Open;
    t7.Open;
    t8.Open;
    t9.Open;
    t10.Open;

    pv.Open;
    norm1.Open;
  end;
end;

function TForm1.CheckP1: bool;
{*******************************************************************************
    ������� CheckP1 ��������� ������������� �� ������� ����� ��������, �����������
  ��� ������������ ��������.
    ey � em - ��� � �����, ������������ ������ ����� �������� ������ ���������
  ������ �� ��� ���, ���� �� �������� ���� �� ���� ������ � ������� � ���������
  �������� �������.
    ������� ���������� true, ���� ������� �������� ������ >= �������, ���������
  � ������� em � ey. ����� false.
*******************************************************************************}
var
  e: TDate;
begin
  e := EncodeDate(ey, em, 1);
  if StrToDate(rdt) >= e then
    Result := True
  else
    Result := False;
end;

function TForm1.CheckP2: bool;
{*******************************************************************************
    ������� CheckP2 ��������� ������������� �� ������� �������� ������ ��������,
  ����������� ��� ��������� ������������ � ����� ������ ����, �� ������� ��������
  ���������.
    ������� ���������� true, ���� ������� �������� ������ ��������� ��� ������ ��
  ����� �������, ��������� � ������� em � ey. ����� false.
*******************************************************************************}
var
  c, e: TDate;
begin
  c := StrToDate(rdt);
  e := EncodeDate(ey, em, 1);
  if (c = e) or (c = IncMonth(e)) then
    Result := True
  else
    Result := False;
end;

procedure TForm1.aAboutExecute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TForm1.aClAddExecute(Sender: TObject);
{*******************************************************************************
    ��������� N15Click ������������ ������� ������ ���� � �������� ����� ����������
  ������ �������.
    ������� ����� �������� ������ � ������� �� ��������� ��� ��������� �� ���
  �������� ������. � ������ ���� ������� ������ �� �������� ������� �� ���������,
  �������� ��������� �� ������.
*******************************************************************************}
begin
  if CheckP2 then
  begin
    Form2.mode := vAdd;
    Form2.ShowModal;
  end
  else
    ShowMessage('�������� ������� ����� ������ � ������� �� ��������� ��� ��������� �� ��� �������� ������!');
end;

procedure TForm1.aClDelExecute(Sender: TObject);
{*******************************************************************************
    ��������� ������� �������.
    ����� ��������� ������� ������������� ������������� ��������. ����� ���������
  �������� ������ � ��� ��������� �� ���� ������.
    ���� � ������� �� ������ ����� ��������, �� ��� ������� ������. ���� ����
  �����, �� �� ���� �������� ��������������� ���������.
*******************************************************************************}
var
  res, i: integer;
begin
  if (Length(cl) > 0) then
  begin
    if (status = 0) then
    begin
      i := SGCl.Row - 1;
      if MessageBox(Form1.Handle, PChar('�������� ������� ' + SGCL.Cells[0, i + 1] + '.' + #13 +
        '�������������?'), PChar('�������� �������'),
        MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
      begin
        DModule.Database1.StartTransaction;
        try
          with DModule.Query1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('delete from cl');
            SQL.Add('where regn = :id');
            ParamByName('id').AsInteger := client;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from hist');
            SQL.Add('where regn = :id and bdate=convert(smalldatetime,:d,104)');
            ParamByName('id').AsInteger := client;
            ParamByName('d').AsString := Form1.rdt;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from fam');
            SQL.Add('where regn = :id');
            ParamByName('id').AsInteger := client;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from sub');
            SQL.Add('where regn = :id');
            ParamByName('id').AsInteger := client;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from sluj');
            SQL.Add('where regn = :id');
            ParamByName('id').AsInteger := client;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from FactSale');
            SQL.Add('where regn = :id');
            ParamByName('id').AsInteger := client;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from FactBalance');
            SQL.Add('where regn = :id');
            ParamByName('id').AsInteger := client;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from Counters');
            SQL.Add('where regn = :id');
            ParamByName('id').AsInteger := client;
            ExecSQL;
            Close;
          end;
          DModule.Database1.Commit;
          Res := 0;
        except
          //�� ��������� ����������
          DModule.Database1.Rollback;
          Res := -1;
        end;
        if Res = 0 then
          DelCl(client);
      end;
    end
    else
      ShowMessage('������� ������ �������!');
  end
  else
    ShowMessage('���� �����!');
end;

procedure TForm1.aClEditExecute(Sender: TObject);
{*******************************************************************************
  ��������� �������� ����� ��������/�������� �������.
  ���� ���� �����, �� �� ���� �������� ��������������� ���������.
*******************************************************************************}
begin
  if (Length(cl) > 0) then
  begin
    if (stop[SGCl.Row - 1] < 2) or (stop[SGCl.Row - 1] > 1) and (status = 3) then
    begin
      Form2.mode := vEdit;
      Form2.ShowModal;
    end
    else
      ShowMessage('����� ������� ������������� ��� ���������!' + #13 +
        '�������� �������� ������ ����� ������������� �������� ��� �� ��������� ����� ��������.');
  end
  else
    ShowMessage('���� �����!');
end;

procedure TForm1.aCodePageExecute(Sender: TObject);
begin
  Form41.ShowModal;
end;

procedure TForm1.aConfExecute(Sender: TObject);
begin
  SettingsFrm.ShowModal;
  ReloadConfig; //��������� ����� ���������
end;

function TForm1.ACount: integer;
{*******************************************************************************
    ������� ACount ���������� ���������� �������� �������� � ��������������� ������
  ��������. ���� ������ �� ������, �� ��� ���������� ���������� �������� ��������
  � ����.
*******************************************************************************}
var
  i, c: integer;
begin
  c := 0;
  for i := 0 to Length(st) - 1 do
    if st[i] < 3 then
      Inc(c);
  Result := c;
end;

procedure TForm1.Action10Execute(Sender: TObject);
{ ���������� ����� ��������� }
begin
  with GenRefBookFrm do
  begin
    mode := mSettlingType;
    status := sec1;
    ShowModal;
  end;
end;

procedure TForm1.Action11Execute(Sender: TObject);
{ ���������� ����� �������� }
begin
  with GenRefBookFrm do
  begin
    mode := mControl;
    status := sec1;
    ShowModal;
  end;
end;

procedure TForm1.Action12Execute(Sender: TObject);
{ ���������� ��������� }
begin
  with GenRefBookFrm do
  begin
    mode := mRelation;
    status := sec1;
    ShowModal;
  end;
end;

procedure TForm1.Action13Execute(Sender: TObject);
{ ���������� ����� }
begin
  Form11.status := sec1;
  Form11.ShowModal;
end;

procedure TForm1.Action14Execute(Sender: TObject);
{ ���������� ���������� �������� }
begin
  Form14.status := sec1;
  Form14.ShowModal;
end;

procedure TForm1.Action15Execute(Sender: TObject);
{ ���������� ���. ���� }
begin
  Form27.status := sec1;
  Form27.ShowModal;
end;

procedure TForm1.Action16Execute(Sender: TObject);
{ ���������� ����������� ��������� }
begin
  Form13.status := sec1;
  Form13.ShowModal;
end;

procedure TForm1.Action17Execute(Sender: TObject);
{*******************************************************************************
  ��������� �������� ���������� ������������ c��������� ��������� ���.
*******************************************************************************}
begin
  Form38.status := sec1;
  Form38.ShowModal;
end;

procedure TForm1.Action18Execute(Sender: TObject);
{  ����� ����� ��������� ��� }
begin
  Form20.status := sec1;
  Form20.ShowModal;
end;

procedure TForm1.Action19Execute(Sender: TObject);
{ ����� ����� �� ������� ����� }
begin
  Form42.status := sec1;
  Form42.ShowModal;
end;

procedure TForm1.Action1Execute(Sender: TObject);
{*******************************************************************************
    ��������� N25Click ������������ ������� ������ ���� � �������� ����������
  �����������.
    ����� ��� �������� � ������� ����� ������������� ������� ��������� � ����������
  ��������������� ������� � statusbar.
*******************************************************************************}
begin
  Form3.status := sec1;
  Form3.ShowModal;
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select nameinsp');
    SQL.Add('from insp');
    SQL.Add('where (id_insp = :id)and(id_dist=:idd)');
    ParamByName('id').AsInteger  := insp;
    ParamByName('idd').AsInteger := dist;
    Open;
    Statusbar1.Panels[1].Text := '���������: ' + FieldByName('nameinsp').AsString;
    Close;
  end;
end;

procedure TForm1.Action20Execute(Sender: TObject);
{*******************************************************************************
  ��������� ��������� ������� ������� �������, ��������� � ���.����������.
*******************************************************************************}
begin
  FillCurr(bpath, rdt, dist, Form1.codedbf);
end;

procedure TForm1.Action21Execute(Sender: TObject);
var
  xlsExport: TfrxXLSExport;
begin
  with DModule do
  begin
    Query1.Close;
    Query1.SQL.Text := 'EXEC mintrudmounth ' + quotedstr(rdt);
    Query1.Open;
  end;

  frxData.DataSource := DModule.DataSource1;
  frxReport1.LoadFromFile(PChar(reports_path + 'mintrudmount.fr3'));

  frxReport1.Variables.Variables['month'] := quotedstr(LongMonthNames[StrToInt(FormatDateTime('m', StrToDate(rdt)))]);
  frxReport1.Variables.Variables['rdt']  := quotedstr(rdt);

  frxReport1.PrepareReport;

  if MessageBox(Form1.Handle, PChar('�������������� � Excel ?'),
    PChar('������� � Excel'), MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
  begin
    xlsExport :=  TfrxXLSExport.Create(frxReport1);
    frxReport1.Export(xlsExport);
  end;

  frxReport1.ShowPreparedReport;
end;

procedure TForm1.Action2Execute(Sender: TObject);
{*******************************************************************************
  ����� ����������� �������. ����� ��� �������� � ������� ����� �������������
  ������� ����� � ���������.
*******************************************************************************}
begin
  Form4.status := sec1;
  Form4.ShowModal;
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select namedist,nameinsp');
    SQL.Add('from dist inner join insp on dist.id_dist=insp.id_dist');
    SQL.Add('where dist.id_dist = :id');
    ParamByName('id').AsInteger := dist;
    Open;
    Statusbar1.Panels[2].Text := '�����: ' + FieldByName('namedist').AsString;
    Statusbar1.Panels[1].Text := '���������: ' + FieldByName('nameinsp').AsString;
    Close;
  end;
end;

procedure TForm1.Action3Execute(Sender: TObject);
{ ���������� ���� }
begin
  Form5.status := sec1;
  Form5.ShowModal;
end;

procedure TForm1.Action4Execute(Sender: TObject);
{ ���������� ����� }
begin
  Form30.status := sec1;
  Form30.ShowModal;
end;

procedure TForm1.Action5Execute(Sender: TObject);
{ ���������� �������������� ����� }
begin
  Form7.status := sec1;
  Form7.ShowModal;
end;

procedure TForm1.Action6Execute(Sender: TObject);
{ ���������� �������� ������ }
begin
  Form6.status := sec1;
  Form6.ShowModal;
end;

procedure TForm1.Action7Execute(Sender: TObject);
{ ���������� ������ }
begin
  Form31.status := sec1;
  Form31.ShowModal;
end;

procedure TForm1.Action8Execute(Sender: TObject);
{ ���������� ����� ���������� }
begin
  with GenRefBookFrm do
  begin
    mode := mCertification;
    status := sec1;
    ShowModal;
  end;
end;

procedure TForm1.Action9Execute(Sender: TObject);
{ ���������� ����� �������� }
begin
  with GenRefBookFrm do
  begin
    mode := mOwnType;
    status := sec1;
    ShowModal;
  end;
end;

procedure TForm1.aClStopSubsidyExecute(Sender: TObject);
{
  ������������ ����� �� �������� ��������� �������. ������ � �������, ��������
  ��������� ����� ��������, �� ��� ��� ���� �� �������� ����� �����, ���� ����
  ������ �� ������������� ��� ���� �� ��������� ���������.
  ����� ����������� ������ � ������������ ������������� �������������. ���
  ������������� ������ ���������� ���������� ����������� ������.
}
var
  i: integer;
  s, dt: string;
begin
  if status <> 3 then
  begin
    i := SGCl.Row - 1;
    if MessageBox(Form1.Handle, PChar('������������ ����� �� �������� ������� ' + SGCL.Cells[0, i + 1] + '.' + #13 + '�������������?'), PChar('����� �� ��������'),
      MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
    begin
      reg  := client;
      subr := sub[i];
      fdate := StrToDate(Copy(SGCl.Cells[2, i + 1], 1, 10));
      ldate := StrToDate(Copy(SGCl.Cells[2, i + 1], 14, 10));
      with DModule.Query1 do
      begin
        Close;
        SQL.Text :=
          'update hist' + #13 +
          'set edate=CONVERT(smalldatetime, :d, 104)' + #13 +
          'where regn = :id and bdate<=convert(smalldatetime,:d,104)' + #13 +
          'and edate>convert(smalldatetime,:d,104)';
        ParamByName('id').AsInteger := client;
        ParamByName('d').AsString := rdt;
        ExecSQL;

        Close;
        SQL.Text :=
          'update cl' + #13 +
          'set change=CONVERT(smalldatetime, :change, 104)' + #13 +
          'where regn = :id';
        ParamByName('id').AsInteger := client;
        ParamByName('change').AsString := DateToStr(Date);
        ExecSQL;

        Close;
        SQL.Text :=
          'delete from sub' + #13 +
          'where (regn=:id)and(sdate>=convert(smalldatetime,:d,104))';
        ParamByName('id').AsInteger := client;
        ParamByName('d').AsString := rdt;
        ExecSQL;
        Close;

        s := Copy(SGCl.Cells[2, i + 1], 1, 10);
        st[i] := GetStatus(StrToDate(s), StrToDate(rdt));
        status := st[i];
        SetPer2(rdt, dt);
        if (rdt = '01.' + Copy(dt, 3, 2) + '.20' + Copy(dt, 1, 2)) then
          sub[i] := 0;
        SGCl.Cells[2, i + 1] := Copy(SGCl.Cells[2, i + 1], 1, 13) + rdt;
        SGCl.Cells[4, i + 1] := '0,00';
        SGCl.Repaint;
        Edit4.Text := FlToStr(ASub);
      end;
    end;
  end;
end;

procedure TForm1.aClCancelStopExecute(Sender: TObject);
{ ����� - �������������� ����� �������� ����� ������ �� �������� }
var
  i: integer;
  c: TClient;
begin
  if reg <> 0 then
  begin//���������� �����
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update hist');
      SQL.Add('set edate=CONVERT(smalldatetime, :edate, 104)');
      SQL.Add('where regn = :id and edate=convert(smalldatetime,:d,104)');
      ParamByName('id').AsInteger := reg;
      ParamByName('edate').AsString := DateToStr(ldate);
      ParamByName('d').AsString := rdt;
      ExecSQL;
      Close;
      c := TClient.Create(Empty, EmptyC);
      c.SetCalc(reg, rdt);
      c.Calc(1);
      Close;
      SQL.Clear;
      SQL.Add('update sub');
      SQL.Add('set pm=:pm,snpm=:snp,sub=:sub,spfree=:sp,stop=1');
      SQL.Add('where sdate=CONVERT(smalldatetime,:s,104) and regn=:r');
      SQL.Add('and service=:serv');
      ParamByName('s').AsString  := rdt;
      ParamByName('r').AsInteger := client;
      for i := 0 to numbtarif - 1 do
      begin
        if (i < 8) or (i > 11) then
        begin
          ParamByName('serv').AsInteger := i;
          ParamByName('pm').AsFloat  := c.cdata.pm[i];
          ParamByName('snp').AsFloat := c.cdata.snpm[i];
          ParamByName('sub').AsFloat := c.cdata.sub[i];
          ParamByName('sp').AsFloat  := c.cdata.fpm[i];
          ExecSQL;
        end;
      end;
      i := FindCl(reg, cl);
      st[i] := GetStatus(fdate, ldate);
      status := st[i];
      client := cl[i];
      subs := subr;
      SGCl.Cells[2, i + 1] := DateToStr(fdate) + ' - ' + DateToStr(ldate);
      SGCl.Cells[4, i + 1] := FlToStr(subs);
      SGCl.Row := i + 1;
      Edit4.Text := FlToStr(ASub);
      SGCl.Repaint;
    end;
    //����� ����������, �������� ���������� ������
    reg  := 0;
    subr := 0;
  end
  else
    ShowMessage('����������� ������� �����!');
end;

procedure TForm1.aClPauseExecute(Sender: TObject);
{*******************************************************************************
  ��������� ���������������� �������� � ������� �������� ������� ���������� �������.
  � ������� hist �������� ���� stop ��������������� � 2, � � ������� �������� � ���������
  ���������� ������� ��������(����������, ����� ���� ������� ������������).
*******************************************************************************}
begin
  if (stop[SGCl.Row - 1] = 0) and (status <> 3) then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update sub');
      SQL.Add('set sub=0.00,stop=2');
      SQL.Add('where regn=:id and sdate=convert(smalldatetime,:d,104)');
      ParamByName('id').AsInteger := client;
      ParamByName('d').AsString := rdt;
      ExecSQL;
      Close;
      Close;
      SQL.Clear;
      SQL.Add('update sluj');
      SQL.Add('set sub=0.00');
      SQL.Add('where regn=:id and sdate=convert(smalldatetime,:d,104)');
      ParamByName('id').AsInteger := client;
      ParamByName('d').AsString := rdt;
      ExecSQL;
      Close;
    end;
    stop[SGCl.Row - 1] := 2;
    subs := 0;
    sub[SGCl.Row - 1] := 0;
    SGCl.Cells[4, SGCl.Row] := '0.00';
    Edit4.Text := FlToStr(SetSumSub);
    SGCl.Repaint;
  end
  else
    ShowMessage('������������� ����� ������ ����������� �������� ��������� �������!');
end;

procedure TForm1.aClStopExecute(Sender: TObject);
{*******************************************************************************
  ��������� ���������� �������� ���������� �������. � ������� sub �������� ����
  stop ��������������� � 3, � � ������� �������� � ���������
  ���������� ������� ��������(����������, ����� ���� ������� ������������).
*******************************************************************************}
var
  cmp: integer;
begin
  if YearOf(StrToDate(rdt)) = YearOf(StrToDate(Copy(SGCl.Cells[2, SGCl.row], 1, 10))) then
    cmp := MonthOf(StrToDate(rdt)) - MonthOf(StrToDate(Copy(SGCl.Cells[2, SGCl.row], 1, 10)))
  else
    cmp := MonthOf(StrToDate(rdt)) + 12 - MonthOf(StrToDate(Copy(SGCl.Cells[2, SGCl.row], 1, 10)));
  if (stop[SGCl.Row - 1] = 2) and (status <> 3) and (cmp = 1) then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update sub');
      SQL.Add('set sub=0.00,stop=3');
      SQL.Add('where regn=:id and sdate=convert(smalldatetime,:d,104)');
      ParamByName('id').AsInteger := client;
      ParamByName('d').AsString := rdt;
      ExecSQL;
      Close;
      Close;
      SQL.Clear;
      SQL.Add('update sluj');
      SQL.Add('set sub=0.00');
      SQL.Add('where regn=:id and sdate=convert(smalldatetime,:d,104)');
      ParamByName('id').AsInteger := client;
      ParamByName('d').AsString := rdt;
      ExecSQL;
      Close;
    end;
    stop[SGCl.Row - 1] := 3;
    subs := 0;
    sub[SGCl.Row - 1] := 0;
    SGCl.Cells[4, SGCl.Row] := '0.00';
    Edit4.Text := FlToStr(SetSumSub);
    SGCl.Repaint;
  end
  else
    ShowMessage('���������� ����� ������ ���������������� �������� ��������� ������� �� ��������� 1 ������ �� ��� ������������!');
end;

procedure TForm1.aClPlayExecute(Sender: TObject);
{*******************************************************************************
  ��������� ��������������� �������� � ������� �������� ������� ���������� �������.
  � ������� sub �������� ���� stop ��������������� � 1, � � ������� �������� � ���������
  ����������� ������� ��������(����������, ����� ���� ������� ������������).
*******************************************************************************}
var
  c: TClient;
  i: integer;
  cmp: integer;
  s: real;
begin
  if YearOf(StrToDate(rdt)) = YearOf(StrToDate(Copy(SGCl.Cells[2, SGCl.row], 1, 10))) then
    cmp := MonthOf(StrToDate(rdt)) - MonthOf(StrToDate(Copy(SGCl.Cells[2, SGCl.row], 1, 10)))
  else
    cmp := MonthOf(StrToDate(rdt)) + 12 - MonthOf(StrToDate(Copy(SGCl.Cells[2, SGCl.row], 1, 10)));
  if (stop[SGCl.Row - 1] = 3) and (status <> 3) and (cmp >= 1) then
  begin
    with DModule.Query1 do
    begin
      Close;
      c := TClient.Create(Empty, EmptyC);
      c.SetCalc(client, rdt);
      c.Calc(1);
      Close;
      SQL.Clear;
      SQL.Add('update sub');
      SQL.Add('set pm=:pm,snpm=:snp,sub=:sub,spfree=:sp,stop=1');
      SQL.Add('where sdate=CONVERT(smalldatetime,:s,104) and regn=:r');
      SQL.Add('and service=:serv');
      ParamByName('s').AsString := rdt;
      ParamByName('r').AsInteger := client;
      s := 0;
      for i := 0 to numbtarif - 1 do
      begin
        if (i < 8) or (i > 11) then
        begin
          ParamByName('serv').AsInteger := i;
          ParamByName('pm').AsFloat  := c.cdata.pm[i];
          ParamByName('snp').AsFloat := c.cdata.snpm[i];
          ParamByName('sub').AsFloat := c.cdata.sub[i];
          ParamByName('sp').AsFloat  := c.cdata.fpm[i];
          ExecSQL;
          s := s + c.cdata.sub[i];
        end;
      end;
    end;
    stop[SGCl.Row - 1] := 1;
    subs := s;
    sub[SGCl.Row - 1] := s;
    SGCl.Cells[4, SGCl.Row] := FlToStr(sub[SGCl.Row - 1]);
    Edit4.Text := FlToStr(SetSumSub);
    SGCl.Repaint;
  end
  else
    ShowMessage('����������� ����� ������ ���������������� ��� ������������ �������� ��������� ������� �� ��������� 1 ������ �� ��� ������������!');
end;

procedure TForm1.aClUndoExecute(Sender: TObject);
{*******************************************************************************
  ��������� ��������������� �������� � ������� �������� ������� ���������� �������,
  � �������� ���� ������� ������������, ����������� ��� �������������, �
  ���������������� ������� ���������.
  � ������� sub �������� ���� stop ��������������� � 0, � � ������� ��������
  ����������� ������� ��������(����������, ����� ���� ������� ������������).
*******************************************************************************}
var
  c: TClient;
  i: integer;
  s: real;
begin
  if stop[SGCl.Row - 1] = 2 then
  begin
    with DModule.Query1 do
    begin
      Close;
      c := TClient.Create(Empty, EmptyC);
      c.SetCalc(client, rdt);
      c.Calc(1);
      Close;
      SQL.Clear;
      SQL.Add('update sub');
      SQL.Add('set pm=:pm,snpm=:snp,sub=:sub,spfree=:sp,stop=0');
      SQL.Add('where sdate=CONVERT(smalldatetime,:s,104) and regn=:r');
      SQL.Add('and service=:serv');
      ParamByName('s').AsString := rdt;
      ParamByName('r').AsInteger := client;
      s := 0;
      for i := 0 to numbtarif - 1 do
      begin
        if (i < 8) or (i > 11) then
        begin
          ParamByName('serv').AsInteger := i;
          ParamByName('pm').AsFloat  := c.cdata.pm[i];
          ParamByName('snp').AsFloat := c.cdata.snpm[i];
          ParamByName('sub').AsFloat := c.cdata.sub[i];
          ParamByName('sp').AsFloat  := c.cdata.fpm[i];
          ExecSQL;
          s := s + c.cdata.sub[i];
        end;
      end;
    end;
    stop[SGCl.Row - 1] := 0;
    subs := s;
    sub[SGCl.Row - 1] := s;
    SGCl.Cells[4, SGCl.Row] := FlToStr(sub[SGCl.Row - 1]);
    Edit4.Text := FlToStr(SetSumSub);
    SGCl.Repaint;
  end;
end;

procedure TForm1.aClAddMountExecute(Sender: TObject);
var
  i: integer;
begin
  i := SGCl.Row - 1;
  with DModule.Query1 do
  begin
    if MessageBox(Form1.Handle, PChar('�������� ����� ������� ' + SGCL.Cells[0, i + 1] + ' �� ������ ' + SGCL.Cells[2, i + 1] + '.' + #13 + '�������������?'), PChar('����� �� ��������'),
      MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from hist where regn = :idd and edate >=:d');
      ParamByName('idd').AsInteger := client;
      ParamByName('d').AsDateTime  := StrToDateTime(rdt);
      Open;
      if IncMonth(FieldByName('bdate').AsDateTime, 6) = FieldByName('edate').AsDateTime then
        ShowMessage('����� ������� ��������� ��� ������...')
      else
      begin
        Close;
        SQL.Clear;
        SQL.Add('update hist set edate = dateadd(month, 1, edate) where hist.regn = :r and edate >= :d');
        ParamByName('r').AsInteger  := client;
        ParamByName('d').AsDateTime := StrToDateTime(rdt);
        ExecSQL;
        Close;
      end;
    end;
  end;
end;

procedure TForm1.aClDelCurPeriodExecute(Sender: TObject);
var
  i: integer;

function GetCert(regn: integer): integer;
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text := ('SELECT id_cert FROM hist');
    SQL.Add('WHERE regn = :id and bdate=convert(smalldatetime,:d,104)');
    ParamByName('id').AsInteger := client;
    ParamByName('d').AsString := Form1.rdt;
    Open;
    First;
  end;
  Result := DModule.Query1.FieldByName('id_cert').Value;
end;

begin
  if (Length(cl) > 0) then
  begin
    if (status = 0) and (GetCert(client) = 2) then
    begin
      i := SGCl.Row - 1;
      if MessageBox(Form1.Handle, PChar('�������� � ������� "' + SGCL.Cells[0, i + 1] + '" �������� �������.' + #13 +
        '�������������?'), PChar('�������� � ������� �������� �������'),
        MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
      begin
        DModule.Database1.StartTransaction;
        try
          with DModule.Query1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('delete from hist');
            SQL.Add('where regn = :id and bdate=convert(smalldatetime,:d,104)');
            ParamByName('id').AsInteger := client;
            ParamByName('d').AsString := Form1.rdt;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from sub');
            SQL.Add('where regn = :id and sdate=convert(smalldatetime,:d,104)');
            ParamByName('id').AsInteger := client;
            ParamByName('d').AsString := Form1.rdt;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from sluj');
            SQL.Add('where regn = :id and sdate=convert(smalldatetime,:d,104)');
            ParamByName('id').AsInteger := client;
            ParamByName('d').AsString := Form1.rdt;
            ExecSQL;
            Close;
          end;
          DModule.Database1.Commit;
          Reload;
        except
          //�� ��������� ����������
          DModule.Database1.Rollback;
        end;
      end;
    end
    else
      ShowMessage('� ������� ������ ������� ������� ����!');
  end
  else
    ShowMessage('���� �����!');
end;

procedure TForm1.aClDelAllNullExecute(Sender: TObject);
var
  i: integer;
begin
  i := SGCl.Row - 1;
  with DModule.Query1 do
  begin
    if MessageBox(Form1.Handle, PChar('������� ��������� ������ � ������� �������? ' + SGCL.Cells[0, i + 1] + '.' + #13 + '�������������?'), PChar('����� �� ��������'),
      MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from hist where hist.regn = :r and bdate =:d');
      ParamByName('r').AsInteger  := client;
      ParamByName('d').AsDateTime := StrToDateTime(rdt);
      ExecSQL;
      Close;
    end;
  end;
end;

procedure TForm1.aRepUvedomExecute(Sender: TObject);
{*******************************************************************************
    ��������� ��������� �����������.
    ����� ������������� ����������� ������������ ������ ����� � ��� ����� � ��
  ����.
    ����������� �������� ������ � ������ ����� ��������. ���� ���� �����, �� ��
  ���� �������� ��������������� ���������.
*******************************************************************************}
var
  p1, p2: TDate;
  y, m, d, i, j, c: word;
  priv: TStringList;
  s1, s2, priv_str: string;
  pl: integer;
  cd: TDateTime;

procedure GetPPriv;
begin
  priv := TStringList.Create;
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select namepriv');
    SQL.Add('from priv inner join fam');
    SQL.Add('on priv.id_priv=fam.id_priv');
    SQL.Add('where (fam.regn=:id)');
    ParamByName('id').AsInteger := client;
    Open;
    while not EOF do
    begin
      priv.Add(FieldByName('namepriv').AsString);
      Next;
    end;
    Close;
  end;
  priv.Sort;
  i := 0;
  while i < priv.Count do
  begin
    c := 1;
    j := i + 1;
    while j < priv.Count do
    begin
      if priv[i] = priv[j] then
      begin
        priv.Delete(j);
        Inc(c);
      end
      else
        Inc(j);
    end;
    if i = 0 then
      priv_str := priv[i] + '(' + IntToStr(c) + ')'
    else
      priv_str := priv_str + priv[i] + '(' + IntToStr(c) + ')';
    Inc(i);
  end;
  frxReport1.Variables.Variables['ppriv'] := quotedstr(priv_str);
end;

procedure GetPlate;
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select id_service');
    SQL.Add('from sub');
    SQL.Add('where (regn=:id)and(service=7)and(sdate=convert(smalldatetime,:d,104))');
    ParamByName('id').AsInteger := client;
    ParamByName('d').AsString := s1;
    Open;
    pl := FieldByName('id_service').AsInteger;
    Close;
  end;
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select el.plate');
    SQL.Add('from "curel.dbf" el');
    SQL.Add('where el.id_el=:id');
    Parameters.ParamByName('id').Value := pl;
    Open;
    frxReport1.Variables.Variables['plate'] := quotedstr(FieldByName('plate').AsString);
    Close;
  end;
end;
procedure GetStnd;
var
  c: TClient;
  pm, ppm: Real;
  s1: string;
  i, mdd: integer;
  tmpfpm: array of variant;
  procc: TNumbTarifReal;
begin
  s1 := (Copy(SGCl.Cells[2, SGCl.row], 1, 10));
  c := TClient.Create(Empty, EmptyC);
  c.SetClient(client, s1);
  c.SetCalc(client, s1);
  c.Calc(getstatus(c.cdata.begindate, c.cdata.enddate));
  mdd := c.GetMdd;
  ppm := c.CalcFull(c.cdata.pm);
  pm  := c.CalcFull(c.cdata.fpm);

  if c.cdata.calc = 1 then
  begin
    with c do
    begin
      for i := 0 to numbtarif - 1 do
      begin
        procc[i] := cdata.pm[i] / ppm;
        cdata.fpm[i] := rnd(pm * procc[i]);
      end;
    end;
  end;

  if (pm <> 0) and (ppm <> 0) then
    frxReport1.Variables.Variables['lkoef'] := quotedstr(FlToStr(rnd(ppm / pm)))
  else
    frxReport1.Variables.Variables['lkoef'] := '';

  //������ ����������
  setlength(tmpfpm,length(c.cdata.fpm));
  for i := 0 to length(c.cdata.fpm)-1 do
    tmpfpm[i] := c.cdata.fpm[i];

  frxReport1.Script.Variables['fpm']:= VarArrayOf(tmpfpm);
  frxReport1.Variables.Variables['stnd'] := c.GetStandard;
  frxReport1.Variables.Variables['pmin'] := c.cdata.pmin;
  if rnd(c.cdata.koef) <= 1 then
    frxReport1.Variables.Variables['mdd'] := c.cdata.income * rnd(c.cdata.koef) * (mdd / 100)
  else
    frxReport1.Variables.Variables['mdd'] := c.cdata.income * (mdd / 100)
end;

begin
  if (Length(cl) > 0) then
  begin
    s1 := Copy(SGCl.Cells[2, SGCl.row], 1, 10); //begindate
    s2 := Copy(SGCl.Cells[2, SGCl.row], 14, 10);//enddate

    if subs <> 0.0 then
    begin
      frxReport1.LoadFromFile(PChar(reports_path + 'uvedom.fr3'));
      frxData.DataSet := DModule.Query2;
      frxData1.DataSet := DModule.Query1;

      DecodeDate(StrToDate(s2), y, m, d);
      p2 := EncodeDate(y, m, 15);
      m  := m - 1;
      if m = 0 then
      begin
        m := 12;
        y := y - 1;
      end;
      p1 := EncodeDate(y, m, 16);
      frxReport1.Variables.Variables['newatt'] := quotedstr('� ' + DateToStr(p1) + ' �� ' + DateToStr(p2));

      GetPPriv();
      GetPlate();
      GetStnd();

      with DModule.Query1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('execute getcl :id,:d');
        ParamByName('id').AsInteger := client;
        ParamByName('d').AsString := s1;
        Open;
      end;
      with DModule.Query2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('execute getsub :id, :s');
        ParamByName('id').AsInteger := client;
        ParamByName('s').AsString := s1;
        Open;
      end;
      i  := 0;
      cd := DModule.Query1.FieldByName('bdate').AsDateTime;
      while DModule.Query1.FieldByName('edate').AsDateTime <> cd do
      begin
        cd := IncMonth(cd);
        Inc(i);
      end;

      frxReport1.Variables.Variables['sumsub1'] := 0;
      DModule.Query2.First;
      for j := 0 to DModule.Query2.RecordCount - 1 do
      begin
        frxReport1.Variables.Variables['sumsub1'] := frxReport1.Variables.Variables['sumsub1'] + DModule.Query2.FieldValues['sub'];
        DModule.Query2.Next;
      end;

      ReportsFillDistInfo();

      frxReport1.Variables.Variables['cd']  := Quotedstr(rdt);
      frxReport1.Variables.Variables['sd']  := IncMonth(StrToDateTime(rdt));
      frxReport1.Variables.Variables['cm']  := i;
      frxReport1.Variables.Variables['fio'] := Quotedstr(GetFIOPadegFSAS(SGCl.Cells[0, SGCl.row], 3));
      frxReport1.Variables.Variables['fio_g'] := Quotedstr(GetFIOPadegFSAS(SGCl.Cells[0, SGCl.row], 2));
      frxReport1.Variables.Variables['fio_s'] := quotedstr(GetShortName(SGCl.Cells[0, SGCl.row]));
      frxReport1.PrepareReport;
      if MessageBox(Form1.Handle, PChar('����� ��������������� �������� ����������� ' + SGCL.Cells[0, SGCl.Row] + '?'),
        PChar('��������������� ��������'), MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
        frxReport1.ShowPreparedReport
      else
        frxReport1.Print;
    end
    //sub = 0 ������� �� ������
    else
    begin
      frxReport1.LoadFromFile(PChar(reports_path + 'uvedomo.fr3'));
      frxData.DataSet := DModule.Query2;
      frxData1.DataSet := DModule.Query1;

      frxReport1.Variables.Variables['fio']  := quotedstr(GetFIOPadegFSAS(SGCl.Cells[0, SGCl.row], 3));
      frxReport1.Variables.Variables['fio_n'] := quotedstr(SGCl.Cells[0, SGCl.row]);
      frxReport1.Variables.Variables['fio_g'] := quotedstr(GetFIOPadegFSAS(SGCl.Cells[0, SGCl.row], 2));
      frxReport1.Variables.Variables['fio_s'] := quotedstr(GetShortName(SGCl.Cells[0, SGCl.row]));
      frxReport1.Variables.Variables['address'] := quotedstr(SGCl.Cells[1, SGCl.row]);

      GetPPriv();
      GetPlate();
      GetStnd();

      with DModule.Query1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('execute getcl :id,:d');
        ParamByName('id').AsInteger := client;
        ParamByName('d').AsString := s1;
        Open;
      end;

      with DModule.Query2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('execute getsub :id, :s');
        ParamByName('id').AsInteger := client;
        ParamByName('s').AsString := s1;
        Open;
      end;

      ReportDataFrm := TReportDataFrm.Create(Application);
      ReportDataFrm.RepType := rUvedomo;
      ReportsFillAdditionData(DModule.Query1.FieldByName('nameinsp').AsString);
      ReportsFillDistInfo();

      frxReport1.PrepareReport;
      if MessageBox(Form1.Handle, PChar('����� ��������������� �������� ����������� ' + SGCL.Cells[0, SGCl.Row] + '?'),
        PChar('��������������� ��������'),
        MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
        frxReport1.ShowPreparedReport
      else
        frxReport1.Print;
    end;
  end
  else
    ShowMessage('����������� �������� ������ ��� ���������� ��������!');
end;

procedure TForm1.aRepKartaExecute(Sender: TObject);
{*******************************************************************************
    ��������� ��������� ������� �����.
    ����� ������������� ����������� ������������ ������ ����� � ��� ����� � ��
  ����.
    ������� ����� �������� ������ �� ��������� ������� ������ �������� ���
  ��������� �������.
*******************************************************************************}
var
  i, j, c: word;
  s1, s2, priv_str: string;
  priv: TStringList;
  pl: integer;

procedure GetStnd;
var
  c: TClient;
  s1: string;
begin
  s1 := (Copy(SGCl.Cells[2, SGCl.row], 1, 10));
  c := TClient.Create(Empty, EmptyC);
  c.SetClient(client, s1);
  c.SetCalc(client, s1);
  c.Calc(getstatus(c.cdata.begindate, c.cdata.enddate));

  frxReport1.Variables.Variables['stnd'] := c.GetStandard;
end;

begin
  if (Length(cl) > 0) then
  begin
    if (status < 3) then
    begin
      frxReport1.LoadFromFile(PChar(reports_path + 'karta.fr3'));
      frxData.DataSet := DModule.Query1;
      frxData1.DataSet := DModule.Query2;
      frxData2.DataSet := DModule.Query3;
      priv := TStringList.Create;

      GetStnd();

      s1 := Copy(SGCl.Cells[2, SGCl.row], 1, 10);//begindate
      s2 := Copy(SGCl.Cells[2, SGCl.row], 14, 10);//enddate
      //������ �����
      with DModule.Query1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select namepriv');
        SQL.Add('from priv inner join fam');
        SQL.Add('on priv.id_priv=fam.id_priv');
        SQL.Add('where (fam.regn=:id)');
        ParamByName('id').AsInteger := client;
        Open;
        while not EOF do
        begin
          priv.Add(FieldByName('namepriv').AsString);
          Next;
        end;
      end;
      priv.Sort;
      i := 0;
      while i < priv.Count do
      begin
        c := 1;
        j := i + 1;
        while j < priv.Count do
        begin
          if priv[i] = priv[j] then
          begin
            priv.Delete(j);
            Inc(c);
          end
          else
            Inc(j);
        end;
        if i = 0 then
          priv_str := priv[i] + '(' + IntToStr(c) + ')'
        // frVariables['priv'] := priv[i]+'('+IntToStr(c)+')'
        else
          priv_str := priv_str + priv[i] + '(' + IntToStr(c) + ')';
        //frVariables['priv'] := frVariables['priv'] + ',' +
        //                    priv[i]+'('+IntToStr(c)+')';
        Inc(i);
      end;
      frxReport1.Variables.Variables['priv'] := quotedstr(priv_str);

      //�����, ������� ����������������
      with DModule.Query1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_service');
        SQL.Add('from sub');
        SQL.Add('where (regn=:id)and(service=7)and(sdate=convert(smalldatetime,:d,104))');
        ParamByName('id').AsInteger := client;
        ParamByName('d').AsString := s1;
        Open;
        pl := FieldByName('id_service').AsInteger;
        Close;
      end;
      with DModule.qTarif do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select el.plate');
        SQL.Add('from "curel.dbf" el');
        SQL.Add('where el.id_el=:id');
        Parameters.ParamByName('id').Value := pl;
        Open;
        frxReport1.Variables.Variables['plate'] := quotedstr(FieldByName('plate').AsString);
        Close;
      end;
      with DModule.Query1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('execute getcl :id,:d');
        ParamByName('id').AsInteger := client;
        ParamByName('d').AsString := rdt;
      end;
      //�� �������, ���������� ��� ������������ ������ !!!!
      with DModule.Query2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('execute getsub :id, :s');
        ParamByName('id').AsInteger := client;
        ParamByName('s').AsString := s1;
      end;
      //�� �������, ���������� ��� ������������ ������!!!!!
      with DModule.Query3 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('execute getsub :id, :s');
        ParamByName('id').AsInteger := client;
        ParamByName('s').AsString := rdt;
      end;

      frxReport1.PrepareReport;
      if MessageBox(Form1.Handle, PChar('����� ��������������� �������� ������� ����� ' + SGCL.Cells[0, SGCl.Row] + '?'),
        PChar('��������������� ��������'),
        MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
        frxReport1.ShowPreparedReport
      else
        frxReport1.Print;//PreparedReportDlg;
    end
    else
      ShowMessage('������� ����� �������� ������ �� ��������� ������� ������ ������ ��������!');
  end
  else
    ShowMessage('���� �����!');
end;

procedure TForm1.aRepVedomostExecute(Sender: TObject);
{ ��������� �������� ������� � ������ ���� �� ������� ����� }
var
  f, ad, rd, mng: string;
  {  bdate,edate: string; }
  c: Tclient;
  status: integer;
begin
  c := TClient.Create(Empty, EmptyC);
  c.SetClient(Form1.client, Form1.rdt);
  c.SetCalc(Form1.client, Form1.rdt);

  status := getstatus(c.cdata.begindate, c.cdata.enddate);

  if status = 3 then
  begin
    rd := DateToStr(c.Data.regdate);
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select cl.rdate,mng.namemng');
      SQL.Add('from cl inner join hist on cl.regn=hist.regn');
      SQL.Add('inner join mng on hist.id_mng=mng.id_mng and hist.id_dist=mng.id_dist');
      SQL.Add('where (hist.id_dist=:idd)and(cl.regn=:id)');
      ParamByName('id').AsInteger  := client;
      ParamByName('idd').AsInteger := dist;
      Open;
      Last;
      mng := FieldByName('namemng').AsString;
    end;
  end
  else
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select cl.rdate,mng.namemng');
      SQL.Add('from cl inner join hist on cl.regn=hist.regn');
      SQL.Add('inner join mng on hist.id_mng=mng.id_mng and hist.id_dist=mng.id_dist');
      SQL.Add('where (hist.id_dist=:idd)and(cl.regn=:id)');
      SQL.Add('and((hist.bdate<=convert(smalldatetime,:cd,104))');
      SQL.Add('and(hist.edate>convert(smalldatetime,:cd,104))');
      SQL.Add('or(hist.bdate>=convert(smalldatetime,:cd,104))');
      SQL.Add('and(hist.bdate<=convert(smalldatetime,:cd,104)))');
      ParamByName('id').AsInteger := client;
      ParamByName('idd').AsInteger := dist;
      ParamByName('cd').AsString := rdt;
      Open;
      Last;
      rd  := FieldByName('rdate').AsString;
      mng := FieldByName('namemng').AsString;
      Close;
    end;
  end;
  f  := SGCl.Cells[0, SGCl.row];
  ad := SGCl.Cells[1, SGCl.row];
  PrintVedCr(f, ad, rd, mng);
end;

procedure TForm1.aRepPauseExecute(Sender: TObject);
var
  s1, s2, s3, s4: string;
  i: integer;
begin
  frxReport1.LoadFromFile(reports_path + 'solut.fr3');

  s1 := Copy(SGCl.Cells[2, SGCl.row], 1, 10); //begindate
  s2 := Copy(SGCl.Cells[2, SGCl.row], 14, 10);//enddate

  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('execute getcl :id,:d');
    ParamByName('id').AsInteger := client;
    ParamByName('d').AsString := s1;
    Open;
  end;

  frxReport1.Variables.Variables['cd']  := quotedstr(rdt);
  frxReport1.Variables.Variables['sd']  := (IncMonth(StrToDateTime(rdt)));
  frxReport1.Variables.Variables['regn'] := quotedstr('0' + IntToStr(client));
  frxReport1.Variables.Variables['fio'] := quotedstr(GetFIOPadegFSAS(SGCl.Cells[0, SGCl.row], 3));
  frxReport1.Variables.Variables['fio_g'] := quotedstr(GetFIOPadegFSAS(SGCl.Cells[0, SGCl.row], 2));

  s4 := GetFIOPadegFSAS(SGCl.Cells[0, SGCl.row], 3);
  i  := posex(' ', s4, 1);
  s3 := copy(s4, 0, i);
  s1 := copy(s4, i + 1, 1);
  i  := posex(' ', s4, i + 1);
  s2 := copy(s4, i + 1, 1);
  frxReport1.Variables.Variables['fio_r'] := quotedstr(s3 + ' ' + s1 + '. ' + s2 + '.');
  frxReport1.Variables.Variables['fio_n'] := quotedstr(SGCl.Cells[0, SGCl.row]);
  frxReport1.Variables.Variables['fio_s'] := quotedstr(GetShortName(SGCl.Cells[0, SGCl.row]));

  frxReport1.Variables.Variables['address'] := quotedstr(SGCl.Cells[1, SGCl.row]);
  frxReport1.Variables.Variables['sub'] := quotedstr(SGCl.Cells[4, SGCl.row]);
  frxReport1.Variables.Variables['boss'] := quotedstr(DModule.Query1.FieldByName('boss').AsString);
  frxReport1.Script.Variables['id_dist'] := (DModule.Query1.FieldByName('id_dist').AsInteger);

  ReportDataFrm := TReportDataFrm.Create(Application);
  ReportDataFrm.RepType := rSolut;
  ReportsFillAdditionData(DModule.Query1.FieldByName('nameinsp').AsString);
  ReportsFillDistInfo();

  frxReport1.PrepareReport;
  if MessageBox(Form1.Handle, PChar('����� ��������������� �������� ����������� ' + SGCL.Cells[0, SGCl.Row] + '?'),
    PChar('��������������� ��������'),
    MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
    frxReport1.ShowPreparedReport
  else
    frxReport1.Print;
end;

procedure TForm1.aRepPlayExecute(Sender: TObject);
var
  s1, s2: string;
begin
  frxReport1.LoadFromFile(reports_path + 'solutb.fr3');
  s1 := Copy(SGCl.Cells[2, SGCl.row], 1, 10); //begindate
  s2 := Copy(SGCl.Cells[2, SGCl.row], 14, 10);//enddate
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('execute getcl :id,:d');
    ParamByName('id').AsInteger := client;
    ParamByName('d').AsString := s1;
    Open;
  end;
  frxReport1.Variables.Variables['cd']  := quotedstr(rdt);
  frxReport1.Variables.Variables['sd']  := quotedstr(s2);
  frxReport1.Variables.Variables['regn'] := '0' + IntToStr(client);
  frxReport1.Variables.Variables['fio'] := quotedstr(GetFIOPadegFSAS(SGCl.Cells[0, SGCl.row], 3));
  frxReport1.Variables.Variables['fio_g'] := quotedstr(GetFIOPadegFSAS(SGCl.Cells[0, SGCl.row], 2));


  frxReport1.Variables.Variables['fio_n'] := quotedstr(SGCl.Cells[0, SGCl.row]);
  frxReport1.Variables.Variables['address'] := quotedstr(SGCl.Cells[1, SGCl.row]);
//  frxReport1.Variables.Variables['sub']  := quotedstr(SGCl.Cells[4, SGCl.row]);
  frxReport1.Variables.Variables['boss'] := quotedstr(DModule.Query1.FieldValues['boss']);
  frxReport1.Variables.Variables['id_dist'] := DModule.Query1.FieldByName('id_dist').AsInteger;

  ReportDataFrm := TReportDataFrm.Create(Application);
  ReportDataFrm.RepType := rSolutb;
  ReportsFillAdditionData(DModule.Query1.FieldValues['nameinsp']);
  frxReport1.Variables.Variables['spec'] := quotedstr(DModule.Query1.FieldByName('nameinsp').AsString);
  ReportsFillDistInfo();

  frxReport1.PrepareReport;
  if MessageBox(Form1.Handle, PChar('����� ��������������� �������� ����������� ' + SGCL.Cells[0, SGCl.Row] + '?'),
    PChar('��������������� ��������'),
    MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
    frxReport1.ShowPreparedReport
  else
    frxReport1.Print;
end;

procedure TForm1.aRepStopExecute(Sender: TObject);
var
  s1, s2, s3, s4: string;
  //  cd: TDateTime;
  i: integer;
begin
  frxReport1.LoadFromFile(reports_path + 'solute.fr3');

  s1 := Copy(SGCl.Cells[2, SGCl.row], 1, 10); //begindate
  s2 := Copy(SGCl.Cells[2, SGCl.row], 14, 10);//enddate

  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('execute getcl :id,:d');
    ParamByName('id').AsInteger := client;
    ParamByName('d').AsString := s1;
    Open;
  end;
  frxReport1.Variables.Variables['cd']  := quotedstr(rdt);
  frxReport1.Variables.Variables['sd']  := IncMonth(StrToDateTime(rdt));
  frxReport1.Variables.Variables['regn'] := quotedstr('0' + IntToStr(client));
  frxReport1.Variables.Variables['fio'] := quotedstr(GetFIOPadegFSAS(SGCl.Cells[0, SGCl.row], 3));
  frxReport1.Variables.Variables['fio_g'] := quotedstr(GetFIOPadegFSAS(SGCl.Cells[0, SGCl.row], 2));
  frxReport1.Variables.Variables['fio_n'] := quotedstr(SGCl.Cells[0, SGCl.row]);
  frxReport1.Variables.Variables['fio_s'] := quotedstr(GetShortName(SGCl.Cells[0, SGCl.row]));
  frxReport1.Variables.Variables['address'] := quotedstr(SGCl.Cells[1, SGCl.row]);
  frxReport1.Variables.Variables['sub'] := quotedstr(SGCl.Cells[4, SGCl.row]);
  frxReport1.Variables.Variables['boss'] := quotedstr(DModule.Query1.FieldValues['boss']);
  frxReport1.Variables.Variables['edate'] := quotedstr(DModule.Query1.FieldValues['edate']);

  s4 := GetFIOPadegFSAS(SGCl.Cells[0, SGCl.row], 3);
  i  := posex(' ', s4, 1);
  s3 := copy(s4, 0, i);
  s1 := copy(s4, i + 1, 1);
  i  := posex(' ', s4, i + 1);
  s2 := copy(s4, i + 1, 1);
  frxReport1.Variables.Variables['fio_r'] := quotedstr(s3 + ' ' + s1 + '. ' + s2 + '.');

  ReportDataFrm := TReportDataFrm.Create(Application);
  ReportDataFrm.RepType := rSolute;
  ReportsFillAdditionData(DModule.Query1.FieldValues['nameinsp']);
  ReportsFillDistInfo();

  frxReport1.PrepareReport;

  if MessageBox(Form1.Handle, PChar('����� ��������������� �������� ����������� ' + SGCL.Cells[0, SGCl.Row] + '?'),
    PChar('��������������� ��������'),
    MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
    frxReport1.ShowPreparedReport
  else
    frxReport1.Print;
end;

procedure TForm1.aRepNachExecute(Sender: TObject);
{ ����� � ���������� }
begin
  with DModule do
  begin
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('EXEC nachnew ' + quotedstr(rdt) + ',' + IntToStr(dist));
    Query1.Open;

    Query2.Close;
    Query2.SQL.Clear;
    Query2.SQL.Text := ('SELECT boss ' + #13 +
      'FROM Dist ' + #13 +
      'WHERE id_dist = ' + IntToStr(dist));
    Query2.Open;
  end;

  frxData.DataSource := DModule.DataSource1;
  frxReport1.LoadFromFile(PChar(reports_path + 'nach.fr3'));
  frxReport1.Script.Variables['id_dist'] := (dist);
  frxReport1.Variables.Variables['mont'] := quotedstr(LongMonthNames[StrToInt(FormatDateTime('m', StrToDate(rdt)))]);
  frxReport1.Variables.Variables['year'] := IntToStr(yearof(strtodate(rdt)));
  frxReport1.Variables.Variables['boss'] := quotedstr(DModule.Query2.FieldValues['boss']);

  frxReport1.PrepareReport;
  frxReport1.ShowPreparedReport;
end;

procedure TForm1.aRepRealizeExecute(Sender: TObject);
{
  ��������� ��������� ����� � ���������� �������� ��������.
  �������� ������� MSExcel ����������� ������.
}
var
  i, k, m, y, c: integer;
  nd, n, boss: string;
  g, s, sump1, sump2: array of integer;
  gen, sum: real;
  ExcelApp, Sheet, RangeE: OleVariant;
begin
  m := StrToInt(Copy(rdt, 4, 2));
  y := StrToInt(Copy(rdt, 9, 2));

  try
    ExcelApp:=CreateOleObject('Excel.Application');
    ExcelApp.Visible:=False;
    ExcelApp.WorkBooks.Open(Form1.reports_path + 'realize.xlt');
  except
    on E: Exception do
      raise Exception.Create('������ �������� ������� Excel: ' + E.Message);
  end;

  Sheet := ExcelApp.ActiveWorkBook.WorkSheets[1];
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select namedist, boss from dist');
    SQL.Add('where id_dist=:id');
    ParamByName('id').AsInteger := dist;
    Open;
    nd := FieldByName('namedist').AsString;
    boss := FieldByName('boss').AsString;
    Close;
    SQL.Clear;
    SQL.Add('select count(id_fond) as c from fond');
    Open;
    c := FieldByName('c').AsInteger;
    SetLength(sump1, c + 2);
    SetLength(sump2, c + 2);
    Close;
  end;
  Sheet.Range['a4', 'a4'] := nd + ' �����';
  RangeE := Sheet.Range['a5', 'a5'];
  case m of
    12: RangeE := String(RangeE) + '������� ' + IntToStr(y + 2000) + '�.';
    1: RangeE  := String(RangeE) + '������ ' + IntToStr(y + 2000) + '�.';
    2: RangeE  := String(RangeE) + '������� ' + IntToStr(y + 2000) + '�.';
    3: RangeE  := String(RangeE) + '���� ' + IntToStr(y + 2000) + '�.';
    4: RangeE  := String(RangeE) + '������ ' + IntToStr(y + 2000) + '�.';
    5: RangeE  := String(RangeE) + '��� ' + IntToStr(y + 2000) + '�.';
    6: RangeE  := String(RangeE) + '���� ' + IntToStr(y + 2000) + '�.';
    7: RangeE  := String(RangeE) + '���� ' + IntToStr(y + 2000) + '�.';
    8: RangeE  := String(RangeE) + '������ ' + IntToStr(y + 2000) + '�.';
    9: RangeE  := String(RangeE) + '�������� ' + IntToStr(y + 2000) + '�.';
    10: RangeE := String(RangeE) + '������� ' + IntToStr(y + 2000) + '�.';
    11: RangeE := String(RangeE) + '������ ' + IntToStr(y + 2000) + '�.';
  end;
  //������
  k := 1;
  SetLength(g, 3);
  SetLength(s, 3);
  sum := 0;
  gen := 0;
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('execute realize :s, :d');
    ParamByName('s').AsString  := rdt;
    ParamByName('d').AsInteger := dist;
    Open;
    while not EOF do
    begin
      n := IntToStr(7 + k);
      if FieldByName('namefond').AsString = String(Sheet.Range['a' + n, 'a' + n]) then
      begin
        Sheet.Range['c' + n, 'c' + n] := FieldByName('num').AsInteger;
        Sheet.Range['d' + n, 'd' + n] := IntToStr(FieldByName('numn').AsInteger) + '(' +
          IntToStr(FieldByName('numo').AsInteger) + ')';
        Sheet.Range['e' + n, 'e' + n] := FlToStr(FieldByName('sums').AsFloat -
          FieldByName('sumsl').AsFloat);
        g[0] := g[0] + FieldByName('num').AsInteger;
        g[1] := g[1] + FieldByName('numn').AsInteger;
        g[2] := g[2] + FieldByName('numo').AsInteger;
        gen  := gen + Rnd(FieldByName('sums').AsFloat - FieldByName('sumsl').AsFloat);
        if (FieldByName('namefond').AsString = '���') and (k = 1) or
          (FieldByName('namefond').AsString = '�������������') and (k = 3) then
        begin
          s[0] := s[0] + FieldByName('num').AsInteger;
          s[1] := s[1] + FieldByName('numn').AsInteger;
          s[2] := s[2] + FieldByName('numo').AsInteger;
          sum  := sum + Rnd(FieldByName('sums').AsFloat - FieldByName('sumsl').AsFloat);
        end;
        Next;
      end
      else
      begin
        Sheet.Range['c' + n, 'c' + n] := 0;
        Sheet.Range['d' + n, 'd' + n] := '0(0)';
        Sheet.Range['e' + n, 'e' + n] := 0;
      end;
      Inc(k);
    end;
    Close;
  end;
  n := IntToStr(7 + c + 1);
  //���+�������������
  Sheet.Range['c' + n, 'c' + n] := s[0];
  Sheet.Range['d' + n, 'd' + n] := IntToStr(s[1]) + '(' + IntToStr(s[2]) + ')';
  Sheet.Range['e' + n, 'e' + n] := FlToStr(sum);
  //�����
  Sheet.Range['c7', 'c7'] := g[0];
  Sheet.Range['d7', 'd7'] := IntToStr(g[1]) + '(' + IntToStr(g[2]) + ')';
  Sheet.Range['e7', 'e7'] := FlToStr(gen);
  if (k < c + 1) then
  begin
    for i := k to c do
    begin
      n := IntToStr(7 + i);
      Sheet.Range['c' + n, 'c' + n] := 0;
      Sheet.Range['d' + n, 'd' + n] := '0(0)';
      Sheet.Range['e' + n, 'e' + n] := 0;
    end;
  end;
  k := c + 8;
  n := IntToStr(7 + k);
  Sheet.Range['e' + n, 'e' + n] := boss;
  ExcelApp.Visible := True;
end;

procedure TForm1.aSQLQueryExecute(Sender: TObject);
{ ����� ����� SQL-������� }
begin
  Form34.ShowModal;
end;

procedure TForm1.aRepFactExecute(Sender: TObject);
var
  y1: string;
begin
  with DModule do
  begin
    Query1.Close;
    Query1.SQL.Text := 'EXEC getclfactsum ' + quotedstr(rdt) + ', ' + IntToStr(dist);
    Query1.Open;

    Query2.Close;
    Query2.SQL.Clear;
    Query2.SQL.Text := ('SELECT boss ' + #13 +
      'FROM Dist ' + #13 +
      'WHERE id_dist = ' + IntToStr(dist));
    Query2.Open;
  end;

  frxData.DataSource := DModule.DataSource1;
  frxReport1.LoadFromFile(PChar(reports_path + 'factsale.fr3'));

  y1 := IntToStr(YearOf(StrToDate(rdt)));

  frxReport1.Variables.Variables['month'] := quotedstr(LongMonthNames[StrToInt(FormatDateTime('m', StrToDate(rdt)))]);//quotedstr(ReturnMountStr);
  frxReport1.Variables.Variables['year']  := quotedstr(y1);
  frxReport1.Script.Variables['id_dist']  := (dist);
  frxReport1.Variables.Variables['boss']  := quotedstr(DModule.Query2.FieldValues['boss']);

  frxReport1.PrepareReport;
  frxReport1.ShowPreparedReport;
end;

procedure TForm1.aSlujSumTarifExecute(Sender: TObject);
{ ������ ��������� �� ������� ������ }
begin
  SlujFrm.mode := mDetail;
  SlujFrm.FillSlujGrid;
  if DModule.Query1.RecordCount > 0 then
    SlujFrm.ShowModal;
end;

procedure TForm1.aSlujSumAllExecute(Sender: TObject);
{ ������ ���������, ����� ����� �� ����� �� ������� }
begin
  SlujFrm.mode := mSum;
  SlujFrm.FillSlujGrid;
  if DModule.Query1.RecordCount > 0 then
    SlujFrm.ShowModal;
end;

procedure TForm1.aSvodNachExecute(Sender: TObject);
{
  ������ ���������� �������� �� ������� �����. �����, ������� ���������� � �����
  ������� ����������.
}
var
  y1: string;
begin
  DModule.Query1.SQL.Clear;
  DModule.Query1.SQL.Add('EXEC svodsub ' + quotedstr(rdt));
  DModule.Query1.Open;

  frxData.DataSource := DModule.DataSource1;
  frxReport1.LoadFromFile(PChar(reports_path + 'svodsub.fr3'));

  y1 := IntToStr(YearOf(StrToDate(rdt)));

  frxReport1.Variables.Variables['month'] := quotedstr(LongMonthNames[StrToInt(FormatDateTime('m', StrToDate(rdt)))]);//quotedstr(ReturnMountStr);
  frxReport1.Variables.Variables['year']  := quotedstr(y1);

  frxReport1.PrepareReport;
  frxReport1.ShowPreparedReport;
end;

procedure TForm1.aStatMinMddExecute(Sender: TObject);
{*******************************************************************************
  ��������� ��������� ����� � ������ ���������� ����� � ������� ��������� �
  ������ ��������� �������� ������������ �������� � ��� ��� ��������� ���������� �����.
*******************************************************************************}
begin
  Form40.ShowModal;
end;

procedure TForm1.aStatAgeExecute(Sender: TObject);
{*******************************************************************************
  ��������� ��������� ����� �����, ������� ������� ���������� � �������� ���������
  ������� � ������ ������.
*******************************************************************************}
begin
  Form22.ShowModal;
end;

procedure TForm1.aStatPrivExecute(Sender: TObject);
begin
  Stats := TStats.Create(Form1);
  Stats.ShowModal;
  Stats.Free;
end;

procedure TForm1.aEditClCertExecute(Sender: TObject);
{*******************************************************************************
    ��������� �������� ������, ����������� ����� ���������� � ��������, ����
    ������� ����� �� �������� �� ������������� ��� �� ����������� ����������.
*******************************************************************************}
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('execute chatt :idd,:d');
    ParamByName('idd').AsInteger := dist;
    ParamByName('d').AsString := rdt;
    ExecSQL;
  end;
end;

procedure TForm1.aEditTrafClExecute(Sender: TObject);
{  ����� ����� ��������� ������, �������������, ��������� � �������� }
begin
  Form29.status := sec1;
  Form29.ShowModal;
end;

procedure TForm1.aSetActiveAllInspExecute(Sender: TObject);
{*******************************************************************************
  ��������� ������ ��������� ���� ����������� �������� ������
*******************************************************************************}
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update insp');
    SQL.Add('set status=1');
    SQL.Add('where id_dist=:idd');
    ParamByName('idd').AsInteger := dist;
    ExecSQL;
    Close;
  end;
end;

procedure TForm1.aSetActiveAllStrtExecute(Sender: TObject);
{*******************************************************************************
  ��������� ������ ��������� ��� �����.
*******************************************************************************}
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update strt');
    SQL.Add('set status=1');
    ExecSQL;
    Close;
  end;
end;

procedure TForm1.aSetActiveUseStrtExecute(Sender: TObject);
{*******************************************************************************
  ��������� ������ ��������� ������������ �����
*******************************************************************************}
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update strt');
    SQL.Add('set status=0');
    SQL.Add('where id_street not in');
    SQL.Add('(select distinct(id_street)');
    SQL.Add('from cl where id_dist=:idd)');
    ParamByName('idd').AsInteger := dist;
    ExecSQL;
    Close;
    SQL.Clear;
    SQL.Add('update strt');
    SQL.Add('set status=1');
    SQL.Add('where id_street in');
    SQL.Add('(select distinct(id_street)');
    SQL.Add('from cl where id_dist=:idd)');
    ParamByName('idd').AsInteger := dist;
    ExecSQL;
    Close;
  end;
end;

procedure TForm1.aShowLegendExecute(Sender: TObject);
begin
  if GroupBox1.Visible = True then
    GroupBox1.Visible := False
  else
    GroupBox1.Visible := True;
  GridPanel1.Realign;
end;

procedure TForm1.aRepEditorExecute(Sender: TObject);
begin
  ReportEditFrm := TReportEditFrm.Create(Application);
  ReportEditFrm.ShowModal;
  ReportEditFrm.Free;
end;

function TForm1.ASub: real;
{*******************************************************************************
    ������� ASub ���������� ����� �������� �������� �������� � ���������������
  ������ ��������. ���� ������ �� ������, �� ��� ���������� ����� �������� ��������
  �������� � ����.
*******************************************************************************}
var
  i: integer;
begin
  Result := 0;
  for i := 0 to Length(cl) - 1 do
  begin
    if st[i] < 3 then
      Result := Result + sub[i];
   end;
end;

procedure TForm1.aUpdateExecute(Sender: TObject);
begin
  winExec('sUpdater.exe', SW_NORMAL);
end;

function TForm1.GetStatus(b, e: TDate): integer;
{*******************************************************************************
    ������� GetStatus ���������� ���������� � ������� �������(������ �����,��������,
  ��������� �����,����������), ������� ���������� � 0.
    ���� ������(b) � ���������(e) ����� �������� ������������� 1 ��� ������,
  �������� ������ ����� ���������� � 1 ��� ������.
    ������ ������� - ��������, ���� ������� �������� ������ "���������" ������
  ����� �������� � "�������" �� ��� ������ ��� ������� �� �����.
    ������ ������� - ����������, ���� ������� �������� ������ "���������" ��
  ��������� ����� ��������.
    ������ ������� - ��������� �����, ���� ������� �������� ������ "���������" �
  ��������� ������ ����� ��������. ���������� ������������ 1 �����.
*******************************************************************************}
var
  td: TDate;
begin
  td := StrToDate(rdt);
  if (IncMonth(b) <= tD) and (tD < IncMonth(e, -1)) then//��������
    Result := 1
  else
  begin
    if (tD < b) or (tD >= e) then //�� ��������
      Result := 3
    else
    begin
      if (IncMonth(e, -1) <= tD) and (tD < e) then//��������� �����
        Result := 2
      else //if (b<=tD)and(tD<IncMonth(b)) then//1 �����
        Result := 0;
    end;
  end;
end;

function TForm1.GenAddr(s, n, c, a: string): string;
{*******************************************************************************
    ������� GenAddr ���������� ������, ���������� �������.
    ����� ������������ �� ������� ������. ���� ������ ������������, �� ��
  ����������� � �����, ���� ����� �������� ������, �� �� ����� ����������� �
  �����.
*******************************************************************************}
begin
  Result := s + ',�.' + n;
  if c <> '' then
    Result := Result + '/' + c;
  if a <> '' then
    Result := Result + ',��.' + a;
end;

function TForm1.GenPer(b, e: TDate): string;
{*******************************************************************************
    ������� GenPer ���������� ������ �� ������ ��������.
    ���� �������� ����������� �� ������� ������ ������ � ��������� ����� ��������.
*******************************************************************************}
begin
  Result := DateToStr(b) + ' - ' + DateToStr(e);
end;

function TForm1.GenCalc(c: integer): string;
{*******************************************************************************
    ������� GenCalc ���������� ������ � ����� �������.
    � ����������� �� �������� ��������� � ����� ���������� ��������, ����������
  ������� ��� �������������� ������.
*******************************************************************************}
begin
  if c = 0 then
    Result := ''
  else
    Result := '�����.';
end;

procedure TForm1.aOpenMountExecute(Sender: TObject);
{*******************************************************************************
    ��������� N2Click ��������� ����� ������ ��������� �������.
    ���� ������ �������� �� �������� �������� ������, �� ������ �� ������� �����
  �������������. ������� ������� ����������� ������� �� ���� ������. ��������
  �������� ������� ����� - � ��� ���������� ������� �������� ������.
*******************************************************************************}
var
  old: string;
begin
  //����� � ������� �������
  old := rdt;
  Form26.ShowModal;
  if old <> rdt then
  begin
    if CheckP2 then
      sec1 := 1
    else
      sec1 := 0;
    FillCurr(Form1.bpath, rdt, Form1.dist, Form1.codedbf);
    LastTime := Time;
    Reload;

    form1.Caption := '���� �������������� �������� �� ������ ��� ��������� �.����� �� ' +
      LongMonthNames[StrToInt(FormatDateTime('m', StrToDate(rdt)))] + ' ' +
      IntToStr(YearOf(StrToDate(rdt))) + '�.' + ' [' + Revision + ']' + ' - ' + curServer;
  end;
end;

procedure TForm1.aReloadExecute(Sender: TObject);
{*******************************************************************************
  ��������� ��������� ������ �� ������� �����.
*******************************************************************************}
begin
  Reload;
end;

procedure TForm1.aBackupExecute(Sender: TObject);
{ ��������� ���� ������ �� ������� ����}
var
  ext1, ext2, Name, path, dt: string;
  d, i: integer;
  SevenZip: TSevenZip;
begin
  path := ExtractFilePath(Application.ExeName) + 'arc\';
  if not DirectoryExists(path) then
    ForceDirectories(path);

  ext1 := '.dbf';
  ext2 := IntToStr(dist) + ext1;

  d := DayOf(Date);
  SetPer2(rdt, dt);
  if d < 10 then
    Name := dt + '0' + IntToStr(d)
  else
    Name := dt + IntToStr(d);

  try
    if FileExists(path + Name + '.7z') then
      DeleteFile(PAnsiChar(path + Name + '.7z'));
    SevenZip := TSevenZip.Create(Application);
    SevenZip.SZFileName := path + Name + '.7z';
    with SevenZip do
    begin
      AddOptions := [AddStoreOnlyFilename];
      VolumeSize := 0;
      LZMACompressType := LZMA;
      LZMACompressStrength := MAXIMUM;
      Files.Clear;
    end;

  //�������� ����� � �����
  ExportDiff(path, 'bank');
  SevenZip.Files.AddString(path + 'bank' + ext1);
  ExportDiff(path, 'dist');
  SevenZip.Files.AddString(path + 'dist' + ext1);
  ExportDiff(path, 'fond');
  SevenZip.Files.AddString(path + 'fond' + ext1);
  ExportDiff(path, 'stat');
  SevenZip.Files.AddString(path + 'stat' + ext1);
  ExportDiff(path, 'norm');
  SevenZip.Files.AddString(path + 'norm' + ext1);
  ExportDiff(path, 'priv');
  SevenZip.Files.AddString(path + 'priv' + ext1);
  ExportStr(path);
  SevenZip.Files.AddString(path + 'strt' + ext1);
  ExportHouse(path, dist);
  SevenZip.Files.AddString(path + 'house' + ext2);
  ExportMng(path, dist);
  SevenZip.Files.AddString(path + 'mng' + ext2);
  ExportInsp(path, dist, True);
  SevenZip.Files.AddString(path + 'insp' + ext2);
  ExportDiff(path, 'cert');
  SevenZip.Files.AddString(path + 'cert' + ext1);
  ExportDiff(path, 'own');
  SevenZip.Files.AddString(path + 'own' + ext1);
  ExportDiff(path, 'settl');
  SevenZip.Files.AddString(path + 'settl' + ext1);
  ExportDiff(path, 'cntrl');
  SevenZip.Files.AddString(path + 'cntrl' + ext1);
  ExportDiff(path, 'rel');
  SevenZip.Files.AddString(path + 'rel' + ext1);
  ExportDiff(path, 'charge');
  SevenZip.Files.AddString(path + 'charge' + ext1);
  ExportCl(path, rdt, dist);
  SevenZip.Files.AddString(path + 'cl' + ext2);
  ExportHist(path, rdt, dist);
  SevenZip.Files.AddString(path + 'hist' + ext2);
  ExportFam(path, rdt, dist);
  SevenZip.Files.AddString(path + 'fam' + ext2);
  ExportSluj(path, rdt, dist);
  SevenZip.Files.AddString(path + 'sluj' + ext2);
  ExportFact(path, dist);
  SevenZip.Files.AddString(path + 'factsale' + ext2);
  SevenZip.Files.AddString(path + 'factbalance' + ext2);
  ExportSub(path, rdt, dist);
  SevenZip.Files.AddString(path + 'sub' + ext2);
  ExportCounters(path, rdt, dist);
  SevenZip.Files.AddString(path + 'counters' + ext2);
  ExportMin(path, rdt);
  SevenZip.Files.AddString(path + 'lmin' + ext1);
  ExportRStnd(path, rdt);
  SevenZip.Files.AddString(path + 'rstnd' + ext1);
  ExportTarif(path, rdt, 'cont', dist);
  SevenZip.Files.AddString(path + 'cont' + ext2);
  ExportTarif(path, rdt, 'rep', dist);
  SevenZip.Files.AddString(path + 'rep' + ext2);
  ExportTarif(path, rdt, 'cold', dist);
  SevenZip.Files.AddString(path + 'cold' + ext2);
  ExportTarif(path, rdt, 'hot', dist);
  SevenZip.Files.AddString(path + 'hot' + ext2);
  ExportTarif(path, rdt, 'canal', dist);
  SevenZip.Files.AddString(path + 'canal' + ext2);
  ExportTarif(path, rdt, 'heat', dist);
  SevenZip.Files.AddString(path + 'heat' + ext2);
  ExportTarif(path, rdt, 'gas', dist);
  SevenZip.Files.AddString(path + 'gas' + ext2);
  ExportTarif(path, rdt, 'el', dist);
  SevenZip.Files.AddString(path + 'el' + ext2);
  ExportTarif(path, rdt, 'wood', dist);
  SevenZip.Files.AddString(path + 'wood' + ext2);
  ExportTarif(path, rdt, 'coal', dist);
  SevenZip.Files.AddString(path + 'coal' + ext2);
  SevenZip.Add;
  finally
    for i := 0 to SevenZip.Files.Count - 1 do
      DeleteFile(SevenZip.Files.WStrings[i]);
    Sleep(1000);
    SevenZip.Free;
  end;
end;

procedure TForm1.aExportForCentrExecute(Sender: TObject);
{ ��������� ���� ��� ������ }
var
  ext1, ext2, Name, path, dt: string;
  SevenZip: TSevenZip;
  i: integer;
begin
  path := ExtractFilePath(Application.ExeName) + 'arc\';
  if not DirectoryExists(path) then
    ForceDirectories(path);

  ext1 := '.dbf';
  ext2 := IntToStr(dist) + ext1;

  Name := '4center' + IntToStr(dist);
  SetPer2(rdt, dt);
  dt  := '01.' + Copy(dt, 3, 2) + '.20' + Copy(dt, 1, 2);

  try
    if FileExists(path + Name + '.7z') then
      DeleteFile(PAnsiChar(path + Name + '.7z'));
    SevenZip := TSevenZip.Create(Application);
    SevenZip.SZFileName := path + Name + '.7z';
    with SevenZip do
    begin
      AddOptions := [AddStoreOnlyFilename];
      VolumeSize := 0;
      LZMACompressType := LZMA;
      LZMACompressStrength := MAXIMUM;
      Files.Clear;
    end;

    //�������� ����� � �����
    ExportDiff(path, 'priv');
    SevenZip.Files.AddString(path + 'priv' + ext1);
    ExportHouse(path, dist);
    SevenZip.Files.AddString(path + 'house' + ext2);
    ExportMng(path, dist);
    SevenZip.Files.AddString(path + 'mng' + ext2);
    ExportInsp(path, dist, False);
    SevenZip.Files.AddString(path + 'insp' + ext2);
    ExportCl(path, dt, dist);
    SevenZip.Files.AddString(path + 'cl' + ext2);
    ExportHist(path, dt, dist);
    SevenZip.Files.AddString(path + 'hist' + ext2);
    ExportFam(path, dt, dist);
    SevenZip.Files.AddString(path + 'fam' + ext2);
    ExportSluj(path, dt, dist);
    SevenZip.Files.AddString(path + 'sluj' + ext2);
    ExportFact(path, dist);
    SevenZip.Files.AddString(path + 'factsale' + ext2);
    SevenZip.Files.AddString(path + 'factbalance' + ext2);
    ExportSub(path, dt, dist);
    SevenZip.Files.AddString(path + 'sub' + ext2);
    ExportCounters(path, rdt, dist);
    SevenZip.Files.AddString(path + 'counters' + ext2);
    ExportTarif(path, dt, 'cont', dist);
    SevenZip.Files.AddString(path + 'cont' + ext2);
    ExportTarif(path, dt, 'rep', dist);
    SevenZip.Files.AddString(path + 'rep' + ext2);
    ExportTarif(path, dt, 'cold', dist);
    SevenZip.Files.AddString(path + 'cold' + ext2);
    ExportTarif(path, dt, 'hot', dist);
    SevenZip.Files.AddString(path + 'hot' + ext2);
    ExportTarif(path, dt, 'canal', dist);
    SevenZip.Files.AddString(path + 'canal' + ext2);
    ExportTarif(path, dt, 'heat', dist);
    SevenZip.Files.AddString(path + 'heat' + ext2);
    ExportTarif(path, dt, 'gas', dist);
    SevenZip.Files.AddString(path + 'gas' + ext2);
    ExportTarif(path, dt, 'el', dist);
    SevenZip.Files.AddString(path + 'el' + ext2);
    ExportTarif(path, dt, 'wood', dist);
    SevenZip.Files.AddString(path + 'wood' + ext2);
    ExportTarif(path, dt, 'coal', dist);
    SevenZip.Files.AddString(path + 'coal' + ext2);
    SevenZip.Add;
  finally
    for i := 0 to SevenZip.Files.Count - 1 do
      DeleteFile(SevenZip.Files.WStrings[i]);
    SevenZip.Free;
  end;
end;

procedure TForm1.aCurHistExecute(Sender: TObject);
{
  ��������� �������� ������� ������� ��������, � ������� ����� �����������
  ���������� � �������� ����������� �������, � ����� ������������� ������.
  ���� �������� �������� ��� ��� ���� �����, �� �������� ��������������� ���������.
}
begin
  if (Length(cl) > 0) then
  begin
    if (Length(cl) > 1) or (Length(cl) = 1) and (status < 3) then
    begin
      Form18.status := sec1;
      Form18.ShowModal;
      Edit4.Text := FlToStr(SetSumSub);
      if Form18.changes then
        Form1.Reload;
    end
    else
      ShowMessage('��� �������� ��������!');
  end
  else
    ShowMessage('���� �����!');
end;

procedure TForm1.aFilterExecute(Sender: TObject);
{
  ����� ����� ������ �������. ���� ������ �� ����, �� ����� �������� ��������
  ��������� �������.
}
begin
  Form33.ShowModal;
  if qr.SQL <> '' then
    Load(qr, Form33.rsel);
end;

procedure TForm1.aFormSubsidyExecute(Sender: TObject);
{
  ������������ �������� �� ������� �����.
  ����� �������� ����������� ������������� �� ������������� ������ �����������(CheckP1).
  ����� �������� ��������� ��� ������ � ��������� ��������, ����� ��� ������� ��������
  �������� ������ ����� � ���, ������� �������� �������������. ����� ����������� ����
  �� ��������� � �������� ������������ �������, ����������, ��������� � ���� ������.
  ���� ���, �� ���������� ����������� ���������� � ��������� �������� �� ��������
  ������. ���� ��, �� ���������� ���������� ���� ��������.
}
var
  odt: string;
  pr:  TAboutBox1;
begin
  if (Length(cl) <> 0) then
  begin
    odt := DateToStr(IncMonth(StrToDate(rdt), -1));
    if CheckP1 then
    begin//������ �� ������� �����
      pr := TAboutBox1.Create(Application);
      pr.Label1.Caption := '������������ �������� �� ������� �����';
      pr.Label2.Caption := '�����...';
      pr.Label3.Caption := '';
      pr.Show;
      pr.Update;
      SendMessage(pr.Handle, wm_paint, 0, 0);
      try
        DModule.Database1.StartTransaction;
        with DModule.Query1 do
        begin
          //������ ������ ��������
          Close;
          SQL.Clear;
          SQL.Add('execute formnewpm :od,:nd,:idd');
          ParamByName('idd').AsInteger := dist;
          ParamByName('od').AsString := odt;
          ParamByName('nd').AsString := rdt;
          ExecSQL;
          Close;
        end;
        DModule.Database1.Commit;
      except
        DModule.Database1.Rollback;
      end;
      pr.Close;
      pr.Release;
      Reload;
    end;
  end
  else
    ShowMessage('������� �����������!');
end;

procedure TForm1.aImportExecute(Sender: TObject);
{*******************************************************************************
  ��������� N8Click �������� ����� ������� � ��������� ������.
*******************************************************************************}
begin
  Form35.status := mImport;//������
  Form35.ShowModal;
end;

procedure TForm1.aMergeExecute(Sender: TObject);
{
  ����� ����� ������ ������� ����� �������� � ������� ��� ����� ������� � �������.
}
begin
  Form21.ShowModal;
end;

procedure TForm1.AddCl(id: integer);
{*******************************************************************************
    ��������� AddCl ��������� �������� ������� � sgcl.
    ���������� em � ey - ���������� ���������.
    � ������� ������� ������ ����������� ��� ����������� �� �����. �����������
  �����, �� ������� ����� �������� �������. ���������������, ��� ��� ���������
  �������� ������������� �����.
    � ����� � ����������� ������� �� ����� ���������� �������� ���������� ����� �
  ������� ������.
*******************************************************************************}
var
  f, addr, per, clc: string;
  pl, stp: integer;
begin
  ey := StrToInt(Copy(rdt, 7, 4));
  em := StrToInt(Copy(rdt, 4, 2));
  with DModule.Query1 do
  begin
    Close;
    SetLength(cl, Length(cl) + 1);
    SetLength(st, Length(st) + 1);
    SetLength(sub, Length(sub) + 1);
    SetLength(stop, Length(stop) + 1);
    Close;
    SQL.Clear;
    SQL.Add('execute getinfocl :id,:d');
    ParamByName('id').AsInteger := id;
    ParamByName('d').AsString := Form1.rdt;
    Open;
    client := id;
    f := FieldByName('fio').AsString;
    addr := GenAddr(FieldByName('namestreet').AsString, FieldByName('nhouse').AsString,
      FieldByName('corp').AsString, FieldByName('apart').AsString);
    per := GenPer(FieldByName('bdate').AsDateTime, FieldByName('edate').AsDateTime);
    clc := GenCalc(FieldByName('calc').AsInteger);
    status := GetStatus(FieldByName('bdate').AsDateTime, FieldByName('edate').AsDateTime);
    stp := FieldByName('stop').AsInteger;
    subs := FieldByName('summa').AsFloat;
    Close;
  end;
  sub[Length(sub) - 1] := subs;
  cl[Length(cl) - 1] := id;
  st[Length(st) - 1] := status;
  stop[Length(stop) - 1] := stp;
  pl := NewPlace(Length(cl) - 1, f, addr);
  if Length(cl) > 1 then
    SGCl.RowCount := SGCl.RowCount + 1;
  SGCl.Cells[0, pl] := f;
  SGCl.Cells[1, pl] := addr;
  SGCl.Cells[2, pl] := per;
  SGCl.Cells[3, pl] := clc;
  SGCl.Cells[4, pl] := FlToStr(sub[pl - 1]);
  SGCl.Row := pl;
  SGCl.Repaint;
  Inc(ccl);
  if status < 3 then
    Inc(acl);
  Statusbar1.Panels[0].Text := '������: ' + SGCl.Cells[0, SGCl.row] + '/' + FlToStr(subs);
  Edit1.Text := IntToStr(ccl);
  Edit2.Text := IntToStr(Acl);
  Edit3.Text := IntToStr(StrToInt(Edit3.Text) + 1);
  Edit4.Text := FlToStr(StrToFloat(Edit4.Text) + subs);
end;

procedure TForm1.aExitExecute(Sender: TObject);
{*******************************************************************************
  ��������� ��������� �������� ���������
*******************************************************************************}
begin
  Close;
end;

procedure TForm1.aExportDBFExecute(Sender: TObject);
{ ����� ����� � dbf }
var
  dt, outdir: string;
begin
  outdir := 'out\';
  if not DirectoryExists(outdir) then
    CreateDir(outdir);
  try
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('execute gendbf :idd,:d');
      ParamByName('idd').AsInteger := dist;
      ParamByName('d').AsString := rdt;
      Open;
      if not IsEmpty then
      begin
        dt := Copy(rdt, 9, 2) + Copy(rdt, 4, 2);
        FillTable(ExtractFilePath(Application.ExeName) + outdir, dt + '_r0' + IntToStr(dist), codedbf);
        ShowMessage('����� � dbf ��������!');
      end
      else
        ShowMessage('����� � dbf ����������: ��������� ������� �������!');
    end;
  except
    ShowMessage('������ ��� ������ � dbf!');
  end;
end;

procedure TForm1.aExportExecute(Sender: TObject);
{*******************************************************************************
  ��������� N7Click �������� ����� �������� �� ��������� ������.
*******************************************************************************}
begin
  Form35.status := mExport;//�������
  Form35.ShowModal;
end;

procedure TForm1.aOpenExcelExecute(Sender: TObject);
{ �������� ������� MSExcel ����������� ������ � ����������� MSExcel }
begin
  ExportGridToExcel(SGCL, Form1.reports_path + 'filter.xlt');
end;

procedure TForm1.aRecalcSubsidyExecute(Sender: TObject);
{*******************************************************************************
  ��������� ��������� ���������� �������� ��� ����������� � ������� ������, �����
  �������� ��� ��������, ������� ������ �������������� ������.
  ������������ � �������, ����� ���������� ������, ���������, �������� ��� ���.
*******************************************************************************}
var
  c:  TClient;
  i, j, cnt: integer;
  pr: TAboutBox1;
  t, st: array of integer;
begin
  if (Length(cl) <> 0) then
  begin
    if CheckP1 then
    begin//������ �� ������� �����
      pr := TAboutBox1.Create(Application);
      pr.Label1.Caption := '���������� �������� �� ������� �����';
      pr.Label2.Caption := '���������� �������:';
      pr.Label3.Caption := '';
      pr.Show;
      pr.Update;
      SendMessage(pr.Handle, wm_paint, 0, 0);
      pr.ProgressBar1.Step := 1;

      cnt := 0;
      try
        DModule.Database1.StartTransaction;
        with DModule.Query1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('execute maxsdate :idd');
          ParamByName('idd').AsInteger := dist;
          Open;
          {if DateToStr(FieldByName('mdt').AsDateTime)>=rdt then}
          begin
            Close;
            SQL.Clear;
            SQL.Add('execute getncl :idd,:nd');
            ParamByName('idd').AsInteger := dist;
            ParamByName('nd').AsString := rdt;
            Open;
            if not EOF then
            begin
              pr.ProgressBar1.Max := RecordCount;
              SetLength(t, RecordCount);
              SetLength(st, RecordCount);
              for i := 0 to Length(t) - 1 do
              begin
                t[i]  := FieldByName('regn').AsInteger;
                st[i] := FieldByName('st').AsInteger;
                Next;
              end;
              Close;
              for j := 0 to Length(t) - 1 do
              begin
                Application.ProcessMessages();
                curregn := t[j];
                c := TClient.Create(Empty, EmptyC);
                c.SetClient(curregn, Form1.rdt);
                c.SetCalc(curregn, Form1.rdt);
                c.Calc(getstatus(c.cdata.begindate, c.cdata.enddate));
                //���� ������ �� �������������(2) � �� ���������(3), �� ������������ ����������, �����
                //������������� ���������� �������
                if (c.cdata.stop = 2) or (c.cdata.stop = 3) then
                  Continue;

                Close;
                SQL.Clear;
                SQL.Add('update hist');
                SQL.Add('set pmin=:pm');
                SQL.Add('where bdate<=CONVERT(smalldatetime,:s,104)and ');
                SQL.Add('edate>CONVERT(smalldatetime,:s,104) and regn=:r');
                ParamByName('s').AsString  := rdt;
                ParamByName('r').AsInteger := curregn;
                ParamByName('pm').AsFloat  := c.cdata.pmin;
                ExecSQL;

                Close;
                SQL.Clear;
                SQL.Add('update sub');
                SQL.Add('set pm=:pm,snpm=:snp,sub=:sub,spfree=:sp,stop=:st, stndsub=:stndsub');
                SQL.Add('where sdate=CONVERT(smalldatetime,:s,104) and regn=:r');
                SQL.Add('and service=:serv');
                ParamByName('s').AsString  := rdt;
                ParamByName('r').AsInteger := curregn;
                for i := 0 to numbtarif - 1 do
                begin
                  if (i < 8) or (i > 11) then
                  begin
                    ParamByName('serv').AsInteger := i;
                    ParamByName('pm').AsFloat  := c.cdata.pm[i];
                    ParamByName('snp').AsFloat := c.cdata.snpm[i];
                    ParamByName('sub').AsFloat := c.cdata.sub[i];
                    ParamByName('sp').AsFloat  := c.cdata.fpm[i];
                    ParamByName('stndsub').AsFloat  := c.cdata.stndsub[i];
                    ParamByName('st').AsInteger := c.cdata.stop;
                    ExecSQL;
                  end;
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
        end;
        DModule.Database1.Commit;
      except
        DModule.Database1.Rollback;
      end;
      pr.Free;
      Reload;
    end;
  end
  else
    ShowMessage('������� �����������!');
end;

procedure TForm1.aRepRecalcSubsidyExecute(Sender: TObject);
begin
  Form43.ShowModal;
end;

procedure TForm1.aRunCalcExecute(Sender: TObject);
begin
  WinExec(PChar('calc'), SW_SHOW);
end;

procedure TForm1.aSelDistExecute(Sender: TObject);
{*******************************************************************************
    ��������� N10Click �������� ����� ������������.
    ��� ����� ��������� ������� ������ ����� � ������� ����������. ���� ���������
  �����, �� ������ �� ����� �������������. ���� ��������� ������� ���������, ��
  ������ � ��� ���������� �� �����.
*******************************************************************************}
var
  ins, dis: string;
  dist1: integer;
begin
  dist1 := dist;
  SelectDistFrm.ShowModal;
  if (dist1 <> dist) then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select nameinsp, namedist');
      SQL.Add('from insp inner join dist on insp.id_dist = dist.id_dist');
      SQL.Add('where (insp.id_insp = :idi) and (dist.id_dist = :idd)');
      SQL.Add('order by insp.nameinsp');
      ParamByName('idi').AsInteger := insp;
      ParamByName('idd').AsInteger := dist;
      Open;
      ins := FieldByName('nameinsp').AsString;
      dis := FieldByName('namedist').AsString;
      Close;
    end;
    if CheckP2 then
      sec1 := 1
    else
      sec1 := 0;
    FillCurr(bpath, rdt, dist, Form1.codedbf);
    SetTarifs;
    Reload;
    Statusbar1.Panels[1].Text := '���������: ' + ins;
    Statusbar1.Panels[2].Text := '�����: ' + dis;
  end
  else
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select nameinsp');
      SQL.Add('from insp ');
      SQL.Add('where (id_insp = :idi) and (id_dist = :idd)');
      ParamByName('idi').AsInteger := insp;
      ParamByName('idd').AsInteger := dist;
      Open;
      ins := FieldByName('nameinsp').AsString;
      Close;
    end;
    if CheckP2 then
      sec1 := 1
    else
      sec1 := 0;
    Statusbar1.Panels[1].Text := '���������: ' + ins;
    FillCurr(bpath, rdt, dist, Form1.codedbf);
    SetTarifs;
  end;

  SaveSubsidyCfg;
end;

procedure TForm1.aSelInspExecute(Sender: TObject);
{
  ����� ����� ������ �������� ����������. ���� ��������� ����� ����������, �� ��
  ����� ���������� �������� ������ � StatusBar.
}
var
  insp1: integer;
begin
  insp1 := insp;
  Form17.ShowModal;
  if (insp1 <> insp) then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select nameinsp');
      SQL.Add('from insp');
      SQL.Add('where (id_insp = :idi) and (id_dist = :idd)');
      SQL.Add('order by nameinsp');
      ParamByName('idi').AsInteger := insp;
      ParamByName('idd').AsInteger := dist;
      Open;
      Statusbar1.Panels[1].Text := '���������: ' + FieldByName('nameinsp').AsString;
      Close;
    end;
    if CheckP2 then
      sec1 := 1
    else
      sec1 := 0;
  end;
end;

procedure TForm1.aSelServerExecute(Sender: TObject);
{ ����� ������� ��� �����������}
begin
  ConnectionFrm.ShowModal;
  Form1.Caption := '���� �������������� �������� �� ������ ��� ��������� �.����� �� ' +
    LongMonthNames[StrToInt(FormatDateTime('m', StrToDate(rdt)))] + ' ' +
    IntToStr(YearOf(StrToDate(rdt))) + '�.' + ' [' + Revision + ']' + ' - ' + curServer;
end;

procedure TForm1.ModCl(id: integer);
{*******************************************************************************
    ��������� ModCl ��������� �������� ����������� �������.
    � ������� ������� ������ ����������� ��� ����������� �� �����. �����������
  �����, �� ������� ����� �������� ���������� �������. ���������������, ��� ���
  ��������� �������� ������������� �����.
    � ����� � ���������� ������� ���������� �������� ���������� �����.
*******************************************************************************}
var
  f, addr, per, clc: string;
  i, pl, sts, stp: integer;
  s: real;
begin
  sts := status;
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('execute getinfocl :id, :d');
    ParamByName('id').AsInteger := id;
    ParamByName('d').AsString := Form1.rdt;
    Open;
    client := id;
    f := FieldByName('fio').AsString;
    addr := GenAddr(FieldByName('namestreet').AsString, FieldByName('nhouse').AsString,
      FieldByName('corp').AsString, FieldByName('apart').AsString);
    per := GenPer(FieldByName('bdate').AsDateTime, FieldByName('edate').AsDateTime);
    clc := GenCalc(FieldByName('calc').AsInteger);
    status := GetStatus(FieldByName('bdate').AsDateTime, FieldByName('edate').AsDateTime);
    stp := FieldByName('stop').AsInteger;
    subs := FieldByName('summa').AsFloat;
    Close;
  end;
  for i := 0 to Length(cl) - 1 do
    if cl[i] = id then
      break;
  st[i] := status;
  stop[i] := stp;
  s  := sub[i];
  sub[i] := subs;
  SGCl.Cells[0, SGCl.row] := f;
  SGCl.Cells[1, SGCl.row] := addr;
  pl := NewPlace(i, f, addr);
  subs := sub[pl - 1];
  SGCl.Cells[0, pl] := f;
  SGCl.Cells[1, pl] := Addr;
  SGCl.Cells[2, pl] := Per;
  SGCl.Cells[3, pl] := Clc;
  SGCl.Cells[4, pl] := FlToStr(sub[pl - 1]);
  SGCl.Row := pl;
  SGCl.Repaint;
  Statusbar1.Panels[0].Text := '������: ' + SGCl.Cells[0, SGCl.row] + '/' + FlToStr(subs);
  Edit1.Text := IntToStr(ccl);
  if (sts = 3) and (status <> 3) then
  begin//��� �� �������, ���� �������
    Inc(acl);
    Edit3.Text := IntToStr(StrToInt(Edit3.Text) + 1);
  end;
  if (sts <> 3) and (status = 3) then
  begin//��� �������, ���� �� �������
    Dec(acl);
    Edit3.Text := IntToStr(StrToInt(Edit3.Text) - 1);
  end;
  Edit2.Text := IntToStr(Acl);
  Edit4.Text := FlToStr(StrToFloat(Edit4.Text) - s + subs);
end;

procedure TForm1.DelCl(id: integer);
{*******************************************************************************
    ��������� DelCl ��������� ������� ������� �� sgcl.
    �� ����������� �������� � �� sgcl ��������� ������� �������
    � ����� � ���������� ������� ���������� �������� ���������� �����.
*******************************************************************************}
var
  ind, i: integer;
begin
  for ind := 0 to Length(cl) - 1 do
    if cl[ind] = id then
      break;
  Dec(ccl);
  if st[ind] < 3 then
    Dec(acl);
  DelRow(ind + 1);
  if Length(cl) > 1 then
  begin
    for i := ind to Length(cl) - 2 do
    begin
      cl[i]  := cl[i + 1];
      st[i]  := st[i + 1];
      sub[i] := sub[i + 1];
      stop[i] := stop[i + 1];
    end;
    if ind > 0 then
    begin
      client := cl[ind - 1];
      status := st[ind - 1];
      subs := sub[ind - 1];
      SGCl.Row := ind;
    end
    else
    begin
      client := cl[0];
      status := st[0];
      subs := sub[0];
      SGCl.Row := 1;
    end;
    SetLength(cl, Length(cl) - 1);
    SetLength(st, Length(st) - 1);
    SetLength(sub, Length(sub) - 1);
    SetLength(stop, Length(stop) - 1);
    Statusbar1.Panels[0].Text := '������: ' + SGCl.Cells[0, SGCl.row] + '/' + FlToStr(subs);
  end
  else
  begin
    SetLength(cl, 0);
    SetLength(st, 0);
    SetLength(stop, 0);
    SetLength(sub, 0);
    client := 0;
    status := 0;
    subs := 0;
    SGCl.Row := 1;
    Statusbar1.Panels[0].Text := '���� �����';
  end;
  SGCl.Repaint;
  Edit1.Text := IntToStr(ccl);
  Edit2.Text := IntToStr(Acl);
  Edit3.Text := IntToStr(StrToInt(Edit3.Text) - 1);
  Edit4.Text := FlToStr(ASub);
end;

procedure TForm1.RecalcSelectedRows;
var
  pr: TAboutBox1;
  c:  TClient;
  t:  array of integer;
  i, j, cnt: integer;
begin

  //������ ���������� ���������
  with DModule.Query1 do
  begin
    cnt := 0;
    Close;
    SQL.Clear;
    SQL.Add(qr.SQL);
    for i := 0 to Length(qr.parname) - 1 do
      ParamByName(qr.parname[i]).AsString := qr.parval[i];
    Open;
    if not EOF then
    begin
      c  := TClient.Create(Empty, EmptyC);
      pr := TAboutBox1.Create(Application);
      pr.Label1.Caption := '���������� ��������';
      pr.Label2.Caption := '���������� �������:';
      pr.Label3.Caption := '';
      pr.Show;
      pr.Update;
      SendMessage(pr.Handle, wm_paint, 0, 0);
      pr.ProgressBar1.Max := RecordCount;
      SetLength(t, RecordCount);
      for i := 0 to Length(t) - 1 do
      begin
        t[i] := FieldByName('regn').AsInteger;
        Next;
      end;
      Close;
      for j := 0 to Length(t) - 1 do
      begin
        c.SetCalc(t[j], rdt);
        c.Calc(1);
        Close;
        SQL.Clear;
        SQL.Add('update sub');
        SQL.Add('set pm=:pm,snpm=:snp,sub=:sub,spfree=:sp');
        SQL.Add('where sdate=CONVERT(smalldatetime,:s,104) and regn=:r');
        SQL.Add('and service=:serv');
        ParamByName('s').AsString  := rdt;
        ParamByName('r').AsInteger := client;
        for i := 0 to numbtarif - 1 do
        begin
          if (i < 8) or (i > 11) then
          begin
            ParamByName('serv').AsInteger := i;
            ParamByName('pm').AsFloat  := c.cdata.pm[i];
            ParamByName('snp').AsFloat := c.cdata.snpm[i];
            ParamByName('sub').AsFloat := c.cdata.sub[i];
            ParamByName('sp').AsFloat  := c.cdata.fpm[i];
            ExecSQL;
          end;
        end;
        Inc(cnt);
        pr.ProgressBar1.StepIt;
        pr.Label3.Caption := IntToStr(cnt);
        pr.Update;
        SendMessage(pr.Handle, wm_paint, 0, 0);
      end;
      Close;
      pr.Close;
      pr.Release;
    end;
  end;
  Reload;

end;

procedure TForm1.FormCreate(Sender: TObject);
{
  �������� ������� �����. ���������� �������� ��������� ������ �� �����(������� �����
  � ���������, ���, ��� � ����� ������� ���������) � � �������.
  ���� ���� �� ����������, �� �� ��������� � ��������������� �����������.
  ���������� ������� ���������. ��������������� ��������� ��� ������������ ������
  ��������, ��� ������ �������.
}
var
  dt: string;
  c, i: integer;
  rl, el: THandle;
  Layouts: array[0..7] of THandle;
  y, m, d: word;
begin
  IDate := EncodeDate(2006, 6, 1);//���� ������� ��������� � �������������

  //���� ��� ����� � ������ DBF
  if getConfValue('0.OtherDatabasePath') = True then
    bpath := getConfValue('0.DatabasePath')
  else
    bpath := ExtractFilePath(Application.ExeName) + 'database\';

  normc  := 0.065;
  normw  := 0.087;
  normsc := 23;
  normsw := 24;

  //�������� �� �������
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey('Software\Subsidy', True) then
      begin
        if ValueExists('dist') then
          dist := ReadInteger('dist'{,2})
        else
          dist := 2;
        if ValueExists('insp') then
          insp := ReadInteger('insp'{,1})
        else
          insp := 1;
        if ValueExists('by') then
          by := ReadInteger('by'{,2006})
        else
          by := 2006;
        if ValueExists('bm') then
          bm := ReadInteger('bm'{,6})
        else
          bm := 6;
        if ValueExists('ey') then
          ey := ReadInteger('ey'{,YearOf(Date)})
        else
          ey := YearOf(Date);
        if ValueExists('em') then
          em := ReadInteger('em'{,MonthOf(Date)})
        else
          em := MonthOf(Date);
        if not ValueExists('svnRev') then
          WriteString('svnRev', Revision);
      end;
      if OpenKey('Connection', True) then
        if ValueExists('Server') then
          curServer := ReadString('Server');
    finally
      CloseKey;
      Free;
    end;

  DecodeDate(Date, y, m, d);
  y := y - 2000;
  if y < 10 then
    dt := '0' + IntToStr(y)
  else
    dt := IntToStr(y);
  if m < 10 then
    dt := dt + '0' + IntToStr(m)
  else
    dt := dt + IntToStr(m);
  SetPer(dt, rdt);

  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select nameinsp, namedist');
    SQL.Add('from insp inner join dist on insp.id_dist = dist.id_dist');
    SQL.Add('where (insp.id_insp = :idi) and (dist.id_dist = :idd)');
    SQL.Add('order by nameinsp');
    ParamByName('idi').AsInteger := insp;
    ParamByName('idd').AsInteger := dist;
    Open;
    Statusbar1.Panels[1].Text := '���������: ' + FieldByName('nameinsp').AsString;
    Statusbar1.Panels[2].Text := '�����: ' + FieldByName('namedist').AsString;
    Close;
  end;

  FormerStringGrid(SGCL, TStringArray.Create('���', '�����', '���� ��������',
    '������','��������'), TIntArray.Create(200, 170, 128, 40, 55), 2);

  Form1.Caption := '���� �������������� �������� �� ������ ��� ��������� �.����� �� ' +
    LongMonthNames[StrToInt(FormatDateTime('m', StrToDate(rdt)))] + ' ' +
    IntToStr(YearOf(StrToDate(rdt))) + '�.' + ' [' + Revision + ']' + ' - ' + curServer;

  //������� ��������
  c := GetKeyboardLayoutList(High(Layouts) + 1, Layouts);
  for i := 0 to c - 1 do
  begin
    if LoWord(Layouts[i]) and $FF = Lang_Russian then
      rl := Layouts[i];
    if LoWord(Layouts[i]) and $FF = Lang_English then
      el := Layouts[i];
  end;
  if rl <> 0 then
    ActivateKeyboardLayout(rl, 0);

  if CheckP2 then
    sec1 := 1
  else
    sec1 := 0;

  Form1.codedbf := OEM;
  FillCurr(bpath, rdt, dist, Form1.codedbf);

  //��� �������� ������ �� �������
  ItemIndex := -1;
  LastTime := Time;
  //��� ������
  reg := 0;
  fdate := Date;
  lDate := Date;
  SetTarifs;
end;

function TForm1.NewPlace(id: integer; s1, s2: string): integer;
{
  ����� ����� ��� ������ S � StringGrid.
}
var
  i, c1, c2: integer;
begin
  Result := 1;
  if Length(cl) > 1 then
  begin
    for i := 0 to Length(cl) - 2 do
    begin
      C1 := CompareText(AnsiLowerCase(SGCl.Cells[0, i + 1]), AnsiLowerCase(s1));
      C2 := CompareText(AnsiLowerCase(SGCl.Cells[1, i + 1]), AnsiLowerCase(s2));
      if C1 >= 0 then
      begin //������ > ������
        if (i <> id) or (i = id) and (c2 <> 0) then
          InsertCl(id, i);
        Result := i + 1;
        exit;
      end;
      if (i = Length(cl) - 2) then
        Result := Length(cl);
    end;
  end
  else
    Result := 1;
end;

procedure TForm1.InsertCl(i1, i2: integer);
{
  ��������� ������� � ������� i1 �� ����� i2, ���������
  �������� ��������
}
var
  i, c, s, k, sp: integer;
  sb: real;
  cs: array of string;
begin
  c  := cl[i1];
  s  := st[i1];
  sb := sub[i1];
  sp := stop[i1];
  SetLength(cs, 4);
  for k := 0 to 3 do
    cs[k] := SGCl.Cells[k, i1 + 1];
  for i := Length(cl) - 1 downto i2 + 1 do
  begin
    cl[i]  := cl[i - 1];
    st[i]  := st[i - 1];
    sub[i] := sub[i - 1];
    stop[i] := stop[i - 1];
    for k := 0 to 3 do
      SGCl.Cells[k, i + 1] := SGCl.Cells[k, i];
  end;
  cl[i2]  := c;
  st[i2]  := s;
  sub[i2] := sb;
  stop[i2] := sp;
  for k := 0 to 3 do
    SGCl.Cells[k, i2 + 1] := cs[k];
end;

procedure TForm1.FormClose;
{
  ����� �� ���������. ����������� ��������� ���� edate, � ������� ��� ����������
  ������. ��� ���� ������������ � by � bm, ������� ������������� ������ �������
  �������, ���������� ��� ���������, � � ������� ��������� ��������. � ����
  ������������ ������ ������������, �� ������� � ��������� ��� ����� ������������
  ��������� ���������, ����� ��� �����, ���������, ������ ��������� �����.
  ����� ��������� ������������ ���� �������� ��������� ������� � ���������� �������.
  ���� ��� �����������, �� ������� ������� �������, ���������� � ��������� �����������
  � ������������ � ������� �����.
}
var
  ed:  TDate;
  y, m, d: word;
  pdt: string;
  cy, cm: integer;
begin
  DecodeDate(Date, y, m, d);
  if d > 19 then
  begin
    Inc(m);
    if m > 12 then
    begin
      m := m - 12;
      Inc(y);
    end;
  end;
  ed  := EncodeDate(y, m, 1);
  pdt := DateToStr(ed);

  try
    DModule.Database1.Connected := True;
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('execute getedate :idd');
      ParamByName('idd').AsInteger := dist;
      Open;
      ed := FieldByName('edate').AsDateTime;
      Close;
    end;
    DModule.qTarif.Close;
  except
    ShowMessage('��������� ���� ��� ������� ���������� � ��������! ���������� � ' +
      '�������������� ��� ���������� ���� ���������.' + #13 +
      '��� ��������� ������� ��������� �������� ������������� ' +
      '�������� ��������� ������.����� ��� ��������� ������������� ' +
      '��������� �������� ������ ��������� � ��������� ���������.');
  end;
  DecodeDate(ed, y, m, d);
  by := 2006;
  bm := 6;
  ey := by;
  em := bm;
  cy := StrToInt(Copy(pdt, 7, 4));//������� ����
  cm := StrToInt(Copy(pdt, 4, 2));
  if (by <= cy) then
  begin
    if (by < y) and (y < cy) or (by = y) and (by <> cy) and (bm <= m) or (cy = y) and (by <> cy) and (m <= cm) then
    begin
      ey := y;
      em := m;
    end
    else
    begin
      ey := cy;
      em := cm;
    end;
  end
  else
  begin
    if (by < y) or (by = y) and (bm <= m) then
    begin
      ey := y;
      em := m;
    end;
  end;

  SaveSubsidyCfg;

  try
    DModule.Database1.Connected := True;
    if (pdt > rdt) and DModule.Database1.Connected then
      FillCurr(bpath, pdt, dist, Form1.codedbf);
  except
    ShowMessage('��������� ���� ��� ������� ���������� � ��������! ���������� � ' +
      '�������������� ��� ���������� ���� ���������.' + #13 +
      '��� ��������� ������� ��������� �������� ������������� ' +
      '�������� ��������� ������.����� ��� ��������� ������������� ' +
      '��������� �������� ������ ��������� � ��������� ���������.');
  end;
  with DModule do
  begin
    t1.Close;
    t2.Close;
    t3.Close;
    t4.Close;
    t5.Close;
    t6.Close;
    t7.Close;
    t8.Close;
    t9.Close;
    t10.Close;
    tc.Close;
    norm1.Close;
    pv.Close;
  end;
end;

function TForm1.SetSumSub: real;
  { ���������� ������� ����� �������� ��� �������� �� ������� ����� }
var
  i: integer;
begin
  Result := 0;
  for i := 0 to Length(cl) - 1 do
    Result := Result + sub[i];
end;

procedure TForm1.Reload;
{
  ������� ������������ ���� ������. � ������ �������� ������ ���� ���������
  ����, � ������� ������� �������� �������� � ���������� ����������� �������.
  ����� ��������� StringGrid ���������.
}
var
  i, c: integer;
  f:  string;
  pr: TAboutBox1;
begin
  ClearSG;
{  for i := 0 to MainMenu1.Items.Count - 1 do
    MainMenu1.Items.Items[i].Enabled := False;}
  Form1{.ActionToolBar1}.Enabled := False;
  pr := TAboutBox1.Create(Application);
  pr.Label1.Caption := '�������� ���� ������';
  pr.Label2.Caption := '��������� �������:';
  pr.Label3.Caption := '';
  pr.Show;
  pr.Update;
  SendMessage(pr.Handle, wm_paint, 0, 0);
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('execute getinfoscr :idd,:d');
    ParamByName('idd').AsInteger := dist;
    ParamByName('d').AsString := rdt;
    try
      Open;
    except
      ShowMessage('Connect failed trying reconnect...');
      DModule.Database1.Close;
      try
        DModule.Database1.Open;
        ShowMessage('Connection restore...');
        Open;
      except
        ShowMessage('Attempt restoring Connection failed...');
      end;
    end;
    c := RecordCount;
    if c > 0 then
    begin
      SGCl.RowCount := c + 1;
      SetLength(cl, c);
      SetLength(st, c);
      SetLength(stop, c);
      SetLength(sub, c);
      pr.ProgressBar1.Max := c;
      pr.ProgressBar1.Step := 1;
      i := 0;
      f := FieldByName('fio').AsString;
      client := FieldByName('regn').AsInteger;
      status := GetStatus(FieldByName('bdate').AsDateTime,
        FieldByName('edate').AsDateTime);
      subs := FieldByName('summa').AsFloat;
      while not EOF do
      begin
        Application.ProcessMessages;
        cl[i]  := FieldByName('regn').AsInteger;
        st[i]  := GetStatus(FieldByName('bdate').AsDateTime,
          FieldByName('edate').AsDateTime);
        sub[i] := FieldByName('summa').AsFloat;
        stop[i] := FieldByName('stop').AsInteger;
        SGCl.Cells[0, i + 1] := FieldByName('fio').AsString;
        SGCl.Cells[1, i + 1] := GenAddr(FieldByName('namestreet').AsString,
          FieldByName('nhouse').AsString,
          FieldByName('corp').AsString,
          FieldByName('apart').AsString);
        SGCl.Cells[2, i + 1] := GenPer(FieldByName('bdate').AsDateTime,
          FieldByName('edate').AsDateTime);
        SGCl.Cells[3, i + 1] := GenCalc(FieldByName('calc').AsInteger);
        SGCl.Cells[4, i + 1] := FlToStr(sub[i]);
        Next;
        Inc(i);
        pr.ProgressBar1.StepIt;
        pr.Label3.Caption := IntToStr(i);
        pr.Update;
        SendMessage(pr.Handle, wm_paint, 0, 0);
      end;
      Close;
    end;
  end;
  pr.Close;
  pr.Release;
{  for i := 0 to MainMenu1.Items.Count - 1 do
    MainMenu1.Items.Items[i].Enabled := True;}
  Form1{.ActionToolBar1}.Enabled := True;
  ccl := c;
  acl := ACount;
  Edit1.Text := IntToStr(ccl);
  Edit2.Text := IntToStr(acl);
  Edit3.Text := Edit1.Text;
  Edit4.Text := FlToStr(SetSumSub);
  if c > 0 then
    Statusbar1.Panels[0].Text := '������: ' + f + '/' + FlToStr(subs)
  else
    Statusbar1.Panels[0].Text := '������: ' + f + '/?';
end;

procedure TForm1.ReloadConfig;
begin
  GroupBox1.Visible := getConfValue('0.ShowLegend');
  Button3.Visible := getConfValue('0.ShowDeleteButton');
  getConfValue('1.Server');
  //� ���������� �������� ���� ����� � ��������
  if getConfValue('0.OtherRepPath') = True then
    reports_path := getConfValue('0.RepPath')
  else
    reports_path := (ExtractFilePath(Application.ExeName) + 'reports\');
end;

procedure TForm1.ReportsFillAdditionData(nameInsp: string);
begin
  New(Form1.ARepData);
  ARepData.Clear;
  if getConfValue('0.ShowAddReportData') = True then
    ReportDataFrm.ShowModal;
    ReportDataFrm.Free;

  with frxReport1 do
  begin
    Variables['Num1']  := quotedstr(ARepData.Num1);
    Variables['Num2']  := quotedstr(ARepData.Num2);
    Variables['toNum'] := quotedstr(ARepData.toNum);
    Variables['soluteNum'] := quotedstr(ARepData.soluteNum);
    Variables['zipCode'] := quotedstr(ARepData.zipCode);
    Variables['StartDate'] := quotedstr(ARepData.StartDate);
    Variables['sumBeg'] := quotedstr(ARepData.sumBeg);
    Variables['basetext'] := quotedstr(ARepData.basetext);
//    Variables['spec'] := quotedstr(ARepData.spec);
    if ARepData.insp then
      Variables['spec2'] := quotedstr(nameInsp)
    else
      Variables['spec2'] := quotedstr(ARepData.spec2);
//      Variables['spec'] := quotedstr('');
  end;
  Dispose(Form1.ARepData);
end;

procedure TForm1.ReportsFillDistInfo;
{ ��������� ��������� �������� ���������� � ������� ��� ������������ ����� }
var
  tmp_query: TQuery;
begin
  tmp_query := TQuery.Create(DModule);
  tmp_query.DatabaseName := 'Subsidy';
  with tmp_query do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM Dist' + #13 +
      'WHERE id_dist=:dist';
    ParamByName('dist').AsInteger := dist;
    Open;
    frxReport1.Variables.Variables['distName'] := Quotedstr(GetFIOPadeg(FieldByName('namedist').AsString, '', '', True, 2));
    frxReport1.Variables.Variables['distAdr']  := Quotedstr(FieldByName('adr').AsString);
    frxReport1.Variables.Variables['distTel']  := Quotedstr(FieldByName('tel').AsString);
    Free;
  end;
end;

procedure TForm1.Load(q: CQuery; rsel: boolean);
{
  ������� ������������ ���� ������ � ������������ � �������� q, ������� ��� �����������
  �� ����� �������. � ������ �������� ������ ���� ��������� ����, � ������� �������
  �������� �������� � ���������� ����������� �������. ����� ��������� StringGrid ���������.
}
var
  i, c: integer;
  f:  string;
  pr: TAboutBox1;
begin
  ClearSG;
{  for i := 0 to MainMenu1.Items.Count - 1 do
    MainMenu1.Items.Items[i].Enabled := False;}
  Form1.{ActionToolBar1.}Enabled := False;
  pr := TAboutBox1.Create(Application);
  pr.Label1.Caption := '�������� ����������� ������';
  pr.Label2.Caption := '��������� �������:';
  pr.Label3.Caption := '';
  pr.Show;
  pr.Update;
  SendMessage(pr.Handle, wm_paint, 0, 0);
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;

    SQL.Text := (
      'select cl.regn,cl.fio,strt.namestreet,cl.nhouse,cl.corp,cl.apart,' + #13 +
      'sb1.calc,sb1.bdate,sb1.edate,sb.summa,sb.stop' + #13 +
      'from cl inner join strt on cl.id_street=strt.id_street' + #13 +
      'left join' + #13 +
      '(' + #13 +
      'SELECT    sub.regn,' + #13 +
      '(case when' + #13 +
        'sub.regn not in' + #13 +
          '(select sluj.regn' + #13 +
          'from sluj' + #13 +
          'where sluj.sdate = CONVERT(smalldatetime, :d, 104)' + #13 +
            'and sluj.regn=sub.regn)' + #13 +
      'then SUM(sub.sub)' + #13 +
      'else (SUM(sub.sub) - (select sum(sluj.sub)' + #13 +
                'from sluj' + #13 +
                'where sluj.sdate = CONVERT(smalldatetime, :d, 104)' + #13 +
                  'and sluj.regn=sub.regn))' + #13 +
      'end) as summa, stop' + #13 +
      'FROM          Sub' + #13 +

      'WHERE      (sub.sdate = CONVERT(smalldatetime, :d, 104))' + #13 +
      'GROUP BY sub.regn, sub.stop' + #13 +
      ')' + #13 +
       'sb on sb.regn=cl.regn' + #13 +
          'inner join (' + q.SQL + ') sb1 on cl.regn=sb1.regn' + #13 +
      'order by cl.fio');

    ParamByName('idd').AsInteger := dist;
    ParamByName('d').AsString := rdt;
    for i := 0 to Length(q.parname) - 1 do
      ParamByName(q.parname[i]).AsString := q.parval[i];
    Open;
    c := RecordCount;
    if c > 0 then
    begin
      SGCl.RowCount := c + 1;
      SetLength(cl, c);
      SetLength(st, c);
      SetLength(stop, c);
      SetLength(sub, c);
      pr.ProgressBar1.Max := c;
      pr.ProgressBar1.Step := 1;
      f := FieldByName('fio').AsString;
      client := FieldByName('regn').AsInteger;
      status := GetStatus(FieldByName('bdate').AsDateTime,
        FieldByName('edate').AsDateTime);
      subs := FieldByName('summa').AsFloat;
      i := 0;
      while not EOF do
      begin
        Application.ProcessMessages;
        cl[i]  := FieldByName('regn').AsInteger;
        st[i]  := GetStatus(FieldByName('bdate').AsDateTime,
          FieldByName('edate').AsDateTime);
        stop[i] := FieldByName('stop').AsInteger;
        sub[i] := FieldByName('summa').AsFloat;
        SGCl.Cells[0, i + 1] := FieldByName('fio').AsString;
        SGCl.Cells[1, i + 1] := GenAddr(FieldByName('namestreet').AsString,
          FieldByName('nhouse').AsString,
          FieldByName('corp').AsString,
          FieldByName('apart').AsString);
        SGCl.Cells[2, i + 1] := GenPer(FieldByName('bdate').AsDateTime,
          FieldByName('edate').AsDateTime);
        SGCl.Cells[3, i + 1] := GenCalc(FieldByName('calc').AsInteger);
        SGCl.Cells[4, i + 1] := FlToStr(sub[i]);
        Next;
        Inc(i);
        pr.ProgressBar1.StepIt;
        pr.Label3.Caption := IntToStr(i);
        pr.Update;
        SendMessage(pr.Handle, wm_paint, 0, 0);
      end;
      Close;
    end;
  end;
  pr.Close;
  pr.Release;
{  for i := 0 to MainMenu1.Items.Count - 1 do
    MainMenu1.Items.Items[i].Enabled := True;}
  Form1.{ActionToolBar1.}Enabled := True;
  Edit3.Text := IntToStr(c);
  if c > 0 then
  begin
    Edit4.Text := FlToStr(ASub);
    Statusbar1.Panels[0].Text := '������: ' + f + '/' + FlToStr(subs);
  end
  else
  begin
    Edit4.Text := '0';
    Statusbar1.Panels[0].Text := '������: ' + f + '/?';
  end;
end;

procedure TForm1.SGClDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
{
  ������� ���������� ������. ������������������� ��� ����������� �������
  ������� � ��������� ��������� ������� ��������� ������.
}
begin
  if Arow = 0 then
    SGCl.Canvas.Brush.Color := clBtnFace
  else
  begin
    if Length(cl) > 0 then
    begin
      case stop[Arow - 1] of
        0://������ ���
        begin
          if (Arow = SGCl.Row) then
            SGCl.Canvas.Brush.Color := clSkyBlue
          else
            SGCl.Canvas.Brush.Color := clWindow;
        end;
        1://�������������
        begin
          if (Arow = SGCl.Row) then
            SGCl.Canvas.Brush.Color := clTeal
          else
            SGCl.Canvas.Brush.Color := clMoneyGreen;
        end;
        2://������������
        begin
          if (Arow = SGCl.Row) then
            SGCl.Canvas.Brush.Color := clOlive
          else
            SGCl.Canvas.Brush.Color := clInfoBk;
        end;
        3://�����������
        begin
          if (Arow = SGCl.Row) then
            SGCl.Canvas.Brush.Color := clGray
          else
            SGCl.Canvas.Brush.Color := clSilver;
        end;
      end;
      if sub[ARow - 1] < 0  then
        if (Arow = SGCl.Row) then
          SGCl.Canvas.Brush.Color := clSilver
        else
          SGCl.Canvas.Brush.Color := clMaroon;
    end
    else
    begin
      if (ARow = SGCl.Row) then
        SGCl.Canvas.Brush.Color := clSkyBlue
      else
        SGCl.Canvas.Brush.Color := clWindow;
    end;
  end;
  SGCl.Canvas.FillRect(Rect);
  if (ACol = 0) and (ARow > 0) and (Length(st) > 0) then
  begin
    imagelist1.Draw(SGCl.Canvas, rect.Left + 2, rect.Top + 2, st[ARow - 1]);
    SGCl.Canvas.TextOut(rect.Left + ImageList1.Width + 4, rect.Top + 2, SGCl.Cells[acol, arow]);
  end
  else
    SGCl.Canvas.TextOut(rect.Left + 2, rect.Top + 2, SGCl.Cells[acol, arow]);
end;


procedure TForm1.ClearSG;
{ ������� stringgrid }
var
  i: integer;
begin
  SetLength(cl, 0);
  SetLength(st, 0);
  SetLength(sub, 0);
  SetLength(stop, 0);
  with SGCl do
  begin
    RowCount  := 2;
    FixedRows := 1;
    for i := 1 to RowCount - 1 do
    begin
      Cells[0, i] := '';
      Cells[1, i] := '';
      Cells[2, i] := '';
      Cells[3, i] := '';
      Cells[4, i] := '';
    end;
  end;
end;

procedure TForm1.DelRow(i: integer);
{ ������� ������ �� string grid }
var
  j, k: integer;
begin
  for j := i to SGCl.RowCount - 2 do
    for k := 0 to 4 do
      SGCl.Cells[k, j] := SGCl.Cells[k, j + 1];
  if SGCl.RowCount > 2 then
    SGCl.RowCount := SGCl.RowCount - 1
  else
    for k := 0 to 4 do
      SGCl.Cells[k, 1] := '';
end;

procedure TForm1.SGClSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
{
  ������� ������ ������. ������������������� ��� ������ ������� � �������� � statusbar,
  ��� ����������� �������� ������� � ��� �������.
}
begin
  if Length(cl) > 0 then
  begin
    client := cl[arow - 1];
    status := st[arow - 1];
    subs := sub[arow - 1];
    Statusbar1.Panels[0].Text := '������: ' + SGCl.Cells[0, arow] + '/' + FlToStr(subs);
  end;
end;

procedure TForm1.SaveSubsidyCfg;
begin
  //���������� � ������
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey('Software\Subsidy', True) then
      begin
        WriteInteger('dist', dist);
        WriteInteger('insp', insp);
        WriteInteger('by', by);
        WriteInteger('bm', bm);
        WriteInteger('ey', ey);
        WriteInteger('em', em);
        WriteString('svnRev', Revision);
      end;
    finally
      CloseKey;
      Free;
    end;
end;

procedure TForm1.SetPer(per1: string; var per2: string);
{ ���������� ���� per2, ������ �� per1 - ���������� ���� � ������(����� 4 �����) }
var
  m, y, d: integer;
  per: string;
begin
  m := StrToInt(Copy(per1, 3, 2));
  y := StrToInt(Copy(per1, 1, 2));
  d := DayOf(Date);
  if d > 19 then
  begin
    m := m + 1;
    if m > 12 then
    begin
      m := m - 12;
      y := y + 1;
    end;
  end;
  if y < 10 then
    per := '0' + IntToStr(y)
  else
    per := IntToStr(y);
  if m < 10 then
    per := per + '0' + IntToStr(m)
  else
    per := per + IntToStr(m);
  per2 := '01.' + Copy(per, 3, 2) + '.20' + Copy(per, 1, 2);
end;

procedure TForm1.SetPer2(per1: string; var per2: string);
{ ���������� per1 - ���������� ���� � ������(����� 4 �����), ������ �� ���� per2 }
var
  m, y, d: integer;
begin
  m := StrToInt(Copy(per1, 4, 2));
  y := StrToInt(Copy(per1, 9, 2));
  d := DayOf(Date);
  if d > 19 then
  begin
    m := m - 1;
    if m = 0 then
    begin
      m := 12;
      y := y - 1;
    end;
  end;
  if y < 10 then
    per2 := '0' + IntToStr(y)
  else
    per2 := IntToStr(y);
  if m < 10 then
    per2 := per2 + '0' + IntToStr(m)
  else
    per2 := per2 + IntToStr(m);
end;

procedure TForm1.PrintVedCr(f, ad, rd, mng: string);
{ ������������ ��������� �������� ������� �� ��� }
var
  y1, dt: string;
begin
  DModule.Query1.SQL.Clear;
  DModule.Query1.SQL.Add('EXEC vedomost "' + rdt + '", "' + IntToStr(client) + '"');
  DModule.Query1.Open;

  DModule.Query2.SQL.Clear;
  DModule.Query2.SQL.Text := ('SELECT boss ' + #13 +
    'FROM Dist ' + #13 +
    'WHERE id_dist = ' + IntToStr(dist));
  DModule.Query2.Open;

  frxData.DataSource := DModule.DataSource1;
  frxReport1.LoadFromFile(PChar(reports_path + 'vedomost.fr3'));
  //  frxReport1.Title := '��������� ��������';

  SetPer2(rdt, dt);
  y1 := '20' + Copy(dt, 1, 2);

  frxReport1.Variables.Variables['pyear'] := quotedstr(y1);
  frxReport1.Variables.Variables['fio'] := quotedstr(f);
  frxReport1.Variables.Variables['addr'] := quotedstr(ad);
  frxReport1.Variables.Variables['reg'] := quotedstr(IntToStr(client));
  frxReport1.Variables.Variables['rd'] := quotedstr(rd);
  frxReport1.Variables.Variables['mng'] := quotedstr(mng);
  frxReport1.Script.Variables['dist'] := (IntToStr(dist));
  frxReport1.Variables.Variables['boss'] := quotedstr(DModule.Query2.FieldValues['boss']);
  frxReport1.PrepareReport;
  frxReport1.ShowPreparedReport;
end;

function TForm1.SG_FindCl(SG: TStringGrid; s: string): integer;
{
  ��������� ������������ ��� ������ ��� ������� � stringgrid �� ��������� ������,
  ����������� � s. ������������ ��������������� ��� ������ SGCL, ���� ������ �������,
  �� ������������ ����� ������, ���� ���, �� -1.
}
var
  i, j: integer;
  s1: string;
begin
  Result := -1;
  i := 1;
  while i <> SGCL.RowCount - 1 do
  begin
    s1 := AnsiLowerCase(SG.Cells[0, i]);
    j  := Pos(s, s1);
    if j = 1 then
    begin
      Result := i;
      exit;
    end;
    Inc(i);
  end;

  if i = SG.RowCount then
    Result := -1;
end;

procedure TForm1.SGClDblClick(Sender: TObject);
{
  ������������������� ��� ������ ����� ��������� �������.
}
var
  oldsec: integer;
begin
  if (Length(cl) > 0) then
  begin
    oldsec := sec1;
    sec1 := 0;
    if (stop[SGCl.Row - 1] < 2) or (stop[SGCl.Row - 1] > 1) and (status = 3) then
    begin
      Form2.mode := vEdit;
      Form2.ShowModal;
    end
    else
      ShowMessage('����� ������� ������������� ��� ���������!' + #13 +
        '�������� �������� ������ ����� ������������� �������� ��� �� ��������� ����� ��������.');
    sec1 := oldsec;
  end
  else
    ShowMessage('���� �����!');
end;

procedure TForm1.SGClKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{ ��������� ������� ������ �� ���������� }
begin
  if Key = vk_insert then
  begin
    if CheckP2 then
    begin
      Form2.mode := vAdd;
      Form2.ShowModal;
    end
    else
      ShowMessage('�������� ������� ����� ������ � ������� �������� ������!');
  end;
  if Key = vk_return then
  begin
    if (Length(cl) > 0) then
    begin
      if (stop[SGCl.Row - 1] < 2) or (stop[SGCl.Row - 1] > 1) and (status = 3) then
      begin
        Form2.mode := vEdit;
        Form2.ShowModal;
      end
      else
        ShowMessage('����� ������� ������������� ��� ���������!' + #13 +
          '�������� �������� ������ ����� ������������� �������� ��� �� ��������� ����� ��������.');
    end
    else
      ShowMessage('���� �����!');
  end;
end;

procedure TForm1.SGClKeyPress(Sender: TObject; var Key: char);
{
  ��������� ��������� ������� ������ �� ����������. ������������ ��� ��������
  ������ ��� ������� � stringgrid.
}
var
  s: word;
begin
  //����� ������� �� ������ ��������
  if (Key in ['�'..'�']) or (Key in ['�'..'�']) then
  begin
    s := MilliSecondsBetween(Time, LastTime);
    if (s > 1000) then//����� �����
      searchbuf := Key
    else
    begin
      Dec(ItemIndex);
      searchbuf := searchbuf + Key;
    end;
    LastTime  := Time;
    ItemIndex := SG_FindCl(SGCl, searchbuf);
    if (ItemIndex <> -1) then
    begin
      client := cl[ItemIndex - 1];
      status := st[ItemIndex - 1];
      subs := sub[ItemIndex - 1];
      SGCl.Row := ItemIndex;
    end;
  end;
end;

procedure TForm1.SGClMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SGCL.Row := SGCL.MouseCoord(x,y ).Y;
end;

procedure TForm1.FormResize(Sender: TObject);
{
  ��������� ��������� �������� ����������� �� ����� � ������������ � ����������
  �������� �����
}
var
  w1: integer;
begin
  case Form1.WindowState of
    wsMaximized:
    begin
      w1 := Panel1.Width - SGCl.ColWidths[2] - SGCl.ColWidths[3] - SGCl.ColWidths[4];
      SGCl.ColWidths[0] := (w1 div 2) - 55;
      SGCl.ColWidths[1] := (w1 div 2) - 60;
    end;
    wsNormal:
    begin
      with SGCl do
      begin
        ColWidths[0] := 200;
        ColWidths[1] := 170;
        ColWidths[2] := 128;
        ColWidths[3] := 39;
        ColWidths[4] := 55;
      end;
    end;
  end;
  GridPanel1.Realign;
end;

procedure TForm1.N73Click(Sender: TObject);
{*******************************************************************************
  ��������� ���������������� �������� � ������� �������� ������� ���������� �������.
  � ������� hist �������� ���� stop ��������������� � 2, � � ������� �������� � ���������
  ���������� ������� ��������(����������, ����� ���� ������� ������������).
*******************************************************************************}
begin
  if (stop[SGCl.Row - 1] = 0) and (status <> 3) then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update sub');
      SQL.Add('set sub=0.00,stop=2');
      SQL.Add('where regn=:id and sdate=convert(smalldatetime,:d,104)');
      ParamByName('id').AsInteger := client;
      ParamByName('d').AsString := rdt;
      ExecSQL;
      Close;
      Close;
      SQL.Clear;
      SQL.Add('update sluj');
      SQL.Add('set sub=0.00');
      SQL.Add('where regn=:id and sdate=convert(smalldatetime,:d,104)');
      ParamByName('id').AsInteger := client;
      ParamByName('d').AsString := rdt;
      ExecSQL;
      Close;
    end;
    stop[SGCl.Row - 1] := 2;
    subs := 0;
    sub[SGCl.Row - 1] := 0;
    SGCl.Cells[4, SGCl.Row] := '0.00';
    Edit4.Text := FlToStr(SetSumSub);
    SGCl.Repaint;
  end
  else
    ShowMessage('������������� ����� ������ ����������� �������� ��������� �������!');
end;

procedure TForm1.N75Click(Sender: TObject);
{*******************************************************************************
  ��������� ���������� �������� ���������� �������. � ������� sub �������� ����
  stop ��������������� � 3, � � ������� �������� � ���������
  ���������� ������� ��������(����������, ����� ���� ������� ������������).
*******************************************************************************}
var
  cmp: integer;
begin
  if YearOf(StrToDate(rdt)) = YearOf(StrToDate(Copy(SGCl.Cells[2, SGCl.row], 1, 10))) then
    cmp := MonthOf(StrToDate(rdt)) - MonthOf(StrToDate(Copy(SGCl.Cells[2, SGCl.row], 1, 10)))
  else
    cmp := MonthOf(StrToDate(rdt)) + 12 - MonthOf(StrToDate(Copy(SGCl.Cells[2, SGCl.row], 1, 10)));
  if (stop[SGCl.Row - 1] = 2) and (status <> 3) and (cmp = 1) then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update sub');
      SQL.Add('set sub=0.00,stop=3');
      SQL.Add('where regn=:id and sdate=convert(smalldatetime,:d,104)');
      ParamByName('id').AsInteger := client;
      ParamByName('d').AsString := rdt;
      ExecSQL;
      Close;
      Close;
      SQL.Clear;
      SQL.Add('update sluj');
      SQL.Add('set sub=0.00');
      SQL.Add('where regn=:id and sdate=convert(smalldatetime,:d,104)');
      ParamByName('id').AsInteger := client;
      ParamByName('d').AsString := rdt;
      ExecSQL;
      Close;
    end;
    stop[SGCl.Row - 1] := 3;
    subs := 0;
    sub[SGCl.Row - 1] := 0;
    SGCl.Cells[4, SGCl.Row] := '0.00';
    Edit4.Text := FlToStr(SetSumSub);
    SGCl.Repaint;
  end
  else
    ShowMessage('���������� ����� ������ ���������������� �������� ��������� ������� �� ��������� 1 ������ �� ��� ������������!');
end;

procedure TForm1.N74Click(Sender: TObject);
{*******************************************************************************
  ��������� ��������������� �������� � ������� �������� ������� ���������� �������.
  � ������� sub �������� ���� stop ��������������� � 1, � � ������� �������� � ���������
  ����������� ������� ��������(����������, ����� ���� ������� ������������).
*******************************************************************************}
var
  c: TClient;
  i: integer;
  cmp: integer;
  s: real;
begin
  if YearOf(StrToDate(rdt)) = YearOf(StrToDate(Copy(SGCl.Cells[2, SGCl.row], 1, 10))) then
    cmp := MonthOf(StrToDate(rdt)) - MonthOf(StrToDate(Copy(SGCl.Cells[2, SGCl.row], 1, 10)))
  else
    cmp := MonthOf(StrToDate(rdt)) + 12 - MonthOf(StrToDate(Copy(SGCl.Cells[2, SGCl.row], 1, 10)));
  if (stop[SGCl.Row - 1] = 3) and (status <> 3) and (cmp >= 1) then
  begin
    with DModule.Query1 do
    begin
      Close;
      c := TClient.Create(Empty, EmptyC);
      c.SetCalc(client, rdt);
      c.Calc(1);
      Close;
      SQL.Clear;
      SQL.Add('update sub');
      SQL.Add('set pm=:pm,snpm=:snp,sub=:sub,spfree=:sp,stop=1');
      SQL.Add('where sdate=CONVERT(smalldatetime,:s,104) and regn=:r');
      SQL.Add('and service=:serv');
      ParamByName('s').AsString := rdt;
      ParamByName('r').AsInteger := client;
      s := 0;
      for i := 0 to numbtarif - 1 do
      begin
        if (i < 8) or (i > 11) then
        begin
          ParamByName('serv').AsInteger := i;
          ParamByName('pm').AsFloat  := c.cdata.pm[i];
          ParamByName('snp').AsFloat := c.cdata.snpm[i];
          ParamByName('sub').AsFloat := c.cdata.sub[i];
          ParamByName('sp').AsFloat  := c.cdata.fpm[i];
          ExecSQL;
          s := s + c.cdata.sub[i];
        end;
      end;
    end;
    stop[SGCl.Row - 1] := 1;
    subs := s;
    sub[SGCl.Row - 1] := s;
    SGCl.Cells[4, SGCl.Row] := FlToStr(sub[SGCl.Row - 1]);
    Edit4.Text := FlToStr(SetSumSub);
    SGCl.Repaint;
  end
  else
    ShowMessage('����������� ����� ������ ������������ �������� ��������� ������� �� ��������� 1 ������ �� ��� ������������!');
end;

procedure TForm1.N93Click(Sender: TObject);
{*******************************************************************************
  ��������� ��������������� �������� � ������� �������� ������� ���������� �������,
  � �������� ���� ������� ������������, ����������� ��� �������������, �
  ����������������� ������� ���������.
  � ������� sub �������� ���� stop ��������������� � 0, � � ������� �������� � ���������
  ����������� ������� ��������(����������, ����� ���� ������� ������������).
*******************************************************************************}
var
  c: TClient;
  i: integer;
  s: real;
begin
  if stop[SGCl.Row - 1] = 2 then
  begin
    with DModule.Query1 do
    begin
      Close;
      c := TClient.Create(Empty, EmptyC);
      c.SetCalc(client, rdt);
      c.Calc(1);
      Close;
      SQL.Clear;
      SQL.Add('update sub');
      SQL.Add('set pm=:pm,snpm=:snp,sub=:sub,spfree=:sp,stop=0');
      SQL.Add('where sdate=CONVERT(smalldatetime,:s,104) and regn=:r');
      SQL.Add('and service=:serv');
      ParamByName('s').AsString := rdt;
      ParamByName('r').AsInteger := client;
      s := 0;
      for i := 0 to numbtarif - 1 do
      begin
        if (i < 8) or (i > 11) then
        begin
          ParamByName('serv').AsInteger := i;
          ParamByName('pm').AsFloat  := c.cdata.pm[i];
          ParamByName('snp').AsFloat := c.cdata.snpm[i];
          ParamByName('sub').AsFloat := c.cdata.sub[i];
          ParamByName('sp').AsFloat  := c.cdata.fpm[i];
          ExecSQL;
          s := s + c.cdata.sub[i];
        end;
      end;
    end;
    stop[SGCl.Row - 1] := 0;
    subs := s;
    sub[SGCl.Row - 1] := s;
    SGCl.Cells[4, SGCl.Row] := FlToStr(sub[SGCl.Row - 1]);
    Edit4.Text := FlToStr(SetSumSub);
    SGCl.Repaint;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  SGCl.SetFocus;
  GridPanel1.Realign;
  ReloadConfig;
end;

{ TAdditionRepData }

procedure TAdditionRepData.Clear;
begin
  Num1  := '_____________';
  Num2  := '_____________';
  toNum := '_______________________';
  soluteNum := '_____________';
  zipCode := '_____________';
  StartDate := '01.___.20___';
  spec2 := '';
  sumBeg := '_______';
  basetext := '';
  insp :=  False;
end;

end.

