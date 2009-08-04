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
    BevelInner = bvLowered
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
  end
  object IniLabeledEdit1: TIniLabeledEdit
    Left = 16
    Top = 82
    Width = 177
    Height = 21
    EditLabel.Width = 37
    EditLabel.Height = 13
    EditLabel.Caption = #1057#1077#1088#1074#1077#1088
    TabOrder = 1
    SectionName = 'Config'
    KeyName = '1.Server'
  end
  object IniCheckBox1: TIniCheckBox
    Left = 16
    Top = 40
    Width = 177
    Height = 17
    Caption = #1040#1074#1090#1086#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077
    TabOrder = 2
    SectionName = 'Config'
    KeyName = '1.AutoUpdate'
  end
end
