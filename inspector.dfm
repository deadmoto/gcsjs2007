object Form3: TForm3
  Left = 243
  Top = 179
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1080#1085#1089#1087#1077#1082#1090#1086#1088#1086#1074
  ClientHeight = 334
  ClientWidth = 430
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
    Width = 424
    Height = 234
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object StringGrid1: TStringGrid
      Left = 2
      Top = 2
      Width = 420
      Height = 230
      Align = alClient
      BorderStyle = bsNone
      ColCount = 4
      DefaultRowHeight = 20
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      TabOrder = 0
      OnSelectCell = StringGrid1SelectCell
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 240
    Width = 424
    Height = 57
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 57
      Top = 12
      Width = 92
      Height = 13
      Caption = #1060#1048#1054' '#1080#1085#1089#1087#1077#1082#1090#1086#1088#1072':'
    end
    object Label2: TLabel
      Left = 10
      Top = 12
      Width = 22
      Height = 13
      Caption = #1050#1086#1076':'
    end
    object Label3: TLabel
      Left = 343
      Top = 12
      Width = 56
      Height = 13
      Caption = #1056#1077#1075'.'#1085#1086#1084#1077#1088':'
    end
    object Edit1: TEdit
      Left = 57
      Top = 28
      Width = 217
      Height = 21
      Hint = 
        #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 51 ' +
        #1082#1080#1088#1080#1083#1083#1080#1095#1077#1089#1082#1086#1075#1086' '#1089#1080#1084#1074#1086#1083#1072
      MaxLength = 51
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object CheckBox1: TCheckBox
      Left = 280
      Top = 28
      Width = 57
      Height = 17
      Hint = '0 - '#1085#1077#1072#1082#1090#1080#1074#1085#1099#1081' '#1080#1085#1089#1087#1077#1082#1090#1086#1088'; 1 - '#1072#1082#1090#1080#1074#1085#1099#1081' '#1080#1085#1089#1087#1077#1082#1090#1086#1088
      Caption = #1057#1090#1072#1090#1091#1089
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object Edit2: TEdit
      Left = 10
      Top = 28
      Width = 33
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1094#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object Edit3: TEdit
      Left = 343
      Top = 28
      Width = 73
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1085#1077' '#1073#1086#1083#1077#1077' 9 '#1089#1080#1084#1074#1086#1083#1086#1074
      MaxLength = 9
      TabOrder = 3
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 300
    Width = 424
    Height = 31
    Align = alTop
    AutoWrap = False
    BevelOuter = bvNone
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 2
    object Button4: TButton
      AlignWithMargins = True
      Left = 346
      Top = 3
      Width = 75
      Height = 25
      Caption = #1042#1099#1081#1090#1080
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 265
      Top = 3
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 184
      Top = 3
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 103
      Top = 3
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
