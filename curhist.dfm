object Form18: TForm18
  Left = 337
  Top = 201
  BorderStyle = bsToolWindow
  ClientHeight = 496
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 411
    Height = 471
    Align = alClient
    Caption = #1058#1077#1082#1091#1097#1080#1077' '#1089#1091#1073#1089#1080#1076#1080#1080'('#1073#1077#1079' '#1091#1095#1077#1090#1072' '#1091#1076#1077#1088#1078#1072#1085#1080#1081'):'
    TabOrder = 0
    object SGH: TStringGrid
      Left = 2
      Top = 15
      Width = 407
      Height = 413
      Hint = #1057#1087#1080#1089#1086#1082' '#1072#1082#1090#1080#1074#1085#1099#1093' '#1082#1083#1080#1077#1085#1090#1086#1074' '#1080' '#1080#1093' '#1089#1091#1073#1089#1080#1076#1080#1081
      Align = alClient
      BorderStyle = bsNone
      ColCount = 3
      DefaultColWidth = 125
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnDblClick = SGHDblClick
      OnKeyDown = SGHKeyDown
      OnKeyPress = SGHKeyPress
      OnSelectCell = SGHSelectCell
      ExplicitHeight = 401
    end
    object Panel1: TPanel
      Left = 2
      Top = 428
      Width = 407
      Height = 41
      Align = alBottom
      TabOrder = 1
      object Button1: TButton
        Left = 320
        Top = 6
        Width = 75
        Height = 25
        Caption = #1054#1090#1082#1088'. '#1074' Excel'
        TabOrder = 0
        OnClick = Button1Click
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 477
    Width = 417
    Height = 19
    Panels = <
      item
        Text = #1050#1083#1080#1077#1085#1090#1086#1074':'
        Width = 194
      end
      item
        Text = #1057#1091#1084#1084#1072' '#1089#1091#1073#1089#1080#1076#1080#1081':'
        Width = 50
      end>
  end
end
