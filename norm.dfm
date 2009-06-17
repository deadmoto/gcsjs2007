object Form27: TForm27
  Left = 337
  Top = 162
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1086#1094#1080#1072#1083#1100#1085#1099#1077' '#1085#1086#1088#1084#1099' '#1087#1083#1086#1097#1072#1076#1080' '#1080' '#1090#1077#1087#1083#1072
  ClientHeight = 272
  ClientWidth = 546
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
    Top = 192
    Width = 91
    Height = 13
    Caption = #1063#1077#1083#1086#1074#1077#1082' '#1074' '#1089#1077#1084#1100#1077':'
  end
  object Label2: TLabel
    Left = 160
    Top = 192
    Width = 85
    Height = 13
    Caption = #1053#1086#1088#1084#1072' '#1087#1083#1086#1097#1072#1076#1080':'
  end
  object Label3: TLabel
    Left = 352
    Top = 192
    Width = 69
    Height = 13
    Caption = #1053#1086#1088#1084#1072' '#1090#1077#1087#1083#1072':'
  end
  object Label4: TLabel
    Left = 16
    Top = 192
    Width = 22
    Height = 13
    Caption = #1050#1086#1076':'
  end
  object Label5: TLabel
    Left = 248
    Top = 192
    Width = 96
    Height = 13
    Caption = #1053#1086#1088#1084#1072' '#1087#1083'. '#1076#1083#1103' '#1087'/'#1080':'
  end
  object Label6: TLabel
    Left = 424
    Top = 192
    Width = 104
    Height = 13
    Caption = #1053#1086#1088#1084#1072' '#1087#1083'. '#1076#1083#1103' '#1083#1075#1090#1085'.:'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 513
    Height = 169
    TabStop = False
    DataSource = DataModule1.DataSource1
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
        FieldName = 'id_norm'
        Title.Caption = #1050#1086#1076
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'countp'
        Title.Caption = #1063#1077#1083#1086#1074#1077#1082' '#1074' '#1089#1077#1084#1100#1077
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'snorm'
        Title.Caption = #1053#1086#1088#1084#1072' '#1087#1083'.'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'psnorm'
        Title.Caption = #1053#1086#1088#1084#1072' '#1087#1083'. '#1076#1083#1103' '#1087'/'#1080
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hnorm'
        Title.Caption = #1053#1086#1088#1084#1072' '#1090#1077#1087#1083#1072
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'phnorm'
        Title.Caption = #1053#1086#1088#1084#1072' '#1087#1083'. '#1076#1083#1103' '#1083#1075#1090#1085'.'
        Width = 105
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 64
    Top = 208
    Width = 65
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1094#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object Button1: TButton
    Left = 112
    Top = 240
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 192
    Top = 240
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 272
    Top = 240
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 8
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 352
    Top = 240
    Width = 75
    Height = 25
    Caption = #1042#1099#1081#1090#1080
    TabOrder = 10
    OnClick = Button4Click
  end
  object Edit3: TEdit
    Left = 352
    Top = 208
    Width = 65
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object Edit4: TEdit
    Left = 16
    Top = 208
    Width = 33
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1094#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object Edit2: TEdit
    Left = 168
    Top = 208
    Width = 65
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object Edit5: TEdit
    Left = 256
    Top = 208
    Width = 89
    Height = 21
    TabOrder = 3
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object Edit6: TEdit
    Left = 424
    Top = 208
    Width = 65
    Height = 21
    TabOrder = 5
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
end
