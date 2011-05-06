object MainFrm: TMainFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' "'#1057#1091#1073#1089#1080#1076#1080#1080'"'
  ClientHeight = 290
  ClientWidth = 428
  Color = clBtnFace
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
  object ProgressBar1: TProgressBar
    AlignWithMargins = True
    Left = 3
    Top = 28
    Width = 422
    Height = 17
    Margins.Bottom = 0
    Align = alTop
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 25
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 90
      Height = 13
      Caption = #1058#1077#1082#1091#1097#1072#1103' '#1074#1077#1088#1089#1080#1103': '
    end
    object Label2: TLabel
      Left = 256
      Top = 6
      Width = 127
      Height = 13
      Caption = #1042#1077#1088#1089#1080#1103' '#1076#1083#1103' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103': '
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 71
    Width = 422
    Height = 157
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Memo1: TMemo
      Left = 2
      Top = 2
      Width = 418
      Height = 153
      Align = alClient
      BorderStyle = bsNone
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object ProgressBar2: TProgressBar
    AlignWithMargins = True
    Left = 3
    Top = 48
    Width = 422
    Height = 17
    Align = alTop
    Max = 50
    TabOrder = 3
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 256
    Width = 422
    Height = 31
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 4
    object Button1: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 190
      Height = 25
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1085#1072#1083#1080#1095#1080#1103' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 199
      Top = 3
      Width = 75
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Enabled = False
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 228
    Width = 428
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object CheckBox1: TCheckBox
      Left = 6
      Top = 4
      Width = 127
      Height = 17
      Hint = #1047#1072#1087#1088#1086#1089#1099' '#1074#1099#1087#1086#1083#1085#1103#1102#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1083#1086#1082#1072#1083#1100#1085#1086#1075#1086' '#1089#1077#1088#1074#1077#1088#1072'!'
      Margins.Left = 5
      Margins.Top = 8
      Caption = #1042#1099#1087#1086#1083#1085#1103#1090#1100' '#1079#1072#1087#1088#1086#1089#1099
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 139
      Top = 4
      Width = 158
      Height = 17
      Caption = #1059#1076#1072#1083#1103#1090#1100' '#1089#1082#1072#1095#1077#1085#1085#1099#1077' '#1092#1072#1081#1083#1099
      TabOrder = 1
      OnClick = CheckBox2Click
    end
  end
end
