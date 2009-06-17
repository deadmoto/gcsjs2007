object Form3: TForm3
  Left = 243
  Top = 179
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1080#1085#1089#1087#1077#1082#1090#1086#1088#1086#1074
  ClientHeight = 327
  ClientWidth = 417
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
    Left = 48
    Top = 248
    Width = 92
    Height = 13
    Caption = #1060#1048#1054' '#1080#1085#1089#1087#1077#1082#1090#1086#1088#1072':'
  end
  object Label2: TLabel
    Left = 8
    Top = 248
    Width = 22
    Height = 13
    Caption = #1050#1086#1076':'
  end
  object Label3: TLabel
    Left = 336
    Top = 248
    Width = 56
    Height = 13
    Caption = #1056#1077#1075'.'#1085#1086#1084#1077#1088':'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 401
    Height = 233
    TabStop = False
    DataSource = DataModule1.DataSource1
    ReadOnly = True
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id_insp'
        Title.Caption = #1050#1086#1076
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nameinsp'
        Title.Caption = #1060#1048#1054
        Width = 206
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lastnum'
        Title.Caption = #1056#1077#1075'.'#1085#1086#1084#1077#1088
        Width = 80
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 48
    Top = 296
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 296
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 208
    Top = 296
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 288
    Top = 296
    Width = 75
    Height = 25
    Caption = #1042#1099#1081#1090#1080
    TabOrder = 0
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 48
    Top = 264
    Width = 217
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
  object CheckBox1: TCheckBox
    Left = 272
    Top = 264
    Width = 57
    Height = 17
    Hint = '0 - '#1085#1077#1072#1082#1090#1080#1074#1085#1099#1081' '#1080#1085#1089#1087#1077#1082#1090#1086#1088'; 1 - '#1072#1082#1090#1080#1074#1085#1099#1081' '#1080#1085#1089#1087#1077#1082#1090#1086#1088
    Caption = #1057#1090#1072#1090#1091#1089
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 8
    Top = 264
    Width = 33
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1094#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object Edit3: TEdit
    Left = 336
    Top = 264
    Width = 73
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1085#1077' '#1073#1086#1083#1077#1077' 9 '#1089#1080#1084#1074#1086#1083#1086#1074
    MaxLength = 9
    TabOrder = 4
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
end
