object Form18: TForm18
  Left = 337
  Top = 201
  BorderStyle = bsSingle
  Caption = #1058#1077#1082#1091#1097#1080#1077' '#1089#1091#1073#1089#1080#1076#1080#1080
  ClientHeight = 402
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 184
    Top = 384
    Width = 87
    Height = 13
    Caption = #1057#1091#1084#1084#1072' '#1089#1091#1073#1089#1080#1076#1080#1081':'
  end
  object Label2: TLabel
    Left = 280
    Top = 384
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 16
    Top = 384
    Width = 51
    Height = 13
    Caption = #1050#1083#1080#1077#1085#1090#1086#1074':'
  end
  object Label4: TLabel
    Left = 72
    Top = 384
    Width = 32
    Height = 13
    Caption = 'Label4'
  end
  object SGH: TStringGrid
    Left = 8
    Top = 8
    Width = 377
    Height = 369
    Hint = #1057#1087#1080#1089#1086#1082' '#1072#1082#1090#1080#1074#1085#1099#1093' '#1082#1083#1080#1077#1085#1090#1086#1074' '#1080' '#1080#1093' '#1089#1091#1073#1089#1080#1076#1080#1081
    ColCount = 3
    DefaultColWidth = 114
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
