unit Plugins;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DBTables, StdCtrls;

type
  TPlugins = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure _Report_Click(Sender: TObject);

  private
    { Private declarations }
    Procedure CreateListPlugin;
    Procedure _Clear_and_Inicil;

  public
    procedure _FindButton(Value  : Integer);
    Procedure _FreeAllLibrary;

    { Public declarations }
  end;

var
  Plugin: TPlugins;

implementation

uses mod_Types, datamodule;

{$R *.dfm}

Const CountBtns         = 21;

Type  TListPlugin       = Array[1..CountBtns] of TPlugin;

Var   ListPlugin        : TListPlugin;
var DM: TDataModule1;

Procedure TPlugins._Clear_and_Inicil;
Var i   : Integer;
Begin
// Очистка массива и запрещение всех доступных кнопок кроме системных
FillChar(ListPlugin, SizeOf(TListPlugin), #0);
For i:=0 to ComponentCount - 1 do                            // Перебираем компоненты
  If (Components[i] is TSpeedButton) Then                    // ...если это кнопка
    If (Components[i] as TSpeedButton).Tag > 0 Then          // ...если не системная
      Begin
      (Components[i] as TSpeedButton).Visible := False;
      (Components[i] as TSpeedButton).Caption := NullStr;
      (Components[i] as TSpeedButton).Hint    := NullStr;
      end;
end;

procedure TPlugins._FindButton(Value  : Integer);
Var i                 : Integer;
     vEnb        : Integer;
Begin

For i:=0 to ComponentCount - 1 do                            // Перебираем компоненты
  If (Components[i] is TSpeedButton) Then                    // ...если это кнопка
    If (Components[i] as TSpeedButton).Tag = Value Then      // ...если нужная кнопка
      Begin
      (Components[i] as TSpeedButton).Visible := True;
      (Components[i] as TSpeedButton).Caption := ListPlugin[Value].BtnName;
      (Components[i] as TSpeedButton).Hint    := ListPlugin[Value].Hint;
//      Try vVis := qButton.Field('VISIBLE'); Except vVis := 0; end;
  //    Try vEnb := qButton.Field('ENABLED'); Except vEnb := 0; end;
     (Components[i] as TSpeedButton).Enabled :=  vEnb = 1;
//     (Components[i] as TSpeedButton).Visible :=  vVis = 1;
      end;
end;

procedure TPlugins.FormCreate(Sender: TObject);
begin
     //ShowMessage('I be work!');
end;

procedure TPlugins.FormShow(Sender: TObject);
begin
    CreateListPlugin;
end;

procedure TPlugins.CreateListPlugin;
Var  SearchRec        : TSearchRec;
     hLib             : THandle;
     ExtConf          : TExternalConf;
     PlugIn_Conf      : TPlugin;
begin
_Clear_and_Inicil;
If FindFirst(PathDLL + '*.dll', faAnyFile, SearchRec) <> 0 Then
  Begin
  ShowMessage('Не найдено подключаемых модулей...'); Close;
  end;
Repeat
  hLib := LoadLibrary(PChar(PathDLL + SearchRec.Name)); @ExtConf := Nil;
  If hLib <> 0 Then
    Begin
    @ExtConf := GetProcAddress(hLib, 'ExternalConf');
    If @ExtConf = Nil Then FreeLibrary(hLib) Else
      Begin
      ExtConf(PlugIn_Conf);
      ListPlugin[PlugIn_Conf.ID]          := PlugIn_Conf;
      ListPlugin[PlugIn_Conf.ID].FileName := SearchRec.Name;
      ListPlugin[PlugIn_Conf.ID].Handle   := hLib;
      _FindButton(PlugIn_Conf.ID);

      end;
    end;
Until FindNext(SearchRec) <> 0;
end;

procedure TPlugins._FreeAllLibrary;
Var i   : Integer;
begin
For i:=1 to CountBtns do
  If ListPlugin[i].Handle <> 0 Then
    Try
      FreeLibrary(ListPlugin[i].Handle);
    Except ; end;
_Clear_and_Inicil;
end;

procedure TPlugins._Report_Click(Sender: TObject);
Var vTag                : Integer;
    ExternalStart       : TExternalStart;

begin
// Case (Sender as TComponent).Tag of
If Not (Sender is TSpeedButton) Then Exit;
If Not (Sender as TSpeedButton).Visible Then Exit;
vTag := (Sender as TSpeedButton).Tag;

Try
  ExternalStart := TExternalStart(GetProcAddress(ListPlugin[vTag].Handle, 'ExternalStart'));
  ExternalStart(Handle, DataModule1.Database1);
Finally ; end;
end;


procedure TPlugins.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  _FreeAllLibrary;

end;

end.
