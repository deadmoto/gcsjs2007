object AboutBox: TAboutBox
  Left = 263
  Top = 226
  BorderStyle = bsNone
  ClientHeight = 224
  ClientWidth = 230
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
    Left = 0
    Top = 0
    Width = 230
    Height = 224
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 0
    OnClick = Panel1Click
    ExplicitWidth = 219
    ExplicitHeight = 204
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
      Width = 190
      Height = 13
      Caption = #1040#1074#1090#1086#1088': '#1062#1077#1087#1091#1082#1086#1074#1072' '#1058#1072#1090#1100#1103#1085#1072' 2005 - 2006'
      IsControl = True
    end
    object Comments: TLabel
      Left = 8
      Top = 179
      Width = 211
      Height = 16
      Caption = #1054#1088#1075'.: '#1041#1059' '#1054#1054' "'#1054#1062#1046#1057#1057#1042#1080#1051'" '#1075'.'#1054#1084#1089#1082' (2008)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      IsControl = True
    end
    object Label1: TLabel
      Left = 8
      Top = 88
      Width = 95
      Height = 13
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1080#1089#1090#1099':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 104
      Width = 88
      Height = 13
      Caption = #1041#1091#1076#1103#1082' '#1040#1083#1077#1082#1089#1072#1085#1076#1088
    end
    object Label3: TLabel
      Left = 16
      Top = 120
      Width = 100
      Height = 13
      Caption = #1041#1077#1088#1077#1078#1085#1086#1081' '#1044#1084#1080#1090#1088#1080#1081
    end
    object Label4: TLabel
      Left = 16
      Top = 136
      Width = 72
      Height = 13
      Caption = #1057#1072#1078#1072#1077#1074' '#1048#1075#1085#1072#1090
    end
    object Label5: TLabel
      Left = 8
      Top = 160
      Width = 190
      Height = 16
      Caption = #1054#1088#1075'.: '#1052#1059' "'#1043#1062#1046#1057'" '#1075'.'#1054#1084#1089#1082' (2006)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsStrikeOut]
      ParentFont = False
      WordWrap = True
      IsControl = True
    end
    object Label6: TLabel
      Left = 8
      Top = 198
      Width = 199
      Height = 16
      Caption = #1054#1088#1075'.: '#1050#1059' "'#1062#1057#1042#1080#1052#1058#1054'" '#1075'.'#1054#1084#1089#1082' (2011)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      IsControl = True
    end
  end
end
