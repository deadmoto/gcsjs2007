object Form39: TForm39
  Left = 199
  Top = 187
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1058#1072#1088#1080#1092#1099' '#1089' '#1073#1086#1081#1083#1077#1088#1086#1084
  ClientHeight = 320
  ClientWidth = 538
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 521
    Height = 273
    DataSource = DataModule1.DataSource2
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Title.Caption = #1050#1086#1076
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 281
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = #1054#1090#1082#1088'.'#1074'/'#1088#1072#1079#1073#1086#1088
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = #1047#1072#1082#1088'.'#1074'/'#1088#1072#1079#1073#1086#1088
        Width = 80
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 192
    Top = 288
    Width = 75
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 288
    Top = 288
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
end
