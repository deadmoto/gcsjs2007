object ReportEditFrm: TReportEditFrm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1086#1090#1095#1077#1090#1086#1074':'
  ClientHeight = 406
  ClientWidth = 370
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
  object ReportListView: TListView
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 364
    Height = 363
    Align = alClient
    Columns = <
      item
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 250
      end
      item
        Caption = #1060#1072#1081#1083
        Width = 100
      end>
    GridLines = True
    PopupMenu = PopupMenu1
    SmallImages = MainForm.ImageList2
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = N1Click
    ExplicitHeight = 318
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 372
    Width = 364
    Height = 31
    Align = alBottom
    AutoWrap = False
    BevelOuter = bvNone
    FlowStyle = fsRightLeftBottomTop
    TabOrder = 1
    object Button2: TButton
      AlignWithMargins = True
      Left = 286
      Top = 3
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 205
      Top = 3
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 184
    Top = 296
    object N1: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1096#1072#1073#1083#1086#1085
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1053#1072#1079#1085#1072#1095#1080#1090#1100' '#1096#1072#1073#1083#1086#1085
      OnClick = N2Click
    end
  end
end
