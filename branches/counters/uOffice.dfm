object OfficeForm: TOfficeForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1091#1095#1072#1089#1090#1082#1086#1074
  ClientHeight = 305
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 360
    Height = 153
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    ExplicitWidth = 566
    object officeGrid: TStringGrid
      Left = 2
      Top = 2
      Width = 356
      Height = 149
      Align = alClient
      BorderStyle = bsNone
      DefaultRowHeight = 20
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      TabOrder = 0
      OnSelectCell = officeGridSelectCell
      ExplicitWidth = 562
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 159
    Width = 360
    Height = 106
    Margins.Top = 0
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 14
      Top = 12
      Width = 24
      Height = 13
      Caption = #1050#1086#1076':'
    end
    object Label2: TLabel
      Left = 62
      Top = 12
      Width = 34
      Height = 13
      Caption = #1056#1072#1081#1086#1085':'
    end
    object Label3: TLabel
      Left = 14
      Top = 60
      Width = 35
      Height = 13
      Caption = #1040#1076#1088#1077#1089':'
    end
    object Label4: TLabel
      Left = 252
      Top = 60
      Width = 48
      Height = 13
      Caption = #1058#1077#1083#1077#1092#1086#1085':'
    end
    object Edit1: TEdit
      Left = 14
      Top = 28
      Width = 33
      Height = 21
      TabOrder = 0
    end
    object ComboBox1: TComboBox
      Left = 62
      Top = 28
      Width = 176
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 14
      Top = 76
      Width = 224
      Height = 21
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 252
      Top = 76
      Width = 97
      Height = 21
      TabOrder = 3
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 271
    Width = 360
    Height = 31
    Align = alBottom
    AutoWrap = False
    BevelOuter = bvNone
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 2
    ExplicitTop = 229
    ExplicitWidth = 566
    object Button1: TButton
      AlignWithMargins = True
      Left = 282
      Top = 3
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 201
      Top = 3
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 120
      Top = 3
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = Button3Click
    end
  end
end
