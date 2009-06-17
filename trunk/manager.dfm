object Form7: TForm7
  Left = 324
  Top = 144
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1072#1089#1087#1086#1088#1103#1076#1080#1090#1077#1083#1080' '#1078#1080#1083#1100#1103
  ClientHeight = 403
  ClientWidth = 330
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
  object Label1: TLabel
    Left = 80
    Top = 320
    Width = 159
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1072#1089#1087#1086#1088#1103#1076#1080#1090#1077#1083#1103':'
  end
  object Label3: TLabel
    Left = 32
    Top = 320
    Width = 22
    Height = 13
    Caption = #1050#1086#1076':'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 313
    Height = 305
    TabStop = False
    DataSource = DataModule1.DataSource1
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id_mng'
        Title.Caption = #1050#1086#1076
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'namemng'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 245
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 8
    Top = 368
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 88
    Top = 368
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 168
    Top = 368
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 247
    Top = 368
    Width = 75
    Height = 25
    Caption = #1042#1099#1081#1090#1080
    TabOrder = 0
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 80
    Top = 336
    Width = 225
    Height = 21
    Hint = 
      #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 51 ' +
      #1082#1080#1088#1080#1083#1083#1080#1095#1077#1089#1082#1086#1075#1086' '#1089#1080#1084#1074#1086#1083#1072
    MaxLength = 51
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object Edit2: TEdit
    Left = 32
    Top = 336
    Width = 33
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1094#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
end
