object Form17: TForm17
  Left = 324
  Top = 180
  BorderStyle = bsToolWindow
  ClientHeight = 134
  ClientWidth = 251
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
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 245
    Height = 94
    Margins.Bottom = 0
    Align = alTop
    Caption = #1042#1099#1073#1086#1088' '#1080#1085#1089#1087#1077#1082#1090#1086#1088#1072':'
    TabOrder = 0
    object ComboBox1: TComboBox
      Left = 8
      Top = 25
      Width = 229
      Height = 21
      ItemHeight = 0
      TabOrder = 0
    end
    object LabeledEdit1: TLabeledEdit
      Left = 8
      Top = 64
      Width = 229
      Height = 21
      EditLabel.Width = 41
      EditLabel.Height = 13
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = #1055#1072#1088#1086#1083#1100':'
      EditLabel.ParentBiDiMode = False
      PasswordChar = '|'
      TabOrder = 1
    end
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 100
    Width = 245
    Height = 31
    Align = alTop
    AutoWrap = False
    BevelOuter = bvNone
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 1
    object Button2: TButton
      AlignWithMargins = True
      Left = 167
      Top = 3
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 86
      Top = 3
      Width = 75
      Height = 25
      Hint = #1057#1087#1080#1089#1086#1082' '#1072#1082#1090#1080#1074#1085#1099#1093' '#1080#1085#1089#1087#1077#1082#1090#1086#1088#1086#1074
      Caption = #1054#1082
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
