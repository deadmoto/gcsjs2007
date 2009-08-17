object AddReportDataFrm: TAddReportDataFrm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1044#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1086#1090#1095#1077#1090#1072
  ClientHeight = 174
  ClientWidth = 227
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
    Width = 221
    Height = 78
    Margins.Bottom = 0
    Align = alTop
    Caption = #1053#1086#1084#1077#1088' '#1080#1089#1093#1086#1076#1103#1097#1077#1075#1086':'
    TabOrder = 0
    ExplicitWidth = 300
    object Label1: TLabel
      Left = 103
      Top = 27
      Width = 13
      Height = 13
      Caption = #8470
    end
    object Label2: TLabel
      Left = 16
      Top = 51
      Width = 29
      Height = 13
      Caption = #1053#1072' '#8470
    end
    object Edit1: TEdit
      Left = 16
      Top = 24
      Width = 81
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 122
      Top = 24
      Width = 81
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 51
      Top = 48
      Width = 152
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 84
    Width = 221
    Height = 58
    Margins.Bottom = 0
    Align = alTop
    Caption = #1053#1086#1084#1077#1088' '#1088#1077#1096#1077#1085#1080#1103':'
    TabOrder = 1
    ExplicitTop = 111
    ExplicitWidth = 422
    object Label3: TLabel
      Left = 16
      Top = 27
      Width = 13
      Height = 13
      Caption = #8470
    end
    object Edit4: TEdit
      Left = 35
      Top = 24
      Width = 168
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 149
    Top = 145
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = Button1Click
  end
end
