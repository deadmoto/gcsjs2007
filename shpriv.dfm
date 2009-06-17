object Form22: TForm22
  Left = 210
  Top = 235
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1051#1100#1075#1086#1090#1099
  ClientHeight = 289
  ClientWidth = 657
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
    Width = 641
    Height = 273
    Hint = #1057#1087#1080#1089#1086#1082' '#1083#1100#1075#1086#1090
    DataSource = DataModule1.DataSource1
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id_priv'
        Title.Caption = #1050#1086#1076
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'namepriv'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 330
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'square'
        Title.Caption = 'c/'#1085
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'levelp'
        Title.Caption = #1092#1077#1076'/'#1091
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p1'
        Title.Caption = '%'#1086#1073#1089#1083#1091#1078
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p2'
        Title.Caption = '%'#1082#1086#1084#1084#1091#1085
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p3'
        Title.Caption = '%'#1090#1074'.'#1090#1086#1087#1083'.'
        Width = 60
        Visible = True
      end>
  end
end
