object Form43: TForm43
  Left = 181
  Top = 188
  Width = 298
  Height = 228
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1042#1099#1073#1086#1088' '#1087#1088#1080#1095#1080#1085#1099' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 273
    Height = 145
    Caption = #1055#1088#1080#1095#1080#1085#1072' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' '#1074' '#1080#1079#1084#1077#1085#1077#1085#1080#1080
    TabOrder = 0
    object CheckBox1: TCheckBox
      Left = 32
      Top = 24
      Width = 153
      Height = 17
      Caption = #1087#1088#1086#1078#1080#1090#1086#1095#1085#1086#1075#1086' '#1084#1080#1085#1080#1084#1091#1084#1072
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 32
      Top = 48
      Width = 97
      Height = 17
      Caption = #1052#1044#1044
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 32
      Top = 72
      Width = 161
      Height = 17
      Caption = #1089#1090#1072#1085#1076#1072#1088#1090#1072' '#1089#1090#1086#1080#1084#1086#1089#1090#1080' '#1046#1050#1059
      TabOrder = 2
    end
    object CheckBox4: TCheckBox
      Left = 32
      Top = 96
      Width = 17
      Height = 17
      TabOrder = 3
    end
    object Memo1: TMemo
      Left = 50
      Top = 96
      Width = 185
      Height = 33
      Lines.Strings = (
        '')
      TabOrder = 4
    end
  end
  object Button1: TButton
    Left = 104
    Top = 160
    Width = 89
    Height = 25
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 32
    Top = 152
  end
end
