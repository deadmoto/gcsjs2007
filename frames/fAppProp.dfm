object fAppProp: TfAppProp
  Left = 0
  Top = 0
  Width = 280
  Height = 336
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 280
    Height = 25
    Align = alTop
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
  end
  object IniCheckBox1: TIniCheckBox
    Left = 16
    Top = 40
    Width = 233
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' "'#1083#1077#1075#1077#1085#1076#1091'" '#1087#1088#1080' '#1079#1072#1087#1091#1089#1082#1077
    TabOrder = 1
    OnClick = IniCheckBox6Click
    SectionName = 'Config'
    KeyName = '0.ShowLegend'
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 127
    Width = 249
    Height = 186
    Caption = #1044#1080#1088#1077#1082#1090#1086#1088#1080#1080':'
    TabOrder = 2
    object IniCheckBox3: TIniCheckBox
      Left = 13
      Top = 23
      Width = 233
      Height = 17
      Caption = #1054#1090#1095#1077#1090#1099':'
      TabOrder = 0
      OnClick = IniCheckBox3Click
      SectionName = 'Config'
      KeyName = '0.OtherRepPath'
    end
    object Panel2: TPanel
      Left = 30
      Top = 46
      Width = 208
      Height = 27
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object Button1: TButton
        Left = 183
        Top = 0
        Width = 25
        Height = 21
        Caption = '...'
        TabOrder = 1
        OnClick = Button1Click
      end
      object IniLabeledEdit1: TIniLabeledEdit
        Left = 0
        Top = 0
        Width = 177
        Height = 21
        EditLabel.Width = 73
        EditLabel.Height = 13
        EditLabel.Caption = 'IniLabeledEdit1'
        TabOrder = 0
        SectionName = 'Config'
        KeyName = '0.RepPath'
      end
    end
    object IniCheckBox5: TIniCheckBox
      Left = 13
      Top = 73
      Width = 156
      Height = 17
      Caption = #1060#1072#1081#1083#1099' '#1073#1072#1079' '#1076#1072#1085#1085#1099#1093' (*.dbf):'
      TabOrder = 2
      OnClick = IniCheckBox5Click
      SectionName = 'Config'
      KeyName = '0.OtherDatabasePath'
    end
    object Panel3: TPanel
      Left = 30
      Top = 96
      Width = 208
      Height = 25
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 3
      object IniLabeledEdit2: TIniLabeledEdit
        Left = 0
        Top = 0
        Width = 177
        Height = 21
        EditLabel.Width = 73
        EditLabel.Height = 13
        EditLabel.Caption = 'IniLabeledEdit2'
        TabOrder = 0
        SectionName = 'Config'
        KeyName = '0.DatabasePath'
      end
      object Button2: TButton
        Left = 183
        Top = 0
        Width = 25
        Height = 21
        Caption = '...'
        TabOrder = 1
        OnClick = Button2Click
      end
    end
    object IniLabeledEdit3: TIniLabeledEdit
      Left = 30
      Top = 144
      Width = 177
      Height = 21
      EditLabel.Width = 3
      EditLabel.Height = 13
      TabOrder = 4
      SectionName = 'Config'
      KeyName = '0.BackupPath'
    end
    object IniCheckBox2: TIniCheckBox
      Left = 13
      Top = 123
      Width = 156
      Height = 17
      Caption = #1056#1077#1079#1077#1088#1074#1085#1086#1077' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077':'
      TabOrder = 5
      OnClick = IniCheckBox2Click
      SectionName = 'Config'
      KeyName = '0.OtherBackupPath'
    end
    object Button3: TButton
      Left = 213
      Top = 144
      Width = 25
      Height = 21
      Caption = '...'
      TabOrder = 6
      OnClick = Button3Click
    end
  end
  object IniCheckBox7: TIniCheckBox
    Left = 16
    Top = 63
    Width = 246
    Height = 26
    Hint = '('#1056#1077#1096#1077#1085#1080#1077' '#1086' ...)'
    Caption = 
      #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1092#1086#1088#1084#1091' '#1074#1074#1086#1076#1072' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1093' '#1076#1072#1085#1085#1099#1093' '#1087#1088#1080' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1080' '#1086#1090 +
      #1095#1077#1090#1086#1074
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    WordWrap = True
    OnClick = IniCheckBox6Click
    SectionName = 'Config'
    KeyName = '0.ShowAddReportData'
  end
end
