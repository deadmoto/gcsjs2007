object Form24: TForm24
  Left = 295
  Top = 138
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  ClientHeight = 455
  ClientWidth = 478
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
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 472
    Height = 414
    Margins.Bottom = 0
    Align = alTop
    Caption = #1044#1086#1084':'
    TabOrder = 0
    ExplicitWidth = 475
    object Label7: TLabel
      Left = 16
      Top = 24
      Width = 35
      Height = 13
      Caption = #1059#1083#1080#1094#1072':'
    end
    object Label8: TLabel
      Left = 304
      Top = 24
      Width = 26
      Height = 13
      Caption = #1044#1086#1084':'
    end
    object Label24: TLabel
      Left = 16
      Top = 168
      Width = 101
      Height = 13
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1078#1080#1083#1100#1103':'
    end
    object Label25: TLabel
      Left = 16
      Top = 192
      Width = 90
      Height = 13
      Caption = #1054#1089#1074#1077#1097#1077#1085#1080#1077' '#1052#1054#1055':'
    end
    object Label26: TLabel
      Left = 16
      Top = 216
      Width = 93
      Height = 13
      Caption = #1042#1086#1076#1086#1087#1086#1090#1088#1077#1073#1083#1077#1085#1080#1077':'
    end
    object Label27: TLabel
      Left = 16
      Top = 240
      Width = 71
      Height = 13
      Caption = #1043#1086#1088#1103#1095#1072#1103' '#1074#1086#1076#1072':'
    end
    object Label28: TLabel
      Left = 16
      Top = 288
      Width = 58
      Height = 13
      Caption = #1054#1090#1086#1087#1083#1077#1085#1080#1077':'
    end
    object Label30: TLabel
      Left = 16
      Top = 312
      Width = 21
      Height = 13
      Caption = #1043#1072#1079':'
    end
    object Label1: TLabel
      Left = 16
      Top = 336
      Width = 36
      Height = 13
      Caption = #1044#1088#1086#1074#1072':'
    end
    object Label2: TLabel
      Left = 16
      Top = 360
      Width = 34
      Height = 13
      Caption = #1059#1075#1086#1083#1100':'
    end
    object Label3: TLabel
      Left = 16
      Top = 56
      Width = 116
      Height = 13
      Caption = #1056#1072#1089#1087#1086#1088#1103#1076#1080#1090#1077#1083#1100' '#1078#1080#1083#1100#1103':'
    end
    object Label4: TLabel
      Left = 16
      Top = 80
      Width = 90
      Height = 13
      Caption = #1046#1080#1083#1080#1097#1085#1099#1081' '#1092#1086#1085#1076':'
    end
    object Label5: TLabel
      Left = 16
      Top = 144
      Width = 34
      Height = 13
      Caption = #1055#1083#1080#1090#1072':'
    end
    object Label6: TLabel
      Left = 16
      Top = 112
      Width = 91
      Height = 13
      Caption = #1056#1077#1075#1080#1086#1085'. '#1089#1090#1072#1085#1076#1072#1088#1090':'
    end
    object Label9: TLabel
      Left = 16
      Top = 264
      Width = 81
      Height = 13
      Caption = #1042#1086#1076#1086#1086#1090#1074#1077#1076#1077#1085#1080#1077':'
    end
    object Edit1: TEdit
      Left = 376
      Top = 24
      Width = 17
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
      Text = ' /'
    end
    object ComboBox1: TComboBox
      Left = 56
      Top = 24
      Width = 233
      Height = 21
      ItemHeight = 0
      MaxLength = 40
      TabOrder = 1
      OnChange = ComboBox1Change
      OnExit = ComboBox1Change
    end
    object Edit3: TEdit
      Left = 336
      Top = 24
      Width = 41
      Height = 21
      MaxLength = 7
      TabOrder = 2
      OnExit = Edit3Exit
      OnKeyDown = Edit3KeyDown
    end
    object Edit4: TEdit
      Left = 392
      Top = 24
      Width = 33
      Height = 21
      MaxLength = 2
      TabOrder = 3
      OnExit = Edit4Exit
      OnKeyDown = Edit4KeyDown
    end
    object ComboBox2: TComboBox
      Left = 136
      Top = 168
      Width = 260
      Height = 21
      ItemHeight = 0
      TabOrder = 4
      OnChange = ComboBox2Change
      OnExit = ComboBox2Change
    end
    object Edit6: TEdit
      Left = 424
      Top = 168
      Width = 41
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object ComboBox3: TComboBox
      Left = 136
      Top = 192
      Width = 289
      Height = 21
      Color = clBtnFace
      ItemHeight = 0
      TabOrder = 6
      OnChange = ComboBox3Change
      OnExit = ComboBox3Change
    end
    object ComboBox4: TComboBox
      Left = 136
      Top = 216
      Width = 289
      Height = 21
      ItemHeight = 0
      TabOrder = 7
      OnChange = ComboBox4Change
      OnExit = ComboBox4Change
    end
    object ComboBox5: TComboBox
      Left = 136
      Top = 240
      Width = 289
      Height = 21
      ItemHeight = 0
      TabOrder = 8
      OnChange = ComboBox5Change
      OnExit = ComboBox5Change
    end
    object ComboBox6: TComboBox
      Left = 136
      Top = 288
      Width = 289
      Height = 21
      ItemHeight = 0
      TabOrder = 9
      OnChange = ComboBox6Change
      OnExit = ComboBox6Change
    end
    object ComboBox7: TComboBox
      Left = 136
      Top = 312
      Width = 289
      Height = 21
      ItemHeight = 0
      TabOrder = 10
      OnChange = ComboBox7Change
      OnExit = ComboBox7Change
    end
    object ComboBox9: TComboBox
      Left = 136
      Top = 336
      Width = 289
      Height = 21
      ItemHeight = 0
      TabOrder = 11
      OnChange = ComboBox9Change
      OnExit = ComboBox9Change
    end
    object ComboBox10: TComboBox
      Left = 136
      Top = 360
      Width = 289
      Height = 21
      ItemHeight = 0
      TabOrder = 12
      OnChange = ComboBox10Change
      OnExit = ComboBox10Change
    end
    object Edit7: TEdit
      Left = 424
      Top = 192
      Width = 41
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 13
    end
    object Edit8: TEdit
      Left = 424
      Top = 216
      Width = 41
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 14
    end
    object Edit9: TEdit
      Left = 424
      Top = 240
      Width = 41
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 15
    end
    object Edit10: TEdit
      Left = 424
      Top = 288
      Width = 41
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 16
    end
    object Edit11: TEdit
      Left = 424
      Top = 312
      Width = 41
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 17
    end
    object Edit13: TEdit
      Left = 424
      Top = 336
      Width = 41
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 18
    end
    object Edit14: TEdit
      Left = 424
      Top = 360
      Width = 41
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 19
    end
    object ComboBox11: TComboBox
      Left = 136
      Top = 56
      Width = 289
      Height = 21
      ItemHeight = 0
      TabOrder = 20
      OnChange = ComboBox11Change
      OnExit = ComboBox11Change
    end
    object ComboBox12: TComboBox
      Left = 136
      Top = 80
      Width = 289
      Height = 21
      ItemHeight = 0
      TabOrder = 21
      OnChange = ComboBox12Change
      OnExit = ComboBox12Change
    end
    object ComboBox8: TComboBox
      Left = 136
      Top = 144
      Width = 289
      Height = 21
      ItemHeight = 0
      TabOrder = 22
      OnChange = ComboBox8Change
      OnExit = ComboBox8Change
    end
    object ComboBox13: TComboBox
      Left = 136
      Top = 112
      Width = 289
      Height = 21
      ItemHeight = 0
      TabOrder = 23
      OnChange = ComboBox13Change
      OnExit = ComboBox13Change
    end
    object ComboBox14: TComboBox
      Left = 136
      Top = 264
      Width = 289
      Height = 21
      ItemHeight = 0
      TabOrder = 24
      OnChange = ComboBox14Change
      OnExit = ComboBox14Change
    end
    object Edit2: TEdit
      Left = 424
      Top = 264
      Width = 41
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 25
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 387
      Width = 65
      Height = 17
      Caption = #1041#1086#1081#1083#1077#1088
      TabOrder = 26
      OnClick = CheckBox1Click
    end
    object elevatorCheckBox: TCheckBox
      Left = 87
      Top = 387
      Width = 57
      Height = 17
      Caption = #1051#1080#1092#1090
      TabOrder = 27
    end
    object Button2: TButton
      Left = 397
      Top = 168
      Width = 25
      Height = 20
      Caption = '...'
      TabOrder = 28
      OnClick = Button2Click
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 420
    Width = 472
    Height = 31
    Align = alTop
    AutoWrap = False
    BevelOuter = bvNone
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 1
    ExplicitWidth = 475
    object Button4: TButton
      AlignWithMargins = True
      Left = 394
      Top = 3
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      OnClick = Button4Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 313
      Top = 3
      Width = 75
      Height = 25
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
