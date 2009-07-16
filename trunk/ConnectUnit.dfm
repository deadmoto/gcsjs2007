object Form45: TForm45
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  ClientHeight = 99
  ClientWidth = 285
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 279
    Height = 52
    Align = alClient
    Caption = #1042#1099#1073#1086#1088' '#1089#1077#1088#1074#1077#1088#1072':'
    TabOrder = 0
    object ComboBox1: TComboBox
      Left = 8
      Top = 22
      Width = 265
      Height = 21
      ItemHeight = 0
      TabOrder = 0
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 61
    Width = 279
    Height = 35
    Align = alBottom
    AutoSize = True
    BevelInner = bvLowered
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 1
    object Button2: TButton
      AlignWithMargins = True
      Left = 199
      Top = 5
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 118
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
