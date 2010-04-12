object ReportEditFrm: TReportEditFrm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  ClientHeight = 94
  ClientWidth = 232
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
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 226
    Height = 54
    Margins.Bottom = 0
    Align = alTop
    Caption = #1054#1090#1095#1077#1090' '#1076#1083#1103' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103':'
    TabOrder = 0
    object ComboBox1: TComboBox
      Left = 8
      Top = 24
      Width = 209
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1083#1077#1085#1080#1080
        #1056#1077#1096#1077#1085#1080#1077' '#1086#1073' '#1086#1090#1082#1072#1079#1077
        #1059#1095#1077#1090#1085#1072#1103' '#1082#1072#1088#1090#1072
        #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1089#1091#1073#1089#1080#1076#1080#1081
        #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1087#1088#1080#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1080
        #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1074#1086#1079#1086#1073#1085#1086#1074#1083#1077#1085#1080#1080
        #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1087#1088#1077#1082#1088#1072#1097#1077#1085#1080#1080
        #1054#1090#1095#1077#1090' '#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1080
        #1057#1074#1086#1076#1082#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1089#1091#1073#1089#1080#1076#1080#1081
        #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1077' '#1088#1072#1089#1093#1086#1076#1099
        #1054#1090#1095#1077#1090' '#1074' '#1084#1080#1085#1090#1088#1091#1076)
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 60
    Width = 226
    Height = 31
    Align = alTop
    AutoWrap = False
    BevelOuter = bvNone
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 1
    object Button2: TButton
      AlignWithMargins = True
      Left = 148
      Top = 3
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 67
      Top = 3
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
