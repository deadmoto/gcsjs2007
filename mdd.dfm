object Form20: TForm20
  Left = 499
  Top = 167
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1052#1044#1044' '#1088#1072#1089#1093#1086#1076#1086#1074' '#1076#1083#1103' '#1075#1088#1072#1078#1076#1072#1085
  ClientHeight = 241
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 16
    Top = 160
    Width = 22
    Height = 13
    Caption = #1050#1086#1076':'
  end
  object Label1: TLabel
    Left = 64
    Top = 160
    Width = 101
    Height = 13
    Caption = #1057#1086#1094#1080#1072#1083#1100#1085#1072#1103' '#1075#1088#1091#1087#1087#1072':'
  end
  object Label2: TLabel
    Left = 296
    Top = 160
    Width = 30
    Height = 13
    Caption = #1052#1044#1044':'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 329
    Height = 145
    TabStop = False
    DataSource = DataModule1.DataSource2
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id_mdd'
        Title.Caption = #1050#1086#1076
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'namegroup'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vmdd'
        Title.Caption = #1052#1044#1044
        Width = 36
        Visible = True
      end>
  end
  object Edit3: TEdit
    Left = 16
    Top = 176
    Width = 33
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1094#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object Edit1: TEdit
    Left = 64
    Top = 176
    Width = 217
    Height = 21
    Hint = 
      #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 30 ' +
      #1082#1080#1088#1080#1083#1083#1080#1095#1077#1089#1082#1080#1093' '#1089#1080#1084#1074#1086#1083#1086#1074
    MaxLength = 30
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object Edit2: TEdit
    Left = 296
    Top = 176
    Width = 33
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object Button4: TButton
    Left = 256
    Top = 208
    Width = 75
    Height = 25
    Caption = #1042#1099#1081#1090#1080
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button1: TButton
    Left = 16
    Top = 208
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 208
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 176
    Top = 208
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 7
    OnClick = Button3Click
  end
end
