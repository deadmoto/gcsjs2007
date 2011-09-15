object EditClForm: TEditClForm
  Left = 310
  Top = 259
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 473
  ClientWidth = 604
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 38
    Width = 598
    Height = 432
    ActivePage = TabSheet1
    Align = alBottom
    OwnerDraw = True
    TabOrder = 0
    OnChange = PageControl1Change
    OnDrawTab = PageControl1DrawTab
    object TabSheet1: TTabSheet
      Caption = #1050#1083#1080#1077#1085#1090
      OnExit = TabSheet1Exit
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 30
        Height = 13
        Caption = #1060#1048#1054':'
      end
      object Label2: TLabel
        Left = 8
        Top = 64
        Width = 94
        Height = 13
        Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094'. '#1085#1086#1084#1077#1088':'
      end
      object Label3: TLabel
        Left = 8
        Top = 88
        Width = 96
        Height = 13
        Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080':'
      end
      object Label5: TLabel
        Left = 180
        Top = 88
        Width = 118
        Height = 13
        Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1103':'
      end
      object Label6: TLabel
        Left = 180
        Top = 64
        Width = 58
        Height = 13
        Caption = #1048#1085#1089#1087#1077#1082#1090#1086#1088':'
      end
      object Label7: TLabel
        Left = 8
        Top = 144
        Width = 35
        Height = 13
        Caption = #1059#1083#1080#1094#1072':'
      end
      object Label8: TLabel
        Left = 272
        Top = 144
        Width = 26
        Height = 13
        Caption = #1044#1086#1084':'
      end
      object Label11: TLabel
        Left = 420
        Top = 144
        Width = 16
        Height = 13
        Caption = #1050#1074':'
      end
      object Label9: TLabel
        Left = 8
        Top = 320
        Width = 81
        Height = 13
        Caption = #1050#1086#1083'-'#1074#1086' '#1095#1077#1083#1086#1074#1077#1082':'
      end
      object Label10: TLabel
        Left = 8
        Top = 288
        Width = 86
        Height = 13
        Caption = #1054#1073#1097#1072#1103' '#1087#1083#1086#1097#1072#1076#1100':'
      end
      object Label12: TLabel
        Left = 8
        Top = 232
        Width = 79
        Height = 13
        Caption = #1058#1080#1087' '#1079#1072#1089#1077#1083#1077#1085#1080#1103':'
      end
      object Label13: TLabel
        Left = 412
        Top = 118
        Width = 22
        Height = 13
        Caption = #1058#1077#1083':'
      end
      object Label14: TLabel
        Left = 8
        Top = 184
        Width = 116
        Height = 13
        Caption = #1056#1072#1089#1087#1086#1088#1103#1076#1080#1090#1077#1083#1100' '#1078#1080#1083#1100#1103':'
      end
      object Label15: TLabel
        Left = 8
        Top = 208
        Width = 90
        Height = 13
        Caption = #1046#1080#1083#1080#1097#1085#1099#1081' '#1092#1086#1085#1076':'
      end
      object Label16: TLabel
        Left = 176
        Top = 288
        Width = 26
        Height = 13
        Caption = #1082#1074'.'#1084'.'
      end
      object Label17: TLabel
        Left = 128
        Top = 320
        Width = 93
        Height = 13
        Caption = #1080#1079' '#1085#1080#1093' '#1089#1086' '#1083#1100#1075#1086#1090#1086#1081':'
      end
      object Label62: TLabel
        Left = 8
        Top = 256
        Width = 73
        Height = 13
        Caption = #1058#1080#1087' '#1074#1083#1072#1076#1077#1085#1080#1103':'
      end
      object Label73: TLabel
        Left = 208
        Top = 288
        Width = 80
        Height = 13
        Caption = #1046#1080#1083#1072#1103'/'#1083#1100#1075#1086#1090#1085'.:'
      end
      object Label74: TLabel
        Left = 344
        Top = 288
        Width = 26
        Height = 13
        Caption = #1082#1074'.'#1084'.'
      end
      object Label75: TLabel
        Left = 180
        Top = 112
        Width = 86
        Height = 13
        Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1083#1077#1085#1080#1103':'
      end
      object Label76: TLabel
        Left = 8
        Top = 112
        Width = 73
        Height = 13
        Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077':'
      end
      object Label84: TLabel
        Left = 263
        Top = 320
        Width = 98
        Height = 13
        Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1086':'
      end
      object GroupBox2: TGroupBox
        Left = 408
        Top = 5
        Width = 169
        Height = 103
        Caption = #1050#1086#1085#1090#1088#1086#1083#1100
        TabOrder = 13
        object Label4: TLabel
          Left = 8
          Top = 44
          Width = 46
          Height = 13
          Caption = #1055#1088#1080#1095#1080#1085#1072':'
        end
        object ComboBox11: TComboBox
          Left = 8
          Top = 17
          Width = 153
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = ComboBox11Change
          OnExit = ComboBox11Change
        end
        object Memo1: TMemo
          Left = 2
          Top = 61
          Width = 165
          Height = 40
          Hint = 
            #1055#1088#1080#1095#1080#1085#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080' '#1085#1072' '#1082#1086#1085#1090#1088#1086#1083#1100'.'#1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077 +
            #1077' 60 '#1082#1080#1088#1080#1083#1083#1080#1095#1077#1089#1082#1080#1093' '#1089#1080#1084#1074#1086#1083#1086#1074
          Align = alBottom
          MaxLength = 60
          ParentShowHint = False
          ScrollBars = ssVertical
          ShowHint = True
          TabOrder = 1
          OnChange = Memo1Change
        end
      end
      object Edit1: TEdit
        Left = 352
        Top = 144
        Width = 13
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 17
        Text = '/'
      end
      object GroupBox6: TGroupBox
        Left = 408
        Top = 264
        Width = 169
        Height = 89
        Caption = #1057#1088#1086#1082' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1089#1091#1073#1089#1080#1076#1080#1080
        TabOrder = 16
        object Label32: TLabel
          Left = 8
          Top = 43
          Width = 67
          Height = 13
          Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072':'
        end
        object Label33: TLabel
          Left = 8
          Top = 63
          Width = 85
          Height = 13
          Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103':'
        end
        object Label28: TLabel
          Left = 8
          Top = 20
          Width = 41
          Height = 13
          Caption = #1055#1077#1088#1080#1086#1076':'
        end
        object MaskEdit2: TMaskEdit
          Left = 96
          Top = 43
          Width = 65
          Height = 21
          TabStop = False
          Color = clBtnFace
          EditMask = '!90/90/0000;1;_'
          MaxLength = 10
          ReadOnly = True
          TabOrder = 3
          Text = '  .  .    '
        end
        object Button6: TButton
          Left = 142
          Top = 20
          Width = 19
          Height = 17
          Hint = #1053#1086#1074#1099#1081' '#1089#1088#1086#1082' '#1085#1072' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
          Caption = #1085
          TabOrder = 1
          OnClick = Button6Click
        end
        object MaskEdit3: TMaskEdit
          Left = 96
          Top = 63
          Width = 65
          Height = 21
          TabStop = False
          Color = clBtnFace
          EditMask = '!90/90/0000;1;_'
          MaxLength = 10
          ReadOnly = True
          TabOrder = 4
          Text = '  .  .    '
        end
        object UpDown1: TUpDown
          Left = 119
          Top = 20
          Width = 17
          Height = 21
          Associate = Edit109
          Max = 10
          Position = 6
          TabOrder = 2
          Thousands = False
        end
        object Edit109: TEdit
          Left = 94
          Top = 20
          Width = 25
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = '6'
        end
      end
      object Edit57: TEdit
        Left = 48
        Top = 24
        Width = 345
        Height = 21
        MaxLength = 50
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnExit = Edit57Exit
        OnKeyDown = Edit57KeyDown
      end
      object ComboBox12: TComboBox
        Left = 48
        Top = 144
        Width = 217
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        OnChange = ComboBox12Change
        OnExit = ComboBox12Change
      end
      object Edit60: TEdit
        Left = 304
        Top = 144
        Width = 49
        Height = 21
        Hint = 
          #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1077#1089#1083#1080' '#1074' '#1085#1086#1084#1077#1088#1077' '#1076#1086#1084#1072' '#1077#1089#1090#1100' '#1073#1091#1082#1074#1072', '#1090#1086' '#1086#1085#1072' '#1087#1080#1096#1077#1090#1089#1103' '#1089#1083#1080#1090#1085 +
          #1086' '#1089' '#1085#1086#1084#1077#1088#1086#1084', '#1073#1077#1079' '#1087#1088#1086#1073#1077#1083#1072
        MaxLength = 7
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnChange = Edit60Change
      end
      object Edit61: TEdit
        Left = 365
        Top = 144
        Width = 41
        Height = 21
        Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1074#1074#1077#1089#1090#1080' '#1084#1086#1078#1085#1086' '#1090#1086#1083#1100#1082#1086' '#1095#1080#1089#1083#1086
        MaxLength = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnChange = Edit60Change
      end
      object Edit63: TEdit
        Left = 442
        Top = 144
        Width = 41
        Height = 21
        Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 4 '#1082#1080#1088#1080#1083#1083#1080#1095#1077#1089#1082#1080#1093' '#1089#1080#1084#1074#1086#1083#1086#1074
        MaxLength = 8
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnExit = Edit63Exit
        OnKeyDown = Edit63KeyDown
      end
      object Edit64: TEdit
        Left = 442
        Top = 118
        Width = 133
        Height = 21
        Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 11 '#1089#1080#1084#1074#1086#1083#1086#1074
        MaxLength = 11
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnExit = Edit64Exit
        OnKeyDown = Edit64KeyDown
      end
      object ComboBox13: TComboBox
        Left = 128
        Top = 208
        Width = 161
        Height = 21
        ItemHeight = 13
        TabOrder = 7
        OnChange = ComboBox13Change
        OnExit = ComboBox13Change
      end
      object ComboBox14: TComboBox
        Left = 128
        Top = 232
        Width = 161
        Height = 21
        ItemHeight = 13
        TabOrder = 8
        OnChange = ComboBox14Change
        OnExit = ComboBox14Change
      end
      object Edit66: TEdit
        Left = 128
        Top = 288
        Width = 41
        Height = 21
        TabOrder = 10
        Text = '0'
        OnExit = Edit66Exit
        OnKeyDown = Edit66KeyDown
      end
      object Edit68: TEdit
        Left = 97
        Top = 320
        Width = 25
        Height = 21
        Hint = 
          #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1095#1077#1083#1086#1074#1077#1082' '#1085#1077' '#1084#1086#1078#1077#1090' '#1087#1088#1077#1074#1099#1096#1072#1090#1100' '#1095#1080#1089#1083#1086' '#1095#1083#1077#1085#1086#1074' ' +
          #1089#1077#1084#1100#1080
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 14
        Text = '0'
      end
      object ComboBox15: TComboBox
        Left = 128
        Top = 184
        Width = 265
        Height = 21
        ItemHeight = 13
        TabOrder = 6
        OnChange = ComboBox15Change
        OnExit = ComboBox15Change
      end
      object Edit85: TEdit
        Left = 108
        Top = 64
        Width = 65
        Height = 21
        TabStop = False
        Color = clBtnFace
        MaxLength = 9
        ReadOnly = True
        TabOrder = 18
      end
      object Edit86: TEdit
        Left = 248
        Top = 64
        Width = 121
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 19
      end
      object Edit87: TEdit
        Left = 108
        Top = 88
        Width = 65
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 20
      end
      object Edit88: TEdit
        Left = 304
        Top = 88
        Width = 65
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 21
      end
      object ComboBox16: TComboBox
        Left = 128
        Top = 256
        Width = 161
        Height = 21
        ItemHeight = 13
        TabOrder = 9
        OnChange = ComboBox16Change
        OnExit = ComboBox16Change
      end
      object Edit95: TEdit
        Left = 227
        Top = 321
        Width = 25
        Height = 21
        Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1083#1100#1075#1086#1090#1085#1080#1082#1086#1074' '#1085#1077' '#1084#1086#1078#1077#1090' '#1073#1099#1090#1100' '#1073#1086#1083#1100#1096#1077','#1095#1077#1084' '#1095#1083#1077#1085#1086#1074' '#1089#1077#1084#1100#1080
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 15
        Text = '0'
      end
      object RadioGroup1: TRadioGroup
        Left = 408
        Top = 180
        Width = 169
        Height = 81
        Caption = #1040#1090#1090#1077#1089#1090#1072#1094#1080#1103
        TabOrder = 22
        OnClick = RadioGroup1Click
      end
      object Button19: TButton
        Left = 370
        Top = 64
        Width = 25
        Height = 20
        Hint = #1057#1084#1077#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1080#1085#1089#1087#1077#1082#1090#1086#1088#1072
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 23
        OnClick = Button19Click
      end
      object RadioGroup3: TRadioGroup
        Left = 321
        Top = 215
        Width = 49
        Height = 57
        Caption = #1052#1044#1044
        TabOrder = 12
        OnClick = RadioGroup3Click
      end
      object Edit110: TEdit
        Left = 296
        Top = 288
        Width = 41
        Height = 21
        TabOrder = 11
        OnExit = Edit66Exit
        OnKeyDown = Edit66KeyDown
      end
      object CheckBox3: TCheckBox
        Left = 108
        Top = 112
        Width = 17
        Height = 17
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        TabOrder = 24
        OnClick = CheckBox3Click
      end
      object MaskEdit4: TMaskEdit
        Left = 304
        Top = 112
        Width = 65
        Height = 21
        TabStop = False
        Color = clBtnFace
        EditMask = '!90/90/0000;1;_'
        MaxLength = 10
        TabOrder = 25
        Text = '  .  .    '
      end
      object GroupBox12: TGroupBox
        Left = 8
        Top = 352
        Width = 398
        Height = 49
        Caption = #1055#1088#1086#1096#1083#1099#1081' '#1087#1077#1088#1080#1086#1076':'
        TabOrder = 26
        object Label85: TLabel
          Left = 158
          Top = 20
          Width = 29
          Height = 13
          Caption = #1044#1086#1083#1075':'
        end
        object Label83: TLabel
          Left = 76
          Top = 22
          Width = 3
          Height = 13
          Caption = '-'
        end
        object Label86: TLabel
          Left = 258
          Top = 20
          Width = 71
          Height = 13
          Caption = #1057#1088'. '#1092'. '#1088#1072#1089#1093#1086#1076':'
        end
        object MaskEdit5: TMaskEdit
          Left = 8
          Top = 20
          Width = 64
          Height = 21
          TabStop = False
          Color = clBtnFace
          EditMask = '!90/90/0000;1;_'
          MaxLength = 10
          ReadOnly = True
          TabOrder = 0
          Text = '  .  .    '
        end
        object MaskEdit6: TMaskEdit
          Left = 86
          Top = 20
          Width = 64
          Height = 21
          TabStop = False
          Color = clBtnFace
          EditMask = '!90/90/0000;1;_'
          MaxLength = 10
          ReadOnly = True
          TabOrder = 1
          Text = '  .  .    '
        end
        object Edit115: TEdit
          Left = 193
          Top = 20
          Width = 59
          Height = 21
          ReadOnly = True
          TabOrder = 2
          Text = '0'
        end
        object Edit116: TEdit
          Left = 334
          Top = 20
          Width = 59
          Height = 21
          ReadOnly = True
          TabOrder = 3
          Text = '0'
        end
      end
      object Edit117: TEdit
        Left = 367
        Top = 321
        Width = 25
        Height = 21
        TabOrder = 27
        Text = '0'
        OnExit = Edit117Exit
      end
      object GroupBox17: TGroupBox
        Left = 408
        Top = 352
        Width = 170
        Height = 49
        Caption = #1059#1095#1072#1089#1090#1086#1082':'
        TabOrder = 28
        object officeEdit: TEdit
          Left = 8
          Top = 19
          Width = 154
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1057#1077#1084#1100#1103
      ImageIndex = 1
      object Label21: TLabel
        Left = 8
        Top = 320
        Width = 97
        Height = 13
        Caption = #1057#1086#1074#1086#1082#1091#1087#1085#1099#1081' '#1076#1086#1093#1086#1076':'
      end
      object Label64: TLabel
        Left = 184
        Top = 320
        Width = 123
        Height = 13
        Caption = #1055#1088#1086#1078#1080#1090#1086#1095#1085#1099#1081' '#1084#1080#1085#1080#1084#1091#1084':'
      end
      object Label70: TLabel
        Left = 384
        Top = 320
        Width = 41
        Height = 13
        Caption = #1057#1044'/'#1055#1052':'
      end
      object Label71: TLabel
        Left = 480
        Top = 320
        Width = 50
        Height = 13
        Caption = #1056#1055#1089'/'#1056#1055#1087':'
      end
      object Label18: TLabel
        Left = 8
        Top = 208
        Width = 30
        Height = 13
        Caption = #1060#1048#1054':'
      end
      object Label20: TLabel
        Left = 320
        Top = 208
        Width = 61
        Height = 13
        Caption = #1057#1086#1094'. '#1089#1090#1072#1090#1091#1089':'
      end
      object Label61: TLabel
        Left = 240
        Top = 256
        Width = 39
        Height = 13
        Caption = #1051#1100#1075#1086#1090#1072':'
      end
      object Label23: TLabel
        Left = 320
        Top = 232
        Width = 60
        Height = 13
        Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077':'
      end
      object Label19: TLabel
        Left = 8
        Top = 232
        Width = 82
        Height = 13
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
      end
      object Label22: TLabel
        Left = 8
        Top = 256
        Width = 78
        Height = 13
        Caption = #1057'/'#1084#1077#1089#1103#1095' '#1076#1086#1093#1086#1076':'
      end
      object Label31: TLabel
        Left = 8
        Top = 280
        Width = 23
        Height = 13
        Caption = #1055#1086#1083':'
      end
      object Label95: TLabel
        Left = 240
        Top = 280
        Width = 41
        Height = 13
        Caption = #1057#1053#1048#1051#1057':'
      end
      object Button3: TButton
        Left = 96
        Top = 168
        Width = 129
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1095#1083#1077#1085#1072' '#1089#1077#1084#1100#1080
        TabOrder = 8
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 232
        Top = 168
        Width = 129
        Height = 25
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1095#1083#1077#1085#1072' '#1089#1077#1084#1100#1080
        TabOrder = 9
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 368
        Top = 168
        Width = 129
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1095#1083#1077#1085#1072' '#1089#1077#1084#1100#1080
        TabOrder = 10
        OnClick = Button5Click
      end
      object Edit73: TEdit
        Left = 112
        Top = 320
        Width = 65
        Height = 21
        HelpType = htKeyword
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 11
      end
      object Edit94: TEdit
        Left = 312
        Top = 320
        Width = 57
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 12
      end
      object LVFam: TListView
        Left = 8
        Top = 8
        Width = 569
        Height = 153
        Columns = <
          item
            Caption = #1060#1048#1054
            Width = 250
          end
          item
            Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
            Width = 91
          end
          item
            Caption = #1044#1086#1093#1086#1076
            Width = 60
          end
          item
            Caption = #1052#1080#1085#1080#1084#1091#1084
            Width = 60
          end
          item
            Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077
            Width = 90
          end>
        GridLines = True
        ReadOnly = True
        TabOrder = 15
        TabStop = False
        ViewStyle = vsReport
        OnSelectItem = LVFamSelectItem
      end
      object Edit107: TEdit
        Left = 432
        Top = 320
        Width = 41
        Height = 21
        Hint = 
          #1054#1090#1085#1086#1096#1077#1085#1080#1077' '#1089#1088#1077#1076#1085#1077#1076#1091#1096#1077#1074#1086#1075#1086' '#1076#1086#1093#1086#1076#1072' '#1089#1077#1084#1100#1080' '#1079#1072#1103#1074#1080#1090#1077#1083#1103' '#1082' '#1087#1088#1086#1078#1080#1090#1086#1095#1085#1086#1084#1091' '#1084 +
          #1080#1085#1080#1084#1091#1084#1091' '#1089#1077#1084#1100#1080' '#1079#1072#1103#1074#1080#1090#1077#1083#1103
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 13
      end
      object Edit108: TEdit
        Left = 536
        Top = 320
        Width = 41
        Height = 21
        Hint = 
          #1054#1090#1085#1086#1096#1077#1085#1080#1077' '#1088#1072#1079#1084#1077#1088#1072' '#1086#1087#1083#1072#1090#1099' '#1089' '#1091#1095#1077#1090#1086#1084' '#1089#1082#1080#1076#1082#1080' '#1082' '#1088#1072#1079#1084#1077#1088#1091' '#1086#1087#1083#1072#1090#1099' '#1073#1077#1079' '#1091#1095 +
          #1077#1090#1072' '#1089#1082#1080#1076#1082#1080
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 14
      end
      object Edit69: TEdit
        Left = 40
        Top = 208
        Width = 271
        Height = 21
        MaxLength = 50
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnExit = Edit69Exit
        OnKeyDown = Edit69KeyDown
      end
      object ComboBox17: TComboBox
        Left = 384
        Top = 208
        Width = 194
        Height = 21
        Hint = 
          #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1089#1086#1094#1080#1072#1083#1100#1085#1099#1081' '#1089#1090#1072#1090#1091#1089' '#1076#1086#1083#1078#1077#1085' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1086#1074#1072#1090#1100' '#1074#1086#1079#1088#1072#1089#1090#1091' '#1080 +
          ' '#1083#1100#1075#1086#1090#1077
        ItemHeight = 13
        MaxLength = 30
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnChange = ComboBox17Change
        OnExit = ComboBox17Change
      end
      object ComboBox18: TComboBox
        Left = 288
        Top = 256
        Width = 266
        Height = 21
        ItemHeight = 13
        MaxLength = 40
        TabOrder = 7
        OnChange = ComboBox18Change
        OnExit = ComboBox18Change
      end
      object ComboBox7: TComboBox
        Left = 384
        Top = 232
        Width = 194
        Height = 21
        Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1082#1083#1080#1077#1085#1090' '#1074' '#1089#1077#1084#1100#1077' '#1084#1086#1078#1077#1090' '#1073#1099#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1086#1076#1080#1085
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnChange = ComboBox7Change
        OnExit = ComboBox7Change
      end
      object MaskEdit1: TMaskEdit
        Left = 96
        Top = 232
        Width = 65
        Height = 21
        EditMask = '!90/90/0000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  .  .    '
        OnExit = MaskEdit1Exit
        OnKeyDown = MaskEdit1KeyDown
      end
      object Edit72: TEdit
        Left = 96
        Top = 256
        Width = 65
        Height = 21
        TabOrder = 2
        OnExit = Edit72Exit
        OnKeyDown = Edit72KeyDown
      end
      object RadioButton7: TRadioButton
        Left = 96
        Top = 280
        Width = 33
        Height = 17
        Caption = #1046
        Checked = True
        TabOrder = 3
        TabStop = True
      end
      object RadioButton8: TRadioButton
        Left = 128
        Top = 280
        Width = 33
        Height = 17
        Caption = #1052
        TabOrder = 4
      end
      object Button7: TButton
        Left = 554
        Top = 256
        Width = 25
        Height = 20
        Hint = #1057#1084#1077#1085#1080#1090#1100' '#1083#1100#1075#1086#1090#1091
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
        OnClick = Button7Click
      end
      object npssEdit: TEdit
        Left = 288
        Top = 278
        Width = 242
        Height = 21
        MaxLength = 11
        TabOrder = 17
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1058#1072#1088#1080#1092#1099
      ImageIndex = 2
      object Label43: TLabel
        Left = 12
        Top = 64
        Width = 91
        Height = 13
        Caption = #1056#1077#1075#1080#1086#1085'. '#1089#1090#1072#1085#1076#1072#1088#1090':'
      end
      object Bevel1: TBevel
        Left = 321
        Top = 4
        Width = 16
        Height = 50
        Shape = bsLeftLine
      end
      object ComboBox10: TComboBox
        Left = 115
        Top = 64
        Width = 334
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnChange = ComboBox10Change
      end
      object Edit9: TEdit
        Left = 458
        Top = 61
        Width = 71
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
        OnExit = Edit9Exit
      end
      object CheckBox2: TCheckBox
        Left = 12
        Top = 36
        Width = 57
        Height = 17
        TabStop = False
        Caption = #1041#1086#1081#1083#1077#1088
        TabOrder = 2
        OnClick = CheckBox2Click
      end
      object GroupBox1: TGroupBox
        Left = 115
        Top = 3
        Width = 185
        Height = 50
        Caption = #1058#1080#1087' '#1087#1083#1080#1090#1099
        TabOrder = 3
        object ComboBox21: TComboBox
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 175
          Height = 21
          Hint = 
            #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1077#1089#1083#1080' '#1074#1099#1073#1088#1072#1085#1072' '#1075#1072#1079#1086#1074#1072#1103' '#1087#1083#1080#1090#1072', '#1090#1086' '#1075#1072#1079' '#1076#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' '#1090#1086#1078#1077 +
            ' '#1074#1099#1073#1088#1072#1085
          Align = alTop
          ItemHeight = 13
          ItemIndex = 0
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = #1043#1072#1079#1086#1074#1072#1103
          OnChange = ComboBox21Change
          Items.Strings = (
            #1043#1072#1079#1086#1074#1072#1103
            #1069#1083#1077#1082#1090#1088#1080#1095#1077#1089#1082#1072#1103
            #1055#1088#1086#1095#1080#1077)
        end
      end
      object GroupBox3: TGroupBox
        Left = 344
        Top = 3
        Width = 185
        Height = 50
        Caption = #1058#1080#1087' '#1086#1090#1086#1087#1083#1077#1085#1080#1103
        TabOrder = 4
        object ComboBox22: TComboBox
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 175
          Height = 21
          Align = alTop
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = #1062#1077#1085#1090#1088#1072#1083#1100#1085#1086#1077
          OnChange = ComboBox22Change
          Items.Strings = (
            #1062#1077#1085#1090#1088#1072#1083#1100#1085#1086#1077
            #1058#1074#1077#1088#1076#1086#1077' '#1090#1086#1087#1083#1080#1074#1086
            #1043#1072#1079#1086#1074#1086#1077
            #1069#1083#1077#1082#1090#1080#1088#1080#1095#1077#1089#1082#1086#1077)
        end
      end
      object PageControl2: TPageControl
        Left = 12
        Top = 88
        Width = 541
        Height = 249
        ActivePage = TabSheet8
        MultiLine = True
        TabOrder = 5
        TabPosition = tpBottom
        object TabSheet7: TTabSheet
          Caption = #1054#1073#1099#1095#1085#1099#1077
          object Label24: TLabel
            Left = 3
            Top = 8
            Width = 101
            Height = 13
            Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1078#1080#1083#1100#1103':'
          end
          object Label25: TLabel
            Left = 3
            Top = 30
            Width = 90
            Height = 13
            Caption = #1054#1089#1074#1077#1097#1077#1085#1080#1077' '#1052#1054#1055':'
          end
          object Label26: TLabel
            Left = 3
            Top = 52
            Width = 79
            Height = 13
            Caption = #1061#1086#1083#1086#1076#1085#1072#1103' '#1074#1086#1076#1072':'
          end
          object Label27: TLabel
            Left = 3
            Top = 73
            Width = 71
            Height = 13
            Caption = #1043#1086#1088#1103#1095#1072#1103' '#1074#1086#1076#1072':'
          end
          object Label65: TLabel
            Left = 3
            Top = 96
            Width = 81
            Height = 13
            Caption = #1042#1086#1076#1086#1086#1090#1074#1077#1076#1077#1085#1080#1077':'
          end
          object Label29: TLabel
            Left = 3
            Top = 118
            Width = 58
            Height = 13
            Caption = #1054#1090#1086#1087#1083#1077#1085#1080#1077':'
          end
          object Label30: TLabel
            Left = 3
            Top = 141
            Width = 21
            Height = 13
            Caption = #1043#1072#1079':'
          end
          object Label60: TLabel
            Left = 3
            Top = 172
            Width = 36
            Height = 13
            Caption = #1044#1088#1086#1074#1072':'
          end
          object Label72: TLabel
            Left = 3
            Top = 193
            Width = 34
            Height = 13
            Caption = #1059#1075#1086#1083#1100':'
          end
          object comboBoxCont: TComboBox
            Left = 106
            Top = 8
            Width = 334
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            OnChange = comboBoxContChange
          end
          object Button10: TButton
            Left = 441
            Top = 7
            Width = 25
            Height = 20
            Caption = '...'
            TabOrder = 1
            OnClick = Button10Click
          end
          object Edit3: TEdit
            Left = 470
            Top = 8
            Width = 41
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 2
          end
          object comboBoxMOP: TComboBox
            Left = 106
            Top = 30
            Width = 334
            Height = 21
            ItemHeight = 13
            TabOrder = 3
            OnChange = comboBoxMOPChange
          end
          object Button11: TButton
            Left = 441
            Top = 29
            Width = 25
            Height = 20
            Caption = '...'
            TabOrder = 4
            OnClick = Button10Click
          end
          object Edit4: TEdit
            Left = 470
            Top = 30
            Width = 41
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 5
          end
          object comboBoxCold: TComboBox
            Left = 106
            Top = 52
            Width = 334
            Height = 21
            ItemHeight = 13
            TabOrder = 6
            OnChange = comboBoxColdChange
          end
          object Button12: TButton
            Left = 441
            Top = 51
            Width = 25
            Height = 20
            Caption = '...'
            TabOrder = 7
            OnClick = Button10Click
          end
          object Edit5: TEdit
            Left = 470
            Top = 52
            Width = 41
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 8
          end
          object comboBoxHot: TComboBox
            Left = 106
            Top = 74
            Width = 334
            Height = 21
            ItemHeight = 13
            TabOrder = 9
            OnChange = comboBoxHotChange
          end
          object Button13: TButton
            Left = 441
            Top = 73
            Width = 25
            Height = 20
            Caption = '...'
            TabOrder = 10
            OnClick = Button10Click
          end
          object Edit6: TEdit
            Left = 470
            Top = 74
            Width = 41
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 11
          end
          object comboBoxCanal: TComboBox
            Left = 106
            Top = 96
            Width = 334
            Height = 21
            ItemHeight = 13
            TabOrder = 12
            OnChange = comboBoxCanalChange
          end
          object Button14: TButton
            Left = 441
            Top = 95
            Width = 25
            Height = 20
            Caption = '...'
            TabOrder = 13
            OnClick = Button10Click
          end
          object Edit2: TEdit
            Left = 469
            Top = 96
            Width = 41
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 14
          end
          object comboBoxHeat: TComboBox
            Left = 106
            Top = 118
            Width = 334
            Height = 21
            Hint = 
              #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1077#1089#1083#1080' '#1086#1090#1086#1087#1083#1077#1085#1080#1077' '#1085#1077' '#1074#1099#1073#1088#1072#1085#1086', '#1079#1085#1072#1095#1080#1090' '#1077#1089#1090#1100' '#1090#1074#1077#1088#1076#1086#1077' '#1090#1086#1087#1083 +
              #1080#1074#1086', '#1080' '#1085#1072#1086#1073#1086#1088#1086#1090
            ItemHeight = 13
            ParentShowHint = False
            ShowHint = True
            TabOrder = 15
            OnChange = comboBoxHeatChange
          end
          object Button15: TButton
            Left = 441
            Top = 118
            Width = 25
            Height = 20
            Caption = '...'
            TabOrder = 16
            OnClick = Button10Click
          end
          object Edit7: TEdit
            Left = 469
            Top = 118
            Width = 41
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 17
          end
          object comboBoxGas: TComboBox
            Left = 106
            Top = 140
            Width = 334
            Height = 21
            Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1077#1089#1083#1080' '#1075#1072#1079#1072' '#1085#1077#1090', '#1090#1086' '#1087#1083#1080#1090#1072' '#1085#1077' '#1076#1086#1083#1078#1085#1072' '#1073#1099#1090#1100' '#1075#1072#1079#1086#1074#1086#1081
            ItemHeight = 13
            ParentShowHint = False
            ShowHint = True
            TabOrder = 18
            OnChange = comboBoxGasChange
          end
          object Button16: TButton
            Left = 441
            Top = 141
            Width = 25
            Height = 20
            Caption = '...'
            TabOrder = 19
            OnClick = Button10Click
          end
          object Edit8: TEdit
            Left = 469
            Top = 141
            Width = 41
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 20
          end
          object comboBoxWood: TComboBox
            Left = 106
            Top = 171
            Width = 334
            Height = 21
            ItemHeight = 13
            TabOrder = 21
            OnChange = comboBoxWoodChange
          end
          object Button17: TButton
            Left = 441
            Top = 171
            Width = 25
            Height = 20
            Caption = '...'
            TabOrder = 22
            OnClick = Button10Click
          end
          object Edit10: TEdit
            Left = 469
            Top = 171
            Width = 41
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 23
          end
          object comboBoxCoal: TComboBox
            Left = 106
            Top = 193
            Width = 334
            Height = 21
            ItemHeight = 13
            TabOrder = 24
            OnChange = comboBoxCoalChange
          end
          object Button18: TButton
            Left = 441
            Top = 193
            Width = 25
            Height = 20
            Caption = '...'
            TabOrder = 25
            OnClick = Button10Click
          end
          object Edit11: TEdit
            Left = 469
            Top = 193
            Width = 41
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 26
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'C'#1095#1077#1090#1095#1080#1082#1080
          ImageIndex = 1
          object Bevel6: TBevel
            Left = 110
            Top = 138
            Width = 351
            Height = 7
            Shape = bsTopLine
          end
          object Label87: TLabel
            Left = 7
            Top = 133
            Width = 86
            Height = 13
            Caption = #1069#1083#1077#1082#1090#1088#1086#1101#1085#1077#1088#1075#1080#1103':'
          end
          object Label88: TLabel
            Left = 7
            Top = 20
            Width = 79
            Height = 13
            Caption = #1061#1086#1083#1086#1076#1085#1072#1103' '#1074#1086#1076#1072':'
          end
          object Label89: TLabel
            Left = 7
            Top = 41
            Width = 71
            Height = 13
            Caption = #1043#1086#1088#1103#1095#1072#1103' '#1074#1086#1076#1072':'
          end
          object Label90: TLabel
            Left = 7
            Top = 64
            Width = 81
            Height = 13
            Caption = #1042#1086#1076#1086#1086#1090#1074#1077#1076#1077#1085#1080#1077':'
          end
          object Label91: TLabel
            Left = 7
            Top = 86
            Width = 58
            Height = 13
            Caption = #1054#1090#1086#1087#1083#1077#1085#1080#1077':'
          end
          object Label92: TLabel
            Left = 7
            Top = 109
            Width = 21
            Height = 13
            Caption = #1043#1072#1079':'
          end
          object comboBoxColdCounter: TComboBox
            Left = 110
            Top = 20
            Width = 283
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            OnChange = comboBoxColdCounterChange
          end
          object btnColdCounter: TButton
            Left = 394
            Top = 19
            Width = 25
            Height = 20
            Caption = '...'
            TabOrder = 1
            OnClick = btnColdCounterClick
          end
          object Edit124: TEdit
            Left = 423
            Top = 18
            Width = 41
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 2
          end
          object Edit125: TEdit
            Left = 423
            Top = 40
            Width = 41
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 3
          end
          object btnHotCounter: TButton
            Left = 394
            Top = 41
            Width = 25
            Height = 20
            Caption = '...'
            TabOrder = 4
            OnClick = btnColdCounterClick
          end
          object comboBoxHotCounter: TComboBox
            Left = 110
            Top = 42
            Width = 283
            Height = 21
            ItemHeight = 13
            TabOrder = 5
            OnChange = comboBoxHotCounterChange
          end
          object comboBoxCanalCounter: TComboBox
            Left = 110
            Top = 64
            Width = 283
            Height = 21
            ItemHeight = 13
            TabOrder = 6
            OnChange = comboBoxCanalCounterChange
          end
          object btnCanalCounter: TButton
            Left = 394
            Top = 63
            Width = 25
            Height = 20
            Caption = '...'
            TabOrder = 7
            OnClick = btnColdCounterClick
          end
          object Edit126: TEdit
            Left = 422
            Top = 62
            Width = 41
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 8
          end
          object Edit127: TEdit
            Left = 422
            Top = 84
            Width = 41
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 9
          end
          object btnHeatCounter: TButton
            Left = 394
            Top = 86
            Width = 25
            Height = 20
            Caption = '...'
            TabOrder = 10
            OnClick = btnColdCounterClick
          end
          object comboBoxHeatCounter: TComboBox
            Left = 110
            Top = 86
            Width = 283
            Height = 21
            Hint = 
              #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1077#1089#1083#1080' '#1086#1090#1086#1087#1083#1077#1085#1080#1077' '#1085#1077' '#1074#1099#1073#1088#1072#1085#1086', '#1079#1085#1072#1095#1080#1090' '#1077#1089#1090#1100' '#1090#1074#1077#1088#1076#1086#1077' '#1090#1086#1087#1083 +
              #1080#1074#1086', '#1080' '#1085#1072#1086#1073#1086#1088#1086#1090
            ItemHeight = 13
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
            OnChange = comboBoxHeatCounterChange
          end
          object comboBoxGasCounter: TComboBox
            Left = 110
            Top = 108
            Width = 283
            Height = 21
            Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1077#1089#1083#1080' '#1075#1072#1079#1072' '#1085#1077#1090', '#1090#1086' '#1087#1083#1080#1090#1072' '#1085#1077' '#1076#1086#1083#1078#1085#1072' '#1073#1099#1090#1100' '#1075#1072#1079#1086#1074#1086#1081
            ItemHeight = 13
            ParentShowHint = False
            ShowHint = True
            TabOrder = 12
            OnChange = comboBoxGasCounterChange
          end
          object btnGasCounter: TButton
            Left = 394
            Top = 107
            Width = 25
            Height = 20
            Caption = '...'
            TabOrder = 13
            OnClick = btnColdCounterClick
          end
          object Edit128: TEdit
            Left = 422
            Top = 107
            Width = 41
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 14
          end
          object CheckBox4: TCheckBox
            Left = 467
            Top = 20
            Width = 15
            Height = 17
            TabOrder = 15
            OnClick = CheckBox4Click
          end
          object Edit118: TEdit
            Left = 485
            Top = 18
            Width = 40
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 16
            OnExit = Edit118Exit
          end
          object CheckBox5: TCheckBox
            Left = 467
            Top = 44
            Width = 15
            Height = 17
            TabOrder = 17
            OnClick = CheckBox4Click
          end
          object Edit119: TEdit
            Left = 485
            Top = 42
            Width = 40
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 18
            OnExit = Edit118Exit
          end
          object CheckBox6: TCheckBox
            Left = 467
            Top = 64
            Width = 15
            Height = 17
            TabOrder = 19
            OnClick = CheckBox4Click
          end
          object Edit120: TEdit
            Left = 485
            Top = 64
            Width = 40
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 20
            OnExit = Edit118Exit
          end
          object CheckBox7: TCheckBox
            Left = 467
            Top = 87
            Width = 15
            Height = 17
            TabOrder = 21
            OnClick = CheckBox4Click
          end
          object Edit121: TEdit
            Left = 485
            Top = 86
            Width = 40
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 22
            OnExit = Edit118Exit
          end
          object CheckBox8: TCheckBox
            Left = 467
            Top = 109
            Width = 15
            Height = 17
            TabOrder = 23
            OnClick = CheckBox4Click
          end
          object Edit122: TEdit
            Left = 485
            Top = 108
            Width = 40
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 24
            OnExit = Edit118Exit
          end
          object CheckBox9: TCheckBox
            Left = 467
            Top = 132
            Width = 15
            Height = 17
            TabOrder = 25
            OnClick = CheckBox4Click
          end
          object Edit123: TEdit
            Left = 485
            Top = 130
            Width = 40
            Height = 21
            Color = clBtnFace
            TabOrder = 26
            OnExit = Edit118Exit
          end
        end
      end
      object CheckBox10: TCheckBox
        Left = 535
        Top = 65
        Width = 42
        Height = 17
        Caption = #1048#1085#1076'.'
        TabOrder = 6
        OnClick = CheckBox10Click
      end
      object elevatorCheckBox: TCheckBox
        Left = 12
        Top = 13
        Width = 57
        Height = 17
        Caption = #1051#1080#1092#1090
        Enabled = False
        TabOrder = 7
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1057#1095#1077#1090#1072
      ImageIndex = 3
      OnExit = TabSheet4Exit
      object GroupBox7: TGroupBox
        Left = 17
        Top = 9
        Width = 305
        Height = 273
        Caption = #1051#1080#1094#1077#1074#1099#1077' '#1089#1095#1077#1090#1072':'
        TabOrder = 0
        object Label36: TLabel
          Left = 12
          Top = 23
          Width = 101
          Height = 13
          Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1078#1080#1083#1100#1103':'
        end
        object Label37: TLabel
          Left = 12
          Top = 47
          Width = 90
          Height = 13
          Caption = #1054#1089#1074#1077#1097#1077#1085#1080#1077' '#1052#1054#1055':'
        end
        object Label38: TLabel
          Left = 12
          Top = 71
          Width = 79
          Height = 13
          Caption = #1061#1086#1083#1086#1076#1085#1072#1103' '#1074#1086#1076#1072':'
        end
        object Label39: TLabel
          Left = 12
          Top = 95
          Width = 71
          Height = 13
          Caption = #1043#1086#1088#1103#1095#1072#1103' '#1074#1086#1076#1072':'
        end
        object Label40: TLabel
          Left = 12
          Top = 143
          Width = 58
          Height = 13
          Caption = #1054#1090#1086#1087#1083#1077#1085#1080#1077':'
        end
        object Label41: TLabel
          Left = 12
          Top = 167
          Width = 21
          Height = 13
          Caption = #1043#1072#1079':'
        end
        object Label42: TLabel
          Left = 12
          Top = 191
          Width = 86
          Height = 13
          Caption = #1069#1083#1077#1082#1090#1088#1086#1101#1085#1077#1088#1075#1080#1103':'
        end
        object Label44: TLabel
          Left = 12
          Top = 239
          Width = 34
          Height = 13
          Caption = #1059#1075#1086#1083#1100':'
        end
        object Label45: TLabel
          Left = 12
          Top = 215
          Width = 36
          Height = 13
          Caption = #1044#1088#1086#1074#1072':'
        end
        object Label66: TLabel
          Left = 12
          Top = 119
          Width = 81
          Height = 13
          Caption = #1042#1086#1076#1086#1086#1090#1074#1077#1076#1077#1085#1080#1077':'
        end
        object Edit74: TEdit
          Left = 132
          Top = 23
          Width = 145
          Height = 21
          Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 11 '#1089#1080#1084#1074#1086#1083#1086#1074
          MaxLength = 11
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnChange = Edit74Change
          OnExit = Edit74Change
        end
        object Edit75: TEdit
          Left = 132
          Top = 47
          Width = 145
          Height = 21
          Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 11 '#1089#1080#1084#1074#1086#1083#1086#1074
          MaxLength = 11
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnChange = Edit74Change
          OnExit = Edit74Change
        end
        object Edit76: TEdit
          Left = 132
          Top = 71
          Width = 145
          Height = 21
          Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 11 '#1089#1080#1084#1074#1086#1083#1086#1074
          MaxLength = 11
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnChange = Edit74Change
          OnExit = Edit74Change
        end
        object Edit77: TEdit
          Left = 132
          Top = 95
          Width = 145
          Height = 21
          Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 11 '#1089#1080#1084#1074#1086#1083#1086#1074
          MaxLength = 11
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnChange = Edit74Change
          OnExit = Edit74Change
        end
        object Edit78: TEdit
          Left = 132
          Top = 143
          Width = 145
          Height = 21
          Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 11 '#1089#1080#1084#1074#1086#1083#1086#1074
          MaxLength = 11
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnChange = Edit74Change
          OnExit = Edit74Change
        end
        object Edit79: TEdit
          Left = 132
          Top = 167
          Width = 145
          Height = 21
          Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 20 '#1089#1080#1084#1074#1086#1083#1086#1074
          MaxLength = 20
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnChange = Edit74Change
          OnExit = Edit74Change
        end
        object Edit80: TEdit
          Left = 132
          Top = 191
          Width = 145
          Height = 21
          Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 11 '#1089#1080#1084#1074#1086#1083#1086#1074
          MaxLength = 11
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnChange = Edit74Change
          OnExit = Edit74Change
        end
        object Edit81: TEdit
          Left = 132
          Top = 215
          Width = 145
          Height = 21
          Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103':  '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 11 '#1089#1080#1084#1074#1086#1083#1086#1074
          MaxLength = 11
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          OnChange = Edit74Change
          OnExit = Edit74Change
        end
        object Edit82: TEdit
          Left = 132
          Top = 239
          Width = 145
          Height = 21
          Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 11 '#1089#1080#1084#1074#1086#1083#1086#1074
          MaxLength = 11
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          OnChange = Edit74Change
          OnExit = Edit74Change
        end
        object Button9: TButton
          Left = 283
          Top = 8
          Width = 17
          Height = 17
          Caption = #1084
          TabOrder = 10
          OnClick = Button9Click
        end
        object Edit58: TEdit
          Left = 132
          Top = 119
          Width = 145
          Height = 21
          Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1076#1083#1080#1085#1072' '#1089#1090#1088#1086#1082#1080' '#1085#1077' '#1073#1086#1083#1077#1077' 11 '#1089#1080#1084#1074#1086#1083#1086#1074
          MaxLength = 11
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnChange = Edit74Change
          OnExit = Edit74Change
        end
      end
      object GroupBox8: TGroupBox
        Left = 327
        Top = 9
        Width = 241
        Height = 109
        Caption = #1055#1077#1088#1089#1086#1085#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1089#1095#1077#1090
        TabOrder = 1
        object Label35: TLabel
          Left = 16
          Top = 64
          Width = 25
          Height = 13
          Caption = #1055#1057#1057':'
        end
        object Label34: TLabel
          Left = 16
          Top = 32
          Width = 28
          Height = 13
          Caption = #1041#1072#1085#1082':'
        end
        object Edit83: TEdit
          Left = 48
          Top = 64
          Width = 177
          Height = 21
          Hint = 
            #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103': '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103', '#1077#1089#1083#1080' '#1073#1072#1085#1082' '#1085#1077' '#1074#1099#1073#1088#1072#1085', '#1090#1086' '#1076 +
            #1086#1083#1078#1085#1086' '#1073#1099#1090#1100' '#1087#1091#1089#1090#1099#1084','#1077#1089#1083#1080' '#1057#1041' '#1076#1083#1080#1085#1072' '#1085#1077' '#1073#1086#1083#1077#1077' 20 '#1089#1080#1084#1074#1086#1083#1086#1074', '#1077#1089#1083#1080' '#1054#1055#1057#1041' ' +
            #1085#1077' '#1073#1086#1083#1077#1077' 12, '#1077#1089#1083#1080' '#1055#1086#1095#1090#1072' '#1085#1077' '#1073#1086#1083#1077#1077' 6'
          MaxLength = 20
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnChange = Edit83Change
          OnExit = Edit83Change
        end
        object ComboBox19: TComboBox
          Left = 48
          Top = 32
          Width = 177
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = ComboBox19Change
          OnExit = ComboBox19Change
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #1057#1091#1073#1089#1080#1076#1080#1103
      ImageIndex = 4
      object Label46: TLabel
        Left = 16
        Top = 48
        Width = 101
        Height = 13
        Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1078#1080#1083#1100#1103':'
      end
      object Label47: TLabel
        Left = 16
        Top = 72
        Width = 90
        Height = 13
        Caption = #1054#1089#1074#1077#1097#1077#1085#1080#1077' '#1052#1054#1055':'
      end
      object Label48: TLabel
        Left = 16
        Top = 96
        Width = 79
        Height = 13
        Caption = #1061#1086#1083#1086#1076#1085#1072#1103' '#1074#1086#1076#1072':'
      end
      object Label49: TLabel
        Left = 16
        Top = 120
        Width = 71
        Height = 13
        Caption = #1043#1086#1088#1103#1095#1072#1103' '#1074#1086#1076#1072':'
      end
      object Label50: TLabel
        Left = 16
        Top = 168
        Width = 58
        Height = 13
        Caption = #1054#1090#1086#1087#1083#1077#1085#1080#1077':'
      end
      object Label51: TLabel
        Left = 16
        Top = 192
        Width = 21
        Height = 13
        Caption = #1043#1072#1079':'
      end
      object Label52: TLabel
        Left = 16
        Top = 216
        Width = 86
        Height = 13
        Caption = #1069#1083#1077#1082#1090#1088#1086#1101#1085#1077#1088#1075#1080#1103':'
      end
      object Label53: TLabel
        Left = 16
        Top = 264
        Width = 34
        Height = 13
        Caption = #1059#1075#1086#1083#1100':'
      end
      object Label54: TLabel
        Left = 16
        Top = 240
        Width = 36
        Height = 13
        Caption = #1044#1088#1086#1074#1072':'
      end
      object Label63: TLabel
        Left = 16
        Top = 288
        Width = 33
        Height = 13
        Caption = #1048#1090#1086#1075#1086':'
      end
      object Label67: TLabel
        Left = 16
        Top = 144
        Width = 81
        Height = 13
        Caption = #1042#1086#1076#1086#1086#1090#1074#1077#1076#1077#1085#1080#1077':'
      end
      object Label69: TLabel
        Left = 16
        Top = 312
        Width = 91
        Height = 13
        Caption = #1041#1077#1079' '#1091#1095#1077#1090#1072' '#1083#1100#1075#1086#1090#1099':'
      end
      object GroupBox9: TGroupBox
        Left = 129
        Top = 9
        Width = 209
        Height = 333
        Caption = #1044#1072#1085#1085#1099#1077' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1089#1088#1086#1082#1072':'
        TabOrder = 0
        object Label55: TLabel
          Left = 11
          Top = 24
          Width = 34
          Height = 13
          Caption = #1053#1072#1095#1089#1083':'
        end
        object Label56: TLabel
          Left = 57
          Top = 24
          Width = 41
          Height = 13
          Caption = #1055'.'#1091#1095#1077#1090#1072':'
        end
        object Label57: TLabel
          Left = 165
          Top = 24
          Width = 27
          Height = 13
          Caption = #1057#1091#1073#1089':'
        end
        object Label93: TLabel
          Left = 106
          Top = 24
          Width = 53
          Height = 13
          Caption = #1057#1091#1073#1089'.'#1089#1090#1085#1076':'
        end
        object Edit12: TEdit
          Left = 8
          Top = 40
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit13: TEdit
          Left = 57
          Top = 40
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit14: TEdit
          Left = 156
          Top = 40
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 20
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit15: TEdit
          Left = 8
          Top = 64
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit16: TEdit
          Left = 57
          Top = 64
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit17: TEdit
          Left = 156
          Top = 64
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 21
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit18: TEdit
          Left = 8
          Top = 88
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit20: TEdit
          Left = 156
          Top = 88
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 22
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit24: TEdit
          Left = 8
          Top = 160
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit25: TEdit
          Left = 57
          Top = 160
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit26: TEdit
          Left = 156
          Top = 160
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 25
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit27: TEdit
          Left = 8
          Top = 184
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit28: TEdit
          Left = 57
          Top = 184
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit29: TEdit
          Left = 156
          Top = 184
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 26
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit19: TEdit
          Left = 57
          Top = 88
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit30: TEdit
          Left = 8
          Top = 208
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit31: TEdit
          Left = 57
          Top = 208
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 17
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit32: TEdit
          Left = 156
          Top = 208
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 27
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit33: TEdit
          Left = 8
          Top = 232
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit34: TEdit
          Left = 57
          Top = 232
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 18
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit35: TEdit
          Left = 156
          Top = 232
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 28
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit36: TEdit
          Left = 8
          Top = 256
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit37: TEdit
          Left = 57
          Top = 256
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 19
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit38: TEdit
          Left = 156
          Top = 256
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 29
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit89: TEdit
          Left = 8
          Top = 280
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 30
          Text = '0'
        end
        object Edit90: TEdit
          Left = 57
          Top = 280
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 31
          Text = '0'
        end
        object Edit91: TEdit
          Left = 156
          Top = 280
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 32
          Text = '0'
        end
        object Edit59: TEdit
          Left = 8
          Top = 136
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit62: TEdit
          Left = 57
          Top = 136
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit67: TEdit
          Left = 156
          Top = 136
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 24
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit21: TEdit
          Left = 8
          Top = 112
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit22: TEdit
          Left = 57
          Top = 112
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit23: TEdit
          Left = 156
          Top = 112
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 23
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit65: TEdit
          Left = 8
          Top = 304
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 33
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit129: TEdit
          Left = 106
          Top = 40
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 34
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit130: TEdit
          Left = 106
          Top = 64
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 35
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit131: TEdit
          Left = 106
          Top = 88
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 36
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit132: TEdit
          Left = 106
          Top = 112
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 37
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit133: TEdit
          Left = 106
          Top = 136
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 38
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit134: TEdit
          Left = 106
          Top = 160
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 39
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit135: TEdit
          Left = 106
          Top = 184
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 40
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit136: TEdit
          Left = 106
          Top = 208
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 41
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit137: TEdit
          Left = 106
          Top = 232
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 42
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit138: TEdit
          Left = 106
          Top = 256
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 43
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit139: TEdit
          Left = 106
          Top = 280
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 44
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
      end
      object GroupBox10: TGroupBox
        Left = 368
        Top = 8
        Width = 209
        Height = 333
        Caption = #1058#1077#1082#1091#1097#1080#1077' '#1076#1072#1085#1085#1099#1077':'
        TabOrder = 1
        object Label58: TLabel
          Left = 11
          Top = 24
          Width = 34
          Height = 13
          Caption = #1053#1072#1095#1089#1083':'
        end
        object Label59: TLabel
          Left = 57
          Top = 24
          Width = 41
          Height = 13
          Caption = #1055'.'#1091#1095#1077#1090#1072':'
        end
        object Label68: TLabel
          Left = 165
          Top = 24
          Width = 27
          Height = 13
          Caption = #1057#1091#1073#1089':'
        end
        object Label94: TLabel
          Left = 106
          Top = 24
          Width = 53
          Height = 13
          Caption = #1057#1091#1073#1089'.'#1089#1090#1085#1076':'
        end
        object Edit39: TEdit
          Left = 57
          Top = 40
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit40: TEdit
          Left = 156
          Top = 40
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 20
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit41: TEdit
          Left = 57
          Top = 64
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit42: TEdit
          Left = 156
          Top = 64
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 21
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit43: TEdit
          Left = 57
          Top = 88
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit44: TEdit
          Left = 156
          Top = 88
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 22
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit45: TEdit
          Left = 57
          Top = 112
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit46: TEdit
          Left = 156
          Top = 112
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 23
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit47: TEdit
          Left = 57
          Top = 160
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit48: TEdit
          Left = 156
          Top = 160
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 25
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit49: TEdit
          Left = 57
          Top = 184
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit50: TEdit
          Left = 156
          Top = 184
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 26
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit51: TEdit
          Left = 57
          Top = 208
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 17
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit52: TEdit
          Left = 156
          Top = 208
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 27
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit53: TEdit
          Left = 57
          Top = 232
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 18
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit54: TEdit
          Left = 156
          Top = 232
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 28
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit55: TEdit
          Left = 57
          Top = 256
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 19
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit56: TEdit
          Left = 156
          Top = 256
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 29
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit92: TEdit
          Left = 57
          Top = 280
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 31
          Text = '0'
        end
        object Edit93: TEdit
          Left = 156
          Top = 280
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 32
          Text = '0'
        end
        object Edit70: TEdit
          Left = 57
          Top = 136
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit71: TEdit
          Left = 156
          Top = 136
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 24
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit96: TEdit
          Left = 8
          Top = 40
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit97: TEdit
          Left = 8
          Top = 64
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit98: TEdit
          Left = 8
          Top = 88
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit99: TEdit
          Left = 8
          Top = 112
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit100: TEdit
          Left = 8
          Top = 136
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit101: TEdit
          Left = 8
          Top = 160
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit102: TEdit
          Left = 8
          Top = 184
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit103: TEdit
          Left = 8
          Top = 208
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit104: TEdit
          Left = 8
          Top = 232
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit105: TEdit
          Left = 8
          Top = 256
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit106: TEdit
          Left = 8
          Top = 280
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 30
          Text = '0'
        end
        object Edit84: TEdit
          Left = 8
          Top = 304
          Width = 50
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 33
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit140: TEdit
          Left = 106
          Top = 40
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 34
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit141: TEdit
          Left = 106
          Top = 64
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 35
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit142: TEdit
          Left = 106
          Top = 88
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 36
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit143: TEdit
          Left = 106
          Top = 112
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 37
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit144: TEdit
          Left = 106
          Top = 136
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 38
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit145: TEdit
          Left = 106
          Top = 160
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 39
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit146: TEdit
          Left = 106
          Top = 184
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 40
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit147: TEdit
          Left = 106
          Top = 208
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 41
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit148: TEdit
          Left = 106
          Top = 232
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 42
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit149: TEdit
          Left = 106
          Top = 256
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 43
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
        object Edit150: TEdit
          Left = 106
          Top = 280
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 44
          Text = '0'
          OnExit = Edit66Exit
          OnKeyDown = Edit66KeyDown
        end
      end
      object Button8: TButton
        Left = 344
        Top = 15
        Width = 17
        Height = 105
        Hint = #1056#1072#1089#1095#1077#1090' '#1090#1077#1082#1091#1097#1080#1093' '#1076#1072#1085#1085#1099#1093
        BiDiMode = bdLeftToRight
        Caption = #1056#1072#1089#1095#1077#1090
        ParentBiDiMode = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        WordWrap = True
        OnClick = Button8Click
      end
      object CheckBox1: TCheckBox
        Left = 17
        Top = 15
        Width = 105
        Height = 17
        TabStop = False
        Caption = #1080#1085#1076#1080#1074#1080#1076'. '#1088#1072#1089#1095#1077#1090
        TabOrder = 3
        OnClick = CheckBox1Click
      end
    end
    object TabSheet6: TTabSheet
      Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1077' '#1088#1072#1089#1093#1086#1076#1099
      ImageIndex = 5
      object FactSaleControl: TTabControl
        Left = 0
        Top = 0
        Width = 590
        Height = 404
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 0
        Tabs.Strings = (
          #1044#1086#1073#1072#1074#1080#1090#1100
          #1048#1079#1084#1077#1085#1080#1090#1100)
        TabIndex = 0
        OnChange = FactSaleControlChange
        object Label78: TLabel
          Left = 152
          Top = 5
          Width = 260
          Height = 13
          Caption = '<- '#1042#1099#1073#1080#1088#1080#1090#1077' '#1088#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099' '#1089' '#1092'. '#1088#1072#1089#1093#1086#1076#1072#1084#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label97: TLabel
          Left = 479
          Top = 205
          Width = 51
          Height = 13
          Caption = #1055#1086#1075#1072#1096#1077#1085#1086
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Panel1: TPanel
          Left = 4
          Top = 27
          Width = 582
          Height = 54
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object GroupBox4: TGroupBox
            Left = 0
            Top = 0
            Width = 161
            Height = 54
            Align = alLeft
            Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1087#1077#1088#1080#1086#1076#1099':'
            TabOrder = 0
            object ComboBox23: TComboBox
              Left = 3
              Top = 24
              Width = 145
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              OnChange = ComboBox23Change
              OnKeyPress = ComboBox23KeyPress
            end
          end
          object Button20: TButton
            Left = 167
            Top = 6
            Width = 96
            Height = 21
            TabOrder = 1
            OnClick = Button20Click
          end
          object Button21: TButton
            Left = 167
            Top = 33
            Width = 96
            Height = 21
            Caption = #1059#1076#1072#1083#1080#1090#1100
            TabOrder = 2
            Visible = False
            OnClick = Button21Click
          end
        end
        object GroupBox5: TGroupBox
          Left = 4
          Top = 81
          Width = 265
          Height = 319
          Align = alLeft
          Caption = #1044#1072#1085#1085#1099#1077' '#1079#1072' '#1087#1077#1088#1080#1086#1076':'
          TabOrder = 1
          object FactGrid: TStringGrid
            Left = 2
            Top = 15
            Width = 261
            Height = 267
            Align = alClient
            BorderStyle = bsNone
            ColCount = 4
            DefaultRowHeight = 20
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
            TabOrder = 0
            OnDrawCell = FactGridDrawCell
            OnMouseLeave = FactGridMouseLeave
            OnSelectCell = FactGridSelectCell
            OnSetEditText = FactGridSetEditText
          end
          object Panel2: TPanel
            Left = 2
            Top = 282
            Width = 261
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Label77: TLabel
              Left = 0
              Top = 0
              Width = 261
              Height = 35
              Align = alClient
              Alignment = taCenter
              WordWrap = True
              ExplicitWidth = 5
              ExplicitHeight = 18
            end
          end
        end
        object GroupBox11: TGroupBox
          Left = 280
          Top = 81
          Width = 193
          Height = 154
          Caption = #1054#1073#1097#1080#1077' '#1089#1091#1084#1084#1099':'
          TabOrder = 2
          object Label79: TLabel
            Left = 8
            Top = 23
            Width = 87
            Height = 13
            Caption = #1057#1091#1084#1084#1072' '#1089#1091#1073#1089#1080#1076#1080#1080':'
          end
          object Label80: TLabel
            Left = 8
            Top = 58
            Width = 101
            Height = 13
            Caption = #1057#1091#1084#1084#1072' '#1092'. '#1088#1072#1089#1093#1086#1076#1086#1074':'
          end
          object Label82: TLabel
            Left = 8
            Top = 85
            Width = 98
            Height = 13
            Caption = #1057#1088#1077#1076#1085#1080#1081' '#1092'. '#1088#1072#1089#1093#1086#1076':'
          end
          object Label81: TLabel
            Left = 8
            Top = 120
            Width = 104
            Height = 13
            Caption = #1057#1091#1084#1084#1072' '#1087#1088#1077#1074#1099#1096#1077#1085#1080#1103':'
          end
          object Edit111: TEdit
            Left = 120
            Top = 23
            Width = 59
            Height = 21
            ReadOnly = True
            TabOrder = 0
            Text = '0'
          end
          object Edit112: TEdit
            Left = 120
            Top = 58
            Width = 59
            Height = 21
            ReadOnly = True
            TabOrder = 1
            Text = '0'
          end
          object Edit114: TEdit
            Left = 120
            Top = 85
            Width = 59
            Height = 21
            ReadOnly = True
            TabOrder = 2
            Text = '0'
          end
          object Edit113: TEdit
            Left = 120
            Top = 120
            Width = 59
            Height = 21
            ReadOnly = True
            TabOrder = 3
            Text = '0'
          end
        end
        object FactMinusDebtBtn: TButton
          Left = 285
          Top = 241
          Width = 150
          Height = 25
          Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1087#1077#1088#1077#1087#1083#1072#1090#1091
          TabOrder = 3
          OnClick = FactMinusDebtBtnClick
        end
      end
    end
    object TabSheet9: TTabSheet
      Caption = #1042#1099#1095#1077#1090#1099
      ImageIndex = 6
      object DebtControl: TTabControl
        Left = 0
        Top = 0
        Width = 590
        Height = 404
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 0
        Tabs.Strings = (
          #1055#1077#1088#1077#1087#1083#1072#1090#1099
          #1059#1076#1077#1088#1078#1072#1085#1080#1103)
        TabIndex = 0
        OnChange = DebtControlChange
        object Label96: TLabel
          Left = 295
          Top = 216
          Width = 3
          Height = 13
        end
        object GroupBox13: TGroupBox
          Left = 0
          Top = 24
          Width = 161
          Height = 54
          Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1087#1077#1088#1080#1086#1076#1099':'
          TabOrder = 0
          object ComboBox1: TComboBox
            Left = 7
            Top = 24
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            OnChange = ComboBox1Change
            OnKeyPress = ComboBox23KeyPress
          end
        end
        object GroupBox14: TGroupBox
          Left = 167
          Top = 24
          Width = 197
          Height = 54
          Caption = #1042#1080#1076' '#1087#1077#1088#1077#1087#1083#1072#1090#1099
          TabOrder = 1
          object comboBoxDebt: TComboBox
            Left = 7
            Top = 24
            Width = 180
            Height = 21
            ItemHeight = 13
            TabOrder = 0
          end
        end
        object GroupBox15: TGroupBox
          Left = 370
          Top = 24
          Width = 98
          Height = 54
          Caption = #1057#1091#1084#1084#1072' '#1076#1086#1083#1075#1072':'
          TabOrder = 2
          object Edit151: TEdit
            Left = 7
            Top = 24
            Width = 80
            Height = 21
            TabOrder = 0
            Text = '0'
            OnExit = Edit72Exit
            OnKeyDown = Edit72KeyDown
          end
        end
        object DebtAddBtn: TButton
          Left = 491
          Top = 24
          Width = 75
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 3
          OnClick = DebtAddBtnClick
        end
        object GroupBox16: TGroupBox
          Left = 0
          Top = 84
          Width = 468
          Height = 314
          Caption = #1055#1077#1088#1080#1086#1076#1099' '#1089' '#1087#1077#1088#1077#1087#1083#1072#1090#1072#1084#1080':'
          TabOrder = 4
          object DebtGrid: TStringGrid
            Left = 2
            Top = 15
            Width = 464
            Height = 234
            Align = alTop
            BorderStyle = bsNone
            ColCount = 4
            DefaultRowHeight = 20
            FixedCols = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
            TabOrder = 0
            OnDrawCell = DebtGridDrawCell
          end
          object Panel3: TPanel
            Left = 2
            Top = 249
            Width = 464
            Height = 63
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DebtPanel: TPanel
              Left = 0
              Top = 0
              Width = 464
              Height = 63
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object DebtFormPay: TButton
                Left = 304
                Top = 30
                Width = 150
                Height = 25
                Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1091#1076#1077#1088#1078#1072#1085#1080#1077
                TabOrder = 0
                OnClick = DebtFormPayClick
              end
              object Edit152: TEdit
                Left = 119
                Top = 24
                Width = 66
                Height = 21
                TabOrder = 1
                Text = '0'
                Visible = False
              end
              object RadioGroup2: TRadioGroup
                Left = 0
                Top = 0
                Width = 113
                Height = 63
                Align = alLeft
                Caption = #1059#1076#1077#1088#1078#1072#1085#1080#1077':'
                Ctl3D = True
                Items.Strings = (
                  #1055#1086#1083#1085#1086#1089#1090#1100#1102
                  #1060#1080#1082#1089'. '#1089#1091#1084#1084#1072
                  #1042' % '#1086#1090#1085#1086#1096#1077#1085#1080#1080)
                ParentCtl3D = False
                TabOrder = 2
                OnClick = RadioGroup2Click
              end
            end
          end
        end
        object DebtDelBtn: TButton
          Left = 491
          Top = 130
          Width = 75
          Height = 25
          Caption = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 5
          OnClick = DebtDelBtnClick
        end
        object DebtPayEditBtn: TButton
          Left = 491
          Top = 99
          Width = 75
          Height = 25
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 6
          Visible = False
          OnClick = DebtPayEditBtnClick
        end
        object DebtPayPauseBtn: TButton
          Left = 491
          Top = 160
          Width = 75
          Height = 25
          Caption = #1055#1072#1091#1079#1072
          TabOrder = 7
          Visible = False
          OnClick = DebtPayPauseBtnClick
        end
      end
    end
  end
  object FlowPanel1: TFlowPanel
    Left = 0
    Top = 0
    Width = 604
    Height = 31
    Align = alTop
    AutoWrap = False
    BevelOuter = bvNone
    Color = clActiveBorder
    FlowStyle = fsRightLeftBottomTop
    ParentBackground = False
    TabOrder = 1
    object Button2: TButton
      AlignWithMargins = True
      Left = 494
      Top = 3
      Width = 107
      Height = 25
      Enabled = False
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 381
      Top = 3
      Width = 107
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
