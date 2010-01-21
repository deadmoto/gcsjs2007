object Stats: TStats
  Left = 229
  Top = 197
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
  ClientHeight = 427
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object TabControl1: TTabControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 435
    Height = 296
    Align = alTop
    TabOrder = 0
    Tabs.Strings = (
      #1051#1100#1075#1086#1090#1099
      #1057#1086#1094'. '#1089#1090#1072#1090#1091#1089)
    TabIndex = 0
    object StringGrid1: TStringGrid
      Left = 4
      Top = 24
      Width = 427
      Height = 234
      Align = alTop
      ColCount = 2
      Ctl3D = True
      DefaultRowHeight = 20
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      ParentCtl3D = False
      TabOrder = 0
    end
    object Button1: TButton
      Left = 3
      Top = 264
      Width = 75
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 85
      Top = 264
      Width = 75
      Height = 25
      Caption = #1042' Excel'
      TabOrder = 2
      OnClick = Button2Click
    end
    object CheckBox1: TCheckBox
      Left = 174
      Top = 264
      Width = 51
      Height = 17
      Hint = #1042#1099#1073#1080#1088#1072#1077#1090#1089#1103' '#1082#1086#1083'-'#1074#1086' '#1083#1102#1076#1077#1081' ('#1080#1085#1072#1095#1077' '#1082#1086#1083'-'#1074#1086' '#1089#1077#1084#1077#1081')'
      Caption = #1051#1102#1076#1080
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
  end
  object Button3: TButton
    Left = 363
    Top = 397
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = Button3Click
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 302
    Width = 215
    Height = 91
    Caption = #1044#1086#1093#1086#1076':'
    TabOrder = 2
    object Label3: TLabel
      Left = 10
      Top = 24
      Width = 16
      Height = 13
      Caption = #1054#1090':'
    end
    object Label4: TLabel
      Left = 85
      Top = 24
      Width = 18
      Height = 13
      Caption = #1044#1086':'
    end
    object Label5: TLabel
      Left = 10
      Top = 51
      Width = 40
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086': '
    end
    object Label9: TLabel
      Left = 52
      Top = 51
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Edit1: TEdit
      Left = 32
      Top = 24
      Width = 49
      Height = 21
      TabOrder = 0
      OnExit = Edit1Exit
    end
    object Edit2: TEdit
      Left = 109
      Top = 24
      Width = 49
      Height = 21
      TabOrder = 1
      OnExit = Edit1Exit
    end
  end
  object GroupBox2: TGroupBox
    Left = 224
    Top = 302
    Width = 215
    Height = 91
    Caption = #1057#1091#1073#1089#1080#1076#1080#1103':'
    TabOrder = 3
    object Label6: TLabel
      Left = 10
      Top = 24
      Width = 16
      Height = 13
      Caption = #1054#1090':'
    end
    object Label7: TLabel
      Left = 85
      Top = 24
      Width = 18
      Height = 13
      Caption = #1044#1086':'
    end
    object Label8: TLabel
      Left = 10
      Top = 51
      Width = 37
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086':'
    end
    object Label1: TLabel
      Left = 12
      Top = 70
      Width = 96
      Height = 13
      Caption = #1057#1088#1077#1076#1085#1103#1103' '#1089#1091#1073#1089#1080#1076#1080#1103':'
    end
    object Label11: TLabel
      Left = 52
      Top = 51
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label12: TLabel
      Left = 114
      Top = 70
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Edit3: TEdit
      Left = 32
      Top = 24
      Width = 49
      Height = 21
      TabOrder = 0
      OnExit = Edit1Exit
    end
    object Edit4: TEdit
      Left = 107
      Top = 24
      Width = 49
      Height = 21
      TabOrder = 1
      OnExit = Edit1Exit
    end
  end
  object Button4: TButton
    Left = 282
    Top = 397
    Width = 75
    Height = 25
    Caption = #1057#1095#1080#1090#1072#1090#1100
    TabOrder = 4
    OnClick = Button4Click
  end
end
