object Form38: TForm38
  Left = 204
  Top = 105
  Width = 401
  Height = 452
  Caption = #1057#1083#1091#1078#1077#1073#1085#1099#1077
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
  object Label1: TLabel
    Left = 16
    Top = 176
    Width = 58
    Height = 13
    Caption = #1046#1080#1083'. '#1092#1086#1085#1076':'
  end
  object Label2: TLabel
    Left = 16
    Top = 152
    Width = 81
    Height = 13
    Caption = #1056#1072#1089#1087#1086#1088#1103#1076#1080#1090#1077#1083#1100':'
  end
  object Label3: TLabel
    Left = 16
    Top = 200
    Width = 38
    Height = 13
    Caption = #1046#1080#1083#1100#1077':'
  end
  object Label4: TLabel
    Left = 16
    Top = 224
    Width = 41
    Height = 13
    Caption = #1056#1077#1084#1086#1085#1090':'
  end
  object Label5: TLabel
    Left = 16
    Top = 248
    Width = 49
    Height = 13
    Caption = #1061#1086#1083'.'#1074#1086#1076#1072':'
  end
  object Label6: TLabel
    Left = 16
    Top = 272
    Width = 48
    Height = 13
    Caption = #1043#1086#1088'.'#1074#1086#1076#1072':'
  end
  object Label7: TLabel
    Left = 16
    Top = 296
    Width = 58
    Height = 13
    Caption = #1054#1090#1086#1087#1083#1077#1085#1080#1077':'
  end
  object Label8: TLabel
    Left = 16
    Top = 320
    Width = 21
    Height = 13
    Caption = #1043#1072#1079':'
  end
  object Label9: TLabel
    Left = 16
    Top = 344
    Width = 56
    Height = 13
    Caption = #1069'/'#1101#1085#1077#1088#1075#1080#1103':'
  end
  object Label10: TLabel
    Left = 16
    Top = 368
    Width = 36
    Height = 13
    Caption = #1044#1088#1086#1074#1072':'
  end
  object Label11: TLabel
    Left = 16
    Top = 392
    Width = 34
    Height = 13
    Caption = #1059#1075#1086#1083#1100':'
  end
  object ComboBox1: TComboBox
    Left = 104
    Top = 176
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBox1Change
    OnExit = ComboBox1Change
  end
  object ComboBox2: TComboBox
    Left = 104
    Top = 152
    Width = 257
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnChange = ComboBox2Change
    OnExit = ComboBox2Change
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 377
    Height = 129
    DataSource = DataModule1.DataSource1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'namefond'
        Title.Caption = #1060#1086#1085#1076
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'namemng'
        Title.Caption = #1056#1072#1089#1087#1086#1088#1103#1076#1080#1090#1077#1083#1100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'conts'
        Title.Caption = #1046#1080#1083#1100#1077
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reps'
        Title.Caption = #1056#1077#1084#1086#1085#1090
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'colds'
        Title.Caption = #1061'.'#1074#1086#1076#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hots'
        Title.Caption = #1043'.'#1074#1086#1076#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'heats'
        Title.Caption = #1054#1090#1086#1087#1083#1077#1085#1080#1077
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gass'
        Title.Caption = #1043#1072#1079
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'els'
        Title.Caption = #1069'/'#1101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'woods'
        Title.Caption = #1044#1088#1086#1074#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'coals'
        Title.Caption = #1059#1075#1086#1083#1100
        Width = 55
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 104
    Top = 200
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '0'
    OnEnter = Edit1Exit
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 104
    Top = 224
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '0'
    OnEnter = Edit1Exit
    OnExit = Edit1Exit
  end
  object Edit3: TEdit
    Left = 104
    Top = 248
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '0'
    OnEnter = Edit1Exit
    OnExit = Edit1Exit
  end
  object Edit4: TEdit
    Left = 104
    Top = 272
    Width = 121
    Height = 21
    TabOrder = 6
    Text = '0'
    OnEnter = Edit1Exit
    OnExit = Edit1Exit
  end
  object Edit5: TEdit
    Left = 104
    Top = 296
    Width = 121
    Height = 21
    TabOrder = 7
    Text = '0'
    OnEnter = Edit1Exit
    OnExit = Edit1Exit
  end
  object Edit6: TEdit
    Left = 104
    Top = 320
    Width = 121
    Height = 21
    TabOrder = 8
    Text = '0'
    OnEnter = Edit1Exit
    OnExit = Edit1Exit
  end
  object Edit7: TEdit
    Left = 104
    Top = 344
    Width = 121
    Height = 21
    TabOrder = 9
    Text = '0'
    OnEnter = Edit1Exit
    OnExit = Edit1Exit
  end
  object Edit8: TEdit
    Left = 104
    Top = 368
    Width = 121
    Height = 21
    TabOrder = 10
    Text = '0'
    OnEnter = Edit1Exit
    OnExit = Edit1Exit
  end
  object Edit9: TEdit
    Left = 104
    Top = 392
    Width = 121
    Height = 21
    TabOrder = 11
    Text = '0'
    OnEnter = Edit1Exit
    OnExit = Edit1Exit
  end
  object Button1: TButton
    Left = 288
    Top = 192
    Width = 73
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 12
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 288
    Top = 224
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 13
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 288
    Top = 256
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 14
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 264
    Top = 328
    Width = 121
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1086#1090#1095#1077#1090
    TabOrder = 15
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 288
    Top = 384
    Width = 75
    Height = 25
    Caption = #1042#1099#1081#1090#1080
    TabOrder = 16
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 264
    Top = 288
    Width = 121
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
    TabOrder = 17
    OnClick = Button6Click
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 144
    Top = 64
  end
end
