object Form17: TForm17
  Left = 324
  Top = 180
  BorderStyle = bsToolWindow
  ClientHeight = 330
  ClientWidth = 238
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 238
    Height = 330
    Align = alClient
    Caption = #1042#1099#1073#1086#1088' '#1080#1085#1089#1087#1077#1082#1090#1086#1088#1072':'
    TabOrder = 0
    object Button2: TButton
      Left = 152
      Top = 296
      Width = 75
      Height = 25
      Caption = #1042#1099#1081#1090#1080
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 8
      Top = 296
      Width = 75
      Height = 25
      Hint = #1057#1087#1080#1089#1086#1082' '#1072#1082#1090#1080#1074#1085#1099#1093' '#1080#1085#1089#1087#1077#1082#1090#1086#1088#1086#1074
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 1
      OnClick = Button1Click
    end
    object ListBox1: TListBox
      Left = 2
      Top = 15
      Width = 234
      Height = 274
      Align = alTop
      Ctl3D = True
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 2
    end
  end
end
