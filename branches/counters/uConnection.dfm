object ConnectionFrm: TConnectionFrm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  ClientHeight = 134
  ClientWidth = 285
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 279
    Height = 94
    Margins.Bottom = 0
    Align = alTop
    Caption = #1042#1099#1073#1086#1088' '#1089#1077#1088#1074#1077#1088#1072':'
    TabOrder = 0
    object ComboBox1: TComboBox
      Left = 8
      Top = 22
      Width = 265
      Height = 21
      ItemHeight = 0
      TabOrder = 0
      OnKeyPress = ComboBox1KeyPress
    end
    object LabeledEdit1: TLabeledEdit
      Left = 8
      Top = 64
      Width = 130
      Height = 21
      EditLabel.Width = 26
      EditLabel.Height = 13
      EditLabel.Caption = 'User:'
      TabOrder = 1
    end
    object LabeledEdit2: TLabeledEdit
      Left = 143
      Top = 64
      Width = 130
      Height = 21
      EditLabel.Width = 50
      EditLabel.Height = 13
      EditLabel.Caption = 'Password:'
      PasswordChar = '|'
      TabOrder = 2
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 100
    Width = 279
    Height = 31
    Align = alTop
    AutoWrap = False
    BevelOuter = bvNone
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 1
    object Button2: TButton
      AlignWithMargins = True
      Left = 201
      Top = 3
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 120
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
