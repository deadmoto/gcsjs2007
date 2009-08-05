object Form14: TForm14
  Left = 317
  Top = 181
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1086#1094#1080#1072#1083#1100#1085#1099#1077' '#1089#1090#1072#1090#1091#1089#1099
  ClientHeight = 320
  ClientWidth = 466
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
    Left = 64
    Top = 240
    Width = 121
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1090#1072#1090#1091#1089#1072':'
  end
  object Label2: TLabel
    Left = 272
    Top = 240
    Width = 119
    Height = 13
    Caption = #1057#1086#1094'.-'#1076#1077#1084#1086#1075#1088#1072#1092'. '#1075#1088#1091#1087#1087#1072':'
  end
  object Label3: TLabel
    Left = 16
    Top = 240
    Width = 22
    Height = 13
    Caption = #1050#1086#1076':'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 449
    Height = 225
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
        FieldName = 'id_status'
        Title.Caption = #1050#1086#1076
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'namestatus'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 186
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'namemin'
        Title.Caption = #1043#1088#1091#1087#1087#1072
        Width = 194
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 72
    Top = 288
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 152
    Top = 288
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 232
    Top = 288
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 312
    Top = 288
    Width = 75
    Height = 25
    Caption = #1042#1099#1081#1090#1080
    TabOrder = 5
    OnClick = Button4Click
  end
  object ComboBox1: TComboBox
    Left = 272
    Top = 256
    Width = 177
    Height = 21
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1097#1080#1081' '#1087#1088#1086#1080#1078#1080#1090#1086#1095#1085#1099#1081' '#1084#1080#1085#1080#1084#1091#1084
    ItemHeight = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnChange = ComboBox1Change
    OnExit = ComboBox1Change
  end
  object Edit1: TEdit
    Left = 64
    Top = 256
    Width = 193
    Height = 21
    Hint = 
      #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 30 ' +
      #1082#1080#1088#1080#1083#1083#1080#1095#1077#1089#1082#1080#1093' '#1089#1080#1084#1074#1086#1083#1086#1074
    MaxLength = 30
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object Edit2: TEdit
    Left = 16
    Top = 256
    Width = 33
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1094#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
end
