object Stats: TStats
  Left = 229
  Top = 197
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
  ClientHeight = 560
  ClientWidth = 303
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
    Width = 297
    Height = 234
    Align = alTop
    Caption = #1057#1086#1094'. '#1089#1090#1072#1090#1091#1089':'
    TabOrder = 0
    ExplicitLeft = -2
    ExplicitTop = -6
    ExplicitWidth = 567
    object DBGrid1: TDBGrid
      Left = 2
      Top = 32
      Width = 293
      Height = 200
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataModule1.DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object CheckBox1: TCheckBox
      Left = 2
      Top = 15
      Width = 293
      Height = 17
      Align = alTop
      Caption = #1040#1082#1090#1080#1074#1085#1099#1077
      TabOrder = 1
      ExplicitWidth = 290
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 243
    Width = 297
    Height = 78
    Align = alTop
    Caption = #1044#1086#1093#1086#1076':'
    TabOrder = 1
    ExplicitWidth = 294
    object Label4: TLabel
      Left = 16
      Top = 24
      Width = 14
      Height = 13
      Caption = #1086#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 107
      Top = 24
      Width = 15
      Height = 13
      Caption = #1076#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 50
      Width = 72
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1089#1077#1084#1077#1081':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lFamcount: TLabel
      Left = 107
      Top = 50
      Width = 6
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 36
      Top = 24
      Width = 65
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object Edit2: TEdit
      Left = 128
      Top = 24
      Width = 65
      Height = 21
      TabOrder = 1
      Text = '0'
    end
  end
  object GroupBox3: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 327
    Width = 297
    Height = 50
    Align = alTop
    Caption = #1044#1086#1093#1086#1076#1086#1084' '#1085#1080#1078#1077' '#1087#1088'. '#1084#1080#1085#1080#1084':'
    TabOrder = 2
    ExplicitWidth = 294
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 72
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1089#1077#1084#1077#1081':'
    end
    object lFamCLMin: TLabel
      Left = 107
      Top = 24
      Width = 6
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox4: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 383
    Width = 297
    Height = 74
    Align = alTop
    Caption = #1057#1091#1073#1089#1080#1076#1080#1103':'
    TabOrder = 3
    ExplicitWidth = 294
    object Label9: TLabel
      Left = 16
      Top = 24
      Width = 14
      Height = 13
      Caption = #1086#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 107
      Top = 24
      Width = 15
      Height = 13
      Caption = #1076#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 16
      Top = 50
      Width = 78
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1095#1077#1083#1086#1074#1077#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object MenCount: TLabel
      Left = 107
      Top = 50
      Width = 6
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit3: TEdit
      Left = 36
      Top = 24
      Width = 65
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object Edit4: TEdit
      Left = 128
      Top = 24
      Width = 65
      Height = 21
      TabOrder = 1
      Text = '0'
    end
  end
  object GroupBox5: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 463
    Width = 297
    Height = 53
    Align = alTop
    Caption = #1057#1088#1077#1076#1085#1103#1103' '#1089#1091#1073#1089#1080#1076#1080#1103': '
    TabOrder = 4
    ExplicitWidth = 294
    object Label3: TLabel
      Left = 19
      Top = 24
      Width = 37
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086':'
    end
    object Label12: TLabel
      Left = 107
      Top = 24
      Width = 6
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 522
    Width = 297
    Height = 35
    Align = alBottom
    AutoWrap = False
    BevelInner = bvLowered
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 5
    ExplicitWidth = 294
    object Button2: TButton
      AlignWithMargins = True
      Left = 217
      Top = 5
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 136
      Top = 5
      Width = 75
      Height = 25
      Caption = #1057#1095#1080#1090#1072#1090#1100
      TabOrder = 1
    end
  end
end
