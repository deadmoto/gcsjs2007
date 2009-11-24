object Form41: TForm41
  Left = 190
  Top = 111
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072' dbf-'#1092#1072#1081#1083#1086#1074
  ClientHeight = 57
  ClientWidth = 238
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RadioButton1: TRadioButton
    Left = 16
    Top = 24
    Width = 57
    Height = 17
    Caption = 'ANSI'
    TabOrder = 0
  end
  object RadioButton2: TRadioButton
    Left = 80
    Top = 24
    Width = 57
    Height = 17
    Caption = 'OEM'
    Checked = True
    TabOrder = 1
    TabStop = True
  end
  object Button1: TButton
    Left = 152
    Top = 20
    Width = 75
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
end
