object AnyDirectoryFrm: TAnyDirectoryFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 262
  ClientWidth = 362
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
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 356
    Height = 158
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object StringGrid1: TStringGrid
      Left = 2
      Top = 2
      Width = 352
      Height = 154
      Align = alClient
      BorderStyle = bsNone
      ColCount = 2
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
    Top = 164
    Width = 356
    Height = 61
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 24
      Height = 13
      Caption = #1050#1086#1076':'
    end
    object Label2: TLabel
      Left = 72
      Top = 8
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Edit1: TEdit
      Left = 8
      Top = 24
      Width = 41
      Height = 21
      TabOrder = 0
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object Edit2: TEdit
      Left = 72
      Top = 24
      Width = 200
      Height = 21
      TabOrder = 1
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 228
    Width = 356
    Height = 31
    Align = alTop
    AutoWrap = False
    BevelOuter = bvNone
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 2
    object Button4: TButton
      AlignWithMargins = True
      Left = 278
      Top = 3
      Width = 75
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      OnClick = Button4Click
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 197
      Top = 3
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 1
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 116
      Top = 3
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 2
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 35
      Top = 3
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 3
    end
  end
end
