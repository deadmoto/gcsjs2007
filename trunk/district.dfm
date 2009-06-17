object Form4: TForm4
  Left = 330
  Top = 193
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1086#1082#1088#1091#1075#1086#1074
  ClientHeight = 265
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 184
    Width = 116
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1082#1088#1091#1075#1072':'
  end
  object Label3: TLabel
    Left = 8
    Top = 184
    Width = 22
    Height = 13
    Caption = #1050#1086#1076':'
  end
  object Label2: TLabel
    Left = 192
    Top = 184
    Width = 96
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1086#1090#1076#1077#1083#1072':'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 377
    Height = 169
    TabStop = False
    DataSource = DataModule1.DataSource1
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id_dist'
        Title.Caption = #1050#1086#1076
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'namedist'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'boss'
        Title.Caption = #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1086#1090#1076#1077#1083#1072
        Width = 220
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 40
    Top = 232
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 232
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 200
    Top = 232
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 279
    Top = 232
    Width = 75
    Height = 25
    Caption = #1042#1099#1081#1090#1080
    TabOrder = 0
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 56
    Top = 200
    Width = 121
    Height = 21
    Hint = 
      #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 20 ' +
      #1082#1080#1088#1080#1083#1083#1080#1095#1077#1089#1082#1080#1093' '#1089#1080#1084#1074#1086#1083#1086#1074
    MaxLength = 20
    TabOrder = 2
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object Edit2: TEdit
    Left = 8
    Top = 200
    Width = 33
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1094#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
    TabOrder = 1
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object Edit3: TEdit
    Left = 192
    Top = 200
    Width = 185
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 41 '#1082#1080#1088#1080#1083#1083#1080#1095#1077#1089#1082#1086#1075#1086' '#1089#1080#1084#1074#1086#1083#1072
    MaxLength = 41
    TabOrder = 3
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
end
