object Form27: TForm27
  Left = 337
  Top = 162
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1057#1086#1094#1080#1072#1083#1100#1085#1099#1077' '#1085#1086#1088#1084#1099' '#1087#1083#1086#1097#1072#1076#1080' '#1080' '#1090#1077#1087#1083#1072
  ClientHeight = 254
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 540
    Height = 150
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    ExplicitWidth = 494
    object StringGrid1: TStringGrid
      Left = 2
      Top = 2
      Width = 536
      Height = 146
      Align = alClient
      BorderStyle = bsNone
      ColCount = 6
      DefaultRowHeight = 20
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      TabOrder = 0
      OnSelectCell = StringGrid1SelectCell
      ExplicitWidth = 490
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 156
    Width = 540
    Height = 61
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 13
      Width = 22
      Height = 13
      Caption = #1050#1086#1076':'
    end
    object Label1: TLabel
      Left = 47
      Top = 13
      Width = 91
      Height = 13
      Caption = #1063#1077#1083#1086#1074#1077#1082' '#1074' '#1089#1077#1084#1100#1077':'
    end
    object Label2: TLabel
      Left = 144
      Top = 13
      Width = 85
      Height = 13
      Caption = #1053#1086#1088#1084#1072' '#1087#1083#1086#1097#1072#1076#1080':'
    end
    object Label5: TLabel
      Left = 235
      Top = 13
      Width = 96
      Height = 13
      Caption = #1053#1086#1088#1084#1072' '#1087#1083'. '#1076#1083#1103' '#1087'/'#1080':'
    end
    object Label3: TLabel
      Left = 447
      Top = 13
      Width = 69
      Height = 13
      Caption = #1053#1086#1088#1084#1072' '#1090#1077#1087#1083#1072':'
    end
    object Label6: TLabel
      Left = 337
      Top = 13
      Width = 104
      Height = 13
      Caption = #1053#1086#1088#1084#1072' '#1087#1083'. '#1076#1083#1103' '#1083#1075#1090#1085'.:'
    end
    object Edit4: TEdit
      Left = 8
      Top = 29
      Width = 33
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1094#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object Edit1: TEdit
      Left = 47
      Top = 29
      Width = 91
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1094#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object Edit2: TEdit
      Left = 144
      Top = 29
      Width = 85
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object Edit5: TEdit
      Left = 235
      Top = 29
      Width = 96
      Height = 21
      TabOrder = 3
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object Edit3: TEdit
      Left = 447
      Top = 29
      Width = 85
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object Edit6: TEdit
      Left = 337
      Top = 29
      Width = 104
      Height = 21
      TabOrder = 5
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 220
    Width = 540
    Height = 31
    Align = alTop
    AutoWrap = False
    BevelOuter = bvNone
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 2
    ExplicitTop = 260
    ExplicitWidth = 494
    object Button4: TButton
      AlignWithMargins = True
      Left = 462
      Top = 3
      Width = 75
      Height = 25
      Caption = #1042#1099#1081#1090#1080
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 381
      Top = 3
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 300
      Top = 3
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 219
      Top = 3
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
