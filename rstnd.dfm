object Form38: TForm38
  Left = 300
  Top = 298
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1077#1075#1080#1086#1085#1072#1083#1100#1085#1099#1077' '#1089#1090#1072#1085#1076#1072#1088#1090#1099
  ClientHeight = 373
  ClientWidth = 580
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
    Top = 264
    Width = 79
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object Label2: TLabel
    Left = 344
    Top = 264
    Width = 38
    Height = 13
    Caption = #1057#1090'-'#1088#1090' 1:'
  end
  object Label3: TLabel
    Left = 8
    Top = 264
    Width = 22
    Height = 13
    Caption = #1050#1086#1076':'
  end
  object Label4: TLabel
    Left = 400
    Top = 264
    Width = 38
    Height = 13
    Caption = #1057#1090'-'#1088#1090' 2:'
  end
  object Label5: TLabel
    Left = 456
    Top = 264
    Width = 38
    Height = 13
    Caption = #1057#1090'-'#1088#1090' 3:'
  end
  object Label6: TLabel
    Left = 512
    Top = 264
    Width = 38
    Height = 13
    Caption = #1057#1090'-'#1088#1090' 4:'
  end
  object Label7: TLabel
    Left = 344
    Top = 304
    Width = 38
    Height = 13
    Caption = #1057#1090'-'#1088#1090' 5:'
  end
  object Label8: TLabel
    Left = 400
    Top = 304
    Width = 38
    Height = 13
    Caption = #1057#1090'-'#1088#1090' 6:'
  end
  object Label9: TLabel
    Left = 456
    Top = 304
    Width = 38
    Height = 13
    Caption = #1057#1090'-'#1088#1090' 7:'
  end
  object Label10: TLabel
    Left = 8
    Top = 8
    Width = 474
    Height = 13
    Caption = 
      #1057#1090'-'#1088#1090' 1 - '#1086#1076#1080#1085#1086#1082#1086' '#1087#1088#1086#1078#1080#1074#1072#1102#1097#1080#1081' '#1075#1088#1072#1078#1076#1072#1085#1080#1085'; '#1057#1090'-'#1088#1090' 2 - '#1085#1072' '#1086#1076#1085#1086#1075#1086' '#1095#1083#1077 +
      #1085#1072' '#1089#1077#1084#1100#1080' '#1080#1079' '#1076#1074#1091#1093' '#1095#1077#1083#1086#1074#1077#1082';'
  end
  object Label11: TLabel
    Left = 8
    Top = 24
    Width = 447
    Height = 13
    Caption = 
      #1057#1090'-'#1088#1090' 3 - '#1085#1072' '#1086#1076#1085#1086#1075#1086' '#1095#1083#1077#1085#1072' '#1089#1077#1084#1100#1080' '#1080#1079' 3-'#1093' '#1095#1077#1083#1086#1074#1077#1082' '#1080#1083#1080' '#1085#1072' '#1086#1076#1085#1086#1075#1086' '#1095#1083#1077 +
      #1085#1072' '#1084#1085#1086#1075#1086#1076#1077#1090#1085#1086#1081' '#1089#1077#1084#1100#1080
  end
  object Label12: TLabel
    Left = 8
    Top = 40
    Width = 528
    Height = 13
    Caption = 
      #1057#1090'-'#1088#1090' 3 - '#1085#1072' '#1086#1076#1085#1086#1075#1086' '#1095#1083#1077#1085#1072' '#1089#1077#1084#1100#1080' '#1080#1079' 4-'#1093' '#1095#1077#1083#1086#1074#1077#1082'; '#1057#1090'-'#1088#1090' 5 - '#1085#1072' '#1086#1076#1085 +
      #1086#1075#1086' '#1095#1083#1077#1085#1072' '#1089#1077#1084#1100#1080' '#1080#1079' 5-'#1090#1080' '#1080' '#1073#1086#1083#1077#1077' '#1095#1077#1083#1086#1074#1077#1082
  end
  object Label13: TLabel
    Left = 8
    Top = 56
    Width = 482
    Height = 13
    Caption = 
      #1057#1090'-'#1088#1090' 6 - '#1086#1076#1080#1085#1086#1082#1086' '#1087#1088#1086#1078'. '#1087#1077#1085#1089'./'#1080#1085#1074'.; '#1057#1090'-'#1088#1090' 7 - '#1085#1072' '#1086#1076#1085#1086#1075#1086'  '#1095#1083#1077#1085#1072' '#1089 +
      #1077#1084#1100#1080' '#1080#1079' '#1076#1074#1091#1093' '#1080' '#1073#1086#1083#1077#1077' '#1087#1077#1085#1089'./'#1080#1085#1074'.'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 80
    Width = 561
    Height = 177
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
        FieldName = 'id_stnd'
        Title.Caption = #1050#1086#1076
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'namestnd'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'value1'
        Title.Caption = #1057#1090'-'#1090' 1'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'value2'
        Title.Caption = #1057#1090'-'#1090' 2'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'value3'
        Title.Caption = #1057#1090'-'#1090' 3'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'value4'
        Title.Caption = #1057#1090'-'#1088#1090' 4'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'value5'
        Title.Caption = #1057#1090'-'#1088#1090' 5:'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'value6'
        Title.Caption = #1057#1090'-'#1088#1090' 6:'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'value7'
        Title.Caption = #1057#1090'-'#1088#1090' 7:'
        Width = 50
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 120
    Top = 344
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 200
    Top = 344
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 280
    Top = 344
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 8
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 360
    Top = 344
    Width = 75
    Height = 25
    Caption = #1042#1099#1081#1090#1080
    TabOrder = 0
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 48
    Top = 280
    Width = 289
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
    Left = 344
    Top = 280
    Width = 50
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object Edit4: TEdit
    Left = 8
    Top = 280
    Width = 33
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1094#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnExit = Edit4Exit
    OnKeyDown = Edit4KeyDown
  end
  object Edit3: TEdit
    Left = 400
    Top = 280
    Width = 50
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object Edit5: TEdit
    Left = 456
    Top = 280
    Width = 50
    Height = 21
    Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1095#1080#1089#1083#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object Edit6: TEdit
    Left = 512
    Top = 280
    Width = 50
    Height = 21
    TabOrder = 10
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object Edit7: TEdit
    Left = 344
    Top = 320
    Width = 50
    Height = 21
    TabOrder = 11
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object Edit8: TEdit
    Left = 400
    Top = 320
    Width = 50
    Height = 21
    TabOrder = 12
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object Edit9: TEdit
    Left = 456
    Top = 320
    Width = 50
    Height = 21
    TabOrder = 13
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
end
