object Form36: TForm36
  Left = 329
  Top = 151
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1042#1099#1073#1086#1088' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1080
  ClientHeight = 251
  ClientWidth = 225
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DirectoryListBox1: TDirectoryListBox
    Left = 16
    Top = 48
    Width = 193
    Height = 113
    Hint = #1057#1087#1080#1089#1086#1082' '#1076#1086#1089#1090#1091#1087#1085#1099#1093' '#1087#1072#1087#1086#1082' '#1076#1083#1103' '#1074#1099#1073#1086#1088#1072' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1080
    ItemHeight = 16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnChange = DirectoryListBox1Change
  end
  object DriveComboBox1: TDriveComboBox
    Left = 16
    Top = 176
    Width = 193
    Height = 19
    Hint = #1057#1087#1080#1089#1086#1082' '#1076#1086#1089#1090#1091#1087#1085#1099#1093' '#1076#1080#1089#1082#1086#1074
    DirList = DirectoryListBox1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object Button2: TButton
    Left = 32
    Top = 216
    Width = 75
    Height = 25
    Caption = #1042#1099#1081#1090#1080
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 112
    Top = 216
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 16
    Top = 16
    Width = 193
    Height = 21
    Hint = #1058#1077#1082#1091#1097#1072#1103' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1103
    TabStop = False
    Enabled = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 4
  end
end
