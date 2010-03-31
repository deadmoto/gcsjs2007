object Form35: TForm35
  Left = 386
  Top = 249
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  ClientHeight = 322
  ClientWidth = 430
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
    Left = 216
    Top = 295
    Width = 97
    Height = 21
    TabOrder = 0
    OnClick = Button1Click
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 424
    Height = 54
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitWidth = 674
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 79
      Height = 13
      Caption = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1072#1084':'
    end
    object Edit1: TEdit
      Left = 8
      Top = 24
      Width = 296
      Height = 21
      Hint = #1058#1077#1082#1091#1097#1072#1103' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1103
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
    end
    object Button2: TButton
      Left = 308
      Top = 24
      Width = 20
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1090#1077#1082#1091#1097#1077#1081' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1080
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object MaskEdit1: TMaskEdit
      Left = 336
      Top = 24
      Width = 65
      Height = 21
      EditMask = '!90/90/0000;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  .  .    '
      OnExit = MaskEdit1Exit
      OnKeyDown = MaskEdit1KeyDown
    end
    object CheckBox29: TCheckBox
      Left = 336
      Top = 8
      Width = 73
      Height = 17
      Hint = '0 - '#1074#1099#1073#1086#1088' '#1073#1077#1079' '#1091#1095#1077#1090#1072' '#1076#1072#1090#1099'; 1- '#1074#1099#1073#1086#1088' '#1089#1086#1075#1083#1072#1089#1085#1086' '#1076#1072#1090#1077
      Caption = #1044#1072#1090#1072
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = CheckBox29Click
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 60
    Width = 424
    Height = 229
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    ExplicitWidth = 674
    object CheckBox7: TCheckBox
      Left = 8
      Top = 75
      Width = 97
      Height = 17
      Caption = #1044#1086#1084#1072
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object CheckBox8: TCheckBox
      Left = 8
      Top = 26
      Width = 97
      Height = 17
      Caption = #1050#1083#1080#1077#1085#1090#1099
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object CheckBox9: TCheckBox
      Left = 8
      Top = 43
      Width = 97
      Height = 17
      Caption = #1057#1077#1084#1100#1080
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object CheckBox10: TCheckBox
      Left = 8
      Top = 107
      Width = 97
      Height = 17
      Caption = #1057#1091#1073#1089#1080#1076#1080#1080
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object CheckBox11: TCheckBox
      Left = 8
      Top = 59
      Width = 97
      Height = 17
      Caption = #1056#1072#1089#1087#1086#1088#1103#1076#1080#1090#1077#1083#1080
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object CheckBox13: TCheckBox
      Left = 8
      Top = 91
      Width = 97
      Height = 17
      Caption = #1048#1085#1089#1087#1077#1082#1090#1086#1088#1072
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object CheckBox24: TCheckBox
      Left = 8
      Top = 194
      Width = 97
      Height = 17
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      TabOrder = 6
      OnClick = CheckBox24Click
    end
    object CheckBox28: TCheckBox
      Left = 8
      Top = 123
      Width = 97
      Height = 17
      Caption = #1057#1083#1091#1078#1077#1073#1085#1099#1077
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object CheckBox30: TCheckBox
      Left = 8
      Top = 139
      Width = 121
      Height = 17
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object CheckBox31: TCheckBox
      Left = 8
      Top = 155
      Width = 97
      Height = 17
      Caption = #1060'. '#1088#1072#1089#1093#1086#1076#1099
      Checked = True
      State = cbChecked
      TabOrder = 9
    end
    object CheckBox33: TCheckBox
      Left = 8
      Top = 171
      Width = 97
      Height = 17
      Caption = #1057#1095#1077#1090#1095#1080#1082#1080
      Checked = True
      State = cbChecked
      TabOrder = 10
    end
    object GroupBox1: TGroupBox
      Left = 135
      Top = 26
      Width = 281
      Height = 185
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080'   '
      Enabled = False
      TabOrder = 11
      object CheckBox3: TCheckBox
        Left = 11
        Top = 34
        Width = 81
        Height = 17
        Caption = #1054#1082#1088#1091#1075#1072
        Color = clBtnFace
        ParentColor = False
        TabOrder = 1
      end
      object CheckBox4: TCheckBox
        Left = 11
        Top = 66
        Width = 121
        Height = 17
        Caption = #1055#1088#1086#1078#1080#1090'. '#1084#1080#1085#1080#1084#1091#1084#1099
        Color = clBtnFace
        ParentColor = False
        TabOrder = 3
      end
      object CheckBox5: TCheckBox
        Left = 11
        Top = 18
        Width = 57
        Height = 17
        Caption = #1041#1072#1085#1082#1080
        Color = clBtnFace
        ParentColor = False
        TabOrder = 0
      end
      object CheckBox12: TCheckBox
        Left = 11
        Top = 50
        Width = 121
        Height = 17
        Caption = #1046#1080#1083'.'#1092#1086#1085#1076#1099
        Color = clBtnFace
        ParentColor = False
        TabOrder = 2
      end
      object CheckBox2: TCheckBox
        Left = 11
        Top = 82
        Width = 121
        Height = 17
        Caption = #1057#1086#1094'. '#1089#1090#1072#1090#1091#1089#1099
        Color = clBtnFace
        ParentColor = False
        TabOrder = 4
      end
      object CheckBox6: TCheckBox
        Left = 163
        Top = 18
        Width = 81
        Height = 17
        Caption = #1046#1080#1083#1100#1077
        Color = clBtnFace
        ParentColor = False
        TabOrder = 10
      end
      object CheckBox14: TCheckBox
        Left = 163
        Top = 34
        Width = 110
        Height = 17
        Caption = #1054#1089#1074#1077#1097#1077#1085#1080#1077' '#1052#1054#1055
        Color = clBtnFace
        ParentColor = False
        TabOrder = 11
      end
      object CheckBox15: TCheckBox
        Left = 163
        Top = 50
        Width = 81
        Height = 17
        Caption = #1061#1086#1083'. '#1074#1086#1076#1072
        Color = clBtnFace
        ParentColor = False
        TabOrder = 12
      end
      object CheckBox17: TCheckBox
        Left = 163
        Top = 98
        Width = 81
        Height = 17
        Caption = #1054#1090#1086#1087#1083#1077#1085#1080#1077
        Color = clBtnFace
        ParentColor = False
        TabOrder = 15
      end
      object CheckBox18: TCheckBox
        Left = 163
        Top = 114
        Width = 81
        Height = 17
        Caption = #1043#1072#1079
        Color = clBtnFace
        ParentColor = False
        TabOrder = 16
      end
      object CheckBox19: TCheckBox
        Left = 163
        Top = 130
        Width = 81
        Height = 17
        Caption = #1069'/'#1101
        Color = clBtnFace
        ParentColor = False
        TabOrder = 17
      end
      object CheckBox20: TCheckBox
        Left = 163
        Top = 146
        Width = 81
        Height = 17
        Caption = #1044#1088#1086#1074#1072
        Color = clBtnFace
        ParentColor = False
        TabOrder = 18
      end
      object CheckBox21: TCheckBox
        Left = 163
        Top = 162
        Width = 81
        Height = 17
        Caption = #1059#1075#1086#1083#1100
        Color = clBtnFace
        ParentColor = False
        TabOrder = 19
      end
      object CheckBox25: TCheckBox
        Left = 11
        Top = 98
        Width = 121
        Height = 17
        Caption = #1057#1086#1094'. '#1085#1086#1088#1084#1099
        Color = clBtnFace
        ParentColor = False
        TabOrder = 5
      end
      object CheckBox26: TCheckBox
        Left = 11
        Top = 114
        Width = 121
        Height = 17
        Caption = #1051#1100#1075#1086#1090#1099
        Color = clBtnFace
        ParentColor = False
        TabOrder = 6
      end
      object CheckBox22: TCheckBox
        Left = 11
        Top = 162
        Width = 121
        Height = 17
        Caption = #1055#1088#1086#1095#1080#1077
        Color = clBtnFace
        ParentColor = False
        TabOrder = 9
      end
      object CheckBox23: TCheckBox
        Left = 11
        Top = 130
        Width = 121
        Height = 17
        Caption = #1056#1077#1075#1080#1086#1085'. '#1089#1090#1072#1085#1076#1072#1088#1090#1099
        TabOrder = 7
      end
      object CheckBox16: TCheckBox
        Left = 163
        Top = 66
        Width = 81
        Height = 17
        Caption = #1043#1086#1088'. '#1074#1086#1076#1072
        Color = clBtnFace
        ParentColor = False
        TabOrder = 13
      end
      object CheckBox27: TCheckBox
        Left = 163
        Top = 82
        Width = 105
        Height = 17
        Caption = #1042#1086#1076#1086#1086#1090#1074#1077#1076#1077#1085#1080#1077
        Color = clBtnFace
        ParentColor = False
        TabOrder = 14
      end
      object CheckBox1: TCheckBox
        Left = 11
        Top = 146
        Width = 97
        Height = 17
        Caption = #1059#1083#1080#1094#1099
        TabOrder = 8
      end
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 6
      Width = 17
      Height = 17
      Caption = '+'
      TabOrder = 12
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 25
      Top = 6
      Width = 17
      Height = 17
      Caption = '-'
      TabOrder = 13
      OnClick = BitBtn2Click
    end
    object CheckBox32: TCheckBox
      Left = 213
      Top = 26
      Width = 17
      Height = 17
      Enabled = False
      TabOrder = 14
      OnClick = CheckBox32Click
    end
  end
  object Button3: TButton
    Left = 322
    Top = 295
    Width = 97
    Height = 21
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = Button3Click
  end
end
