unit main;

interface

uses
  Buttons, Classes, ComCtrls, comobj, Controls, DB, Dialogs, Windows,
  ExtCtrls, Forms, frxClass, frxDBSet, Graphics, Grids, ImgList, Menus, ADODB,
  Messages, Registry, StdCtrls, SysUtils, Variants, dbf, ActnList, XPStyleActnCtrls,
  ActnMan, ActnCtrls, ActnMenus, ToolWin, SevenZipVCL, Math, StrUtils, frxExportXLS,
  OleServer, ExcelXP;

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

  TLoginMode = (lNone, lInsp, lAdmin);

  TMainForm = class(TForm)
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
    aAdminMode: TAction;
    aFactSumRpt: TAction;
    aChangeAdminPasswd: TAction;
    aInformKarta: TAction;
    aCheckHouse: TAction;
    aFormDebt: TAction;
    aDebtShow: TAction;
    aBackupData: TAction;
    aClArch: TAction;
    aExporDolg: TAction;
    aExportSocProt: TAction;
    Action22: TAction;
    aErrorList: TAction;
    aClRecalc: TAction;
    aClNoNpss: TAction;
    Panel3: TPanel;
    Button7: TButton;
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
    procedure aAdminModeExecute(Sender: TObject);
    procedure aFactSumRptExecute(Sender: TObject);
    procedure aChangeAdminPasswdExecute(Sender: TObject);
    procedure aInformKartaExecute(Sender: TObject);
    procedure aCheckHouseExecute(Sender: TObject);
    procedure aDebtShowExecute(Sender: TObject);
    procedure aFormDebtExecute(Sender: TObject);
    procedure aBackupDataExecute(Sender: TObject);
    procedure aClListExecute(Sender: TObject);
    procedure aExporDolgExecute(Sender: TObject);
    procedure aExportSocProtExecute(Sender: TObject);
    procedure Action22Execute(Sender: TObject);
    procedure aErrorListExecute(Sender: TObject);
    procedure Button7Click(Sender: TObject);
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
    office:       integer;//������� �������
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
    LoginMode: TLoginMode;//������� ����� ������������
    idOffice:     integer;//������� id ����������
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
  end;

var
  MainForm:     TMainForm;
  searchbuf: string; //�������� ����� ����, ������� ������������ ��� ������ ��� �������
  LastTime:  TTime;  //����� ���������� ������� �������
  ItemIndex: integer;//������������ ��� ������ ��� �������
  curregn:   integer;

implementation

uses
  sclient, inspector, district, street, fond, manager, privilege, minimum, status,
  tarif, elpower, uSelectDist, opend, houses, norm, chpriv, chhouse, bank, about,
  datamodule, search, service, service2, fstruct, imexp, SQL, progress, Contnrs, DateUtils,
  rstnd, loop, tarifb, chinsp, curhist, chserv, Client, merge, mdd, statage,
  statlm, codedbf, chtarifs, rrecalc, stat, padegFIO, uSluj, uConnection,
  uSettings, uReportData, uGenRefBook, uReportEdit, uShade, wincontrols, md5, appregistry, MyTypes,
  uOffice;

{$R *.dfm}
{$I Revision.inc}

procedure TMainForm.WMEnable(var Message: TWMEnable);
begin
  inherited;
  if Message.Enabled then
    FreeAndNil(FShaderForm)
  else
    FShaderForm:= TShadeForm.Execute(Self);
end;

procedure TMainForm.SetTarifs;
begin
  with DModule do
  begin
    pv.Connection := DModule.sqlConnection;
    norm1.Connection := DModule.sqlConnection;

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

    t1.SQL.Text :=  'select * from curcont';
    t2.SQL.Text :=  'select * from currep';
    t3.SQL.Text :=  'select * from curcold';
    t4.SQL.Text :=  'select * from curhot';
    t5.SQL.Text :=  'select * from curcanal';
    t6.SQL.Text :=  'select * from curheat';
    t7.SQL.Text :=  'select * from curgas';
    t8.SQL.Text :=  'select * from curel';
    t9.SQL.Text :=  'select * from curwood';
    t10.SQL.Text := 'select * from curcoal';

    pv.SQL.Text :=    'select * from priv';
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

function TMainForm.CheckP1: bool;
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

function TMainForm.CheckP2: bool;
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

procedure TMainForm.aAboutExecute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.aChangeAdminPasswdExecute(Sender: TObject);
var
  old_passwd, new_passwd: String;
begin
  old_passwd := InputPassword('������� ������ ������ ��������������!', '������:', '');
  old_passwd := GetConnectionPass(GenMD5Password(old_passwd));

  if GetConnectionPass(ReadRegProperty('Password')) <> old_passwd then
  begin
    MessageDlg('Error! ��������� ������ �� ��������� �� ������!', mtError, [mbOK], 0);
    exit;
  end;

  new_passwd := InputPassword('������� ����� ������ ��������������!', '������:', '');
  try
    new_passwd := GenMD5Password(new_passwd);
    with Dmodule.sqlQuery1 do begin
      Close;
      SQL.Text := 'ALTER LOGIN subuser WITH PASSWORD = ' + QuotedStr(GetConnectionPass(new_passwd)) + ' OLD_PASSWORD = ' + QuotedStr(old_passwd);//:oldpass;';
    end;

    Dmodule.sqlQuery1.ExecSQL;
    
    WriteRegProperty('Password', new_passwd);
    MessageDlg('������ ���������� �������������� ���������� ���������', mtConfirmation, [mbOk], 0);
    with TMyThread.Create(True) do begin
      FreeOnTerminate := True;
      Resume;
    end;
    halt;
  except
    WriteRegProperty('Password', old_passwd);
    MessageDlg('������ ��� ���������� ������', mtError, [mbOk], 0);
  end;
end;

procedure TMainForm.aCheckHouseExecute(Sender: TObject);
var
  C:  TClient;
  i, j, cnt, n, maxid: integer;
  pr: TAboutBox1;
  t, st: array of integer;
  fix: boolean;
  fixHouses: TStringList;
  stringStrt: string;
begin
  fix := False;
  if LoginMode = lAdmin then
    if MessageDlg('��������� ���� �������������?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
      fix := True;
  
  if (Length(cl) <> 0) then
  begin
    fixHouses := TStringList.Create;
    if CheckP1 then
    begin//������ �� ������� �����
      pr := TAboutBox1.Create(Application);
      pr.Label1.Caption := '';
      pr.Label2.Caption := '���������� �������:';
      pr.Label3.Caption := '';
      pr.Show;
      pr.Update;
      SendMessage(pr.Handle, wm_paint, 0, 0);
      pr.ProgressBar1.Step := 1;

      cnt := 0;
      try
        DModule.sqlConnection.BeginTrans;
        with DModule.sqlQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('execute getncl :idd,:nd');
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'idd', dist);
          SetParam(Parameters, 'nd', rdt);
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
              c.SetClient(curregn, MainForm.rdt);
              c.SetCalc(curregn, MainForm.rdt);

              //���� ������ �� �������������(2) � �� ���������(3), �� ������������ ����������, �����
              //������������� ���������� �������
              if (c.cdata.stop = 2) or (c.cdata.stop = 3) then
                Continue;

              if not ExistHouse(n, c) then
              begin
                if not fix then
                begin
                  if c.data.corp = '' then
                    stringStrt := format('%s �.%s',[SelStr(c.data.str), c.data.nh])
                  else
                    stringStrt := format('%s �.%s/%s',[SelStr(c.data.str), c.data.nh, c.data.corp]);
                end;
                if fixHouses.IndexOf(stringStrt) = -1 then
                  fixHouses.Add(stringStrt);
                if fix then
                begin
                  Close;
                  SQL.Clear;
                  SQL.Add('execute maxhouse :dist');
                  Parameters.ParseSQL(SQL.Text, True);
                  SetParam(Parameters, 'dist', C.Data.dist);
                  Open;
                  maxid := FieldByName('mid').AsInteger;
                  Inc(maxid);
                  if c.data.corp = '' then
                    stringStrt := (format('%d;%s �.%s',[maxid, SelStr(c.data.str), c.data.nh]))
                  else
                    stringStrt := (format('%d;%s �.%s/%s',[maxid, SelStr(c.data.str), c.data.nh, c.data.corp]));

                  if fixHouses.IndexOf(stringStrt) = -1 then
                    fixHouses.Add(stringStrt);
                  Close;
                  SQL.Clear;
                  SQL.Add('insert into house');
                  SQL.Add('values (:id,:dist,:str,:nh,:cp,:stnd,');
                  SQL.Add(':cont,:rep,:cold,:hot,:canal,:heat,:gas,');
                  SQL.Add(':el, :wood, :coal, :mng, :fnd,:boil, :elevator)');
                  Parameters.ParseSQL(SQL.Text, True);
                  SetParam(Parameters, 'id', maxid);
                  SetParam(Parameters, 'dist', C.Data.dist);
                  SetParam(Parameters, 'str', C.Data.str);
                  SetParam(Parameters, 'nh', C.Data.nh);
                  SetParam(Parameters, 'cp', C.Data.corp);
                  SetParam(Parameters, 'stnd', C.cdata.rstnd);
                  SetParam(Parameters, 'cont', C.cdata.tarifs[0]);
                  SetParam(Parameters, 'rep', C.cdata.tarifs[1]);
                  SetParam(Parameters, 'cold', C.cdata.tarifs[2]);
                  SetParam(Parameters, 'hot', C.cdata.tarifs[3]);
                  SetParam(Parameters, 'canal', C.cdata.tarifs[4]);
                  SetParam(Parameters, 'heat', C.cdata.tarifs[5]);
                  SetParam(Parameters, 'gas', C.cdata.tarifs[6]);
                  SetParam(Parameters, 'el', C.cdata.tarifs[7]);
                  SetParam(Parameters, 'wood', C.cdata.tarifs[12]);
                  SetParam(Parameters, 'coal', C.cdata.tarifs[13]);
                  SetParam(Parameters, 'mng', C.Data.manager);
                  SetParam(Parameters, 'fnd', C.Data.fond);
                  SetParam(Parameters, 'boil', C.cdata.boiler);
                  SetParam(Parameters, 'elevator', C.cdata.elevator);
                  ExecSQL;
                end;
              end;
              Inc(cnt);
              pr.ProgressBar1.StepIt;
              pr.Label3.Caption := IntToStr(cnt);
              pr.Update;
              SendMessage(pr.Handle, wm_paint, 0, 0);
            end;
          end;
        end;
        DModule.sqlConnection.CommitTrans;
      except
        DModule.sqlConnection.RollbackTrans
      end;
      pr.Free;
    end;
    fixHouses.Sort;
    with TSaveDialog.Create(MainForm) do
    begin
      Filter := 'CSV (Ms-DOS)|*.csv';
      if Execute then
        fixHouses.SaveToFile(FileName+'.csv');
    end;
  end;
end;

procedure TMainForm.aClAddExecute(Sender: TObject);
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
    EditClForm.mode := vAdd;
    EditClForm.ShowModal;
  end
  else
    ShowMessage('�������� ������� ����� ������ � ������� �� ��������� ��� ��������� �� ��� �������� ������!');
end;

procedure TMainForm.aClDelExecute(Sender: TObject);
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
      if MessageBox(MainForm.Handle, PChar('�������� ������� ' + SGCL.Cells[0, i + 1] + '.' + #13 +
        '�������������?'), PChar('�������� �������'),
        MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
      begin
        DModule.sqlConnection.BeginTrans;
        try
          with DModule.sqlQuery1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('delete from cl');
            SQL.Add('where regn = :id');
            Parameters.ParseSQL(SQL.Text, True);
            SetParam(Parameters, 'id', client);
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from hist');
            SQL.Add('where regn = :id and bdate=convert(smalldatetime,:d,104)');
            Parameters.ParseSQL(SQL.Text, True);
            SetParam(Parameters, 'id', client);
            SetParam(Parameters, 'd', MainForm.rdt);
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from fam');
            SQL.Add('where regn = :id');
            Parameters.ParseSQL(SQL.Text, True);
            SetParam(Parameters, 'id', client);
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from sub');
            SQL.Add('where regn = :id');
            Parameters.ParseSQL(SQL.Text, True);
            SetParam(Parameters, 'id', client);
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from sluj');
            SQL.Add('where regn = :id');
            Parameters.ParseSQL(SQL.Text, True);
            SetParam(Parameters, 'id', client);
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from FactSale');
            SQL.Add('where regn = :id');
            Parameters.ParseSQL(SQL.Text, True);
            SetParam(Parameters, 'id', client);
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from FactBalance');
            SQL.Add('where regn = :id');
            Parameters.ParseSQL(SQL.Text, True);
            SetParam(Parameters, 'id', client);
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from Counters');
            SQL.Add('where regn = :id');
            Parameters.ParseSQL(SQL.Text, True);
            SetParam(Parameters, 'id', client);
            ExecSQL;
            Close;
          end;
          DModule.sqlConnection.CommitTrans;
          Res := 0;
        except
          //�� ��������� ����������
          DModule.sqlConnection.RollbackTrans;
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

procedure TMainForm.aClEditExecute(Sender: TObject);
{*******************************************************************************
  ��������� �������� ����� ��������/�������� �������.
  ���� ���� �����, �� �� ���� �������� ��������������� ���������.
*******************************************************************************}
begin
  if (Length(cl) > 0) then
  begin
    if (stop[SGCl.Row - 1] < 2) or (stop[SGCl.Row - 1] > 1) and (status = 3) then
    begin
      EditClForm.mode := vEdit;
      EditClForm.ShowModal;
    end
    else
      ShowMessage('����� ������� ������������� ��� ���������!' + #13 +
        '�������� �������� ������ ����� ������������� �������� ��� �� ��������� ����� ��������.');
  end
  else
    ShowMessage('���� �����!');
end;

procedure TMainForm.aCodePageExecute(Sender: TObject);
begin
  Form41.ShowModal;
end;

procedure TMainForm.aConfExecute(Sender: TObject);
begin
  SettingsFrm.ShowModal;
  ReloadConfig; //��������� ����� ���������
end;

function TMainForm.ACount: integer;
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

procedure TMainForm.Action10Execute(Sender: TObject);
{ ���������� ����� ��������� }
begin
  with GenRefBookFrm do
  begin
    mode := mSettlingType;
    status := sec1;
    ShowModal;
  end;
end;

procedure TMainForm.Action11Execute(Sender: TObject);
{ ���������� ����� �������� }
begin
  with GenRefBookFrm do
  begin
    mode := mControl;
    status := sec1;
    ShowModal;
  end;
end;

procedure TMainForm.Action12Execute(Sender: TObject);
{ ���������� ��������� }
begin
  with GenRefBookFrm do
  begin
    mode := mRelation;
    status := sec1;
    ShowModal;
  end;
end;

procedure TMainForm.Action13Execute(Sender: TObject);
{ ���������� ����� }
begin
  Form11.status := sec1;
  Form11.ShowModal;
end;

procedure TMainForm.Action14Execute(Sender: TObject);
{ ���������� ���������� �������� }
begin
  Form14.status := sec1;
  Form14.ShowModal;
end;

procedure TMainForm.Action15Execute(Sender: TObject);
{ ���������� ���. ���� }
begin
  Form27.status := sec1;
  Form27.ShowModal;
end;

procedure TMainForm.Action16Execute(Sender: TObject);
{ ���������� ����������� ��������� }
begin
  Form13.status := sec1;
  Form13.ShowModal;
end;

procedure TMainForm.Action17Execute(Sender: TObject);
{*******************************************************************************
  ��������� �������� ���������� ������������ c��������� ��������� ���.
*******************************************************************************}
begin
  Form38.status := sec1;
  Form38.ShowModal;
end;

procedure TMainForm.Action18Execute(Sender: TObject);
{  ����� ����� ��������� ��� }
begin
  Form20.status := sec1;
  Form20.ShowModal;
end;

procedure TMainForm.Action19Execute(Sender: TObject);
{ ����� ����� �� ������� ����� }
begin
  Form42.status := sec1;
  Form42.ShowModal;
end;

procedure TMainForm.Action1Execute(Sender: TObject);
{*******************************************************************************
    ��������� N25Click ������������ ������� ������ ���� � �������� ����������
  �����������.
    ����� ��� �������� � ������� ����� ������������� ������� ��������� � ����������
  ��������������� ������� � statusbar.
*******************************************************************************}
begin
  Form3.status := sec1;
  Form3.ShowModal;
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select nameinsp');
    SQL.Add('from insp');
    SQL.Add('where (id_insp = :id)and(id_dist=:idd)');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'id', insp);
    SetParam(Parameters, 'idd', dist);
    Open;
    Statusbar1.Panels[1].Text := '���������: ' + FieldByName('nameinsp').AsString;
    Close;
  end;
end;

procedure TMainForm.Action20Execute(Sender: TObject);
{*******************************************************************************
  ��������� ��������� ������� ������� �������, ��������� � ���.����������.
*******************************************************************************}
begin
  FillCurr(bpath, rdt, dist, MainForm.codedbf);
end;

procedure TMainForm.Action21Execute(Sender: TObject);
var
  xlsExport: TfrxXLSExport;
begin
  with DModule do
  begin
    sqlQuery1.Close;
    sqlQuery1.SQL.Text := 'EXEC mintrudmounth ' + quotedstr(rdt);
    sqlQuery1.Open;
  end;

  frxData.DataSource := DModule.DataSource1;
  frxReport1.LoadFromFile(PChar(reports_path + 'mintrudmount.fr3'));

  frxReport1.Variables.Variables['month'] := quotedstr(LongMonthNames[StrToInt(FormatDateTime('m', StrToDate(rdt)))]);
  frxReport1.Variables.Variables['rdt']  := quotedstr(rdt);

  frxReport1.PrepareReport;

  if MessageBox(MainForm.Handle, PChar('�������������� � Excel ?'),
    PChar('������� � Excel'), MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
  begin
    xlsExport :=  TfrxXLSExport.Create(frxReport1);
    frxReport1.Export(xlsExport);
  end;

  frxReport1.ShowPreparedReport;
end;

procedure TMainForm.Action22Execute(Sender: TObject);
begin
  OfficeForm.status := sec1;
  OfficeForm.ShowModal;
end;

procedure TMainForm.Action2Execute(Sender: TObject);
{*******************************************************************************
  ����� ����������� �������. ����� ��� �������� � ������� ����� �������������
  ������� ����� � ���������.
*******************************************************************************}
begin
  Form4.status := sec1;
  Form4.ShowModal;
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select namedist,nameinsp');
    SQL.Add('from dist inner join insp on dist.id_dist=insp.id_dist');
    SQL.Add('where dist.id_dist = :id');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'id', dist);
    Open;
    Statusbar1.Panels[2].Text := '�����: ' + FieldByName('namedist').AsString;
    Statusbar1.Panels[1].Text := '���������: ' + FieldByName('nameinsp').AsString;
    Close;
  end;
end;

procedure TMainForm.Action3Execute(Sender: TObject);
{ ���������� ���� }
begin
  Form5.status := sec1;
  Form5.ShowModal;
end;

procedure TMainForm.Action4Execute(Sender: TObject);
{ ���������� ����� }
begin
  Form30.status := sec1;
  Form30.ShowModal;
end;

procedure TMainForm.Action5Execute(Sender: TObject);
{ ���������� �������������� ����� }
begin
  Form7.status := sec1;
  Form7.ShowModal;
end;

procedure TMainForm.Action6Execute(Sender: TObject);
{ ���������� �������� ������ }
begin
  Form6.status := sec1;
  Form6.ShowModal;
end;

procedure TMainForm.Action7Execute(Sender: TObject);
{ ���������� ������ }
begin
  Form31.status := sec1;
  Form31.ShowModal;
end;

procedure TMainForm.Action8Execute(Sender: TObject);
{ ���������� ����� ���������� }
begin
  with GenRefBookFrm do
  begin
    mode := mCertification;
    status := sec1;
    ShowModal;
  end;
end;

procedure TMainForm.Action9Execute(Sender: TObject);
{ ���������� ����� �������� }
begin
  with GenRefBookFrm do
  begin
    mode := mOwnType;
    status := sec1;
    ShowModal;
  end;
end;

procedure TMainForm.aClStopSubsidyExecute(Sender: TObject);
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
    if MessageBox(MainForm.Handle, PChar('������������ ����� �� �������� ������� ' + SGCL.Cells[0, i + 1] + '.' + #13 + '�������������?'), PChar('����� �� ��������'),
      MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
    begin
      reg  := client;
      subr := sub[i];
      fdate := StrToDate(Copy(SGCl.Cells[2, i + 1], 1, 10));
      ldate := StrToDate(Copy(SGCl.Cells[2, i + 1], 14, 10));
      with DModule.sqlQuery1 do
      begin
        Close;
        SQL.Text :=
          'update hist' + #13 +
          'set edate=CONVERT(smalldatetime, :d, 104)' + #13 +
          'where regn = :id and bdate<=convert(smalldatetime,:d,104)' + #13 +
          'and edate>convert(smalldatetime,:d,104)';
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', client);
        SetParam(Parameters, 'd', rdt);
        ExecSQL;

        Close;
        SQL.Text :=
          'update cl'#13#10 +
          'set change=CONVERT(smalldatetime, :change, 104)' + #13 +
          'where regn = :id';
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', client);
        SetParam(Parameters, 'change', DateToStr(Date));
        ExecSQL;

        Close;
        SQL.Text :=
          'delete from sub'#13#10 +
          'where (regn=:id)and(sdate>=convert(smalldatetime,:d,104))';
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', client);
        SetParam(Parameters, 'd', rdt);
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
        Edit4.Text := FormatFloat('0.00', ASub);
      end;
    end;
  end;
end;

procedure TMainForm.aClCancelStopExecute(Sender: TObject);
{ ����� - �������������� ����� �������� ����� ������ �� �������� }
var
  i: integer;
  c: TClient;
begin
  if reg <> 0 then
  begin//���������� �����
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update hist');
      SQL.Add('set edate=CONVERT(smalldatetime, :edate, 104)');
      SQL.Add('where regn = :id and edate=convert(smalldatetime,:d,104)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', reg);
      SetParam(Parameters, 'edate', DateToStr(ldate));
      SetParam(Parameters, 'd', rdt);
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
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 's', rdt);
      SetParam(Parameters, 'r', client);
      for i := 0 to numbtarif - 1 do
      begin
        if (i < 8) or (i > 11) then
        begin
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'serv', i);
          SetParam(Parameters, 'pm', c.cdata.pm[i]);
          SetParam(Parameters, 'snp', c.cdata.snpm[i]);
          SetParam(Parameters, 'sub', c.cdata.sub[i]);
          SetParam(Parameters, 'sp', c.cdata.fpm[i]);
          ExecSQL;
        end;
      end;
      i := FindCl(reg, cl);
      st[i] := GetStatus(fdate, ldate);
      status := st[i];
      client := cl[i];
      subs := subr;
      SGCl.Cells[2, i + 1] := DateToStr(fdate) + ' - ' + DateToStr(ldate);
      SGCl.Cells[4, i + 1] := FormatFloat('0.00', subs);
      SGCl.Row := i + 1;
      Edit4.Text := FormatFloat('0.00', ASub);
      SGCl.Repaint;
    end;
    //����� ����������, �������� ���������� ������
    reg  := 0;
    subr := 0;
  end
  else
    ShowMessage('����������� ������� �����!');
end;

procedure TMainForm.aClPauseExecute(Sender: TObject);
{*******************************************************************************
  ��������� ���������������� �������� � ������� �������� ������� ���������� �������.
  � ������� hist �������� ���� stop ��������������� � 2, � � ������� �������� � ���������
  ���������� ������� ��������(����������, ����� ���� ������� ������������).
*******************************************************************************}
begin
  if (stop[SGCl.Row - 1] = 0) and (status <> 3) then
  begin
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update sub');
      SQL.Add('set sub=0.00,stop=2');
      SQL.Add('where regn=:id and sdate=convert(smalldatetime,:d,104)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', client);
      SetParam(Parameters, 'd', rdt);
      ExecSQL;
      Close;
      Close;
      SQL.Clear;
      SQL.Add('update sluj');
      SQL.Add('set sub=0.00');
      SQL.Add('where regn=:id and sdate=convert(smalldatetime,:d,104)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', client);
      SetParam(Parameters, 'd', rdt);
      ExecSQL;
      Close;
    end;
    stop[SGCl.Row - 1] := 2;
    subs := 0;
    sub[SGCl.Row - 1] := 0;
    SGCl.Cells[4, SGCl.Row] := '0.00';
    Edit4.Text := FormatFloat('0.00', SetSumSub);
    SGCl.Repaint;
  end
  else
    ShowMessage('������������� ����� ������ ����������� �������� ��������� �������!');
end;

procedure TMainForm.aClStopExecute(Sender: TObject);
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
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update sub');
      SQL.Add('set sub=0.00,stop=3');
      SQL.Add('where regn=:id and sdate=convert(smalldatetime,:d,104)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', client);
      SetParam(Parameters, 'd', rdt);
      ExecSQL;
      Close;
      Close;
      SQL.Clear;
      SQL.Add('update sluj');
      SQL.Add('set sub=0.00');
      SQL.Add('where regn=:id and sdate=convert(smalldatetime,:d,104)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', client);
      SetParam(Parameters, 'd', rdt);
      ExecSQL;
      Close;
    end;
    stop[SGCl.Row - 1] := 3;
    subs := 0;
    sub[SGCl.Row - 1] := 0;
    SGCl.Cells[4, SGCl.Row] := '0.00';
    Edit4.Text := FormatFloat('0.00', SetSumSub);
    SGCl.Repaint;
  end
  else
    ShowMessage('���������� ����� ������ ���������������� �������� ��������� ������� �� ��������� 1 ������ �� ��� ������������!');
end;

procedure TMainForm.aClPlayExecute(Sender: TObject);
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
    with DModule.sqlQuery1 do
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
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 's', rdt);
      SetParam(Parameters, 'r', client);
      s := 0;
      for i := 0 to numbtarif - 1 do
      begin
        if (i < 8) or (i > 11) then
        begin
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'serv', i);
          SetParam(Parameters, 'pm', c.cdata.pm[i]);
          SetParam(Parameters, 'snp', c.cdata.snpm[i]);
          SetParam(Parameters, 'sub', c.cdata.sub[i]);
          SetParam(Parameters, 'sp', c.cdata.fpm[i]);
          ExecSQL;
          s := s + c.cdata.sub[i];
        end;
      end;
    end;
    stop[SGCl.Row - 1] := 1;
    subs := s;
    sub[SGCl.Row - 1] := s;
    SGCl.Cells[4, SGCl.Row] := FormatFloat('0.00', sub[SGCl.Row - 1]);
    Edit4.Text := FormatFloat('0.00', SetSumSub);
    SGCl.Repaint;
  end
  else
    ShowMessage('����������� ����� ������ ���������������� ��� ������������ �������� ��������� ������� �� ��������� 1 ������ �� ��� ������������!');
end;

procedure TMainForm.aClUndoExecute(Sender: TObject);
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
    with DModule.sqlQuery1 do
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
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 's', rdt);
      SetParam(Parameters, 'r', client);
      s := 0;
      for i := 0 to numbtarif - 1 do
      begin
        if (i < 8) or (i > 11) then
        begin
          SetParam(Parameters, 'serv', i);
          SetParam(Parameters, 'pm', c.cdata.pm[i]);
          SetParam(Parameters, 'snp', c.cdata.snpm[i]);
          SetParam(Parameters, 'sub', c.cdata.sub[i]);
          SetParam(Parameters, 'sp', c.cdata.fpm[i]);
          ExecSQL;
          s := s + c.cdata.sub[i];
        end;
      end;
    end;
    stop[SGCl.Row - 1] := 0;
    subs := s;
    sub[SGCl.Row - 1] := s;
    SGCl.Cells[4, SGCl.Row] := FormatFloat('0.00', sub[SGCl.Row - 1]);
    Edit4.Text := FormatFloat('0.00', SetSumSub);
    SGCl.Repaint;
  end;
end;

procedure TMainForm.aClAddMountExecute(Sender: TObject);
var
  i: integer;
begin
  i := SGCl.Row - 1;
  with DModule.sqlQuery1 do
  begin
    if MessageBox(MainForm.Handle, PChar('�������� ����� ������� ' + SGCL.Cells[0, i + 1] + ' �� ������ ' + SGCL.Cells[2, i + 1] + '.' + #13 + '�������������?'), PChar('����� �� ��������'),
      MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from hist where regn = :idd and edate >=:d');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'idd', client);
      SetParam(Parameters, 'd', StrToDateTime(rdt));
      Open;
      if IncMonth(FieldByName('bdate').Value, 6) = FieldByName('edate').Value then
        ShowMessage('����� ������� ��������� ��� ������...')
      else
      begin
        Close;
        SQL.Clear;
        SQL.Add('update hist set edate = dateadd(month, 1, edate) where hist.regn = :r and edate >= :d');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'r', client);
        SetParam(Parameters, 'd', StrToDateTime(rdt));
        ExecSQL;
        Close;
      end;
    end;
  end;
end;

procedure TMainForm.aClListExecute(Sender: TObject);
var main_query
   ,filter_sql
   ,additional_sql
   ,report_title : string;
begin
  main_query :=
    'SELECT cl.regn, cl.fio, dbo.getcl_address(cl.regn) as address'+cBr+
    'FROM cl INNER JOIN'+cBr+
      'Hist ON cl.regn=hist.regn'+cBr+
      '%ADDITIONAL%'+cBr+
    'WHERE (cl.id_dist=:dist)%FILTER%'+cBr+
    'ORDER BY fio, address';

  //������������� �� �������
  if office <> -1 then
  begin
    additional_sql := 'INNER JOIN Insp ON Insp.id_insp = Hist.id_insp';
    filter_sql     := 'and(insp.id_dist = cl.id_dist)and(Insp.id_office = :office)';
  end;

  if (Sender as TAction) = aClArch then
  begin
    filter_sql   := filter_sql + 'and(hist.bdate=convert(smalldatetime,:date, 104))';
    report_title := '������ �� �����';
  end
  else if (Sender as TAction) = aClRecalc then
  begin
    filter_sql   := filter_sql + 'and(hist.edate=CONVERT(smalldatetime, :de, 104))';
    report_title := '������ �� ��������������';
  end
  else if TAction(Sender) = aClNoNpss then
  begin
    additional_sql := additional_sql + ' INNER JOIN (SELECT regn, npss FROM Fam WHERE id_mem=cast(regn as VARCHAR)+''0'' and(ISNULL(npss,'''')='''')) tFam' +
      ' ON cl.regn=tFam.regn ';
    filter_sql   := filter_sql + 'and(hist.bdate<=CONVERT(smalldatetime,:date,104))'+
                                 'and(hist.edate>CONVERT(smalldatetime,:date,104))';
    report_title := '������ �������� � ������������� �������';
  end;

    with DModule.sqlQuery1 do begin
      Close;
      SQL.Text := StringReplace(
                  StringReplace(main_query, '%ADDITIONAL%', additional_sql, [rfreplaceall]), '%FILTER%', filter_sql, [rfreplaceall]);
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'dist', MainForm.dist);
      SetParam(Parameters, 'date', MainForm.rdt);
      SetParam(Parameters, 'office', MainForm.office);
      SetParam(Parameters, 'de', DateToStr(IncMonth(StrToDate(MainForm.rdt), 1)));
      Open;
    end;

  frxData.DataSource := DModule.DataSource1;
  frxReport1.LoadFromFile(PChar(reports_path + 'cllist.fr3'));

  frxReport1.Variables.Variables['month'] := quotedstr(LongMonthNames[StrToInt(FormatDateTime('m', StrToDate(rdt)))]);
  frxReport1.Variables.Variables['year']  := FormatDateTime('YYYY', StrToDate(rdt));
  frxReport1.Variables.Variables['recCount']  := DModule.sqlQuery1.RecordCount;
  frxReport1.Variables.Variables['dist'] := quotedstr(SelDist(MainForm.dist));
  frxReport1.Variables.Variables['boss'] := quotedstr(SelBoss(dist));
  frxReport1.Variables.Variables['report_title'] := quotedstr(report_title);
  frxReport1.PrepareReport;

  frxReport1.ShowPreparedReport;
end;

procedure TMainForm.aClDelCurPeriodExecute(Sender: TObject);
var
  i: integer;

function GetCert(regn: integer): integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text := ('SELECT id_cert FROM hist');
    SQL.Add('WHERE regn = :id and bdate=convert(smalldatetime,:d,104)');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'id', client);
    SetParam(Parameters, 'd', MainForm.rdt);
    Open;
    First;
  end;
  Result := DModule.sqlQuery1.FieldByName('id_cert').Value;
end;

begin
  if (Length(cl) > 0) then
  begin
    if (status = 0) then // and (GetCert(client) = 2) then
    begin
      i := SGCl.Row - 1;
      if MessageBox(MainForm.Handle, PChar('�������� � ������� "' + SGCL.Cells[0, i + 1] + '" �������� �������.' + #13 +
        '�������������?'), PChar('�������� � ������� �������� �������'),
        MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
      begin
        DModule.sqlConnection.BeginTrans;
        try
          with DModule.sqlQuery1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('delete from hist');
            SQL.Add('where regn = :id and bdate=convert(smalldatetime,:d,104)');
            Parameters.ParseSQL(SQL.Text, True);
            SetParam(Parameters, 'id', client);
            SetParam(Parameters, 'd', MainForm.rdt);
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from sub');
            SQL.Add('where regn = :id and sdate=convert(smalldatetime,:d,104)');
            Parameters.ParseSQL(SQL.Text, True);
            SetParam(Parameters, 'id', client);
            SetParam(Parameters, 'd', MainForm.rdt);
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from sluj');
            SQL.Add('where regn = :id and sdate=convert(smalldatetime,:d,104)');
            Parameters.ParseSQL(SQL.Text, True);
            SetParam(Parameters, 'id', client);
            SetParam(Parameters, 'd', MainForm.rdt);
            ExecSQL;
            Close;
          end;
          DModule.sqlConnection.CommitTrans;
          Reload;
        except
          //�� ��������� ����������
          DModule.sqlConnection.RollbackTrans;
        end;
      end;
    end
    else
      ShowMessage('� ������� ������ ������� ������� ����!');
  end
  else
    ShowMessage('���� �����!');
end;

procedure TMainForm.aClDelAllNullExecute(Sender: TObject);
var
  i: integer;
begin
  i := SGCl.Row - 1;
  with DModule.sqlQuery1 do
  begin
    if MessageBox(MainForm.Handle, PChar('������� ��������� ������ � ������� �������? ' + SGCL.Cells[0, i + 1] + '.' + #13 + '�������������?'), PChar('����� �� ��������'),
      MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from hist where hist.regn = :r and bdate =:d');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'r', client);
      SetParam(Parameters, 'd', StrToDateTime(rdt));
      ExecSQL;
      Close;
    end;
  end;
end;

procedure TMainForm.aRepUvedomExecute(Sender: TObject);
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
  tmpQuery: TADOQuery;

  procedure GetPPriv;
  begin
    priv := TStringList.Create;
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select namepriv');
      SQL.Add('from priv inner join fam');
      SQL.Add('on priv.id_priv=fam.id_priv');
      SQL.Add('where (fam.regn=:id)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', client);
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
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_service');
      SQL.Add('from sub');
      SQL.Add('where (regn=:id)and(service=7)and(sdate=convert(smalldatetime,:d,104))');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', client);
      SetParam(Parameters, 'd', s1);
      Open;
      pl := FieldByName('id_service').AsInteger;
      Close;
    end;
    with DModule.qTarif do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select el.plate');
      SQL.Add('from curel.dbf el');
      SQL.Add('where el.id_el=:id');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', pl);
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
      frxReport1.Variables.Variables['lkoef'] := quotedstr(FormatFloat('0.00', rnd(ppm / pm)))
    else
      frxReport1.Variables.Variables['lkoef'] := '1';//*123

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
  tmpQuery := TADOQuery.Create(DModule.sqlConnection);
  tmpQuery.Connection := DModule.sqlConnection;// .DatabaseName := 'Subsidy';
  if (Length(cl) > 0) then
  begin
    s1 := Copy(SGCl.Cells[2, SGCl.row], 1, 10); //begindate
    s2 := Copy(SGCl.Cells[2, SGCl.row], 14, 10);//enddate

    if subs <> 0.0 then
    begin
      frxReport1.LoadFromFile(PChar(reports_path + 'uvedom.fr3'));
      frxData.DataSet := tmpQuery;
      frxData1.DataSet := DModule.sqlQuery1;

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

      with DModule.sqlQuery1 do
      begin
        Close;                      
        SQL.Clear;
        SQL.Add('execute getcl :id,:d');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', client);
        SetParam(Parameters, 'd', s1);
        Open;
      end;
      with tmpQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('execute getsub :id, :s');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', client);
        SetParam(Parameters, 's', s1);
        Open;
      end;
      i  := 0;
      cd := DModule.sqlQuery1.FieldByName('bdate').AsDateTime;
      while DModule.sqlQuery1.FieldByName('edate').AsDateTime <> cd do
      begin
        cd := IncMonth(cd);
        Inc(i);
      end;

      frxReport1.Variables.Variables['sumsub1'] := 0;
      tmpQuery.First;
      for j := 0 to tmpQuery.RecordCount - 1 do
      begin
        frxReport1.Variables.Variables['sumsub1'] := frxReport1.Variables.Variables['sumsub1'] + tmpQuery.FieldValues['sub'];
        tmpQuery.Next;
      end;

      ReportsFillDistInfo();

      frxReport1.Variables.Variables['cd']  := Quotedstr(rdt);
      frxReport1.Variables.Variables['sd']  := IncMonth(StrToDateTime(rdt));
      frxReport1.Variables.Variables['cm']  := i;
      frxReport1.Variables.Variables['fio'] := Quotedstr(GetFIOPadegFSAS(SGCl.Cells[0, SGCl.row], 3));
      frxReport1.Variables.Variables['fio_g'] := Quotedstr(GetFIOPadegFSAS(SGCl.Cells[0, SGCl.row], 2));
      frxReport1.Variables.Variables['fio_s'] := quotedstr(GetShortName(SGCl.Cells[0, SGCl.row]));

      frxReport1.PrepareReport;
      if MessageBox(MainForm.Handle, PChar('����� ��������������� �������� ����������� ' + SGCL.Cells[0, SGCl.Row] + '?'),
        PChar('��������������� ��������'), MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
        frxReport1.ShowPreparedReport
      else
        frxReport1.Print;
    end
    //sub = 0 ������� �� ������
    else
    begin
      frxReport1.LoadFromFile(PChar(reports_path + 'uvedomo.fr3'));
      frxData.DataSet := tmpQuery;
      frxData1.DataSet := DModule.sqlQuery1;

      frxReport1.Variables.Variables['fio']  := quotedstr(GetFIOPadegFSAS(SGCl.Cells[0, SGCl.row], 3));
      frxReport1.Variables.Variables['fio_n'] := quotedstr(SGCl.Cells[0, SGCl.row]);
      frxReport1.Variables.Variables['fio_g'] := quotedstr(GetFIOPadegFSAS(SGCl.Cells[0, SGCl.row], 2));
      frxReport1.Variables.Variables['fio_s'] := quotedstr(GetShortName(SGCl.Cells[0, SGCl.row]));
      frxReport1.Variables.Variables['address'] := quotedstr(SGCl.Cells[1, SGCl.row]);

      GetPPriv();
      GetPlate();
      GetStnd();

      with DModule.sqlQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('execute getcl :id,:d');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', client);
        SetParam(Parameters, 'd', s1);
        Open;
      end;

      with tmpQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('execute getsub :id, :s');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', client);
        SetParam(Parameters, 's', s1);
        Open;
      end;

      ReportDataFrm := TReportDataFrm.Create(Application);
      ReportDataFrm.RepType := rUvedomo;
      ReportsFillAdditionData(DModule.sqlQuery1.FieldByName('nameinsp').AsString);
      ReportsFillDistInfo();

      frxReport1.PrepareReport;
      if MessageBox(MainForm.Handle, PChar('����� ��������������� �������� ����������� ' + SGCL.Cells[0, SGCl.Row] + '?'),
        PChar('��������������� ��������'),
        MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
        frxReport1.ShowPreparedReport
      else
        frxReport1.Print;
    end;
  end
  else
    ShowMessage('����������� �������� ������ ��� ���������� ��������!');
  tmpQuery.Free;
end;

procedure TMainForm.aRepKartaExecute(Sender: TObject);
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
  tmpQuery, tmpQuery2: TADOQuery;
  
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
  tmpQuery := TADOQuery.Create(DModule);
  tmpQuery.Connection := DModule.sqlConnection;// .DatabaseName := 'Subsidy';
  tmpQuery2 := TADOQuery.Create(DModule);
  tmpQuery2.Connection := DModule.sqlConnection;//
  if (Length(cl) > 0) then
  begin
    if (status < 3) then
    begin
      frxReport1.LoadFromFile(PChar(reports_path + 'karta.fr3'));
      frxData.DataSet := DModule.sqlQuery1;
      frxData1.DataSet := tmpQuery2;
      frxData2.DataSet := tmpQuery;
      priv := TStringList.Create;

      GetStnd();

      s1 := Copy(SGCl.Cells[2, SGCl.row], 1, 10);//begindate
      s2 := Copy(SGCl.Cells[2, SGCl.row], 14, 10);//enddate
      //������ �����
      with DModule.sqlQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select namepriv');
        SQL.Add('from priv inner join fam');
        SQL.Add('on priv.id_priv=fam.id_priv');
        SQL.Add('where (fam.regn=:id)');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', client);
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
      with DModule.sqlQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_service');
        SQL.Add('from sub');
        SQL.Add('where (regn=:id)and(service=7)and(sdate=convert(smalldatetime,:d,104))');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', client);
        SetParam(Parameters, 'd', s1);
        Open;
        pl := FieldByName('id_service').AsInteger;
        Close;
      end;
      with DModule.qTarif do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select el.plate');
        SQL.Add('from curel.dbf el');
        SQL.Add('where el.id_el=:id');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', pl);
        Open;
        frxReport1.Variables.Variables['plate'] := quotedstr(FieldByName('plate').AsString);
        Close;
      end;
      with DModule.sqlQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('execute getcl :id,:d');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', client);
        SetParam(Parameters, 'd', rdt);
      end;
      //�� �������, ���������� ��� ������������ ������ !!!!
      with tmpQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('execute getsub :id, :s');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', client);
        SetParam(Parameters, 's', s1);
      end;
      //�� �������, ���������� ��� ������������ ������!!!!!


      with tmpQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('execute getsub :id, :s');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', client);
        SetParam(Parameters, 's', rdt);
      end;

      frxReport1.PrepareReport;
      if MessageBox(MainForm.Handle, PChar('����� ��������������� �������� ������� ����� ' + SGCL.Cells[0, SGCl.Row] + '?'),
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
    
  tmpQuery.Free;
  tmpQuery2.Free;
end;

procedure TMainForm.aRepVedomostExecute(Sender: TObject);
{ ��������� �������� ������� � ������ ���� �� ������� ����� }
var
  f, ad, rd, mng: string;
  {  bdate,edate: string; }
  c: Tclient;
  status: integer;
begin
  c := TClient.Create(Empty, EmptyC);
  c.SetClient(MainForm.client, MainForm.rdt);
  c.SetCalc(MainForm.client, MainForm.rdt);

  status := getstatus(c.cdata.begindate, c.cdata.enddate);

  if status = 3 then
  begin
    rd := DateToStr(c.Data.regdate);
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select cl.rdate,mng.namemng');
      SQL.Add('from cl inner join hist on cl.regn=hist.regn');
      SQL.Add('inner join mng on hist.id_mng=mng.id_mng and hist.id_dist=mng.id_dist');
      SQL.Add('where (hist.id_dist=:idd)and(cl.regn=:id)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', client);
      SetParam(Parameters, 'idd', dist);
      Open;
      Last;
      mng := FieldByName('namemng').AsString;
    end;
  end
  else
  begin
    with DModule.sqlQuery1 do
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
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', client);
      SetParam(Parameters, 'idd', dist);
      SetParam(Parameters, 'cd', rdt);
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

procedure TMainForm.aRepPauseExecute(Sender: TObject);
var
  s1, s2, s3, s4: string;
  i: integer;
begin
  frxReport1.LoadFromFile(reports_path + 'solut.fr3');

  s1 := Copy(SGCl.Cells[2, SGCl.row], 1, 10); //begindate
  s2 := Copy(SGCl.Cells[2, SGCl.row], 14, 10);//enddate

  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('execute getcl :id,:d');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'id', client);
    SetParam(Parameters, 'd', s1);
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
  frxReport1.Variables.Variables['boss'] := quotedstr(DModule.sqlQuery1.FieldByName('boss').AsString);
  frxReport1.Script.Variables['id_dist'] := (DModule.sqlQuery1.FieldByName('id_dist').AsInteger);

  ReportDataFrm := TReportDataFrm.Create(Application);
  ReportDataFrm.RepType := rSolut;
  ReportsFillAdditionData(DModule.sqlQuery1.FieldByName('nameinsp').AsString);
  ReportsFillDistInfo();

  frxReport1.PrepareReport;
  if MessageBox(MainForm.Handle, PChar('����� ��������������� �������� ����������� ' + SGCL.Cells[0, SGCl.Row] + '?'),
    PChar('��������������� ��������'),
    MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
    frxReport1.ShowPreparedReport
  else
    frxReport1.Print;
end;

procedure TMainForm.aRepPlayExecute(Sender: TObject);
var
  s1, s2: string;
begin
  frxReport1.LoadFromFile(reports_path + 'solutb.fr3');
  s1 := Copy(SGCl.Cells[2, SGCl.row], 1, 10); //begindate
  s2 := Copy(SGCl.Cells[2, SGCl.row], 14, 10);//enddate
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('execute getcl :id,:d');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'id', client);
    SetParam(Parameters, 'd', s1);
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
  frxReport1.Variables.Variables['boss'] := quotedstr(DModule.sqlQuery1.FieldValues['boss']);
  frxReport1.Variables.Variables['id_dist'] := DModule.sqlQuery1.FieldByName('id_dist').AsInteger;

  ReportDataFrm := TReportDataFrm.Create(Application);
  ReportDataFrm.RepType := rSolutb;
  ReportsFillAdditionData(DModule.sqlQuery1.FieldValues['nameinsp']);
  frxReport1.Variables.Variables['spec'] := quotedstr(DModule.sqlQuery1.FieldByName('nameinsp').AsString);
  ReportsFillDistInfo();

  frxReport1.PrepareReport;
  if MessageBox(MainForm.Handle, PChar('����� ��������������� �������� ����������� ' + SGCL.Cells[0, SGCl.Row] + '?'),
    PChar('��������������� ��������'),
    MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
    frxReport1.ShowPreparedReport
  else
    frxReport1.Print;
end;

procedure TMainForm.aRepStopExecute(Sender: TObject);
var
  s1, s2, s3, s4: string;
  //  cd: TDateTime;
  i: integer;
begin
  frxReport1.LoadFromFile(reports_path + 'solute.fr3');

  s1 := Copy(SGCl.Cells[2, SGCl.row], 1, 10); //begindate
  s2 := Copy(SGCl.Cells[2, SGCl.row], 14, 10);//enddate

  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('execute getcl :id,:d');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'id', client);
    SetParam(Parameters, 'd', s1);
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
  frxReport1.Variables.Variables['boss'] := quotedstr(DModule.sqlQuery1.FieldValues['boss']);
  frxReport1.Variables.Variables['edate'] := quotedstr(DModule.sqlQuery1.FieldValues['edate']);

  s4 := GetFIOPadegFSAS(SGCl.Cells[0, SGCl.row], 3);
  i  := posex(' ', s4, 1);
  s3 := copy(s4, 0, i);
  s1 := copy(s4, i + 1, 1);
  i  := posex(' ', s4, i + 1);
  s2 := copy(s4, i + 1, 1);
  frxReport1.Variables.Variables['fio_r'] := quotedstr(s3 + ' ' + s1 + '. ' + s2 + '.');

  ReportDataFrm := TReportDataFrm.Create(Application);
  ReportDataFrm.RepType := rSolute;
  ReportsFillAdditionData(DModule.sqlQuery1.FieldValues['nameinsp']);
  ReportsFillDistInfo();

  frxReport1.PrepareReport;

  if MessageBox(MainForm.Handle, PChar('����� ��������������� �������� ����������� ' + SGCL.Cells[0, SGCl.Row] + '?'),
    PChar('��������������� ��������'),
    MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
    frxReport1.ShowPreparedReport
  else
    frxReport1.Print;
end;

procedure TMainForm.aRepNachExecute(Sender: TObject);
{ ����� � ���������� }
begin
  with DModule do
  begin
    sqlQuery1.Close;
    sqlQuery1.SQL.Clear;
    if office = -1 then
      sqlQuery1.SQL.Add('exec nachnew ' + quotedstr(rdt) + ',' + IntToStr(dist))
    else
      sqlQuery1.SQL.Add('exec nachnew_office ' + quotedstr(rdt) + ',' + IntToStr(dist) + ',' + IntToStr(office));
    sqlQuery1.Open;
  end;

  frxData.DataSource := DModule.DataSource1;
  frxReport1.LoadFromFile(PChar(reports_path + 'nach.fr3'));
  frxReport1.Script.Variables['id_dist'] := (dist);
  frxReport1.Variables.Variables['mont'] := quotedstr(LongMonthNames[StrToInt(FormatDateTime('m', StrToDate(rdt)))]);
  frxReport1.Variables.Variables['year'] := IntToStr(yearof(strtodate(rdt)));
  frxReport1.Variables.Variables['boss'] := quotedstr(SelBoss(dist));

  frxReport1.PrepareReport;
  frxReport1.ShowPreparedReport;
end;

procedure TMainForm.aRepRealizeExecute(Sender: TObject);
{
  ��������� ��������� ����� � ���������� �������� ��������.
  �������� ������� MSExcel ����������� ������.
}
var
  i, k, c: integer;
  nd, n, boss: string;
  g, s, sump1, sump2: array of integer;
  gen, sum: real;
  ExcelApp, Sheet, RangeE: OleVariant;
begin
//  m := StrToInt(Copy(rdt, 4, 2));
//  y := StrToInt(Copy(rdt, 9, 2));

  try
    ExcelApp:=CreateOleObject('Excel.Application');
    ExcelApp.Visible:=False;
    ExcelApp.WorkBooks.Open(MainForm.reports_path + 'realize.xlt');
  except
    on E: Exception do
      raise Exception.Create('������ �������� ������� Excel: ' + E.Message);
  end;

  Sheet := ExcelApp.ActiveWorkBook.WorkSheets[1];
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select namedist, boss from dist');
    SQL.Add('where id_dist=:id');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'id', dist);
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
  RangeE := String(RangeE) + StringDate(StrToDate(rdt)) + '�.';
//  case m of
//    12: RangeE := String(RangeE) + '������� ' + IntToStr(y + 2000) + '�.';
//    1: RangeE  := String(RangeE) + '������ ' + IntToStr(y + 2000) + '�.';
//    2: RangeE  := String(RangeE) + '������� ' + IntToStr(y + 2000) + '�.';
//    3: RangeE  := String(RangeE) + '���� ' + IntToStr(y + 2000) + '�.';
//    4: RangeE  := String(RangeE) + '������ ' + IntToStr(y + 2000) + '�.';
//    5: RangeE  := String(RangeE) + '��� ' + IntToStr(y + 2000) + '�.';
//    6: RangeE  := String(RangeE) + '���� ' + IntToStr(y + 2000) + '�.';
//    7: RangeE  := String(RangeE) + '���� ' + IntToStr(y + 2000) + '�.';
//    8: RangeE  := String(RangeE) + '������ ' + IntToStr(y + 2000) + '�.';
//    9: RangeE  := String(RangeE) + '�������� ' + IntToStr(y + 2000) + '�.';
//    10: RangeE := String(RangeE) + '������� ' + IntToStr(y + 2000) + '�.';
//    11: RangeE := String(RangeE) + '������ ' + IntToStr(y + 2000) + '�.';
//  end;
  //������
  k := 1;
  SetLength(g, 3);
  SetLength(s, 3);
  sum := 0;
  gen := 0;
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    if office = -1 then
    begin
      SQL.Add('execute realize :s, :d');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 's', rdt);
      SetParam(Parameters, 'd', dist);
    end
    else
    begin
      SQL.Add('execute realize_office :s, :d, :office');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 's', rdt);
      SetParam(Parameters, 'd', dist);
      SetParam(Parameters, 'office', office);
    end;
    Open;
    while not EOF do
    begin
      n := IntToStr(7 + k);
      if FieldByName('namefond').AsString = String(Sheet.Range['a' + n, 'a' + n]) then
      begin
        Sheet.Range['c' + n, 'c' + n] := FieldByName('num').AsInteger;
        Sheet.Range['d' + n, 'd' + n] := IntToStr(FieldByName('numn').AsInteger) + '(' +
          IntToStr(FieldByName('numo').AsInteger) + ')';
        Sheet.Range['e' + n, 'e' + n] := FormatFloat('0.00', FieldByName('sums').AsFloat -
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
  Sheet.Range['e' + n, 'e' + n] := FormatFloat('0.00', sum);
  //�����
  Sheet.Range['c7', 'c7'] := g[0];
  Sheet.Range['d7', 'd7'] := IntToStr(g[1]) + '(' + IntToStr(g[2]) + ')';
  Sheet.Range['e7', 'e7'] := FormatFloat('0.00', gen);
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

procedure TMainForm.aSQLQueryExecute(Sender: TObject);
{ ����� ����� SQL-������� }
begin
  with TSQLExecForm.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
  //Form34.ShowModal;
end;

procedure TMainForm.aRepFactExecute(Sender: TObject);
var
  y1: string;
begin
  with DModule do
  begin
    sqlQuery1.Close;
    if office = -1 then
      sqlQuery1.SQL.Text := 'EXEC getclfactsum ' + quotedstr(rdt) + ', ' + IntToStr(dist)
    else
      sqlQuery1.SQL.Text := 'EXEC getclfactsum_office ' + quotedstr(rdt) + ', ' + IntToStr(dist) + ', ' + IntToStr(office);
    sqlQuery1.Open;
  end;

  frxData.DataSource := DModule.DataSource1;
  frxReport1.LoadFromFile(PChar(reports_path + 'factsale.fr3'));

  y1 := IntToStr(YearOf(StrToDate(rdt)));

  frxReport1.Variables.Variables['month'] := quotedstr(LongMonthNames[StrToInt(FormatDateTime('m', StrToDate(rdt)))]);//quotedstr(ReturnMountStr);
  frxReport1.Variables.Variables['year']  := quotedstr(y1);
  frxReport1.Script.Variables['id_dist']  := (dist);
  frxReport1.Variables.Variables['boss']  := quotedstr(SelBoss(dist));

  frxReport1.PrepareReport;
  frxReport1.ShowPreparedReport;
end;

procedure TMainForm.aSlujSumTarifExecute(Sender: TObject);
{ ������ ��������� �� ������� ������ }
begin
  SlujFrm := TSlujFrm.Create(Application);
  with SlujFrm do
  begin
    mode := mDetail;
    ShowModal;
    Free;
  end;
end;

procedure TMainForm.aSlujSumAllExecute(Sender: TObject);
{ ������ ���������, ����� ����� �� ����� �� ������� }
begin
  SlujFrm := TSlujFrm.Create(Application);
  with SlujFrm do
  begin
    mode := mSum;
    ShowModal;
    Free;
  end;
end;

procedure TMainForm.aSvodNachExecute(Sender: TObject);
{
  ������ ���������� �������� �� ������� �����. �����, ������� ���������� � �����
  ������� ����������.
}
var
  y1: string;
begin
  DModule.sqlQuery1.SQL.Clear;
  DModule.sqlQuery1.SQL.Add('EXEC svodsub ' + quotedstr(rdt));
  DModule.sqlQuery1.Open;

  frxData.DataSource := DModule.DataSource1;
  frxReport1.LoadFromFile(PChar(reports_path + 'svodsub.fr3'));

  y1 := IntToStr(YearOf(StrToDate(rdt)));

  frxReport1.Variables.Variables['month'] := quotedstr(LongMonthNames[StrToInt(FormatDateTime('m', StrToDate(rdt)))]);//quotedstr(ReturnMountStr);
  frxReport1.Variables.Variables['year']  := quotedstr(y1);

  frxReport1.PrepareReport;
  frxReport1.ShowPreparedReport;
end;

procedure TMainForm.aStatMinMddExecute(Sender: TObject);
{*******************************************************************************
  ��������� ��������� ����� � ������ ���������� ����� � ������� ��������� �
  ������ ��������� �������� ������������ �������� � ��� ��� ��������� ���������� �����.
*******************************************************************************}
begin
  Form40.ShowModal;
end;

procedure TMainForm.aStatAgeExecute(Sender: TObject);
{*******************************************************************************
  ��������� ��������� ����� �����, ������� ������� ���������� � �������� ���������
  ������� � ������ ������.
*******************************************************************************}
begin
  Form22.ShowModal;
end;

procedure TMainForm.aStatPrivExecute(Sender: TObject);
begin
  Stats := TStats.Create(MainForm);
  Stats.ShowModal;
  Stats.Free;
end;

procedure TMainForm.aDebtShowExecute(Sender: TObject);
begin
  SlujFrm := TSlujFrm.Create(Application);
  with SlujFrm do
  begin
    mode := mDebt;
    ShowModal;
    Free;
  end;
end;

procedure TMainForm.aEditClCertExecute(Sender: TObject);
{*******************************************************************************
    ��������� �������� ������, ����������� ����� ���������� � ��������, ����
    ������� ����� �� �������� �� ������������� ��� �� ����������� ����������.
*******************************************************************************}
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('execute chatt :idd,:d');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'idd', dist);
    SetParam(Parameters, 'd', rdt);
    ExecSQL;
  end;
end;

procedure TMainForm.aEditTrafClExecute(Sender: TObject);
{  ����� ����� ��������� ������, �������������, ��������� � �������� }
begin
  Form29.status := sec1;
  Form29.ShowModal;
end;

procedure TMainForm.aErrorListExecute(Sender: TObject);
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('execute errorList :date,:dist');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'dist', dist);
    SetParam(Parameters, 'date', rdt);
    Open;
  end;
  frxData.DataSource := DModule.DataSource1;
  frxReport1.LoadFromFile(PChar(reports_path + 'errorlist.fr3'));

  frxReport1.Variables.Variables['namedist'] := quotedstr(SelDist(dist));
  frxReport1.Variables.Variables['mont'] := quotedstr(LongMonthNames[StrToInt(FormatDateTime('m', StrToDate(rdt)))]);
  frxReport1.Variables.Variables['year'] := IntToStr(yearof(strtodate(rdt)));  
  frxReport1.Variables.Variables['boss'] := quotedstr(SelBoss(dist));
  frxReport1.PrepareReport;
  
  frxReport1.ShowPreparedReport;

end;

procedure TMainForm.aSetActiveAllInspExecute(Sender: TObject);
{*******************************************************************************
  ��������� ������ ��������� ���� ����������� �������� ������
*******************************************************************************}
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update insp');
    SQL.Add('set status=1');
    SQL.Add('where id_dist=:idd');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'idd', dist);
    ExecSQL;
    Close;
  end;
end;

procedure TMainForm.aSetActiveAllStrtExecute(Sender: TObject);
{*******************************************************************************
  ��������� ������ ��������� ��� �����.
*******************************************************************************}
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update strt');
    SQL.Add('set status=1');
    ExecSQL;
    Close;
  end;
end;

procedure TMainForm.aSetActiveUseStrtExecute(Sender: TObject);
{*******************************************************************************
  ��������� ������ ��������� ������������ �����
*******************************************************************************}
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update strt');
    SQL.Add('set status=0');
    SQL.Add('where id_street not in');
    SQL.Add('(select distinct(id_street)');
    SQL.Add('from cl where id_dist=:idd)');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'idd', dist);
    ExecSQL;
    Close;
    SQL.Clear;
    SQL.Add('update strt');
    SQL.Add('set status=1');
    SQL.Add('where id_street in');
    SQL.Add('(select distinct(id_street)');
    SQL.Add('from cl where id_dist=:idd)');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'idd', dist);
    ExecSQL;
    Close;
  end;
end;

procedure TMainForm.aShowLegendExecute(Sender: TObject);
begin
  if GroupBox1.Visible = True then
    GroupBox1.Visible := False
  else
    GroupBox1.Visible := True;
  GridPanel1.Realign;
end;

procedure TMainForm.aRepEditorExecute(Sender: TObject);
begin
  ReportEditFrm := TReportEditFrm.Create(Application);
  ReportEditFrm.ShowModal;
  ReportEditFrm.Free;
end;

function TMainForm.ASub: real;
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

procedure TMainForm.aUpdateExecute(Sender: TObject);
begin
  winExec('sUpdater.exe', SW_NORMAL);
end;

procedure TMainForm.Button7Click(Sender: TObject);
//���������
var
  WordApp,doc:OleVariant;
  c: TClient;
  i,j: integer;
  yb,sch,trc:byte;
  _birth:TDateTime;
  rBank:packed record
    otd,filial,bank:string;
  end;
  _okrug:string;
  lst:TStringList;

  procedure GetBankParam(n:integer);
  var
    sl:string;

begin
  FillChar(rBank,sizeof(rBank),#0);
  with DModule.sqlQuery1,rBank do begin
    Close;
    SQL.Clear;
    SQL.Text:='select * from bank where id_bank=:id';
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'id', n);
    Open;
    if not isEmpty then begin
      sl:=FieldByName('namebank').AsString;
      case n of
      1..77,80..82,84..97: begin
          otd:=RightStr(sl,4);
          filial:=MidStr(sl,10,4);
          bank:='��������';
        end;
      78..79: begin
          otd:=sl;
          bank:='��� ����';
        end;
      end;
    end;
    Close;
  end;
end;

  function GetLet (b:byte): String;
  var
    i:integer;
    f:real;
begin
 result:='';
 f:=b/10;
 i:=trunc(frac(f)*10+0.1);
 case i of
 1: result:='���';
 2..4: result:='����';
 else  result:='���';
 end;
end;

function StrToArrays(str, r: string; temp: TStringList): Boolean;
var
  j: Integer;
begin
  result:=false;
  if temp <> nil then begin
    temp.Clear;
    while str <> '' do begin
      j := Pos(r, str);
      if j = 0 then j := Length(str) + 1;
      temp.Add(Copy(Str, 1, j - 1));
      Delete(Str, 1, j + Length(r) - 1);
    end;
    Result := True;
  end;
end;

const
  sSpace='   ';
  cntRPC=3; //Row per client

begin
  lst:=TStringList.Create;
  c := TClient.Create(Empty, EmptyC);
  c.SetClient(client, MainForm.rdt);
  c.setcalc(client, MainForm.rdt);
  try
{
    try
      WordApp:=GetActiveOleObject('Word.Application')
    except end;
}
    WordApp:= CreateOleObject('Word.Application');
    try
    doc:=WordApp.documents.Open(MainForm.reports_path + '���������_������.dot');
    WordApp.ActiveDocument.SaveAs('c:\124.doc');
    _okrug:=SelDist(c.Data.dist);_okrug:=_okrug[1]+'��';
    WordApp.Selection.Goto(-1, unAssigned, unAssigned,'okrug');
    WordApp.Selection.TypeText(sSpace+_okrug);
    WordApp.Selection.Goto(-1, unAssigned, unAssigned,'fio');
//    WordApp.Selection.font.bold:=true;
    WordApp.Selection.TypeText(sSpace+c.Data.fio);
    if trim(c.Data.tel)<>'' then begin
      WordApp.Selection.Goto(-1, unAssigned, unAssigned,'tel');
      WordApp.Selection.TypeText(sSpace+c.Data.tel);
    end;

    sch:=2;trc:=doc.tables.item(1).rows.count;
    for i := 0 to C.cdata.family.Count - 1 do begin
      _birth:=TMan(C.cdata.family.Items[i]).birth;
      yb:=YearsBetween(_birth,date);
      for j:=1 to cntRPC do begin
        if sch>trc then
          doc.tables.item(1).rows.add(EmptyParam);
        case j of
        1:  begin
              doc.tables.item(1).cell(sch,1).range.text:=IntToStr(i+1);
              StrToArrays(trim(TMan(C.cdata.family.Items[i]).fio),' ',lst);
              doc.tables.item(1).cell(sch,2).range.text:=lst[0];
              doc.tables.item(1).cell(sch,3).range.text:=SelRel(TMan(C.cdata.family.Items[i]).rel);
              doc.tables.item(1).cell(sch,5).range.text:=DateToStr(_birth);
            end;
        2:  begin
              doc.tables.item(1).cell(sch,2).range.text:=lst[1];
            end;
        3:  begin
              if lst.count>2 then
                doc.tables.item(1).cell(sch,2).range.text:=lst[2];
                doc.tables.item(1).cell(sch,5).range.text:=IntToStr(yb)+' '+GetLet(yb);
            end;
        end;
        inc(sch);
      end;
    end;
    lst.Free;
    if i>5 then begin
      WordApp.Selection.Goto(-1, unAssigned, unAssigned,'break');
      WordApp.Selection.InsertBreak;
    end;
      WordApp.Selection.Goto(-1, unAssigned, unAssigned,'adr');
      with c.Data do begin
        WordApp.Selection.Text:=sSpace+SelStr(str)+' '+nh+' '+corp+' '+apart+sSpace;
      end;

      GetBankParam(c.Data.bank);//�������� � ��������� ������ �����
      if rBank.bank='' then begin
        WordApp.Selection.Goto(-1, unAssigned, unAssigned,'pochta');
        WordApp.Selection.Text:=sSpace+c.Data.acbank+sSpace;
      end else begin
        WordApp.Selection.Goto(-1, unAssigned, unAssigned,'schet');
        WordApp.Selection.Text:=sSpace+c.Data.acbank+sSpace;
        WordApp.Selection.Goto(-1, unAssigned, unAssigned,'otd');
        WordApp.Selection.Text:=sSpace+rBank.otd+sSpace;
        WordApp.Selection.Goto(-1, unAssigned, unAssigned,'filial');
        WordApp.Selection.Text:=sSpace+rBank.filial+sSpace;
        WordApp.Selection.Goto(-1, unAssigned, unAssigned,'bank');
        WordApp.Selection.Text:=sSpace+rBank.bank+sSpace;
      end;
{
      WordApp.Selection.Goto(-1, unAssigned, unAssigned,'fio_1');
      WordApp.Selection.TypeText(sSpace+c.Data.fio+',');

      WordApp.Selection.Goto(-1, unAssigned, unAssigned,'adr_1');
      with c.Data do begin
        WordApp.Selection.TypeText(sSpace+SelStr(str)+' '+nh+' '+corp+' '+apart+sSpace);
      end;
}
      WordApp.Selection.Goto(-1, unAssigned, unAssigned,'okrug_1');
      WordApp.Selection.TypeText(sSpace+_okrug);

      WordApp.Selection.Goto(-1, unAssigned, unAssigned,'adroffice');
      WordApp.Selection.TypeText(sSpace+SelOffice(c.Data.office));

      WordApp.Selection.Goto(-1, unAssigned, unAssigned,'fioinsp');
      WordApp.Selection.TypeText(' '+SelInsp(insp)+' /');

      WordApp.Selection.Goto(-1, unAssigned, unAssigned,'cd_day');
      WordApp.Selection.TypeText('"  '+IntToStr(dayof(date))+'  "');

      WordApp.Selection.Goto(-1, unAssigned, unAssigned,'cd_month');
      WordApp.Selection.TypeText(FormatDateTime('mmmm',date));

      WordApp.Selection.Goto(-1, unAssigned, unAssigned,'cd_year');
      WordApp.Selection.TypeText(FormatDateTime(' yy',date));
    finally
//      WordApp.Selection.Collapse(EmptyParam);
      doc.range(0,0).select;
      Wordapp.Visible:=true;
    end;
  except
    on E: Exception do
      raise Exception.Create('������ �������� ������� Word: ' + E.Message);
  end;
  c.Free;
{
  WordApp.ActiveDocument.Close(0);
  WordApp.Quit;
  WordApp := Unassigned;
}
end;

function TMainForm.GetStatus(b, e: TDate): integer;
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

function TMainForm.GenAddr(s, n, c, a: string): string;
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

function TMainForm.GenPer(b, e: TDate): string;
{*******************************************************************************
    ������� GenPer ���������� ������ �� ������ ��������.
    ���� �������� ����������� �� ������� ������ ������ � ��������� ����� ��������.
*******************************************************************************}
begin
  Result := DateToStr(b) + ' - ' + DateToStr(e);
end;

function TMainForm.GenCalc(c: integer): string;
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

procedure TMainForm.aOpenMountExecute(Sender: TObject);
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
    FillCurr(MainForm.bpath, rdt, MainForm.dist, MainForm.codedbf);
    LastTime := Time;
    Reload;

    MainForm.Caption := '���� �������������� �������� �� ������ ��� ��������� �.����� �� ' +
      LongMonthNames[StrToInt(FormatDateTime('m', StrToDate(rdt)))] + ' ' +
      IntToStr(YearOf(StrToDate(rdt))) + '�.' + ' [' + Revision + ']' + ' - ' + curServer;
  end;
end;

procedure TMainForm.aReloadExecute(Sender: TObject);
{*******************************************************************************
  ��������� ��������� ������ �� ������� �����.
*******************************************************************************}
begin
  Reload;
end;

procedure TMainForm.aAdminModeExecute(Sender: TObject);
var
  adm_pass: string;
begin
  if MainForm.LoginMode = lAdmin then
  begin
    MainForm.LoginMode := lInsp;
    aAdminMode.Checked := False;
    aChangeAdminPasswd.Visible := False;
    aSQLQuery.Visible := False;
    aRepEditor.Visible := False;
    aSetActiveAllInsp.Visible := False;
    aSetActiveAllStrt.Visible := False;
    aSetActiveUseStrt.Visible := False;
    aConf.Visible := False;
    aMerge.Visible := False;
    aImport.Visible := False;
    exit;
  end;

  adm_pass := InputPassword('������� ������ ��������������!', '������:', '');
  adm_pass := GenMD5Password(adm_pass);
  adm_pass := GetConnectionPass(adm_pass);
  if GetConnectionPass(ReadRegProperty('Password')) = adm_pass then
  begin
    MainForm.LoginMode := lAdmin;
    aAdminMode.Checked := True;
    aChangeAdminPasswd.Visible := True;
    aSQLQuery.Visible := True;
    aRepEditor.Visible := True;
    aSetActiveAllInsp.Visible := True;
    aSetActiveAllStrt.Visible := True;
    aSetActiveUseStrt.Visible := True;
    aConf.Visible := True;
    aMerge.Visible := True;
    aImport.Visible := True;
  end;
  
  ActionMainMenuBar1.Repaint;
  ActionMainMenuBar1.Refresh;
end;

procedure TMainForm.aBackupDataExecute(Sender: TObject);
var
  path, name: string;
  SevenZip: TSevenZip;
begin
  //���������� ���� ��� ��� *.dbf
  if getConfValue('0.OtherBackupPath') then
    path := (getConfValue('0.BackupPath'))
  else
    path := (ExtractFilePath(ParamStr(0)) + 'arc\');

  if not DirectoryExists(path) then
    ForceDirectories(path);

  name := format('Subsidy_%s',[FormatDateTime('YYYYMMDD', Date)]);

  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Text := 'exec backupdatabase '+ quotedstr(path);
    ExecSQL;
  end;

  SevenZip := TSevenZip.Create(Application);
  try
    if FileExists(path + '\' + Name + '.7z') then
      DeleteFile(PAnsiChar(path + '\' + name + '.7z'));

    SevenZip.SZFileName := path + '\' + name + '.7z';
    with SevenZip do
    begin
      AddOptions := [AddStoreOnlyFilename];
      VolumeSize := 0;
      LZMACompressType := LZMA;
      LZMACompressStrength := MAXIMUM;
      Files.Clear;
    end;
    SevenZip.Files.AddString(path + '\' + name + '.BAK');
    SevenZip.Add;
  finally
    SevenZip.Free;
    DeleteFile(path + '\' + name + '.BAK');
  end;
  ShowMessage('��������� ���������');
end;

procedure TMainForm.aBackupExecute(Sender: TObject);
{ ��������� ���� ������ �� ������� ����}
var
  ext1, ext2, Name, path, dt: string;
  d, i: integer;
  SevenZip: TSevenZip;
begin
  SevenZip := TSevenZip.Create(Application);

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
  ExportDebt(path, dist);
  SevenZip.Files.AddString(path + 'debt' + ext2);
  SevenZip.Files.AddString(path + 'debtpay' + ext2);
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

procedure TMainForm.aExportForCentrExecute(Sender: TObject);
{ ��������� ���� ��� ������ }
var
  ext1, ext2, Name, path, dt: string;
  SevenZip: TSevenZip;
  i: integer;
begin
  SevenZip := TSevenZip.Create(Application);
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
    ExportDebt(path, dist);
    SevenZip.Files.AddString(path + 'debt' + ext2);
    SevenZip.Files.AddString(path + 'debtpay' + ext2);
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

procedure TMainForm.aExportSocProtExecute(Sender: TObject);
{ �������� ���.������ }
var
  dt, outdir: string;
begin
  outdir := 'out\';
  if not DirectoryExists(outdir) then
    CreateDir(outdir);
  try
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('execute gensocprotect :idd,:d');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'idd', dist);
      SetParam(Parameters, 'd', rdt);
      Open;
      if not IsEmpty then
      begin
        dt := FormatDateTime('YYYYmm',StrToDate(rdt));
        FillTable(ExtractFilePath(Application.ExeName) + outdir, 'socprotect_' + dt + '_r0' + IntToStr(dist), codedbf);
        ShowMessage('�������� � dbf ���������!');
      end
      else
        ShowMessage('�������� � dbf �����������: ��������� ������� �������!');
    end;
  except
    ShowMessage('������ ��� �������� � dbf!');
  end;
end;

procedure TMainForm.aCurHistExecute(Sender: TObject);
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
      Edit4.Text := FormatFloat('0.00', SetSumSub);
      if Form18.changes then
        MainForm.Reload;
    end
    else
      ShowMessage('��� �������� ��������!');
  end
  else
    ShowMessage('���� �����!');
end;

procedure TMainForm.aFactSumRptExecute(Sender: TObject);
{
  ������������ ������� � ��������� ������� �������� � ������������ ���������;
}
const
  val: array[1..6] of string = ('H','G','F','E','D','C');
var
  ExcelApp, Sheet: OleVariant;
  c: TClient;
  i: integer;
  insp: string;
  bdate, edate: TDate;
  tmpQuery: TADOQuery;
begin
  tmpQuery := TADOQuery.Create(DModule);
  tmpQuery.Connection := DModule.sqlConnection;

  c := TClient.Create(Empty, EmptyC);
  c.SetClient(client, MainForm.rdt);
  c.setcalc(client, MainForm.rdt);
  bdate := c.cdata.prevbegindate;
  edate := c.cdata.prevenddate;

  if st[SGCl.Row - 1] = 3 then
  begin
    bdate := c.cdata.begindate;
    edate := c.cdata.enddate;
  end;

  with tmpQuery do
  begin
    Close;
    SQL.Text :=
      'SELECT  sdate, SUM(sub) as subsum FROM Sub'#13#10+
      'WHERE (regn = :rgn) and (sdate >= convert(smalldatetime,:bd,104)) and (sdate < convert(smalldatetime,:ed,104))'#13#10+
      'GROUP BY sdate'#13#10+
      'ORDER BY sdate desc';
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'rgn', client);
    SetParam(Parameters, 'bd', DateToStr(bdate));
    SetParam(Parameters, 'ed', DateToStr(edate));
    Open;
    First;
  end;

  try
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Visible := False;
  except
    on E: Exception do
      raise Exception.Create('������ �������� ������� Excel: ' + E.Message);
  end;

  ExcelApp.WorkBooks.Open(MainForm.reports_path + 'u4et_month.xlt');

  Sheet :=  ExcelApp.ActiveWorkBook.WorkSheets[1];

  Sheet.Range['B5','B5'] := format('%d', [client]);
  Sheet.Range['B6','B6'] := SGCl.Cells[0, SGCl.row];
  Sheet.Range['B7','B7'] := SGCl.Cells[1, SGCl.row];

  Sheet.Cells.Replace(':bdate:', StringDate(bdate), xlPart, xlByRows, False, False, False);
  Sheet.Cells.Replace(':edate:', StringDate(edate), xlPart, xlByRows, False, False, False);
  Sheet.Cells.Replace(':fio:', GetShortName(SGCl.Cells[0, SGCl.row]), xlPart, xlByRows, False, False, False);
//  Sheet.Cells.Replace(':insp:', SplitString(StatusBar1.Panels[1].Text, ' ')[1], xlPart, xlByRows, False, False, False);
  insp := StringReplace(StatusBar1.Panels[1].Text, '���������: ', '', [rfReplaceAll]);
  Sheet.Cells.Replace(':insp:', StringReplace(insp, '(�)', '', [rfReplaceAll]), xlPart, xlByRows, False, False, False);
  Sheet.Cells.Replace(':boss:', SelBoss(dist), xlPart, xlByRows, False, False, False);
  if ( c.cdata.prevbegindate = c.cdata.begindate) then
  begin
    ShowMessage('� ������� �� ������� ������ ��� ��������������� ���������� �������. ������� ����� �������.');
    ExcelApp.Visible := True;
//    ExcelApp.DisplayAlerts := False;
//    ExcelApp.Quit;
//    ExcelApp:=Unassigned;
    Exit;
  end;

  try
    for i := 1 to MounthDiff(bdate, edate) do
    begin
      Sheet.Range[val[i]+'26', val[i]+'26'] := tmpQuery.FieldByName('subsum').Value;
      Sheet.Range[val[i]+'10', val[i]+'10'] := StringDate(tmpQuery.FieldByName('sdate').Value);
      tmpQuery.Next;
    end;

    ExcelApp.Visible := True;
  finally
  end;
  
  c.Free;
  tmpQuery.Free;
end;

procedure TMainForm.aFilterExecute(Sender: TObject);
{
  ����� ����� ������ �������. ���� ������ �� ����, �� ����� �������� ��������
  ��������� �������.
}
begin
  Form33.ShowModal;
  if qr.SQL <> '' then
    Load(qr, Form33.rsel);

end;

procedure TMainForm.aFormDebtExecute(Sender: TObject);
begin
  if not CheckP1 then Exit;
  
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Text := 'exec formdebtpay '+ quotedstr(rdt) + ',' + IntToStr(dist);
    ExecSQL;
  end;
  aReloadExecute(self);
end;

procedure TMainForm.aFormSubsidyExecute(Sender: TObject);
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
        DModule.sqlConnection.BeginTrans;
        with DModule.sqlQuery1 do
        begin
          //������ ������ ��������
          Close;
          SQL.Clear;
          SQL.Add('execute formnewpm :od,:nd,:idd');
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'idd', dist);
          SetParam(Parameters, 'od', odt);
          SetParam(Parameters, 'nd', rdt);
          ExecSQL;
          Close;
        end;
        DModule.sqlConnection.CommitTrans;
      except
        DModule.sqlConnection.RollbackTrans;
      end;
      pr.Close;
      pr.Release;
      Reload;
    end;
  end
  else
    ShowMessage('������� �����������!');
end;

procedure TMainForm.aImportExecute(Sender: TObject);
{*******************************************************************************
  ��������� N8Click �������� ����� ������� � ��������� ������.
*******************************************************************************}
begin
  Form35.status := mImport;//������
  Form35.ShowModal;
end;

procedure TMainForm.aInformKartaExecute(Sender: TObject);
var
  ExcelApp, Sheet, Data: OleVariant;
  c: TClient;
  i: integer;
begin
  c := TClient.Create(Empty, EmptyC);
  c.SetClient(client, MainForm.rdt);
  c.setcalc(client, MainForm.rdt);

//  with DModule.Query2 do
//  begin
//    Close;
//    SQL.Text := 'SELECT  sdate, SUM(sub) as subsum FROM Sub'#13+
//      'WHERE (regn = :rgn) and (sdate >= convert(smalldatetime,:bd,104)) and (sdate < convert(smalldatetime,:ed,104))'#13+
//      'GROUP BY sdate'#13+
//      'ORDER BY sdate desc';
//    SetParam(Parameters, 'rgn', client);
//    SetParam(Parameters, 'bd', DateToStr(c.cdata.prevbegindate));
//    SetParam(Parameters, 'ed', DateToStr(c.cdata.prevenddate));
//    Open;
//    First;
//  end;

  try
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Visible := False;
    ExcelApp.WorkBooks.Open(MainForm.reports_path + 'infkarta.xlt')
  except
    on E: Exception do
      raise Exception.Create('������ �������� ������� Excel: ' + E.Message);
  end;
  Sheet :=  ExcelApp.ActiveWorkBook.WorkSheets[1];

  Sheet.Range['B3','B3'] := SGCl.Cells[0, SGCl.row];//���������
  Sheet.Range['B5','B5'] := SGCl.Cells[1, SGCl.row];//address
  Sheet.Range['B6','B6'] := SelCert(c.data.cert);
  Sheet.Range['B8','B8'] := SelOwn(c.data.own);
  Sheet.Range['E8','E8'] := SelHeating(c.cdata.heating);
  Sheet.Range['B9','B9'] := SelFnd(c.data.fond);
  Sheet.Range['B10','B10'] := c.cdata.square;
  Sheet.Range['E9','E9'] :=  SelSettl(c.data.settl);
  Sheet.Range['B11','B11'] :=  BoolToStr(boolean(c.cdata.elevator));
  Sheet.Range['F11','F11'] :=  GetNameTafif(7, c.cdata.tarifs[7]);//�����
  Sheet.Range['B14','B14'] := c.GetOwnPriv;
  Sheet.Range['F14','F14'] := c.cdata.quanpriv;
  Sheet.Range['D12','D12'] := BoolToStr(Boolean(c.cdata.boiler));
  Sheet.Range['C13','C13'] := c.cdata.mcount;
  Sheet.Range['D13','D13'] := c.cdata.rmcount;
  Sheet.Range['E15','E15'] := SelStnd(c.cdata.rstnd);
  Sheet.Range['D44','D44'] := c.GetStandard;
  //Sheet.Cells.Replace(':mc_rc:', format('%d/%d', [c.cdata.mcount, c.cdata.rmcount]), xlPart, xlByRows, False, False, False);

  Sheet.Range['C20','C20'] := c.cdata.cost[0];
  Sheet.Range['B42','B42'] := c.cdata.cost[1];
  Sheet.Range['C22','C22'] := c.cdata.cost[2];
  Sheet.Range['C25','C25'] := c.cdata.cost[3];
  Sheet.Range['C28','C28'] := c.cdata.cost[4];
  Sheet.Range['C31','C31'] := c.cdata.cost[5];
  Sheet.Range['C34','C34'] := c.cdata.cost[6];
  Sheet.Range['C40','C40'] := c.cdata.cost[12];
  Sheet.Range['C41','C41'] := c.cdata.cost[13];

  Sheet.Range['C23','C23'] := c.cdata.countercost[2];
  Sheet.Range['C26','C26'] := c.cdata.countercost[3];
  Sheet.Range['C29','C29'] := c.cdata.countercost[4];
  Sheet.Range['C32','C32'] := c.cdata.countercost[5];
  Sheet.Range['C35','C35'] := c.cdata.countercost[6];

  Sheet.Range['B37','B37'] := c.cdata.tarifnorm[7];

  if c.cdata.mdd=0 then Sheet.Range['B50','B50'] := 20
  else Sheet.Range['B50','B50'] := 18;

  Sheet :=  ExcelApp.ActiveWorkBook.WorkSheets[2];
  Data := VarArrayCreate([1, C.cdata.family.Count, 1, 7], varVariant);

  //��������� �����
  for i := 0 to C.cdata.family.Count - 1 do
  begin
    Data[i + 1, 1] := TMan(C.cdata.family.Items[i]).fio;
    Data[i + 1, 2] := DateToStr(TMan(C.cdata.family.Items[i]).birth);
    Data[i + 1, 3] := C.cdata.mid[i];
    Data[i + 1, 4] := SelMin(C.cdata.min[i]);
    Data[i + 1, 5] := SelSt(TMan(C.cdata.family.Items[i]).status);
    Data[i + 1, 6] := SelRel(TMan(C.cdata.family.Items[i]).rel);
    Data[i + 1, 7] := SelPriv(TMan(C.cdata.family.Items[i]).priv);
  end;

  Sheet.Range[RefToCell(6,2), RefToCell(6 + C.cdata.family.Count - 1, 8)] := Data;

  Sheet.Range['B24','B24'] := SelInsp(c.data.insp);
  ExcelApp.Visible := True;
  c.Free;
end;

procedure TMainForm.aMergeExecute(Sender: TObject);
{
  ����� ����� ������ ������� ����� �������� � ������� ��� ����� ������� � �������.
}
begin
  MergeForm.ShowModal;
end;

procedure TMainForm.AddCl(id: integer);
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
  with DModule.sqlQuery1 do
  begin
    Close;
    SetLength(cl, Length(cl) + 1);
    SetLength(st, Length(st) + 1);
    SetLength(sub, Length(sub) + 1);
    SetLength(stop, Length(stop) + 1);
    Close;
    SQL.Clear;
    SQL.Add('execute getinfocl :id,:d');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'id', id);
    SetParam(Parameters, 'd', MainForm.rdt);
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
  SGCl.Cells[4, pl] := FormatFloat('0.00', sub[pl - 1]);
  SGCl.Row := pl;
  SGCl.Repaint;
  Inc(ccl);
  if status < 3 then
    Inc(acl);
  Statusbar1.Panels[0].Text := '������: ' + SGCl.Cells[0, SGCl.row] + '/' + FormatFloat('0.00', subs);
  Edit1.Text := IntToStr(ccl);
  Edit2.Text := IntToStr(Acl);
  Edit3.Text := IntToStr(StrToInt(Edit3.Text) + 1);
  Edit4.Text := FormatFloat('0.00', StrToFloat(Edit4.Text) + subs);
end;

procedure TMainForm.aExitExecute(Sender: TObject);
{*******************************************************************************
  ��������� ��������� �������� ���������
*******************************************************************************}
begin
  Close;
end;

procedure TMainForm.aExporDolgExecute(Sender: TObject);
{ �������� ��������� }
var
  dt, outdir: string;
begin
  outdir := 'out\';
  if not DirectoryExists(outdir) then
    CreateDir(outdir);
  try
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('execute gendolg :idd,:d');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'idd', dist);
      SetParam(Parameters, 'd', rdt);
      Open;
      if not IsEmpty then
      begin
        dt := FormatDateTime('YYYYmm',StrToDate(rdt));
        FillTable(ExtractFilePath(Application.ExeName) + outdir, 'dolg_' + dt + '_r0' + IntToStr(dist), codedbf);
        ShowMessage('�������� � dbf ���������!');
      end
      else
        ShowMessage('�������� � dbf �����������: ��������� ������� �������!');
    end;
  except
    ShowMessage('������ ��� �������� � dbf!');
  end;
end;

procedure TMainForm.aExportDBFExecute(Sender: TObject);
{ ����� ����� � dbf }
var
  dt, outdir: string;
begin
  outdir := 'out\';
  if not DirectoryExists(outdir) then
    CreateDir(outdir);
  try
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('execute gendbf :idd,:d');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'idd', dist);
      SetParam(Parameters, 'd', rdt);
      Open;
      if not IsEmpty then
      begin
        dt := FormatDateTime('YYYYmm',StrToDate(rdt));
        FillTable(ExtractFilePath(Application.ExeName) + outdir, 'dbf_' + dt + '_r0' + IntToStr(dist), codedbf);
        ShowMessage('����� � dbf ��������!');
      end
      else
        ShowMessage('����� � dbf ����������: ��������� ������� �������!');
    end;
  except
    ShowMessage('������ ��� ������ � dbf!');
  end;
end;

procedure TMainForm.aExportExecute(Sender: TObject);
{*******************************************************************************
  ��������� N7Click �������� ����� �������� �� ��������� ������.
*******************************************************************************}
begin
  Form35.status := mExport;//�������
  Form35.ShowModal;
end;

procedure TMainForm.aOpenExcelExecute(Sender: TObject);
{ �������� ������� MSExcel ����������� ������ � ����������� MSExcel }
begin
  ExportGridToExcel(SGCL, MainForm.reports_path + 'filter.xlt'); 
end;

procedure TMainForm.aRecalcSubsidyExecute(Sender: TObject);
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
        DModule.sqlConnection.BeginTrans;
        with DModule.sqlQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('execute maxsdate :idd');
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'idd', dist);
          Open;
          {if DateToStr(FieldByName('mdt').AsDateTime)>=rdt then}
          begin
            Close;
            SQL.Clear;
            SQL.Add('execute getncl :idd,:nd');
            Parameters.ParseSQL(SQL.Text, True);
            SetParam(Parameters, 'idd', dist);
            SetParam(Parameters, 'nd', rdt);
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
                c.SetClient(curregn, MainForm.rdt);
                c.SetCalc(curregn, MainForm.rdt);
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
                Parameters.ParseSQL(SQL.Text, True);
                SetParam(Parameters, 's', rdt);
                SetParam(Parameters, 'r', curregn);
                SetParam(Parameters, 'pm', c.cdata.pmin);
                ExecSQL;

                Close;
                SQL.Clear;
                SQL.Add('update sub');
                SQL.Add('set pm=:pm,snpm=:snp,sub=:sub,spfree=:sp,stop=:st, stndsub=:stndsub');
                SQL.Add('where sdate=CONVERT(smalldatetime,:s,104) and regn=:r');
                SQL.Add('and service=:serv');
                Parameters.ParseSQL(SQL.Text, True);
                SetParam(Parameters, 's', rdt);
                SetParam(Parameters, 'r', curregn);
                for i := 0 to numbtarif - 1 do
                begin
                  if (i < 8) or (i > 11) then
                  begin
                    SetParam(Parameters, 'serv', i);
                    SetParam(Parameters, 'pm', c.cdata.pm[i]);
                    SetParam(Parameters, 'snp', c.cdata.snpm[i]);
                    SetParam(Parameters, 'sub', c.cdata.sub[i]);
                    SetParam(Parameters, 'sp', c.cdata.fpm[i]);
                    SetParam(Parameters, 'stndsub', c.cdata.stndsub[i]);
                    SetParam(Parameters, 'st', c.cdata.stop);
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
        DModule.sqlConnection.CommitTrans;
      except
        DModule.sqlConnection.RollbackTrans;
      end;
      pr.Free;
      Reload;
    end;
  end
  else
    ShowMessage('������� �����������!');
end;

procedure TMainForm.aRepRecalcSubsidyExecute(Sender: TObject);
begin
  Form43.ShowModal;
end;

procedure TMainForm.aRunCalcExecute(Sender: TObject);
begin
  WinExec(PChar('calc'), SW_SHOW);
end;

procedure TMainForm.aSelDistExecute(Sender: TObject);
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
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select nameinsp, namedist,id_office');
      SQL.Add('from insp inner join dist on insp.id_dist = dist.id_dist');
      SQL.Add('where (insp.id_insp = :idi) and (dist.id_dist = :idd)');
      SQL.Add('order by insp.nameinsp');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'idi', insp);
      SetParam(Parameters, 'idd', dist);
      Open;
      ins := FieldByName('nameinsp').AsString;
      dis := FieldByName('namedist').AsString;
      MainForm.idOffice:=FieldByName('id_office').AsInteger;
      Close;
    end;
    if CheckP2 then
      sec1 := 1
    else
      sec1 := 0;
    FillCurr(bpath, rdt, dist, MainForm.codedbf);
    SetTarifs;
    Reload;
    Statusbar1.Panels[1].Text := '���������: ' + ins;
    Statusbar1.Panels[2].Text := '�����: ' + dis;
  end
  else
  begin
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select nameinsp,id_office');
      SQL.Add('from insp ');
      SQL.Add('where (id_insp = :idi) and (id_dist = :idd)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'idi', insp);
      SetParam(Parameters, 'idd', dist);
      Open;
      ins := FieldByName('nameinsp').AsString;
      MainForm.idOffice:=FieldByName('id_office').AsInteger;
      Close;
    end;
    if CheckP2 then
      sec1 := 1
    else
      sec1 := 0;
    Statusbar1.Panels[1].Text := '���������: ' + ins;
    FillCurr(bpath, rdt, dist, MainForm.codedbf);
    SetTarifs;
  end;

  SaveSubsidyCfg;
end;

procedure TMainForm.aSelInspExecute(Sender: TObject);
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
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select nameinsp,id_office');
      SQL.Add('from insp');
      SQL.Add('where (id_insp = :idi) and (id_dist = :idd)');
      SQL.Add('order by nameinsp');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'idi', insp);
      SetParam(Parameters, 'idd', dist);
      Open;
      Statusbar1.Panels[1].Text := '���������: ' + FieldByName('nameinsp').AsString;
      MainForm.idOffice:=FieldByName('id_office').AsInteger;
      Close;
    end;
    if CheckP2 then
      sec1 := 1
    else
      sec1 := 0;
  end;
end;

procedure TMainForm.aSelServerExecute(Sender: TObject);
{ ����� ������� ��� �����������}
begin
  ConnectionFrm.ShowModal;
  MainForm.Caption := '���� �������������� �������� �� ������ ��� ��������� �.����� �� ' +
    StringDate(StrToDate(rdt)) + '�.' + ' [' + Revision + ']' + ' - ' + curServer;
end;

procedure TMainForm.ModCl(id: integer);
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
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('execute getinfocl :id, :d');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'id', id);
    SetParam(Parameters, 'd', MainForm.rdt);
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
  SGCl.Cells[4, pl] := FormatFloat('0.00', sub[pl - 1]);
  SGCl.Row := pl;
  SGCl.Repaint;
  Statusbar1.Panels[0].Text := '������: ' + SGCl.Cells[0, SGCl.row] + '/' + FormatFloat('0.00', subs);
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
  Edit4.Text := FormatFloat('0.00', StrToFloat(Edit4.Text) - s + subs);
end;

procedure TMainForm.DelCl(id: integer);
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
    Statusbar1.Panels[0].Text := '������: ' + SGCl.Cells[0, SGCl.row] + '/' + FormatFloat('0.00', subs);
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
  Edit4.Text := FormatFloat('0.00', ASub);
end;

procedure TMainForm.RecalcSelectedRows;
var
  pr: TAboutBox1;
  c:  TClient;
  t:  array of integer;
  i, j, cnt: integer;
begin

  //������ ���������� ���������
  with DModule.sqlQuery1 do
  begin
    cnt := 0;
    Close;
    SQL.Clear;
    SQL.Add(qr.SQL);
    for i := 0 to Length(qr.parname) - 1 do
      Parameters.ParamByName(qr.parname[i]).Value := qr.parval[i];
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
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 's', rdt);
        SetParam(Parameters, 'r', client);
        for i := 0 to numbtarif - 1 do
        begin
          if (i < 8) or (i > 11) then
          begin
            Parameters.ParseSQL(SQL.Text, True);
            SetParam(Parameters, 'serv', i);
            SetParam(Parameters, 'pm', c.cdata.pm[i]);
            SetParam(Parameters, 'snp', c.cdata.snpm[i]);
            SetParam(Parameters, 'sub', c.cdata.sub[i]);
            SetParam(Parameters, 'sp', c.cdata.fpm[i]);
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

procedure TMainForm.FormCreate(Sender: TObject);
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
  office := -1;
  LoginMode := lNone;
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
      if OpenKey(SUB_ROOT_KEY, True) then
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

  Statusbar1.Panels[1].Text := '���������: ' + SelInsp(insp);
  Statusbar1.Panels[2].Text := '�����: ' + SelDist(dist);

  FormerStringGrid(SGCL, TStringArray.Create('���', '�����', '���� ��������',
    '������','��������'), TIntArray.Create(200, 170, 128, 40, 55), 2);

  MainForm.Caption := '���� �������������� �������� �� ������ ��� ��������� �.����� �� ' +
    StringDate(StrToDate(rdt)) + '�.' + ' [' + Revision + ']' + ' - ' + curServer;

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

  MainForm.codedbf := OEM;
  FillCurr(bpath, rdt, dist, MainForm.codedbf);

  //��� �������� ������ �� �������
  ItemIndex := -1;
  LastTime := Time;
  //��� ������
  reg := 0;
  fdate := Date;
  lDate := Date;
  SetTarifs;
end;

function TMainForm.NewPlace(id: integer; s1, s2: string): integer;
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

procedure TMainForm.InsertCl(i1, i2: integer);
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

procedure TMainForm.FormClose;
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
    DModule.sqlConnection.Connected := True;
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('execute getedate :idd');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'idd', dist);
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
    DModule.sqlConnection.Connected := True;
    if (pdt > rdt) and DModule.sqlConnection.Connected then
      FillCurr(bpath, pdt, dist, MainForm.codedbf);
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

function TMainForm.SetSumSub: real;
  { ���������� ������� ����� �������� ��� �������� �� ������� ����� }
var
  i: integer;
begin
  Result := 0;
  for i := 0 to Length(cl) - 1 do
    Result := Result + sub[i];
end;

procedure TMainForm.Reload;
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

  MainForm.Enabled := False;
  pr := TAboutBox1.Create(Application);
  pr.Label1.Caption := '�������� ���� ������';
  pr.Label2.Caption := '��������� �������:';
  pr.Label3.Caption := '';
  pr.Show;
  pr.Update;
  SendMessage(pr.Handle, wm_paint, 0, 0);
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('execute getinfoscr :idd,:d');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'idd', dist);
    SetParam(Parameters, 'd', rdt);
    try
      Open;
    except
      ShowMessage('Connect failed trying reconnect...');
      DModule.sqlConnection.Close;
      try
        DModule.sqlConnection.Open;
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
        SGCl.Cells[4, i + 1] := FormatFloat('0.00', sub[i]);
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
  MainForm.Enabled := True;
  ccl := c;
  acl := ACount;
  Edit1.Text := IntToStr(ccl);
  Edit2.Text := IntToStr(acl);
  Edit3.Text := Edit1.Text;
  Edit4.Text := FormatFloat('0.00', SetSumSub);
  if c > 0 then
    Statusbar1.Panels[0].Text := '������: ' + f + '/' + FormatFloat('0.00', subs)
  else
    Statusbar1.Panels[0].Text := '������: ' + f + '/?';

  if LoginMode = lNone then
  begin
    aSelDist.Execute;
  end;
  if LoginMode = lNone then
    halt;
end;

procedure TMainForm.ReloadConfig;
begin
  GroupBox1.Visible := getConfValue('0.ShowLegend');
  getConfValue('1.Server');
  //� ���������� �������� ���� ����� � ��������
  if getConfValue('0.OtherRepPath') = True then
    reports_path := getConfValue('0.RepPath')
  else
    reports_path := (ExtractFilePath(Application.ExeName) + 'reports\');
end;

procedure TMainForm.ReportsFillAdditionData(nameInsp: string);
begin
  New(MainForm.ARepData);
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
  Dispose(MainForm.ARepData);
end;

procedure TMainForm.ReportsFillDistInfo;
{ ��������� ��������� �������� ���������� � ������� ��� ������������ ����� }
var
  tmp_query: TADOQuery;
begin
  tmp_query := TADOQuery.Create(DModule);
  tmp_query.Connection := DModule.sqlConnection;// .DatabaseName := 'Subsidy';
  with tmp_query do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM Dist' + #13 +
      'WHERE id_dist=:dist';
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'dist', dist);
    Open;
    frxReport1.Variables.Variables['distName'] := Quotedstr(GetFIOPadeg(FieldByName('namedist').AsString, '', '', True, 2));
    frxReport1.Variables.Variables['distAdr']  := Quotedstr(FieldByName('adr').AsString);
    frxReport1.Variables.Variables['distTel']  := Quotedstr(FieldByName('tel').AsString);
    if office <> -1 then
    begin
      //11.08.2011
      Close;SQL.Clear;
      SQL.Text := 'SELECT * FROM Office WHERE id_dist=:dist and id_office=:office';
      Parameters[0].Value:=dist;
      Parameters[1].Value:=MainForm.idOffice;
      Open;
      frxReport1.Variables.Variables['distAdr']  := Quotedstr(FieldByName('adr').AsString);
      frxReport1.Variables.Variables['distTel']  := Quotedstr(FieldByName('tel').AsString);
    end;
    Free;
  end;
end;

procedure TMainForm.Load(q: CQuery; rsel: boolean);
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
  MainForm.{ActionToolBar1.}Enabled := False;
  pr := TAboutBox1.Create(Application);
  pr.Label1.Caption := '�������� ����������� ������';
  pr.Label2.Caption := '��������� �������:';
  pr.Label3.Caption := '';
  pr.Show;
  pr.Update;
  SendMessage(pr.Handle, wm_paint, 0, 0);
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;

    SQL.Text := (
      'select cl.regn,cl.fio,strt.namestreet,cl.nhouse,cl.corp,cl.apart,'#13#10 +
      'sb1.calc,sb1.bdate,sb1.edate,sb.summa,sb.stop'#13#10 +
      'from cl inner join strt on cl.id_street=strt.id_street'#13#10 +
      'left join'#13#10 +
      '('#13#10 +
      'SELECT    sub.regn,'#13#10 +
      '(case when'#13#10 +
        'sub.regn not in'#13#10 +
          '(select sluj.regn'#13#10 +
          'from sluj'#13#10 +
          'where sluj.sdate = CONVERT(smalldatetime, :d, 104)'#13#10 +
            'and sluj.regn=sub.regn)'#13#10 +
      'then SUM(sub.sub)'#13#10 +
      'else (SUM(sub.sub) - (select sum(sluj.sub)'#13#10 +
                'from sluj'#13#10 +
                'where sluj.sdate = CONVERT(smalldatetime, :d, 104)'#13#10 +
                  'and sluj.regn=sub.regn))'#13#10 +
      'end) as summa, stop'#13#10 +
      'FROM          Sub'#13#10 +

      'WHERE      (sub.sdate = CONVERT(smalldatetime, :d, 104))'#13#10 +
      'GROUP BY sub.regn, sub.stop'#13#10 +
      ')'#13#10 +
       'sb on sb.regn=cl.regn'#13#10 +
          'inner join (' + q.SQL + ') sb1 on cl.regn=sb1.regn'#13#10 +
      'order by cl.fio');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'idd', dist);
    SetParam(Parameters, 'd', rdt);
    for i := 0 to Length(q.parname) - 1 do
      SetParam(Parameters, q.parname[i], q.parval[i]);
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
        SGCl.Cells[4, i + 1] := FormatFloat('0.00', sub[i]);
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
  MainForm.Enabled := True;
  Edit3.Text := IntToStr(c);
  if c > 0 then
  begin
    Edit4.Text := FormatFloat('0.00', ASub);
    Statusbar1.Panels[0].Text := '������: ' + f + '/' + FormatFloat('0.00', subs);
  end
  else
  begin
    Edit4.Text := '0';
    Statusbar1.Panels[0].Text := '������: ' + f + '/?';
  end;
end;

procedure TMainForm.SGClDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
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


procedure TMainForm.ClearSG;
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

procedure TMainForm.DelRow(i: integer);
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

procedure TMainForm.SGClSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
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
    Statusbar1.Panels[0].Text := '������: ' + SGCl.Cells[0, arow] + '/' + FormatFloat('0.00', subs);
  end;
end;

procedure TMainForm.SaveSubsidyCfg;
begin
  //���������� � ������
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey(SUB_ROOT_KEY, True) then
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

procedure TMainForm.SetPer(per1: string; var per2: string);
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

procedure TMainForm.SetPer2(per1: string; var per2: string);
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

procedure TMainForm.PrintVedCr(f, ad, rd, mng: string);
{ ������������ ��������� �������� ������� �� ��� }
var
  y1, dt: string;
begin
  DModule.sqlQuery1.SQL.Clear;
  DModule.sqlQuery1.SQL.Add('EXEC vedomost "' + rdt + '", "' + IntToStr(client) + '"');
  DModule.sqlQuery1.Open;

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
  frxReport1.Variables.Variables['boss'] := quotedstr(SelBoss(dist));
  frxReport1.PrepareReport;
  frxReport1.ShowPreparedReport;
end;

procedure TMainForm.SGClDblClick(Sender: TObject);
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
      EditClForm.mode := vEdit;
      EditClForm.ShowModal;
    end
    else
      ShowMessage('����� ������� ������������� ��� ���������!' + #13 +
        '�������� �������� ������ ����� ������������� �������� ��� �� ��������� ����� ��������.');
    sec1 := oldsec;
  end
  else
    ShowMessage('���� �����!');
end;

procedure TMainForm.SGClKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{ ��������� ������� ������ �� ���������� }
begin
  if Key = vk_insert then
  begin
    if CheckP2 then
    begin
      EditClForm.mode := vAdd;
      EditClForm.ShowModal;
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
        EditClForm.mode := vEdit;
        EditClForm.ShowModal;
      end
      else
        ShowMessage('����� ������� ������������� ��� ���������!' + #13 +
          '�������� �������� ������ ����� ������������� �������� ��� �� ��������� ����� ��������.');
    end
    else
      ShowMessage('���� �����!');
  end;
end;

procedure TMainForm.SGClKeyPress(Sender: TObject; var Key: char);
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
    ItemIndex := SG_Find(SGCl, searchbuf, 0);
    if (ItemIndex <> -1) then
    begin
      client := cl[ItemIndex - 1];
      status := st[ItemIndex - 1];
      subs := sub[ItemIndex - 1];
      SGCl.Row := ItemIndex;
    end;
  end;
end;

procedure TMainForm.SGClMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //SGCL.Row := SGCL.MouseCoord(x, y).Y;
end;

procedure TMainForm.FormResize(Sender: TObject);
{
  ��������� ��������� �������� ����������� �� ����� � ������������ � ����������
  �������� �����
}
var
  w1: integer;
begin
  case MainForm.WindowState of
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

procedure TMainForm.N73Click(Sender: TObject);
{*******************************************************************************
  ��������� ���������������� �������� � ������� �������� ������� ���������� �������.
  � ������� hist �������� ���� stop ��������������� � 2, � � ������� �������� � ���������
  ���������� ������� ��������(����������, ����� ���� ������� ������������).
*******************************************************************************}
begin
  if (stop[SGCl.Row - 1] = 0) and (status <> 3) then
  begin
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update sub');
      SQL.Add('set sub=0.00,stop=2');
      SQL.Add('where regn=:id and sdate=convert(smalldatetime,:d,104)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', client);
      SetParam(Parameters, 'd', rdt);
      ExecSQL;
      Close;
      Close;
      SQL.Clear;
      SQL.Add('update sluj');
      SQL.Add('set sub=0.00');
      SQL.Add('where regn=:id and sdate=convert(smalldatetime,:d,104)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', client);
      SetParam(Parameters, 'd', rdt);
      ExecSQL;
      Close;
    end;
    stop[SGCl.Row - 1] := 2;
    subs := 0;
    sub[SGCl.Row - 1] := 0;
    SGCl.Cells[4, SGCl.Row] := '0.00';
    Edit4.Text := FormatFloat('0.00', SetSumSub);
    SGCl.Repaint;
  end
  else
    ShowMessage('������������� ����� ������ ����������� �������� ��������� �������!');
end;

procedure TMainForm.N75Click(Sender: TObject);
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
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update sub');
      SQL.Add('set sub=0.00,stop=3');
      SQL.Add('where regn=:id and sdate=convert(smalldatetime,:d,104)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', client);
      SetParam(Parameters, 'd', rdt);
      ExecSQL;
      Close;
      Close;
      SQL.Clear;
      SQL.Add('update sluj');
      SQL.Add('set sub=0.00');
      SQL.Add('where regn=:id and sdate=convert(smalldatetime,:d,104)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', client);
      SetParam(Parameters, 'd', rdt);
      ExecSQL;
      Close;
    end;
    stop[SGCl.Row - 1] := 3;
    subs := 0;
    sub[SGCl.Row - 1] := 0;
    SGCl.Cells[4, SGCl.Row] := '0.00';
    Edit4.Text := FormatFloat('0.00', SetSumSub);
    SGCl.Repaint;
  end
  else
    ShowMessage('���������� ����� ������ ���������������� �������� ��������� ������� �� ��������� 1 ������ �� ��� ������������!');
end;

procedure TMainForm.N74Click(Sender: TObject);
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
    with DModule.sqlQuery1 do
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
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 's', rdt);
      SetParam(Parameters, 'r', client);
      s := 0;
      for i := 0 to numbtarif - 1 do
      begin
        if (i < 8) or (i > 11) then
        begin
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'serv', i);
          SetParam(Parameters, 'pm', c.cdata.pm[i]);
          SetParam(Parameters, 'snp', c.cdata.snpm[i]);
          SetParam(Parameters, 'sub', c.cdata.sub[i]);
          SetParam(Parameters, 'sp', c.cdata.fpm[i]);
          ExecSQL;
          s := s + c.cdata.sub[i];
        end;
      end;
    end;
    stop[SGCl.Row - 1] := 1;
    subs := s;
    sub[SGCl.Row - 1] := s;
    SGCl.Cells[4, SGCl.Row] := FormatFloat('0.00', sub[SGCl.Row - 1]);
    Edit4.Text := FormatFloat('0.00', SetSumSub);
    SGCl.Repaint;
  end
  else
    ShowMessage('����������� ����� ������ ������������ �������� ��������� ������� �� ��������� 1 ������ �� ��� ������������!');
end;

procedure TMainForm.N93Click(Sender: TObject);
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
    with DModule.sqlQuery1 do
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
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 's', rdt);
      SetParam(Parameters, 'r', client);
      s := 0;
      for i := 0 to numbtarif - 1 do
      begin
        if (i < 8) or (i > 11) then
        begin
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'serv', i);
          SetParam(Parameters, 'pm', c.cdata.pm[i]);
          SetParam(Parameters, 'snp', c.cdata.snpm[i]);
          SetParam(Parameters, 'sub', c.cdata.sub[i]);
          SetParam(Parameters, 'sp', c.cdata.fpm[i]);
          ExecSQL;
          s := s + c.cdata.sub[i];
        end;
      end;
    end;
    stop[SGCl.Row - 1] := 0;
    subs := s;
    sub[SGCl.Row - 1] := s;
    SGCl.Cells[4, SGCl.Row] := FormatFloat('0.00', sub[SGCl.Row - 1]);
    Edit4.Text := FormatFloat('0.00', SetSumSub);
    SGCl.Repaint;
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
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

