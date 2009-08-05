object fAppProp: TfAppProp
  Left = 0
  Top = 0
  Width = 280
  Height = 311
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 280
    Height = 25
    Align = alTop
    BevelInner = bvLowered
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
    SectionName = 'Config'
    KeyName = '0.ShowLegend'
  end
  object IniCheckBox2: TIniCheckBox
    Left = 16
    Top = 63
    Width = 233
    Height = 26
    Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1086#1082#1085#1086' "'#1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1077' '#1088#1072#1089#1093#1086#1076#1099'" '#1087#1088#1080' '#1080#1079#1084#1077#1085#1077#1080#1080' '#1082#1083#1080#1077#1085#1090#1072
    TabOrder = 2
    WordWrap = True
    SectionName = 'Config'
    KeyName = '0.ShowFactSumFrm'
  end
  object IniCheckBox3: TIniCheckBox
    Left = 16
    Top = 95
    Width = 233
    Height = 17
    Caption = #1055#1072#1087#1082#1072' '#1076#1083#1103' '#1086#1090#1095#1077#1090#1086#1074
    TabOrder = 3
    OnClick = IniCheckBox3Click
    SectionName = 'Config'
    KeyName = '0.OtherRepPath'
  end
  object Panel2: TPanel
    Left = 32
    Top = 118
    Width = 208
    Height = 27
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 4
    object Button1: TButton
      Left = 183
      Top = 0
      Width = 25
      Height = 21
      Caption = '...'
      TabOrder = 0
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
      TabOrder = 1
      SectionName = 'Config'
      KeyName = '0.RepPath'
    end
  end
  object IniCheckBox4: TIniCheckBox
    Left = 16
    Top = 199
    Width = 233
    Height = 26
    Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1085#1086#1087#1082#1091' "'#1059#1076#1072#1083#1080#1090#1100'" '#1085#1072' '#1075#1083#1072#1074#1085#1086#1081' '#1092#1086#1088#1084#1077
    TabOrder = 5
    WordWrap = True
    SectionName = 'Config'
    KeyName = '0.ShowDeleteButton'
  end
  object IniCheckBox5: TIniCheckBox
    Left = 16
    Top = 145
    Width = 121
    Height = 17
    Caption = #1055#1072#1087#1082#1072' '#1076#1083#1103' '#1073#1072#1079' DBF'
    TabOrder = 6
    OnClick = IniCheckBox5Click
    SectionName = 'Config'
    KeyName = '0.OtherDatabasePath'
  end
  object Panel3: TPanel
    Left = 32
    Top = 168
    Width = 208
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 7
    object IniLabeledEdit2: TIniLabeledEdit
      Left = 0
      Top = 0
      Width = 177
      Height = 21
      EditLabel.Width = 3
      EditLabel.Height = 13
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
end
