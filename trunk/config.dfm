object Form25: TForm25
  Left = 390
  Top = 212
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  ClientHeight = 141
  ClientWidth = 256
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
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 250
    Height = 97
    Margins.Bottom = 0
    Align = alClient
    Caption = #1042#1099#1073#1086#1088' '#1086#1082#1088#1091#1075#1072':'
    TabOrder = 0
    ExplicitHeight = 94
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
      Top = 21
      Width = 173
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox2Change
      OnExit = ComboBox2Change
    end
    object ComboBox1: TComboBox
      Left = 72
      Top = 61
      Width = 173
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnChange = ComboBox1Change
      OnExit = ComboBox1Change
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 103
    Width = 250
    Height = 35
    Align = alBottom
    AutoWrap = False
    BevelInner = bvLowered
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 1
    object Button2: TButton
      AlignWithMargins = True
      Left = 170
      Top = 5
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 89
      Top = 5
      Width = 75
      Height = 25
      Caption = #1054#1082
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
