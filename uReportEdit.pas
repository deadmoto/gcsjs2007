unit uReportEdit;

interface

uses
  Classes,
  Controls,
  Dialogs,
  ExtCtrls,
  Forms,
  Graphics,
  Messages,
  StdCtrls,
  SysUtils,
  Variants,
  Windows,
  ComCtrls,
  Menus;

type
  TReportEditFrm = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ReportListView: TListView;
    FlowPanel1: TFlowPanel;
    Button2: TButton;
    Button1: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ReportsArr: array of string;
  public
    { Public declarations }
    procedure Reload;
  end;

var
  ReportEditFrm: TReportEditFrm;

implementation

uses
  main, DataModule, service;

{$R *.dfm}

procedure TReportEditFrm.Button1Click(Sender: TObject);
begin
  DModule.CommitSQLTransaction;
  Close;
end;

procedure TReportEditFrm.Button2Click(Sender: TObject);
begin
  Close;
end;

{ TReportFiles }

procedure TReportEditFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DModule.RollBackSQLTransaction;
end;

procedure TReportEditFrm.FormShow(Sender: TObject);
begin
  DModule.StartSQLTransaction;

  Reload;
end;

procedure TReportEditFrm.N1Click(Sender: TObject);
var rep: string;
begin
  rep := MainForm.reports_path + ReportListView.Items[ReportListView.ItemIndex].SubItems[0];
  
  if not FileExists(rep) then
  begin
    ShowMessage('Не удалось найтти файл шаблона!');
    Exit;
  end;

  with MainForm do
  begin
    MainForm.frxReport1.LoadFromFile(rep);
    MainForm.frxReport1.DesignReport();
  end;
end;

procedure TReportEditFrm.N2Click(Sender: TObject);
var oDlg:    TOpenDialog;
begin
  oDlg := tOpenDialog.Create(nil);
  oDlg.Filter := 'FastReport Templates|*.fr3';
  if oDlg.Execute then
  begin
    try
      with DModule.sqlQuery1 do
      begin
        SQL.Text := 'update report set filename = :name where lower(name) = lower(:oldname)';
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'name', ChangeFileExt(ExtractFileName(oDlg.FileName),''));
        SetParam(Parameters, 'oldname',
          ReportsArr[ReportListView.ItemIndex]
          );
        ExecSQL;
      end;
    except
      MessageDlg('Error! Неудалось назначить имя шаблона, возможно новое имя уже используется!', mtError, [mbOK], 0);
    end;
    Reload;
  end;
end;

procedure TReportEditFrm.Reload;
var
  item : TListItem;
begin
  ReportListView.Items.Clear;
  SetLength(ReportsArr,0);
  with DModule.sqlQuery1 do
  begin
    SQL.Text := 'select * from report order by title';
    Open;

    while not EOF do
    begin
      SetLength(ReportsArr, Length(ReportsArr) + 1);
      ReportsArr[Length(ReportsArr) - 1] := FieldByName('name').Value;

      item := ReportListView.Items.Add;
      item.Caption := FieldByName('title').Value;
      item.SubItems.Add(FieldByName('filename').Value + '.' + FieldByName('type').Value);
      if FieldByName('type').Value = 'fr3' then
        item.ImageIndex := 17;
      Next;
    end;

  end;
end;

end.
