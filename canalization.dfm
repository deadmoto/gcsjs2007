object Form39: TForm39
  Left = 219
  Top = 165
  Width = 442
  Height = 319
  Caption = #1058#1072#1088#1080#1092#1099' '#1085#1072' '#1074#1086#1076#1086#1086#1090#1074#1077#1076#1077#1085#1080#1077
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
    Left = 8
    Top = 200
    Width = 22
    Height = 13
    Caption = #1050#1086#1076':'
  end
  object Label1: TLabel
    Left = 56
    Top = 200
    Width = 119
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1072#1088#1080#1092#1072':'
  end
  object Label2: TLabel
    Left = 360
    Top = 200
    Width = 36
    Height = 13
    Caption = #1058#1072#1088#1080#1092':'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 16
    Width = 417
    Height = 169
    DataSource = DataModule1.DataSource1
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
        FieldName = 'id_cont'
        Title.Caption = #1050#1086#1076
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'namecont'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 285
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tarifcont'
        Title.Caption = #1058#1072#1088#1080#1092
        Visible = True
      end>
  end
  object Edit3: TEdit
    Left = 8
    Top = 216
    Width = 33
    Height = 21
    TabOrder = 1
    OnExit = Edit3Exit
  end
  object Edit1: TEdit
    Left = 56
    Top = 216
    Width = 289
    Height = 21
    TabOrder = 2
    OnEnter = Edit1Enter
  end
  object Edit2: TEdit
    Left = 360
    Top = 216
    Width = 65
    Height = 21
    TabOrder = 3
    OnExit = Edit2Exit
  end
  object Button1: TButton
    Left = 64
    Top = 256
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 144
    Top = 256
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 224
    Top = 256
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 304
    Top = 256
    Width = 75
    Height = 25
    Caption = #1042#1099#1081#1090#1080
    TabOrder = 7
    OnClick = Button4Click
  end
end
