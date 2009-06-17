object Form42: TForm42
  Left = 248
  Top = 195
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1084#1077#1085#1080#1090#1100' '#1072#1090#1090#1077#1089#1090#1072#1094#1080#1102' '#1091' '#1072#1082#1090#1080#1074#1085#1099#1093' '#1082#1083#1080#1077#1085#1090#1086#1074
  ClientHeight = 409
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 401
    Height = 193
    Caption = #1058#1077#1082#1091#1097#1080#1077' '#1076#1072#1085#1085#1099#1077
    TabOrder = 0
    object RadioGroup1: TRadioGroup
      Left = 72
      Top = 16
      Width = 321
      Height = 41
      Caption = #1040#1090#1090#1077#1089#1090#1072#1094#1080#1103
      Columns = 3
      TabOrder = 0
    end
    object SG1: TStringGrid
      Left = 8
      Top = 64
      Width = 385
      Height = 120
      ColCount = 2
      DefaultColWidth = 175
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
      TabOrder = 1
      OnDrawCell = SG1DrawCell
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 208
    Width = 401
    Height = 193
    Caption = #1044#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    TabOrder = 1
    object RadioGroup2: TRadioGroup
      Left = 72
      Top = 16
      Width = 321
      Height = 41
      Caption = #1040#1090#1090#1077#1089#1090#1072#1094#1080#1103
      Columns = 3
      TabOrder = 0
    end
    object SG2: TStringGrid
      Left = 8
      Top = 64
      Width = 385
      Height = 120
      ColCount = 2
      DefaultColWidth = 175
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
      TabOrder = 1
      OnDrawCell = SG1DrawCell
    end
  end
end
