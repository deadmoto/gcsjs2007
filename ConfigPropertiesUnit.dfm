object ConfigFrm: TConfigFrm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 365
  ClientWidth = 468
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 142
    Height = 318
    Align = alLeft
    BevelInner = bvLowered
    TabOrder = 0
    object ListBox1: TListBox
      Left = 2
      Top = 2
      Width = 138
      Height = 314
      Style = lbOwnerDrawFixed
      Align = alClient
      BorderStyle = bsNone
      ItemHeight = 20
      TabOrder = 0
      OnClick = ListBox1Click
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 151
    Top = 3
    Width = 314
    Height = 318
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 327
    Width = 462
    Height = 35
    Align = alBottom
    AutoWrap = False
    BevelInner = bvLowered
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 2
    object Button1: TButton
      AlignWithMargins = True
      Left = 382
      Top = 5
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 301
      Top = 5
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      Enabled = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 220
      Top = 5
      Width = 75
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 2
      OnClick = Button3Click
    end
  end
end
