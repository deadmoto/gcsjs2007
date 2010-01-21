object AboutBox1: TAboutBox1
  Left = 365
  Top = 422
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  BorderWidth = 3
  ClientHeight = 88
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 249
    Height = 88
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 39
      Width = 103
      Height = 13
      Caption = #1047#1072#1075#1088#1091#1078#1077#1085#1086' '#1079#1072#1087#1080#1089#1077#1081':'
      Transparent = True
    end
    object Label3: TLabel
      Left = 120
      Top = 39
      Width = 32
      Height = 13
      Caption = 'Label3'
      Transparent = True
    end
    object Label1: TLabel
      Left = 10
      Top = 7
      Width = 228
      Height = 26
      Alignment = taCenter
      Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081' '#1086' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1077' '#1089#1091#1073#1089#1080#1076#1080#1081' '#1074' '#1090#1077#1082#1091#1097#1077#1084' '#1084#1077#1089#1103#1094#1077
      Transparent = True
      WordWrap = True
    end
    object ProgressBar1: TProgressBar
      Left = 5
      Top = 55
      Width = 233
      Height = 17
      Smooth = True
      TabOrder = 0
    end
  end
end
