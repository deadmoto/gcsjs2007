object Form17: TForm17
  Left = 324
  Top = 180
  BorderStyle = bsToolWindow
  ClientHeight = 355
  ClientWidth = 243
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
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 237
    Height = 302
    Align = alTop
    Caption = #1042#1099#1073#1086#1088' '#1080#1085#1089#1087#1077#1082#1090#1086#1088#1072':'
    TabOrder = 0
    ExplicitWidth = 232
    object ListBox1: TListBox
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 227
      Height = 279
      Align = alClient
      Ctl3D = True
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 15
      ExplicitWidth = 234
      ExplicitHeight = 274
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 311
    Width = 237
    Height = 41
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitLeft = 16
    ExplicitTop = 336
    ExplicitWidth = 185
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Hint = #1057#1087#1080#1089#1086#1082' '#1072#1082#1090#1080#1074#1085#1099#1093' '#1080#1085#1089#1087#1077#1082#1090#1086#1088#1086#1074
      Caption = #1054#1082
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 152
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
