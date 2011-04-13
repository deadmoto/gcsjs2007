object SQLExecForm: TSQLExecForm
  Left = 319
  Top = 169
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'SQL-'#1079#1072#1087#1088#1086#1089
  ClientHeight = 465
  ClientWidth = 537
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
  object TabControl1: TTabControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 531
    Height = 230
    Align = alTop
    TabOrder = 0
    Tabs.Strings = (
      #1054#1073#1097#1080#1081'(Open)'
      #1048#1089#1087#1086#1083#1085#1103#1077#1084#1099#1081'(ExecSQL)'
      #1053#1072' '#1089#1090#1086#1088#1086#1085#1077' '#1089#1077#1088#1074#1077#1088#1072'(SQLCMD)')
    TabIndex = 0
    OnChange = TabControl1Change
    object GroupBox1: TGroupBox
      Left = 4
      Top = 24
      Width = 523
      Height = 201
      Align = alTop
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1079#1072#1087#1088#1086#1089':'
      TabOrder = 0
      object Memo1: TMemo
        Left = 7
        Top = 16
        Width = 405
        Height = 177
        Hint = #1058#1077#1082#1089#1090' '#1090#1077#1082#1091#1097#1077#1075#1086' SQL-'#1079#1072#1087#1088#1086#1089#1072
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object Button1: TButton
        Left = 418
        Top = 16
        Width = 97
        Height = 25
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
        TabOrder = 2
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 418
        Top = 47
        Width = 97
        Height = 25
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        TabOrder = 3
        OnClick = Button2Click
      end
      object Button4: TButton
        Left = 418
        Top = 140
        Width = 97
        Height = 25
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1074' DBF'
        TabOrder = 5
        OnClick = Button4Click
      end
      object Button3: TButton
        Left = 418
        Top = 109
        Width = 97
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 4
        OnClick = Button3Click
      end
      object Button5: TButton
        Left = 418
        Top = 78
        Width = 97
        Height = 25
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        TabOrder = 1
        OnClick = Button5Click
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 236
    Width = 537
    Height = 229
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 531
      Height = 223
      Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090' SQL-'#1079#1072#1087#1088#1086#1089#1072
      Align = alClient
      DataSource = DModule.DataSource1
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
    object Memo2: TMemo
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 531
      Height = 223
      Align = alClient
      TabOrder = 1
      Visible = False
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
    Top = 424
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'sql'
    Filter = 
      #1060#1072#1081#1083#1099' '#1079#1072#1087#1088#1086#1089#1086#1074'(*.sql)|*.sql|'#1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'(*.txt)|*.txt|'#1042#1089#1077' '#1092#1072#1081 +
      #1083#1099'(*.*)|*.*'
    InitialDir = 'querys'
    Left = 8
    Top = 424
  end
end
