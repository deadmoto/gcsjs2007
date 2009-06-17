object Form24: TForm24
  Left = 295
  Top = 138
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 416
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 16
    Top = 16
    Width = 35
    Height = 13
    Caption = #1059#1083#1080#1094#1072':'
  end
  object Label8: TLabel
    Left = 304
    Top = 16
    Width = 26
    Height = 13
    Caption = #1044#1086#1084':'
  end
  object Label24: TLabel
    Left = 16
    Top = 160
    Width = 101
    Height = 13
    Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1078#1080#1083#1100#1103':'
  end
  object Label25: TLabel
    Left = 16
    Top = 184
    Width = 90
    Height = 13
    Caption = #1054#1089#1074#1077#1097#1077#1085#1080#1077' '#1052#1054#1055':'
  end
  object Label26: TLabel
    Left = 16
    Top = 208
    Width = 93
    Height = 13
    Caption = #1042#1086#1076#1086#1087#1086#1090#1088#1077#1073#1083#1077#1085#1080#1077':'
  end
  object Label27: TLabel
    Left = 16
    Top = 232
    Width = 71
    Height = 13
    Caption = #1043#1086#1088#1103#1095#1072#1103' '#1074#1086#1076#1072':'
  end
  object Label28: TLabel
    Left = 16
    Top = 280
    Width = 58
    Height = 13
    Caption = #1054#1090#1086#1087#1083#1077#1085#1080#1077':'
  end
  object Label30: TLabel
    Left = 16
    Top = 304
    Width = 21
    Height = 13
    Caption = #1043#1072#1079':'
  end
  object Label1: TLabel
    Left = 16
    Top = 328
    Width = 36
    Height = 13
    Caption = #1044#1088#1086#1074#1072':'
  end
  object Label2: TLabel
    Left = 16
    Top = 352
    Width = 34
    Height = 13
    Caption = #1059#1075#1086#1083#1100':'
  end
  object Label3: TLabel
    Left = 16
    Top = 48
    Width = 116
    Height = 13
    Caption = #1056#1072#1089#1087#1086#1088#1103#1076#1080#1090#1077#1083#1100' '#1078#1080#1083#1100#1103':'
  end
  object Label4: TLabel
    Left = 16
    Top = 72
    Width = 90
    Height = 13
    Caption = #1046#1080#1083#1080#1097#1085#1099#1081' '#1092#1086#1085#1076':'
  end
  object Label5: TLabel
    Left = 16
    Top = 136
    Width = 34
    Height = 13
    Caption = #1055#1083#1080#1090#1072':'
  end
  object Label6: TLabel
    Left = 16
    Top = 104
    Width = 91
    Height = 13
    Caption = #1056#1077#1075#1080#1086#1085'. '#1089#1090#1072#1085#1076#1072#1088#1090':'
  end
  object Label9: TLabel
    Left = 16
    Top = 256
    Width = 81
    Height = 13
    Caption = #1042#1086#1076#1086#1086#1090#1074#1077#1076#1077#1085#1080#1077':'
  end
  object Edit1: TEdit
    Left = 376
    Top = 16
    Width = 17
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 27
    Text = ' /'
  end
  object Button1: TButton
    Left = 256
    Top = 384
    Width = 75
    Height = 25
    TabOrder = 18
    OnClick = Button1Click
  end
  object Button4: TButton
    Left = 175
    Top = 384
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 0
    OnClick = Button4Click
  end
  object ComboBox1: TComboBox
    Left = 56
    Top = 16
    Width = 233
    Height = 21
    ItemHeight = 13
    MaxLength = 40
    TabOrder = 1
    OnChange = ComboBox1Change
    OnExit = ComboBox1Change
  end
  object Edit3: TEdit
    Left = 336
    Top = 16
    Width = 41
    Height = 21
    MaxLength = 7
    TabOrder = 2
    OnExit = Edit3Exit
    OnKeyDown = Edit3KeyDown
  end
  object Edit4: TEdit
    Left = 392
    Top = 16
    Width = 33
    Height = 21
    MaxLength = 2
    TabOrder = 3
    OnExit = Edit4Exit
    OnKeyDown = Edit4KeyDown
  end
  object ComboBox2: TComboBox
    Left = 136
    Top = 160
    Width = 289
    Height = 21
    ItemHeight = 13
    TabOrder = 8
    OnChange = ComboBox2Change
    OnExit = ComboBox2Change
  end
  object Edit6: TEdit
    Left = 424
    Top = 160
    Width = 41
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 19
  end
  object ComboBox3: TComboBox
    Left = 136
    Top = 184
    Width = 289
    Height = 21
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 9
    OnChange = ComboBox3Change
    OnExit = ComboBox3Change
  end
  object ComboBox4: TComboBox
    Left = 136
    Top = 208
    Width = 289
    Height = 21
    ItemHeight = 13
    TabOrder = 10
    OnChange = ComboBox4Change
    OnExit = ComboBox4Change
  end
  object ComboBox5: TComboBox
    Left = 136
    Top = 232
    Width = 289
    Height = 21
    ItemHeight = 13
    TabOrder = 11
    OnChange = ComboBox5Change
    OnExit = ComboBox5Change
  end
  object ComboBox6: TComboBox
    Left = 136
    Top = 280
    Width = 289
    Height = 21
    ItemHeight = 13
    TabOrder = 13
    OnChange = ComboBox6Change
    OnExit = ComboBox6Change
  end
  object ComboBox7: TComboBox
    Left = 136
    Top = 304
    Width = 289
    Height = 21
    ItemHeight = 13
    TabOrder = 14
    OnChange = ComboBox7Change
    OnExit = ComboBox7Change
  end
  object ComboBox9: TComboBox
    Left = 136
    Top = 328
    Width = 289
    Height = 21
    ItemHeight = 13
    TabOrder = 15
    OnChange = ComboBox9Change
    OnExit = ComboBox9Change
  end
  object ComboBox10: TComboBox
    Left = 136
    Top = 352
    Width = 289
    Height = 21
    ItemHeight = 13
    TabOrder = 16
    OnChange = ComboBox10Change
    OnExit = ComboBox10Change
  end
  object Edit7: TEdit
    Left = 424
    Top = 184
    Width = 41
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 20
  end
  object Edit8: TEdit
    Left = 424
    Top = 208
    Width = 41
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 21
  end
  object Edit9: TEdit
    Left = 424
    Top = 232
    Width = 41
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 22
  end
  object Edit10: TEdit
    Left = 424
    Top = 280
    Width = 41
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 23
  end
  object Edit11: TEdit
    Left = 424
    Top = 304
    Width = 41
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 24
  end
  object Edit13: TEdit
    Left = 424
    Top = 328
    Width = 41
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 25
  end
  object Edit14: TEdit
    Left = 424
    Top = 352
    Width = 41
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 26
  end
  object ComboBox11: TComboBox
    Left = 136
    Top = 48
    Width = 289
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    OnChange = ComboBox11Change
    OnExit = ComboBox11Change
  end
  object ComboBox12: TComboBox
    Left = 136
    Top = 72
    Width = 289
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    OnChange = ComboBox12Change
    OnExit = ComboBox12Change
  end
  object ComboBox8: TComboBox
    Left = 136
    Top = 136
    Width = 289
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    OnChange = ComboBox8Change
    OnExit = ComboBox8Change
  end
  object ComboBox13: TComboBox
    Left = 136
    Top = 104
    Width = 289
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    OnChange = ComboBox13Change
    OnExit = ComboBox13Change
  end
  object ComboBox14: TComboBox
    Left = 136
    Top = 256
    Width = 289
    Height = 21
    ItemHeight = 13
    TabOrder = 12
    OnChange = ComboBox14Change
    OnExit = ComboBox14Change
  end
  object Edit2: TEdit
    Left = 424
    Top = 256
    Width = 41
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 28
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 384
    Width = 65
    Height = 17
    Caption = #1041#1086#1081#1083#1077#1088
    TabOrder = 17
    OnClick = CheckBox1Click
  end
end
