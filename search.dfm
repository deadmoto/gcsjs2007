object Form33: TForm33
  Left = 296
  Top = 306
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1060#1080#1083#1100#1090#1088
  ClientHeight = 391
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 171
    Width = 313
    Height = 180
    TabOrder = 1
    object Label4: TLabel
      Left = 224
      Top = 16
      Width = 26
      Height = 13
      Caption = #1044#1086#1084':'
    end
    object ComboBox2: TComboBox
      Left = 8
      Top = 32
      Width = 217
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 0
      ParentFont = False
      TabOrder = 0
      OnChange = ComboBox2Change
      OnExit = ComboBox2Change
    end
    object Edit3: TEdit
      Left = 224
      Top = 32
      Width = 33
      Height = 21
      Hint = 
        #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1077#1089#1083#1080' '#1074' '#1085#1086#1084#1077#1088#1077' '#1076#1086#1084#1072' '#1077#1089#1090#1100' '#1073#1091#1082#1074#1072', '#1090#1086' '#1086#1085#1072' '#1087#1080#1096#1077#1090#1089#1103' '#1073#1077#1079' '#1087 +
        #1088#1086#1073#1077#1083#1072' '#1089#1088#1072#1079#1091' '#1079#1072' '#1094#1080#1092#1088#1086#1081
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
      OnExit = Edit3Exit
      OnKeyDown = Edit3KeyDown
    end
    object Edit4: TEdit
      Left = 256
      Top = 32
      Width = 17
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
      Text = ' /'
    end
    object Edit5: TEdit
      Left = 272
      Top = 32
      Width = 33
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1084#1086#1078#1085#1086' '#1074#1074#1077#1089#1090#1080' '#1090#1086#1083#1100#1082#1086' '#1095#1080#1089#1083#1086
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
      OnExit = Edit5Exit
      OnKeyDown = Edit5KeyDown
    end
    object ComboBox7: TComboBox
      Left = 48
      Top = 72
      Width = 257
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 0
      ParentFont = False
      TabOrder = 3
      OnChange = ComboBox7Change
      OnExit = ComboBox7Change
    end
    object ComboBox8: TComboBox
      Left = 144
      Top = 96
      Width = 161
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 0
      ParentFont = False
      TabOrder = 4
      OnChange = ComboBox8Change
      OnExit = ComboBox8Change
    end
    object ComboBox9: TComboBox
      Left = 144
      Top = 120
      Width = 161
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 0
      ParentFont = False
      TabOrder = 5
      OnChange = ComboBox9Change
      OnExit = ComboBox9Change
    end
    object ComboBox10: TComboBox
      Left = 144
      Top = 144
      Width = 161
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 0
      ParentFont = False
      TabOrder = 6
      OnChange = ComboBox10Change
      OnExit = ComboBox10Change
    end
    object CheckBox6: TCheckBox
      Left = 8
      Top = 16
      Width = 57
      Height = 17
      TabStop = False
      Caption = #1059#1083#1080#1094#1072
      TabOrder = 8
      OnClick = CheckBox6Click
    end
    object CheckBox7: TCheckBox
      Left = 8
      Top = 56
      Width = 137
      Height = 17
      TabStop = False
      Caption = #1056#1072#1089#1087#1086#1088#1103#1076#1080#1090#1077#1083#1100' '#1078#1080#1083#1100#1103
      TabOrder = 9
      OnClick = CheckBox7Click
    end
    object CheckBox8: TCheckBox
      Left = 8
      Top = 96
      Width = 129
      Height = 17
      TabStop = False
      Caption = #1046#1080#1083#1080#1097#1085#1099#1081' '#1092#1086#1085#1076
      TabOrder = 10
      OnClick = CheckBox8Click
    end
    object CheckBox9: TCheckBox
      Left = 8
      Top = 120
      Width = 113
      Height = 17
      TabStop = False
      Caption = #1058#1080#1087' '#1079#1072#1089#1077#1083#1077#1085#1080#1103
      TabOrder = 11
      OnClick = CheckBox9Click
    end
    object CheckBox10: TCheckBox
      Left = 8
      Top = 144
      Width = 97
      Height = 17
      TabStop = False
      Caption = #1058#1080#1087' '#1074#1083#1072#1076#1077#1085#1080#1103
      TabOrder = 12
      OnClick = CheckBox10Click
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 313
    Height = 169
    TabOrder = 0
    object Edit2: TEdit
      Left = 128
      Top = 16
      Width = 153
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object ComboBox1: TComboBox
      Left = 128
      Top = 64
      Width = 153
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 0
      ParentFont = False
      TabOrder = 2
      OnChange = ComboBox1Change
      OnExit = ComboBox1Change
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 16
      Width = 81
      Height = 17
      TabStop = False
      Caption = #1056#1077#1075'. '#1085#1086#1084#1077#1088
      TabOrder = 5
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 40
      Width = 121
      Height = 17
      TabStop = False
      Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      TabOrder = 6
      OnClick = CheckBox2Click
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 64
      Width = 81
      Height = 17
      TabStop = False
      Caption = #1048#1085#1089#1087#1077#1082#1090#1086#1088
      TabOrder = 7
      OnClick = CheckBox3Click
    end
    object CheckBox12: TCheckBox
      Left = 8
      Top = 88
      Width = 113
      Height = 17
      TabStop = False
      Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      TabOrder = 8
      OnClick = CheckBox12Click
    end
    object ComboBox6: TComboBox
      Left = 72
      Top = 112
      Width = 209
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 0
      ParentFont = False
      TabOrder = 4
      OnChange = ComboBox6Change
      OnExit = ComboBox6Change
    end
    object CheckBox14: TCheckBox
      Left = 8
      Top = 112
      Width = 57
      Height = 17
      TabStop = False
      Caption = #1051#1100#1075#1086#1090#1072
      TabOrder = 9
      OnClick = CheckBox14Click
    end
    object MaskEdit1: TMaskEdit
      Left = 128
      Top = 40
      Width = 152
      Height = 21
      Color = clBtnFace
      EditMask = '!90/90/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  .  .    '
      OnExit = MaskEdit1Exit
      OnKeyDown = MaskEdit1KeyDown
    end
    object MaskEdit4: TMaskEdit
      Left = 128
      Top = 88
      Width = 152
      Height = 21
      Color = clBtnFace
      EditMask = '!90/90/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      Text = '  .  .    '
      OnExit = MaskEdit4Exit
      OnKeyDown = MaskEdit4KeyDown
    end
    object CheckBox19: TCheckBox
      Left = 8
      Top = 139
      Width = 97
      Height = 17
      Caption = #1058#1080#1087' '#1086#1090#1086#1087#1083#1077#1085#1080#1103
      TabOrder = 10
      OnClick = CheckBox19Click
    end
    object ComboBox13: TComboBox
      Left = 128
      Top = 139
      Width = 152
      Height = 21
      Color = clBtnFace
      ItemHeight = 13
      TabOrder = 11
      Items.Strings = (
        #1062#1077#1085#1090#1088#1072#1083#1100#1085#1086#1077
        #1058#1074#1077#1088#1076#1086#1077' '#1090#1086#1087#1083#1080#1074#1086
        #1043#1072#1079#1086#1074#1086#1077
        #1069#1083#1077#1082#1090#1080#1088#1080#1095#1077#1089#1082#1086#1077)
    end
  end
  object GroupBox3: TGroupBox
    AlignWithMargins = True
    Left = 320
    Top = 3
    Width = 311
    Height = 169
    TabOrder = 2
    object Label9: TLabel
      Left = 24
      Top = 40
      Width = 6
      Height = 13
      Caption = #1089
    end
    object Label10: TLabel
      Left = 128
      Top = 40
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object CheckBox11: TCheckBox
      Left = 8
      Top = 16
      Width = 153
      Height = 17
      TabStop = False
      Caption = #1057#1088#1086#1082' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1089#1091#1073#1089#1080#1076#1080#1080
      TabOrder = 5
      OnClick = CheckBox11Click
    end
    object CheckBox4: TCheckBox
      Left = 8
      Top = 88
      Width = 105
      Height = 17
      TabStop = False
      Caption = #1058#1080#1087' '#1072#1090#1090#1077#1089#1090#1072#1094#1080#1080
      TabOrder = 6
      OnClick = CheckBox4Click
    end
    object CheckBox5: TCheckBox
      Left = 8
      Top = 112
      Width = 97
      Height = 17
      TabStop = False
      Caption = #1058#1080#1087' '#1082#1086#1085#1090#1088#1086#1083#1103
      TabOrder = 7
      OnClick = CheckBox5Click
    end
    object ComboBox3: TComboBox
      Left = 120
      Top = 88
      Width = 145
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 0
      ParentFont = False
      TabOrder = 3
      OnChange = ComboBox3Change
      OnExit = ComboBox3Change
    end
    object CheckBox13: TCheckBox
      Left = 8
      Top = 64
      Width = 73
      Height = 17
      TabStop = False
      Caption = #1057#1090#1072#1090#1091#1089
      TabOrder = 8
      OnClick = CheckBox13Click
    end
    object ComboBox5: TComboBox
      Left = 120
      Top = 64
      Width = 145
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 0
      ParentFont = False
      TabOrder = 2
      OnChange = ComboBox5Change
      OnExit = ComboBox5Change
    end
    object ComboBox4: TComboBox
      Left = 120
      Top = 112
      Width = 145
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 0
      ParentFont = False
      TabOrder = 4
      OnChange = ComboBox4Change
      OnExit = ComboBox4Change
    end
    object MaskEdit2: TMaskEdit
      Left = 40
      Top = 40
      Width = 73
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1077#1085#1100' '#1076#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' 1 '#1095#1080#1089#1083#1086#1084' '#1084#1077#1089#1103#1094#1072
      Color = clBtnFace
      EditMask = '!90/90/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = '  .  .    '
      OnExit = MaskEdit2Exit
      OnKeyDown = MaskEdit2KeyDown
    end
    object MaskEdit3: TMaskEdit
      Left = 160
      Top = 40
      Width = 73
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1077#1085#1100' '#1076#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' 1 '#1095#1080#1089#1083#1086#1084' '#1084#1077#1089#1103#1094#1072
      Color = clBtnFace
      EditMask = '!90/90/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = '  .  .    '
      OnExit = MaskEdit3Exit
      OnKeyDown = MaskEdit3KeyDown
    end
    object CheckBox15: TCheckBox
      Left = 8
      Top = 136
      Width = 97
      Height = 17
      TabStop = False
      Caption = #1058#1080#1087' '#1088#1072#1089#1095#1077#1090#1072
      TabOrder = 9
      OnClick = CheckBox15Click
    end
    object ComboBox11: TComboBox
      Left = 120
      Top = 136
      Width = 145
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 0
      ParentFont = False
      TabOrder = 10
      OnChange = ComboBox11Change
      OnExit = ComboBox11Change
    end
  end
  object GroupBox4: TGroupBox
    AlignWithMargins = True
    Left = 320
    Top = 171
    Width = 311
    Height = 180
    TabOrder = 3
    object CheckBox16: TCheckBox
      Left = 8
      Top = 16
      Width = 97
      Height = 17
      Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
      TabOrder = 0
      OnClick = CheckBox16Click
    end
    object ComboBox12: TComboBox
      Left = 120
      Top = 16
      Width = 145
      Height = 21
      Color = clBtnFace
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        #1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1086
        #1053#1077' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1086)
    end
    object CheckBox17: TCheckBox
      Left = 24
      Top = 64
      Width = 121
      Height = 17
      Caption = '('#1090#1086#1083#1100#1082#1086' '#1079#1072' '#1084#1077#1089#1103#1094')'
      Enabled = False
      TabOrder = 2
      OnClick = CheckBox17Click
    end
    object MaskEdit5: TMaskEdit
      Left = 120
      Top = 40
      Width = 73
      Height = 21
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1077#1085#1100' '#1076#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' 1 '#1095#1080#1089#1083#1086#1084' '#1084#1077#1089#1103#1094#1072
      Color = clBtnFace
      EditMask = '!90/90/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = '  .  .    '
    end
    object CheckBox18: TCheckBox
      Left = 8
      Top = 40
      Width = 105
      Height = 17
      Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
      Enabled = False
      TabOrder = 4
      OnClick = CheckBox18Click
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 353
    Width = 627
    Height = 35
    Align = alBottom
    BevelInner = bvLowered
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 4
    object Button2: TButton
      AlignWithMargins = True
      Left = 547
      Top = 5
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 466
      Top = 5
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
