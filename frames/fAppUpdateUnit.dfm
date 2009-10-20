object fAppUpdate: TfAppUpdate
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
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
  end
  object IniLabeledEdit1: TIniLabeledEdit
    Left = 16
    Top = 50
    Width = 193
    Height = 21
    EditLabel.Width = 104
    EditLabel.Height = 13
    EditLabel.Caption = #1057#1077#1088#1074#1077#1088' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081':'
    TabOrder = 1
    OnClick = IniLabeledEdit1Click
    SectionName = 'Config'
    KeyName = '1.Server'
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 77
    Width = 185
    Height = 105
    Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103' '#1085#1072' '#1089#1077#1088#1074#1077#1088#1077':'
    TabOrder = 2
    object IniLabeledEdit3: TIniLabeledEdit
      Left = 8
      Top = 71
      Width = 121
      Height = 21
      EditLabel.Width = 41
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1072#1088#1086#1083#1100':'
      TabOrder = 1
      OnClick = IniLabeledEdit1Click
      SectionName = 'Config'
      KeyName = '1.FtpPasswd'
    end
    object IniLabeledEdit2: TIniLabeledEdit
      Left = 8
      Top = 34
      Width = 121
      Height = 21
      EditLabel.Width = 97
      EditLabel.Height = 13
      EditLabel.Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103':'
      TabOrder = 0
      OnClick = IniLabeledEdit1Click
      SectionName = 'Config'
      KeyName = '1.FtpName'
    end
  end
  object Button1: TButton
    Left = 207
    Top = 50
    Width = 25
    Height = 21
    Caption = '...'
    TabOrder = 3
    OnClick = Button1Click
  end
end
