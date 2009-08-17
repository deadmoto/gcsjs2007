object Form26: TForm26
  Left = 344
  Top = 195
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  ClientHeight = 117
  ClientWidth = 256
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 250
    Height = 73
    Margins.Bottom = 0
    Align = alClient
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1086#1090#1095#1077#1090#1085#1099#1081' '#1087#1077#1088#1080#1086#1076':'
    TabOrder = 0
    ExplicitHeight = 70
    object Label1: TLabel
      Left = 89
      Top = 17
      Width = 36
      Height = 13
      Caption = #1052#1077#1089#1103#1094':'
    end
    object Label2: TLabel
      Left = 8
      Top = 17
      Width = 21
      Height = 13
      Caption = #1043#1086#1076':'
    end
    object ComboBox2: TComboBox
      Left = 89
      Top = 36
      Width = 156
      Height = 21
      DropDownCount = 12
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox2Change
      OnExit = ComboBox2Change
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 36
      Width = 68
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = '2009'
      OnExit = ComboBox1Exit
      OnKeyDown = ComboBox1KeyDown
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 79
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
      Caption = #1042#1099#1081#1090#1080
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 89
      Top = 5
      Width = 75
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
