object Form18: TForm18
  Left = 337
  Top = 201
  BorderStyle = bsToolWindow
  ClientHeight = 441
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 411
    Height = 416
    Align = alClient
    Caption = #1058#1077#1082#1091#1097#1080#1077' '#1089#1091#1073#1089#1080#1076#1080#1080':'
    TabOrder = 0
    object SGH: TStringGrid
      Left = 2
      Top = 15
      Width = 407
      Height = 399
      Hint = #1057#1087#1080#1089#1086#1082' '#1072#1082#1090#1080#1074#1085#1099#1093' '#1082#1083#1080#1077#1085#1090#1086#1074' '#1080' '#1080#1093' '#1089#1091#1073#1089#1080#1076#1080#1081
      Align = alClient
      BorderStyle = bsNone
      ColCount = 3
      DefaultColWidth = 125
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnDblClick = SGHDblClick
      OnKeyDown = SGHKeyDown
      OnKeyPress = SGHKeyPress
      OnSelectCell = SGHSelectCell
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 422
    Width = 417
    Height = 19
    Panels = <
      item
        Text = #1050#1083#1080#1077#1085#1090#1086#1074':'
        Width = 194
      end
      item
        Text = #1057#1091#1084#1084#1072' '#1089#1091#1073#1089#1080#1076#1080#1081':'
        Width = 50
      end>
  end
end
