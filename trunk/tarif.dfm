object Form15: TForm15
  Left = 395
  Top = 251
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1058#1072#1088#1080#1092#1099' '
  ClientHeight = 385
  ClientWidth = 433
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
    Left = 56
    Top = 304
    Width = 119
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1072#1088#1080#1092#1072':'
  end
  object Label2: TLabel
    Left = 288
    Top = 304
    Width = 36
    Height = 13
    Caption = #1058#1072#1088#1080#1092':'
  end
  object Label3: TLabel
    Left = 8
    Top = 304
    Width = 22
    Height = 13
    Caption = #1050#1086#1076':'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 417
    Height = 289
    DataSource = DataModule1.DataSource2
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
        Title.Caption = #1050#1086#1076
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 305
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = #1058#1072#1088#1080#1092
        Width = 41
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 64
    Top = 352
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 144
    Top = 352
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 224
    Top = 352
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 304
    Top = 352
    Width = 75
    Height = 25
    Caption = #1042#1099#1081#1090#1080
    TabOrder = 5
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 48
    Top = 320
    Width = 233
    Height = 21
    Hint = 
      #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 51 ' +
      #1089#1080#1084#1074#1086#1083#1072
    MaxLength = 51
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 288
    Top = 320
    Width = 41
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object Edit3: TEdit
    Left = 8
    Top = 320
    Width = 33
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1094#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnExit = Edit3Exit
    OnKeyDown = Edit3KeyDown
  end
end
