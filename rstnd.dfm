object Form38: TForm38
  Left = 300
  Top = 298
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1056#1077#1075#1080#1086#1085#1072#1083#1100#1085#1099#1077' '#1089#1090#1072#1085#1076#1072#1088#1090#1099
  ClientHeight = 409
  ClientWidth = 580
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
    Width = 574
    Height = 70
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label10: TLabel
      Left = 8
      Top = 8
      Width = 474
      Height = 13
      Caption = 
        #1057#1090'-'#1088#1090' 1 - '#1086#1076#1080#1085#1086#1082#1086' '#1087#1088#1086#1078#1080#1074#1072#1102#1097#1080#1081' '#1075#1088#1072#1078#1076#1072#1085#1080#1085'; '#1057#1090'-'#1088#1090' 2 - '#1085#1072' '#1086#1076#1085#1086#1075#1086' '#1095#1083#1077 +
        #1085#1072' '#1089#1077#1084#1100#1080' '#1080#1079' '#1076#1074#1091#1093' '#1095#1077#1083#1086#1074#1077#1082';'
    end
    object Label11: TLabel
      Left = 8
      Top = 24
      Width = 447
      Height = 13
      Caption = 
        #1057#1090'-'#1088#1090' 3 - '#1085#1072' '#1086#1076#1085#1086#1075#1086' '#1095#1083#1077#1085#1072' '#1089#1077#1084#1100#1080' '#1080#1079' 3-'#1093' '#1095#1077#1083#1086#1074#1077#1082' '#1080#1083#1080' '#1085#1072' '#1086#1076#1085#1086#1075#1086' '#1095#1083#1077 +
        #1085#1072' '#1084#1085#1086#1075#1086#1076#1077#1090#1085#1086#1081' '#1089#1077#1084#1100#1080
    end
    object Label12: TLabel
      Left = 8
      Top = 40
      Width = 528
      Height = 13
      Caption = 
        #1057#1090'-'#1088#1090' 3 - '#1085#1072' '#1086#1076#1085#1086#1075#1086' '#1095#1083#1077#1085#1072' '#1089#1077#1084#1100#1080' '#1080#1079' 4-'#1093' '#1095#1077#1083#1086#1074#1077#1082'; '#1057#1090'-'#1088#1090' 5 - '#1085#1072' '#1086#1076#1085 +
        #1086#1075#1086' '#1095#1083#1077#1085#1072' '#1089#1077#1084#1100#1080' '#1080#1079' 5-'#1090#1080' '#1080' '#1073#1086#1083#1077#1077' '#1095#1077#1083#1086#1074#1077#1082
    end
    object Label13: TLabel
      Left = 8
      Top = 56
      Width = 482
      Height = 13
      Caption = 
        #1057#1090'-'#1088#1090' 6 - '#1086#1076#1080#1085#1086#1082#1086' '#1087#1088#1086#1078'. '#1087#1077#1085#1089'./'#1080#1085#1074'.; '#1057#1090'-'#1088#1090' 7 - '#1085#1072' '#1086#1076#1085#1086#1075#1086'  '#1095#1083#1077#1085#1072' '#1089 +
        #1077#1084#1100#1080' '#1080#1079' '#1076#1074#1091#1093' '#1080' '#1073#1086#1083#1077#1077' '#1087#1077#1085#1089'./'#1080#1085#1074'.'
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 76
    Width = 574
    Height = 189
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object StringGrid1: TStringGrid
      Left = 2
      Top = 2
      Width = 570
      Height = 185
      Align = alClient
      BorderStyle = bsNone
      ColCount = 9
      DefaultRowHeight = 20
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      TabOrder = 0
      OnSelectCell = StringGrid1SelectCell
      ExplicitLeft = 1
      ExplicitTop = 1
    end
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 268
    Width = 574
    Height = 101
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 22
      Height = 13
      Caption = #1050#1086#1076':'
    end
    object Label1: TLabel
      Left = 47
      Top = 8
      Width = 79
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label2: TLabel
      Left = 342
      Top = 8
      Width = 38
      Height = 13
      Caption = #1057#1090'-'#1088#1090' 1:'
    end
    object Label7: TLabel
      Left = 342
      Top = 52
      Width = 38
      Height = 13
      Caption = #1057#1090'-'#1088#1090' 5:'
    end
    object Label4: TLabel
      Left = 398
      Top = 8
      Width = 38
      Height = 13
      Caption = #1057#1090'-'#1088#1090' 2:'
    end
    object Label8: TLabel
      Left = 398
      Top = 52
      Width = 38
      Height = 13
      Caption = #1057#1090'-'#1088#1090' 6:'
    end
    object Label5: TLabel
      Left = 454
      Top = 8
      Width = 38
      Height = 13
      Caption = #1057#1090'-'#1088#1090' 3:'
    end
    object Label6: TLabel
      Left = 512
      Top = 8
      Width = 38
      Height = 13
      Caption = #1057#1090'-'#1088#1090' 4:'
    end
    object Label9: TLabel
      Left = 454
      Top = 52
      Width = 38
      Height = 13
      Caption = #1057#1090'-'#1088#1090' 7:'
    end
    object Edit4: TEdit
      Left = 8
      Top = 24
      Width = 33
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1094#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = Edit4Exit
      OnKeyDown = Edit4KeyDown
    end
    object Edit1: TEdit
      Left = 47
      Top = 24
      Width = 289
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
    object Edit2: TEdit
      Left = 342
      Top = 25
      Width = 50
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object Edit7: TEdit
      Left = 342
      Top = 68
      Width = 50
      Height = 21
      TabOrder = 6
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object Edit3: TEdit
      Left = 398
      Top = 24
      Width = 50
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object Edit8: TEdit
      Left = 398
      Top = 68
      Width = 50
      Height = 21
      TabOrder = 7
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object Edit5: TEdit
      Left = 454
      Top = 24
      Width = 50
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object Edit6: TEdit
      Left = 512
      Top = 24
      Width = 50
      Height = 21
      TabOrder = 5
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object Edit9: TEdit
      Left = 454
      Top = 68
      Width = 50
      Height = 21
      TabOrder = 8
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 375
    Width = 574
    Height = 31
    Align = alTop
    AutoWrap = False
    BevelOuter = bvNone
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 3
    object Button4: TButton
      AlignWithMargins = True
      Left = 496
      Top = 3
      Width = 75
      Height = 25
      Caption = #1042#1099#1081#1090#1080
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 415
      Top = 3
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 334
      Top = 3
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 253
      Top = 3
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
