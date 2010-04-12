object Form19: TForm19
  Left = 342
  Top = 153
  BorderStyle = bsDialog
  Caption = #1058#1072#1088#1080#1092#1099' '#1073#1077#1079' '#1073#1086#1081#1083#1077#1088#1072' / '#1089' '#1073#1086#1081#1083#1077#1088#1086#1084
  ClientHeight = 413
  ClientWidth = 476
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
    Width = 470
    Height = 274
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    ExplicitWidth = 441
    object StringGrid1: TStringGrid
      Left = 2
      Top = 2
      Width = 466
      Height = 270
      Align = alClient
      BorderStyle = bsNone
      ColCount = 4
      DefaultRowHeight = 20
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      TabOrder = 0
      OnDrawCell = StringGrid1DrawCell
      OnSelectCell = StringGrid1SelectCell
      ExplicitWidth = 437
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 280
    Width = 470
    Height = 96
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitWidth = 441
    object Label3: TLabel
      Left = 15
      Top = 50
      Width = 22
      Height = 13
      Caption = #1050#1086#1076':'
    end
    object Label1: TLabel
      Left = 15
      Top = 7
      Width = 119
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1072#1088#1080#1092#1072':'
    end
    object Label2: TLabel
      Left = 70
      Top = 50
      Width = 78
      Height = 13
      Caption = #1054#1090#1082#1088'.'#1074'/'#1088#1072#1079#1073#1086#1088':'
    end
    object Label4: TLabel
      Left = 162
      Top = 50
      Width = 48
      Height = 13
      Caption = #1047#1072#1082#1088'.'#1074'/'#1088':'
    end
    object Label5: TLabel
      Left = 253
      Top = 50
      Width = 54
      Height = 13
      Caption = #1053#1086#1088#1084#1072#1090#1080#1074':'
    end
    object Edit3: TEdit
      Left = 15
      Top = 66
      Width = 33
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1094#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = Edit3Exit
      OnKeyDown = Edit3KeyDown
    end
    object Edit1: TEdit
      Left = 15
      Top = 23
      Width = 442
      Height = 21
      Hint = 
        #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 51 ' +
        #1089#1080#1084#1074#1086#1083#1072
      MaxLength = 120
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 70
      Top = 66
      Width = 78
      Height = 21
      Hint = #1058#1072#1088#1080#1092' '#1074' '#1076#1086#1084#1077' '#1073#1077#1079' '#1073#1086#1081#1083#1077#1088#1072'.'#1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object Edit4: TEdit
      Left = 162
      Top = 66
      Width = 78
      Height = 21
      Hint = #1058#1072#1088#1080#1092' '#1074' '#1076#1086#1084#1077' '#1089' '#1073#1086#1081#1083#1077#1088#1086#1084'.'#1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object Edit5: TEdit
      Left = 253
      Top = 66
      Width = 78
      Height = 21
      TabOrder = 4
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 379
    Width = 470
    Height = 31
    Align = alTop
    AutoWrap = False
    BevelOuter = bvNone
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 2
    ExplicitWidth = 441
    object Button4: TButton
      AlignWithMargins = True
      Left = 392
      Top = 3
      Width = 75
      Height = 25
      Caption = #1042#1099#1081#1090#1080
      TabOrder = 0
      OnClick = Button4Click
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 311
      Top = 3
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 230
      Top = 3
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 149
      Top = 3
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 3
      OnClick = Button1Click
    end
  end
end
