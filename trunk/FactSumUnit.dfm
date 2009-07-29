object FactSumFrm: TFactSumFrm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1077' '#1088#1072#1089#1093#1086#1076#1099
  ClientHeight = 355
  ClientWidth = 290
  Color = clBtnFace
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
  object TabControl1: TTabControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 284
    Height = 349
    Align = alClient
    TabOrder = 0
    Tabs.Strings = (
      #1044#1086#1073#1072#1074#1080#1090#1100
      #1048#1079#1084#1077#1085#1080#1090#1100)
    TabIndex = 0
    OnChange = TabControl1Change
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 7
      Top = 27
      Width = 270
      Height = 78
      Align = alTop
      Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1087#1077#1088#1080#1086#1076#1099':'
      TabOrder = 0
      object ComboBox1: TComboBox
        Left = 8
        Top = 23
        Width = 161
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnChange = ComboBox1Change
        OnKeyPress = ComboBox1KeyPress
      end
      object Button1: TButton
        Left = 183
        Top = 23
        Width = 75
        Height = 21
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 1
        OnClick = Button1Click
      end
      object CheckBox1: TCheckBox
        Left = 8
        Top = 50
        Width = 161
        Height = 26
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1087#1077#1088#1080#1086#1076
        TabOrder = 2
        Visible = False
        WordWrap = True
        OnClick = CheckBox1Click
      end
      object Button2: TButton
        Left = 183
        Top = 50
        Width = 75
        Height = 21
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 3
        OnClick = Button2Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 108
      Width = 276
      Height = 237
      Align = alTop
      Caption = #1044#1072#1085#1085#1099#1077' '#1079#1072' '#1087#1077#1088#1080#1086#1076':'
      TabOrder = 1
      object StringGrid1: TStringGrid
        Left = 2
        Top = 15
        Width = 130
        Height = 185
        Align = alLeft
        BorderStyle = bsNone
        ColCount = 2
        DefaultRowHeight = 20
        Enabled = False
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
        TabOrder = 0
        OnDrawCell = StringGrid1DrawCell
      end
      object StringGrid2: TStringGrid
        Left = 132
        Top = 15
        Width = 129
        Height = 185
        Align = alLeft
        BorderStyle = bsNone
        ColCount = 1
        DefaultColWidth = 70
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
        TabOrder = 1
        OnDrawCell = StringGrid2DrawCell
        OnSelectCell = StringGrid2SelectCell
      end
      object Panel1: TPanel
        Left = 2
        Top = 200
        Width = 272
        Height = 35
        Align = alBottom
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Label1: TLabel
          Left = 0
          Top = 0
          Width = 272
          Height = 16
          Align = alTop
          Alignment = taCenter
          WordWrap = True
          ExplicitWidth = 4
        end
      end
    end
  end
end
