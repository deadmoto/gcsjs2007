object Form34: TForm34
  Left = 319
  Top = 169
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'SQL-'#1079#1072#1087#1088#1086#1089
  ClientHeight = 473
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 239
    Width = 540
    Height = 231
    Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090' SQL-'#1079#1072#1087#1088#1086#1089#1072
    Align = alClient
    DataSource = DataModule1.DataSource1
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object TabControl1: TTabControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 540
    Height = 230
    Align = alTop
    TabOrder = 1
    Tabs.Strings = (
      #1054#1073#1097#1080#1081
      #1048#1089#1087#1086#1083#1085#1103#1077#1084#1099#1081)
    TabIndex = 0
    OnChange = TabControl1Change
    object GroupBox1: TGroupBox
      Left = 4
      Top = 24
      Width = 532
      Height = 201
      Align = alTop
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1079#1072#1087#1088#1086#1089':'
      TabOrder = 0
      ExplicitLeft = 7
      ExplicitTop = -8
      ExplicitWidth = 547
      object Memo1: TMemo
        Left = 8
        Top = 16
        Width = 405
        Height = 177
        Hint = #1058#1077#1082#1089#1090' '#1090#1077#1082#1091#1097#1077#1075#1086' SQL-'#1079#1072#1087#1088#1086#1089#1072
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object Button1: TButton
        Left = 424
        Top = 25
        Width = 97
        Height = 25
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
        TabOrder = 2
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 424
        Top = 56
        Width = 97
        Height = 25
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        TabOrder = 3
        OnClick = Button2Click
      end
      object Button4: TButton
        Left = 424
        Top = 152
        Width = 97
        Height = 25
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1074' DBF'
        TabOrder = 5
        OnClick = Button4Click
      end
      object Button3: TButton
        Left = 424
        Top = 120
        Width = 97
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 4
        OnClick = Button3Click
      end
      object Button5: TButton
        Left = 424
        Top = 88
        Width = 97
        Height = 25
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        TabOrder = 1
        OnClick = Button5Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'sql'
    FileName = 'untitled1'
    Filter = 
      #1060#1072#1081#1083#1099' '#1079#1072#1087#1088#1086#1089#1086#1074'(*.sql)|*.sql|'#1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'(*.txt)|*.txt|'#1042#1089#1077' '#1092#1072#1081 +
      #1083#1099'(*.*)|*.*'
    InitialDir = 'querys'
    Left = 40
    Top = 296
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'sql'
    Filter = 
      #1060#1072#1081#1083#1099' '#1079#1072#1087#1088#1086#1089#1086#1074'(*.sql)|*.sql|'#1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'(*.txt)|*.txt|'#1042#1089#1077' '#1092#1072#1081 +
      #1083#1099'(*.*)|*.*'
    InitialDir = 'querys'
    Left = 8
    Top = 296
  end
end