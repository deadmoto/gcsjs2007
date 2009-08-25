object Form23: TForm23
  Left = 313
  Top = 178
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1058#1072#1088#1080#1092#1099' '#1085#1072' '#1101#1083#1077#1082#1090#1088#1086#1101#1085#1077#1088#1075#1080#1102'('#1088#1091#1073'./'#1095#1077#1083'.)'
  ClientHeight = 282
  ClientWidth = 453
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
    Width = 447
    Height = 186
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object StringGrid1: TStringGrid
      Left = 2
      Top = 2
      Width = 443
      Height = 182
      Align = alClient
      BorderStyle = bsNone
      DefaultRowHeight = 20
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      TabOrder = 0
      OnSelectCell = StringGrid1SelectCell
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 192
    Width = 453
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 53
      Top = 3
      Width = 56
      Height = 13
      Caption = #1058#1080#1087' '#1087#1083#1080#1090#1099':'
    end
    object Label2: TLabel
      Left = 213
      Top = 3
      Width = 68
      Height = 13
      Caption = #1057#1077#1084#1100#1103' 1 '#1095#1077#1083'.:'
    end
    object Label4: TLabel
      Left = 5
      Top = 3
      Width = 22
      Height = 13
      Caption = #1050#1086#1076':'
    end
    object Label3: TLabel
      Left = 293
      Top = 3
      Width = 68
      Height = 13
      Caption = #1057#1077#1084#1100#1103' 2 '#1095#1077#1083'.:'
    end
    object Label5: TLabel
      Left = 373
      Top = 3
      Width = 74
      Height = 13
      Caption = #1057#1077#1084#1100#1103' >2 '#1095#1077#1083'.:'
    end
    object Edit1: TEdit
      Left = 53
      Top = 22
      Width = 145
      Height = 21
      Hint = 
        #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 20 ' +
        #1082#1080#1088#1080#1083#1083#1080#1095#1077#1089#1082#1080#1093' '#1089#1080#1084#1074#1086#1083#1086#1074
      MaxLength = 20
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object Edit4: TEdit
      Left = 5
      Top = 22
      Width = 33
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1094#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = Edit4Exit
      OnKeyDown = Edit4KeyDown
    end
    object Edit2: TEdit
      Left = 213
      Top = 22
      Width = 65
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object Edit3: TEdit
      Left = 293
      Top = 22
      Width = 65
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object Edit5: TEdit
      Left = 373
      Top = 22
      Width = 65
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 244
    Width = 447
    Height = 35
    Align = alTop
    AutoWrap = False
    BevelInner = bvLowered
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 2
    object Button4: TButton
      AlignWithMargins = True
      Left = 367
      Top = 5
      Width = 75
      Height = 25
      Caption = #1042#1099#1081#1090#1080
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 286
      Top = 5
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 205
      Top = 5
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 124
      Top = 5
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
