object Form4: TForm4
  Left = 330
  Top = 193
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1086#1082#1088#1091#1075#1086#1074
  ClientHeight = 297
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 263
    Width = 572
    Height = 31
    Align = alTop
    AutoWrap = False
    BevelOuter = bvNone
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 0
    ExplicitWidth = 562
    object Button4: TButton
      AlignWithMargins = True
      Left = 494
      Top = 3
      Width = 75
      Height = 25
      Caption = #1042#1099#1081#1090#1080
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 413
      Top = 3
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 332
      Top = 3
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 251
      Top = 3
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 572
    Height = 148
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitWidth = 562
    object distGrid: TStringGrid
      Left = 2
      Top = 2
      Width = 568
      Height = 144
      Align = alClient
      BorderStyle = bsNone
      DefaultRowHeight = 20
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      TabOrder = 0
      OnSelectCell = distGridSelectCell
      ExplicitWidth = 558
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 154
    Width = 572
    Height = 106
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    ExplicitWidth = 562
    object Label3: TLabel
      Left = 14
      Top = 12
      Width = 22
      Height = 13
      Caption = #1050#1086#1076':'
    end
    object Label1: TLabel
      Left = 53
      Top = 12
      Width = 116
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1082#1088#1091#1075#1072':'
    end
    object Label2: TLabel
      Left = 215
      Top = 12
      Width = 96
      Height = 13
      Caption = #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1086#1090#1076#1077#1083#1072':'
    end
    object Label4: TLabel
      Left = 215
      Top = 55
      Width = 34
      Height = 13
      Caption = #1040#1076#1088#1077#1089':'
    end
    object Label5: TLabel
      Left = 391
      Top = 12
      Width = 48
      Height = 13
      Caption = #1058#1077#1083#1077#1092#1086#1085':'
    end
    object Edit2: TEdit
      Left = 14
      Top = 28
      Width = 33
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1094#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
      TabOrder = 0
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object Edit1: TEdit
      Left = 53
      Top = 28
      Width = 156
      Height = 21
      Hint = 
        #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 20 ' +
        #1082#1080#1088#1080#1083#1083#1080#1095#1077#1089#1082#1080#1093' '#1089#1080#1084#1074#1086#1083#1086#1074
      MaxLength = 20
      TabOrder = 1
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object Edit3: TEdit
      Left = 215
      Top = 28
      Width = 170
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 41 '#1082#1080#1088#1080#1083#1083#1080#1095#1077#1089#1082#1086#1075#1086' '#1089#1080#1084#1074#1086#1083#1072
      MaxLength = 41
      TabOrder = 2
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object Edit4: TEdit
      Left = 215
      Top = 71
      Width = 328
      Height = 21
      TabOrder = 3
    end
    object Edit5: TEdit
      Left = 391
      Top = 28
      Width = 152
      Height = 21
      TabOrder = 4
    end
  end
end
