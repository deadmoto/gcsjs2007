object Form44: TForm44
  Left = 279
  Top = 210
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089#1083#1091#1078#1077#1073#1085#1099#1093
  ClientHeight = 496
  ClientWidth = 703
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 703
    Height = 496
    Align = alClient
    TabOrder = 0
    object sluj_grid: TStringGrid
      Left = 2
      Top = 15
      Width = 699
      Height = 442
      Align = alTop
      Ctl3D = True
      DefaultRowHeight = 20
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
      ParentCtl3D = False
      TabOrder = 0
      OnSelectCell = sluj_gridSelectCell
      ColWidths = (
        64
        64
        64
        64
        64)
    end
    object Panel1: TPanel
      Left = 2
      Top = 457
      Width = 699
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      object Button2: TButton
        Left = 104
        Top = 8
        Width = 75
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 0
        OnClick = Button2Click
      end
      object Button1: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 1
        OnClick = Button1Click
      end
    end
  end
end
