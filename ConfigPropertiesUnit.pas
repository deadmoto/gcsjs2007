unit ConfigPropertiesUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Registry, StdCtrls, i_def;

const
  cConfig:array[0..1] of string=
  (
    'Приложение',
    'Обновление'
  );

type
  TConfigFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ListBox1: TListBox;
    FlowPanel1: TFlowPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
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
    function returncConfigId(name: string): integer;
  end;

var
  ConfigFrm: TConfigFrm;

implementation

uses fAppPropUnit, fAppUpdateUnit;

{$R *.dfm}

function TConfigFrm.returncConfigId(name: string): integer;
var i: integer;
begin
  for i:=0 to length(cConfig)-1 do
    if cConfig[i]=name then Result:= i;
end;


procedure TConfigFrm.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TConfigFrm.Button2Click(Sender: TObject);
var i : integer;
    ProxyI : IIniOperations;
begin
  if ListBox1.ItemIndex<>-1 then begin
    case returncConfigId(ListBox1.Items[ListBox1.ItemIndex]) of
      0: begin
        if Assigned(confFrame) then
          for i := 0 to TfAppProp(confFrame).ComponentCount -1 do
            if TfAppProp(confFrame).Components[i].GetInterface(IIniOperations, ProxyI) then begin
              ProxyI.IniFileObj := regConf;
              ProxyI.SaveValToIni();
            end;
      end;

      1: begin
        if Assigned(confFrame) then
          for i := 0 to TfAppUpdate(confFrame).ComponentCount -1 do
            if TfAppUpdate(confFrame).Components[i].GetInterface(IIniOperations, ProxyI) then begin
              ProxyI.IniFileObj := regConf;
              ProxyI.SaveValToIni();
            end;
      end;
    end;
end;

end;

procedure TConfigFrm.Button3Click(Sender: TObject);
begin
  Button2.Click;
  Button1.Click;
end;

procedure TConfigFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  regConf.Free;
end;

procedure TConfigFrm.FormShow(Sender: TObject);
var
  list{,list2}: TStringList;
  i: integer;
begin
  if Assigned(confFrame) then FreeAndNil(confFrame);

  regConf:= TRegIniFile.Create('Software\Subsidy');

  list:= TStringList.Create;
//  list2:= TStringList.Create;
//  list2.Duplicates:=dupIgnore;
//  list2.Sorted:= TRUE;
  with TRegistry.Create do begin
    RootKey:= HKEY_CURRENT_USER;
    if OpenKey('Software\Subsidy\Config', TRUE) then begin
      GetValueNames(list);//GetKeyNames(list);
      ListBox1.Clear;
      for i:=0 to list.Count-1 do
        if ListBox1.Items.IndexOf(cConfig[StrToInt(copy(list[i],1,pos('.',list[i])-1))]) = -1 then ListBox1.Items.Add(cConfig[StrToInt(copy(list[i],1,pos('.',list[i])-1))]);
//      ListBox1.Clear;
//      ListBox1.Items.Assign(list2);
    end;
  end;
//  list2.Free;
  list.Free;
end;

procedure TConfigFrm.ListBox1Click(Sender: TObject);
var i : integer;
    ProxyI : IIniOperations;
begin
  if ListBox1.ItemIndex<>-1 then begin
    case returncConfigId(ListBox1.Items[ListBox1.ItemIndex]) of
      0: begin
        if Assigned(confFrame) then FreeAndNil(confFrame);
        confFrame := TfAppProp.Create(ConfigFrm);
        confFrame.Parent:= Panel2;
        confFrame.Align:= alClient;
        confFrame.Visible:= TRUE;
        TfAppProp(confFrame).Panel1.Caption:= ListBox1.Items[ListBox1.ItemIndex];
        for i := 0 to TfAppProp(confFrame).ComponentCount -1 do begin
          if TfAppProp(confFrame).Components[i].GetInterface(IIniOperations, ProxyI) then begin
            ProxyI.IniFileObj := regConf;
            ProxyI.LoadValFromIni();
          end;
        end;
      end;

      1: begin
        if Assigned(confFrame) then FreeAndNil(confFrame);
        confFrame := TfAppUpdate.Create(ConfigFrm);
        confFrame.Parent:= Panel2;
        confFrame.Align:= alClient;
        confFrame.Visible:= TRUE;
        TfAppUpdate(confFrame).Panel1.Caption:= ListBox1.Items[ListBox1.ItemIndex];
        for i := 0 to TfAppUpdate(confFrame).ComponentCount -1 do begin
          if TfAppUpdate(confFrame).Components[i].GetInterface(IIniOperations, ProxyI) then begin
            ProxyI.IniFileObj := regConf;
            ProxyI.LoadValFromIni();
          end;
        end;
      end;
    end;
  end;
end;


end.

