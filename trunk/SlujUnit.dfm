object Form44: TForm44
  Left = 279
  Top = 210
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089#1083#1091#1078#1077#1073#1085#1099#1093
  ClientHeight = 497
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 463
    Width = 619
    Height = 31
    Align = alTop
    AutoWrap = False
    BevelOuter = bvNone
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 1
    ExplicitWidth = 617
    object Button2: TButton
      AlignWithMargins = True
      Left = 541
      Top = 3
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 460
      Top = 3
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 364
      Top = 3
      Width = 90
      Height = 25
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      TabOrder = 0
      OnClick = Button3Click
    end
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 619
    Height = 457
    Margins.Bottom = 0
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 617
    object SlujGrid: TStringGrid
      Left = 2
      Top = 15
      Width = 615
      Height = 440
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = True
      DefaultRowHeight = 20
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
      ParentCtl3D = False
      TabOrder = 0
      OnSelectCell = SlujGridSelectCell
      ExplicitWidth = 613
      ColWidths = (
        64
        64
        64
        64
        64)
    end
  end
end
