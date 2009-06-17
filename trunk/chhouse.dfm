object Form30: TForm30
  Left = 326
  Top = 159
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1076#1086#1084#1086#1074
  ClientHeight = 387
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 88
    Top = 352
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 168
    Top = 352
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 248
    Top = 352
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 352
    Width = 75
    Height = 25
    Caption = #1042#1099#1081#1090#1080
    TabOrder = 0
    OnClick = Button4Click
  end
  object SGH: TStringGrid
    Left = 8
    Top = 24
    Width = 313
    Height = 313
    ColCount = 1
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 1
    OnDblClick = SGHDblClick
    OnSelectCell = SGHSelectCell
    ColWidths = (
      288)
  end
  object HeaderControl1: THeaderControl
    Left = 8
    Top = 8
    Width = 313
    Height = 20
    Align = alCustom
    Sections = <
      item
        ImageIndex = -1
        Text = #1040#1076#1088#1077#1089
        Width = 313
      end>
  end
end
