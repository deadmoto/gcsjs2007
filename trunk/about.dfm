object AboutBox: TAboutBox
  Left = 263
  Top = 226
  BorderStyle = bsNone
  ClientHeight = 134
  ClientWidth = 262
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 256
    Height = 128
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 0
    OnClick = Panel1Click
    object ProgramIcon: TImage
      Left = 24
      Top = 16
      Width = 32
      Height = 32
      AutoSize = True
      IncrementalDisplay = True
      Proportional = True
      Stretch = True
      Transparent = True
      OnClick = Panel1Click
      IsControl = True
    end
    object ProductName: TLabel
      Left = 88
      Top = 16
      Width = 93
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077': Subsidy'
      IsControl = True
    end
    object Version: TLabel
      Left = 88
      Top = 40
      Width = 43
      Height = 13
      Caption = #1042#1077#1088#1089#1080#1103': '
      IsControl = True
    end
    object Copyright: TLabel
      Left = 8
      Top = 72
      Width = 184
      Height = 13
      Caption = #1040#1074#1090#1086#1088': '#1062#1077#1087#1091#1082#1086#1074#1072' '#1058#1072#1090#1100#1103#1085#1072' 2005-2006'
      IsControl = True
    end
    object Comments: TLabel
      Left = 8
      Top = 96
      Width = 119
      Height = 13
      Caption = #1050#1086#1084#1087#1072#1085#1080#1103': '#1052#1059' '#1043#1062#1057#1046#1057' '
      WordWrap = True
      IsControl = True
    end
  end
end
