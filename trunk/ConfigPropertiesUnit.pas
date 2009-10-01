unit ConfigPropertiesUnit;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ComCtrls,
  ExtCtrls,
  Registry,
  StdCtrls,
  i_def,
  IniCheckBox,
  IniLabeledEdit;

type
  TConfigGroup = class
  strict private
    function returnID(name: string): integer;
  public
    cConfig: array[0..1] of string;
    property GetID[cName: string]: integer Read returnID;
    constructor Create;
  end;

  TConfigFrm = class(TForm)
    Panel1:     TPanel;
    Panel2:     TPanel;
    ListBox1:   TListBox;
    FlowPanel1: TFlowPanel;
    Button1:    TButton;
    Button2:    TButton;
    Button3:    TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    confFrame: TFrame;
  public
    { Public declarations }
    regConf: TregIniFile;
    cGroup: TConfigGroup;
    function CheckChanges: boolean;
  end;

var
  ConfigFrm: TConfigFrm;

implementation

uses
  fAppPropUnit,
  fAppUpdateUnit,
  service;

{$R *.dfm}

procedure TConfigFrm.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TConfigFrm.Button2Click(Sender: TObject);
var
  i: integer;
  ProxyI: IIniOperations;
begin
  if ListBox1.ItemIndex <> -1 then
  begin
    case cGroup.GetID[ListBox1.Items[ListBox1.ItemIndex]] of
      0:
      begin
        if Assigned(confFrame) then
          for i := 0 to TfAppProp(confFrame).ComponentCount - 1 do
            if TfAppProp(confFrame).Components[i].GetInterface(IIniOperations, ProxyI) then
            begin
              ProxyI.IniFileObj := regConf;
              ProxyI.SaveValToIni();
            end;
      end;

      1:
      begin
        if Assigned(confFrame) then
          for i := 0 to TfAppUpdate(confFrame).ComponentCount - 1 do
            if TfAppUpdate(confFrame).Components[i].GetInterface(IIniOperations, ProxyI) then
            begin
              ProxyI.IniFileObj := regConf;
              ProxyI.SaveValToIni();
            end;
      end;
    end;

    if checkChanges then
      Button2.Enabled := True
    else
      Button2.Enabled := False;
  end;
end;

procedure TConfigFrm.Button3Click(Sender: TObject);
begin
  Button2.Click;
  Button1.Click;
end;

function TConfigFrm.CheckChanges: boolean;
var
  i: integer;
begin
  if ListBox1.ItemIndex <> -1 then
  begin
    case cGroup.GetID[ListBox1.Items[ListBox1.ItemIndex]] of
      0:
      begin
        for i := 0 to TfAppProp(confFrame).ComponentCount - 1 do
          if TfAppProp(confFrame).Components[i] is TIniCheckBox then
            if getConfValue(TIniCheckBox(TfAppProp(confFrame).Components[i]).KeyName) <> TIniCheckBox(TfAppProp(confFrame).Components[i]).Checked then
              Result := True;
      end;
      1:
      begin
        for i := 0 to TfAppUpdate(confFrame).ComponentCount - 1 do
          if TfAppUpdate(confFrame).Components[i] is TIniLabeledEdit then
            if getConfValue(TIniLabeledEdit(TfAppUpdate(confFrame).Components[i]).KeyName) <> TIniLabeledEdit(TfAppUpdate(confFrame).Components[i]).Text then
              Result := True;
      end;
    end;
  end
end;

procedure TConfigFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  regConf.Free;
end;

procedure TConfigFrm.FormShow(Sender: TObject);
var
  list: TStringList;
  i: integer;
begin
  cGroup:= TConfigGroup.Create;
  if Assigned(confFrame) then
    FreeAndNil(confFrame);

  regConf := TRegIniFile.Create('Software\Subsidy');

  list := TStringList.Create;

  with TRegistry.Create do
  begin
    RootKey := HKEY_CURRENT_USER;
    if OpenKey('Software\Subsidy\Config', True) then
    begin
      GetValueNames(list);//GetKeyNames(list);
      ListBox1.Clear;
      for i := 0 to list.Count - 1 do
        if ListBox1.Items.IndexOf(cGroup.cConfig[StrToInt(copy(list[i], 1, pos('.', list[i]) - 1))]) = -1 then
          ListBox1.Items.Add(cGroup.cConfig[StrToInt(copy(list[i], 1, pos('.', list[i]) - 1))]);
    end;
  end;
  list.Free;
end;

procedure TConfigFrm.ListBox1Click(Sender: TObject);
var
  i: integer;
  ProxyI: IIniOperations;
begin
  if ListBox1.ItemIndex <> -1 then
  begin
    case cGroup.GetID[ListBox1.Items[ListBox1.ItemIndex]] of
      0:
      begin
        if Assigned(confFrame) then
          FreeAndNil(confFrame);
        confFrame := TfAppProp.Create(ConfigFrm);
        confFrame.Parent := Panel2;
        confFrame.Align := alClient;
        confFrame.Visible := True;
        TfAppProp(confFrame).Panel1.Caption := ListBox1.Items[ListBox1.ItemIndex];
        for i := 0 to TfAppProp(confFrame).ComponentCount - 1 do
        begin
          if TfAppProp(confFrame).Components[i].GetInterface(IIniOperations, ProxyI) then
          begin
            ProxyI.IniFileObj := regConf;
            ProxyI.LoadValFromIni();
          end;
        end;
      end;

      1:
      begin
        if Assigned(confFrame) then
          FreeAndNil(confFrame);
        confFrame := TfAppUpdate.Create(ConfigFrm);
        confFrame.Parent := Panel2;
        confFrame.Align := alClient;
        confFrame.Visible := True;
        TfAppUpdate(confFrame).Panel1.Caption := ListBox1.Items[ListBox1.ItemIndex];
        for i := 0 to TfAppUpdate(confFrame).ComponentCount - 1 do
        begin
          if TfAppUpdate(confFrame).Components[i].GetInterface(IIniOperations, ProxyI) then
          begin
            ProxyI.IniFileObj := regConf;
            ProxyI.LoadValFromIni();
          end;
        end;
      end;
    end;
  end;
end;


{ TConfigGroup }

constructor TConfigGroup.Create;
begin
  cConfig[0] := 'Приложение';
  cConfig[1] := 'Обновление';
end;

function TConfigGroup.returnID(name: string): integer;
var
  i: integer;
begin
  for i := 0 to length(cConfig) - 1 do
    if cConfig[i] = Name then
      Result := i;
end;

end.

