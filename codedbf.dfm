object Form41: TForm41
  Left = 190
  Top = 111
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  ClientHeight = 65
  ClientWidth = 225
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
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 219
    Height = 59
    Align = alClient
    Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072' DBF-'#1092#1072#1081#1083#1086#1074
    TabOrder = 0
    ExplicitLeft = 16
    ExplicitTop = 47
    ExplicitWidth = 185
    ExplicitHeight = 105
    object Button1: TButton
      Left = 135
      Top = 20
      Width = 75
      Height = 25
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
    object RadioButton1: TRadioButton
      Left = 9
      Top = 24
      Width = 57
      Height = 17
      Caption = 'ANSI'
      TabOrder = 1
    end
    object RadioButton2: TRadioButton
      Left = 73
      Top = 24
      Width = 57
      Height = 17
      Caption = 'OEM'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
  end
end
