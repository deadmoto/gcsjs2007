object Form21: TForm21
  Left = 273
  Top = 192
  BorderStyle = bsSingle
  Caption = #1055#1077#1088#1077#1076#1072#1095#1072' '#1080' '#1087#1088#1080#1077#1084' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 98
  ClientWidth = 282
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 114
    Height = 13
    Caption = #1055#1077#1088#1077#1076#1072#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1089' '
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 40
    Width = 265
    Height = 17
    TabOrder = 3
  end
  object Button1: TButton
    Left = 56
    Top = 64
    Width = 75
    Height = 25
    Caption = #1055#1077#1088#1077#1076#1072#1095#1072
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 144
    Top = 64
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1077#1084
    TabOrder = 2
    OnClick = Button2Click
  end
  object MaskEdit1: TMaskEdit
    Left = 128
    Top = 8
    Width = 72
    Height = 21
    EditMask = '!90/90/0000;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  .  .    '
    OnExit = MaskEdit1Exit
    OnKeyDown = MaskEdit1KeyDown
  end
end
