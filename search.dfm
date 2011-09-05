object Form33: TForm33
  Left = 296
  Top = 306
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1060#1080#1083#1100#1090#1088
  ClientHeight = 530
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 241
    Width = 385
    Height = 244
    TabOrder = 1
    object Label4: TLabel
      Left = 276
      Top = 20
      Width = 29
      Height = 16
      Caption = #1044#1086#1084':'
    end
    object ComboBox2: TComboBox
      Left = 10
      Top = 39
      Width = 267
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      OnChange = ComboBox2Change
      OnExit = ComboBox2Change
    end
    object Edit3: TEdit
      Left = 276
      Top = 39
      Width = 40
      Height = 24
      Hint = 
        #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1077#1089#1083#1080' '#1074' '#1085#1086#1084#1077#1088#1077' '#1076#1086#1084#1072' '#1077#1089#1090#1100' '#1073#1091#1082#1074#1072', '#1090#1086' '#1086#1085#1072' '#1087#1080#1096#1077#1090#1089#1103' '#1073#1077#1079' '#1087 +
        #1088#1086#1073#1077#1083#1072' '#1089#1088#1072#1079#1091' '#1079#1072' '#1094#1080#1092#1088#1086#1081
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
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
      Left = 315
      Top = 39
      Width = 21
      Height = 24
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
      Text = ' /'
    end
    object Edit5: TEdit
      Left = 335
      Top = 39
      Width = 40
      Height = 24
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1084#1086#1078#1085#1086' '#1074#1074#1077#1089#1090#1080' '#1090#1086#1083#1100#1082#1086' '#1095#1080#1089#1083#1086
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
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
      Left = 59
      Top = 89
      Width = 316
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 3
      OnChange = ComboBox7Change
      OnExit = ComboBox7Change
    end
    object ComboBox8: TComboBox
      Left = 177
      Top = 118
      Width = 198
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 4
      OnChange = ComboBox8Change
      OnExit = ComboBox8Change
    end
    object ComboBox9: TComboBox
      Left = 177
      Top = 148
      Width = 198
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 5
      OnChange = ComboBox9Change
      OnExit = ComboBox9Change
    end
    object ComboBox10: TComboBox
      Left = 177
      Top = 177
      Width = 198
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 6
      OnChange = ComboBox10Change
      OnExit = ComboBox10Change
    end
    object CheckBox6: TCheckBox
      Left = 10
      Top = 20
      Width = 70
      Height = 21
      TabStop = False
      Caption = #1059#1083#1080#1094#1072
      TabOrder = 8
      OnClick = CheckBox6Click
    end
    object CheckBox7: TCheckBox
      Left = 10
      Top = 69
      Width = 168
      Height = 21
      TabStop = False
      Caption = #1056#1072#1089#1087#1086#1088#1103#1076#1080#1090#1077#1083#1100' '#1078#1080#1083#1100#1103
      TabOrder = 9
      OnClick = CheckBox7Click
    end
    object CheckBox8: TCheckBox
      Left = 10
      Top = 118
      Width = 159
      Height = 21
      TabStop = False
      Caption = #1046#1080#1083#1080#1097#1085#1099#1081' '#1092#1086#1085#1076
      TabOrder = 10
      OnClick = CheckBox8Click
    end
    object CheckBox9: TCheckBox
      Left = 10
      Top = 148
      Width = 139
      Height = 21
      TabStop = False
      Caption = #1058#1080#1087' '#1079#1072#1089#1077#1083#1077#1085#1080#1103
      TabOrder = 11
      OnClick = CheckBox9Click
    end
    object CheckBox10: TCheckBox
      Left = 10
      Top = 177
      Width = 119
      Height = 21
      TabStop = False
      Caption = #1058#1080#1087' '#1074#1083#1072#1076#1077#1085#1080#1103
      TabOrder = 12
      OnClick = CheckBox10Click
    end
    object CheckBox20: TCheckBox
      Left = 10
      Top = 207
      Width = 119
      Height = 21
      Caption = #1050#1086#1083'-'#1074#1086' '#1095#1077#1083#1086#1074#1077#1082
      TabOrder = 13
      OnClick = CheckBox20Click
    end
    object ComboBox14: TComboBox
      Left = 177
      Top = 207
      Width = 198
      Height = 24
      Color = clBtnFace
      ItemHeight = 16
      TabOrder = 14
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10')
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 4
    Width = 385
    Height = 238
    TabOrder = 0
    object Edit2: TEdit
      Left = 158
      Top = 20
      Width = 188
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object ComboBox1: TComboBox
      Left = 158
      Top = 79
      Width = 188
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 2
      OnChange = ComboBox1Change
      OnExit = ComboBox1Change
    end
    object CheckBox1: TCheckBox
      Left = 10
      Top = 20
      Width = 100
      Height = 21
      TabStop = False
      Caption = #1056#1077#1075'. '#1085#1086#1084#1077#1088
      TabOrder = 5
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 10
      Top = 49
      Width = 149
      Height = 21
      TabStop = False
      Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      TabOrder = 6
      OnClick = CheckBox2Click
    end
    object CheckBox3: TCheckBox
      Left = 10
      Top = 79
      Width = 100
      Height = 21
      TabStop = False
      Caption = #1048#1085#1089#1087#1077#1082#1090#1086#1088
      TabOrder = 7
      OnClick = CheckBox3Click
    end
    object CheckBox12: TCheckBox
      Left = 10
      Top = 108
      Width = 139
      Height = 21
      TabStop = False
      Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      TabOrder = 8
      OnClick = CheckBox12Click
    end
    object ComboBox6: TComboBox
      Left = 89
      Top = 138
      Width = 257
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 4
      OnChange = ComboBox6Change
      OnExit = ComboBox6Change
    end
    object CheckBox14: TCheckBox
      Left = 10
      Top = 138
      Width = 70
      Height = 21
      TabStop = False
      Caption = #1051#1100#1075#1086#1090#1072
      TabOrder = 9
      OnClick = CheckBox14Click
    end
    object MaskEdit1: TMaskEdit
      Left = 158
      Top = 49
      Width = 187
      Height = 24
      Color = clBtnFace
      EditMask = '!90/90/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
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
      Left = 158
      Top = 108
      Width = 187
      Height = 24
      Color = clBtnFace
      EditMask = '!90/90/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
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
      Left = 10
      Top = 197
      Width = 119
      Height = 21
      Caption = #1058#1080#1087' '#1086#1090#1086#1087#1083#1077#1085#1080#1103
      TabOrder = 10
      OnClick = CheckBox19Click
    end
    object ComboBox13: TComboBox
      Left = 158
      Top = 197
      Width = 188
      Height = 24
      Color = clBtnFace
      ItemHeight = 16
      TabOrder = 11
      Items.Strings = (
        #1062#1077#1085#1090#1088#1072#1083#1100#1085#1086#1077
        #1058#1074#1077#1088#1076#1086#1077' '#1090#1086#1087#1083#1080#1074#1086
        #1043#1072#1079#1086#1074#1086#1077
        #1069#1083#1077#1082#1090#1080#1088#1080#1095#1077#1089#1082#1086#1077)
    end
    object CheckBox23: TCheckBox
      Left = 10
      Top = 167
      Width = 119
      Height = 21
      Caption = #1057#1086#1094'. '#1089#1090#1072#1090#1091#1089
      TabOrder = 12
      OnClick = CheckBox23Click
    end
    object ComboBox15: TComboBox
      Left = 158
      Top = 167
      Width = 188
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 13
      OnChange = ComboBox15Change
      OnExit = ComboBox15Change
    end
  end
  object GroupBox3: TGroupBox
    AlignWithMargins = True
    Left = 394
    Top = 4
    Width = 383
    Height = 238
    TabOrder = 2
    object Label9: TLabel
      Left = 30
      Top = 49
      Width = 7
      Height = 16
      Caption = #1089
    end
    object Label10: TLabel
      Left = 158
      Top = 49
      Width = 16
      Height = 16
      Caption = #1087#1086
    end
    object CheckBox11: TCheckBox
      Left = 10
      Top = 20
      Width = 188
      Height = 21
      TabStop = False
      Caption = #1057#1088#1086#1082' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1089#1091#1073#1089#1080#1076#1080#1080
      TabOrder = 5
      OnClick = CheckBox11Click
    end
    object CheckBox4: TCheckBox
      Left = 10
      Top = 108
      Width = 129
      Height = 21
      TabStop = False
      Caption = #1058#1080#1087' '#1072#1090#1090#1077#1089#1090#1072#1094#1080#1080
      TabOrder = 6
      OnClick = CheckBox4Click
    end
    object CheckBox5: TCheckBox
      Left = 10
      Top = 138
      Width = 119
      Height = 21
      TabStop = False
      Caption = #1058#1080#1087' '#1082#1086#1085#1090#1088#1086#1083#1103
      TabOrder = 7
      OnClick = CheckBox5Click
    end
    object ComboBox3: TComboBox
      Left = 148
      Top = 108
      Width = 178
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 3
      OnChange = ComboBox3Change
      OnExit = ComboBox3Change
    end
    object CheckBox13: TCheckBox
      Left = 10
      Top = 79
      Width = 90
      Height = 21
      TabStop = False
      Caption = #1057#1090#1072#1090#1091#1089
      TabOrder = 8
      OnClick = CheckBox13Click
    end
    object ComboBox5: TComboBox
      Left = 148
      Top = 79
      Width = 178
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 2
      OnChange = ComboBox5Change
      OnExit = ComboBox5Change
    end
    object ComboBox4: TComboBox
      Left = 148
      Top = 138
      Width = 178
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 4
      OnChange = ComboBox4Change
      OnExit = ComboBox4Change
    end
    object MaskEdit2: TMaskEdit
      Left = 49
      Top = 49
      Width = 90
      Height = 24
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1077#1085#1100' '#1076#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' 1 '#1095#1080#1089#1083#1086#1084' '#1084#1077#1089#1103#1094#1072
      Color = clBtnFace
      EditMask = '!90/90/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
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
      Left = 197
      Top = 49
      Width = 90
      Height = 24
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1077#1085#1100' '#1076#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' 1 '#1095#1080#1089#1083#1086#1084' '#1084#1077#1089#1103#1094#1072
      Color = clBtnFace
      EditMask = '!90/90/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
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
      Left = 10
      Top = 167
      Width = 119
      Height = 21
      TabStop = False
      Caption = #1058#1080#1087' '#1088#1072#1089#1095#1077#1090#1072
      TabOrder = 9
      OnClick = CheckBox15Click
    end
    object ComboBox11: TComboBox
      Left = 148
      Top = 167
      Width = 178
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 10
      OnChange = ComboBox11Change
      OnExit = ComboBox11Change
    end
    object CheckBox24: TCheckBox
      Left = 10
      Top = 197
      Width = 119
      Height = 21
      Caption = #1052#1044#1044
      TabOrder = 11
      OnClick = CheckBox24Click
    end
    object ComboBox16: TComboBox
      Left = 148
      Top = 201
      Width = 178
      Height = 24
      Color = clBtnFace
      ItemHeight = 16
      TabOrder = 12
      Items.Strings = (
        '20'
        '18')
    end
  end
  object GroupBox4: TGroupBox
    AlignWithMargins = True
    Left = 394
    Top = 241
    Width = 383
    Height = 244
    TabOrder = 3
    object CheckBox16: TCheckBox
      Left = 10
      Top = 20
      Width = 119
      Height = 21
      Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
      TabOrder = 0
      OnClick = CheckBox16Click
    end
    object ComboBox12: TComboBox
      Left = 148
      Top = 20
      Width = 178
      Height = 24
      Color = clBtnFace
      ItemHeight = 16
      TabOrder = 1
      Items.Strings = (
        #1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1086
        #1053#1077' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1086)
    end
    object CheckBox17: TCheckBox
      Left = 23
      Top = 78
      Width = 149
      Height = 20
      Caption = '('#1090#1086#1083#1100#1082#1086' '#1079#1072' '#1084#1077#1089#1103#1094')'
      Enabled = False
      TabOrder = 4
      OnClick = CheckBox17Click
    end
    object MaskEdit5: TMaskEdit
      Left = 148
      Top = 49
      Width = 90
      Height = 24
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1077#1085#1100' '#1076#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' 1 '#1095#1080#1089#1083#1086#1084' '#1084#1077#1089#1103#1094#1072
      Color = clBtnFace
      EditMask = '!90/90/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
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
      Left = 10
      Top = 49
      Width = 129
      Height = 21
      Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
      Enabled = False
      TabOrder = 2
      OnClick = CheckBox18Click
    end
    object CheckBox21: TCheckBox
      Left = 10
      Top = 118
      Width = 90
      Height = 21
      Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1086#1073#1097#1077#1081' '#1087#1083#1086#1097#1072#1076#1080
      Caption = #1055#1083#1086#1097#1072#1076#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = CheckBox21Click
    end
    object Panel1: TPanel
      Left = 148
      Top = 118
      Width = 178
      Height = 70
      BevelInner = bvLowered
      TabOrder = 6
      Visible = False
      object Button3: TButton
        Left = 10
        Top = 10
        Width = 31
        Height = 21
        Caption = '='
        TabOrder = 0
        OnClick = Button3Click
      end
      object UpDown1: TUpDown
        Left = 41
        Top = 10
        Width = 21
        Height = 21
        Max = 3
        TabOrder = 1
        Thousands = False
        OnClick = UpDown1Click
      end
      object CheckBox22: TCheckBox
        Left = 127
        Top = 10
        Width = 32
        Height = 21
        Caption = #1080
        TabOrder = 2
        OnClick = CheckBox22Click
      end
      object Panel2: TPanel
        Left = 10
        Top = 38
        Width = 109
        Height = 21
        BevelOuter = bvNone
        TabOrder = 3
        Visible = False
        object Button4: TButton
          Left = 0
          Top = 0
          Width = 31
          Height = 21
          Caption = '='
          TabOrder = 0
          OnClick = Button4Click
        end
        object UpDown2: TUpDown
          Left = 31
          Top = 0
          Width = 21
          Height = 21
          Max = 3
          TabOrder = 1
          Thousands = False
          OnClick = UpDown2Click
        end
        object Edit6: TEdit
          Left = 59
          Top = 0
          Width = 51
          Height = 24
          Ctl3D = True
          MaxLength = 6
          ParentCtl3D = False
          TabOrder = 2
          OnExit = Edit1Exit
        end
      end
      object Edit1: TEdit
        Left = 69
        Top = 10
        Width = 50
        Height = 24
        MaxLength = 6
        TabOrder = 4
        OnExit = Edit1Exit
      end
    end
    object CheckBox25: TCheckBox
      Left = 10
      Top = 197
      Width = 90
      Height = 21
      Caption = #1059#1095#1072#1089#1090#1086#1082
      TabOrder = 7
      OnClick = CheckBox25Click
    end
    object ComboBox17: TComboBox
      Left = 148
      Top = 196
      Width = 178
      Height = 24
      Color = clBtnFace
      ItemHeight = 16
      TabOrder = 8
      OnChange = ComboBox17Change
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 489
    Width = 773
    Height = 38
    Align = alBottom
    AutoWrap = False
    BevelOuter = bvNone
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 4
    object Button2: TButton
      AlignWithMargins = True
      Left = 678
      Top = 5
      Width = 92
      Height = 30
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 580
      Top = 5
      Width = 92
      Height = 30
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
