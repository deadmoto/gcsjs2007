object Form25: TForm25
  Left = 390
  Top = 212
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  ClientHeight = 129
  ClientWidth = 240
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 240
    Height = 129
    Align = alClient
    Caption = #1050#1086#1085#1092#1080#1088#1091#1075#1072#1094#1080#1103':'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 64
      Width = 58
      Height = 13
      Caption = #1048#1085#1089#1087#1077#1082#1090#1086#1088':'
    end
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 33
      Height = 13
      Caption = #1054#1082#1088#1091#1075':'
    end
    object ComboBox2: TComboBox
      Left = 72
      Top = 24
      Width = 161
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox2Change
      OnExit = ComboBox2Change
    end
    object ComboBox1: TComboBox
      Left = 72
      Top = 64
      Width = 161
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnChange = ComboBox1Change
      OnExit = ComboBox1Change
    end
    object Button2: TButton
      Left = 152
      Top = 96
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 8
      Top = 96
      Width = 75
      Height = 25
      Caption = #1054#1082
      TabOrder = 3
      OnClick = Button1Click
    end
  end
end
