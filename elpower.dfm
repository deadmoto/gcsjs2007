object Form23: TForm23
  Left = 313
  Top = 178
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1058#1072#1088#1080#1092#1099' '#1085#1072' '#1101#1083#1077#1082#1090#1088#1086#1101#1085#1077#1088#1075#1080#1102'('#1088#1091#1073'./'#1095#1077#1083'.)'
  ClientHeight = 288
  ClientWidth = 455
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
    Top = 200
    Width = 56
    Height = 13
    Caption = #1058#1080#1087' '#1087#1083#1080#1090#1099':'
  end
  object Label2: TLabel
    Left = 216
    Top = 200
    Width = 68
    Height = 13
    Caption = #1057#1077#1084#1100#1103' 1 '#1095#1077#1083'.:'
  end
  object Label4: TLabel
    Left = 8
    Top = 200
    Width = 22
    Height = 13
    Caption = #1050#1086#1076':'
  end
  object Label3: TLabel
    Left = 296
    Top = 200
    Width = 68
    Height = 13
    Caption = #1057#1077#1084#1100#1103' 2 '#1095#1077#1083'.:'
  end
  object Label5: TLabel
    Left = 376
    Top = 200
    Width = 74
    Height = 13
    Caption = #1057#1077#1084#1100#1103' >2 '#1095#1077#1083'.:'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 441
    Height = 185
    TabStop = False
    DataSource = DataModule1.DataSource2
    ReadOnly = True
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id_el'
        Title.Caption = #1050#1086#1076
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'plate'
        Title.Caption = #1058#1080#1087' '#1087#1083#1080#1090#1099
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tarifel1'
        Title.Caption = #1057#1077#1084#1100#1103' 1 '#1095#1077#1083'.'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tarifel2'
        Title.Caption = #1057#1077#1084#1100#1103' 2 '#1095#1077#1083'.'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tarifel3'
        Title.Caption = #1057#1077#1084#1100#1103' >2 '#1095#1077#1083'.'
        Width = 74
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 72
    Top = 256
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 152
    Top = 256
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 232
    Top = 256
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 8
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 312
    Top = 256
    Width = 75
    Height = 25
    Caption = #1042#1099#1081#1090#1080
    TabOrder = 0
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 56
    Top = 216
    Width = 145
    Height = 21
    Hint = 
      #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 20 ' +
      #1082#1080#1088#1080#1083#1083#1080#1095#1077#1089#1082#1080#1093' '#1089#1080#1084#1074#1086#1083#1086#1074
    MaxLength = 20
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object Edit4: TEdit
    Left = 8
    Top = 216
    Width = 33
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1094#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnExit = Edit4Exit
    OnKeyDown = Edit4KeyDown
  end
  object Edit2: TEdit
    Left = 216
    Top = 216
    Width = 65
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object Edit3: TEdit
    Left = 296
    Top = 216
    Width = 65
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object Edit5: TEdit
    Left = 376
    Top = 216
    Width = 65
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
end
