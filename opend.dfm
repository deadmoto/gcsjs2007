object Form26: TForm26
  Left = 344
  Top = 195
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  ClientHeight = 117
  ClientWidth = 221
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
    Width = 215
    Height = 70
    Align = alClient
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1086#1090#1095#1077#1090#1085#1099#1081' '#1087#1077#1088#1080#1086#1076':'
    TabOrder = 0
    object Label1: TLabel
      Left = 64
      Top = 20
      Width = 36
      Height = 13
      Caption = #1052#1077#1089#1103#1094':'
    end
    object Label2: TLabel
      Left = 8
      Top = 20
      Width = 21
      Height = 13
      Caption = #1043#1086#1076':'
    end
    object ComboBox2: TComboBox
      Left = 64
      Top = 36
      Width = 145
      Height = 21
      DropDownCount = 12
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox2Change
      OnExit = ComboBox2Change
    end
    object Edit1: TEdit
      Left = 8
      Top = 36
      Width = 41
      Height = 21
      TabOrder = 1
      Text = '2006'
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 79
    Width = 215
    Height = 35
    Align = alBottom
    AutoSize = True
    BevelInner = bvLowered
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 1
    object Button2: TButton
      AlignWithMargins = True
      Left = 135
      Top = 5
      Width = 75
      Height = 25
      Caption = #1042#1099#1081#1090#1080
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 54
      Top = 5
      Width = 75
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
