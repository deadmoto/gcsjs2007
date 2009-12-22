object Form29: TForm29
  Left = 462
  Top = 292
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1072#1088#1080#1092' '#1091' '#1082#1083#1080#1077#1085#1090#1086#1074
  ClientHeight = 389
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
  object Button1: TButton
    Left = 272
    Top = 359
    Width = 65
    Height = 25
    Caption = 'Ok'
    TabOrder = 3
    OnClick = Button1Click
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 224
    Width = 401
    Height = 129
    Caption = #1058#1072#1088#1080#1092#1099
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 39
      Height = 13
      Caption = #1059#1089#1083#1091#1075#1072':'
    end
    object Label2: TLabel
      Left = 8
      Top = 72
      Width = 31
      Height = 13
      Caption = #1053#1072#1080#1084':'
    end
    object Label3: TLabel
      Left = 8
      Top = 96
      Width = 49
      Height = 13
      Caption = #1057#1090#1086#1080#1084'-'#1090#1100':'
    end
    object ComboBox4: TComboBox
      Left = 64
      Top = 48
      Width = 329
      Height = 21
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox4Change
      OnExit = ComboBox4Change
    end
    object ComboBox5: TComboBox
      Left = 64
      Top = 72
      Width = 329
      Height = 21
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 1
      OnChange = ComboBox5Change
      OnExit = ComboBox5Change
    end
    object Edit6: TEdit
      Left = 64
      Top = 96
      Width = 49
      Height = 21
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 24
      Width = 97
      Height = 17
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 3
      OnClick = CheckBox3Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 8
    Width = 401
    Height = 81
    Caption = #1040#1076#1088#1077#1089
    TabOrder = 1
    object Label7: TLabel
      Left = 8
      Top = 24
      Width = 35
      Height = 13
      Caption = #1059#1083#1080#1094#1072':'
    end
    object Label8: TLabel
      Left = 264
      Top = 24
      Width = 26
      Height = 13
      Caption = #1044#1086#1084':'
    end
    object ComboBox1: TComboBox
      Left = 48
      Top = 24
      Width = 209
      Height = 21
      ItemHeight = 13
      MaxLength = 40
      TabOrder = 0
      OnChange = ComboBox1Change
      OnExit = ComboBox1Change
    end
    object Edit2: TEdit
      Left = 296
      Top = 24
      Width = 33
      Height = 21
      TabOrder = 1
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object Edit1: TEdit
      Left = 328
      Top = 24
      Width = 17
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 3
      Text = ' /'
    end
    object Edit3: TEdit
      Left = 344
      Top = 24
      Width = 33
      Height = 21
      TabOrder = 2
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 54
      Width = 65
      Height = 17
      Caption = #1041#1086#1081#1083#1077#1088
      TabOrder = 4
    end
    object CheckBox4: TCheckBox
      Left = 72
      Top = 54
      Width = 193
      Height = 17
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1076#1083#1103' '#1088#1072#1089#1087#1086#1088#1103#1076#1080#1090#1077#1083#1103
      TabOrder = 5
    end
  end
  object Button2: TButton
    Left = 344
    Top = 359
    Width = 65
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 0
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 96
    Width = 401
    Height = 121
    TabOrder = 4
    object Label14: TLabel
      Left = 8
      Top = 44
      Width = 116
      Height = 13
      Caption = #1056#1072#1089#1087#1086#1088#1103#1076#1080#1090#1077#1083#1100' '#1078#1080#1083#1100#1103':'
    end
    object Label15: TLabel
      Left = 8
      Top = 68
      Width = 90
      Height = 13
      Caption = #1046#1080#1083#1080#1097#1085#1099#1081' '#1092#1086#1085#1076':'
    end
    object Label4: TLabel
      Left = 8
      Top = 92
      Width = 91
      Height = 13
      Caption = #1056#1077#1075#1080#1086#1085'. '#1089#1090#1072#1085#1076#1072#1088#1090':'
    end
    object ComboBox2: TComboBox
      Left = 128
      Top = 44
      Width = 265
      Height = 21
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox2Change
      OnExit = ComboBox2Change
    end
    object ComboBox3: TComboBox
      Left = 128
      Top = 68
      Width = 169
      Height = 21
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 1
      OnChange = ComboBox3Change
      OnExit = ComboBox3Change
    end
    object ComboBox6: TComboBox
      Left = 128
      Top = 92
      Width = 265
      Height = 21
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 2
      OnChange = ComboBox6Change
      OnExit = ComboBox6Change
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 16
      Width = 97
      Height = 17
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 3
      OnClick = CheckBox2Click
    end
  end
end
