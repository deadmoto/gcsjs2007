object Form34: TForm34
  Left = 319
  Top = 169
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'SQL-'#1079#1072#1087#1088#1086#1089
  ClientHeight = 371
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 521
    Height = 145
    Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090' SQL-'#1079#1072#1087#1088#1086#1089#1072
    DataSource = DataModule1.DataSource1
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 160
    Width = 529
    Height = 201
    Caption = #1058#1077#1082#1091#1097#1080#1081' '#1079#1072#1087#1088#1086#1089
    TabOrder = 0
    object Memo1: TMemo
      Left = 8
      Top = 16
      Width = 405
      Height = 177
      Hint = #1058#1077#1082#1089#1090' '#1090#1077#1082#1091#1097#1077#1075#1086' SQL-'#1079#1072#1087#1088#1086#1089#1072
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object Button1: TButton
      Left = 424
      Top = 24
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
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1074' dbf'
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
  object SaveDialog1: TSaveDialog
    DefaultExt = 'sql'
    FileName = 'untitled1'
    Filter = 
      #1060#1072#1081#1083#1099' '#1079#1072#1087#1088#1086#1089#1086#1074'(*.sql)|*.sql|'#1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'(*.txt)|*.txt|'#1042#1089#1077' '#1092#1072#1081 +
      #1083#1099'(*.*)|*.*'
    InitialDir = 'querys'
    Left = 224
    Top = 88
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'sql'
    Filter = 
      #1060#1072#1081#1083#1099' '#1079#1072#1087#1088#1086#1089#1086#1074'(*.sql)|*.sql|'#1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'(*.txt)|*.txt|'#1042#1089#1077' '#1092#1072#1081 +
      #1083#1099'(*.*)|*.*'
    InitialDir = 'querys'
    Left = 168
    Top = 88
  end
end
