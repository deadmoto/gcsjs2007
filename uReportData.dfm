object ReportDataFrm: TReportDataFrm
  Left = 0
  Top = 0
  AutoSize = True
  BorderStyle = bsToolWindow
  Caption = #1044#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1086#1090#1095#1077#1090#1072
  ClientHeight = 396
  ClientWidth = 457
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
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 451
    Height = 200
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 221
      Height = 78
      Margins.Bottom = 0
      Caption = #1053#1086#1084#1077#1088' '#1080#1089#1093#1086#1076#1103#1097#1077#1075#1086':'
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      object Label1: TLabel
        Left = 103
        Top = 27
        Width = 13
        Height = 13
        Caption = #8470
      end
      object Label2: TLabel
        Left = 16
        Top = 51
        Width = 29
        Height = 13
        Caption = #1053#1072' '#8470
      end
      object Edit1: TEdit
        Left = 16
        Top = 24
        Width = 81
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 122
        Top = 24
        Width = 81
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 51
        Top = 48
        Width = 152
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
      end
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 81
      Width = 221
      Height = 58
      Margins.Bottom = 0
      Caption = #1053#1086#1084#1077#1088' '#1088#1077#1096#1077#1085#1080#1103':'
      TabOrder = 1
      object Label3: TLabel
        Left = 16
        Top = 27
        Width = 13
        Height = 13
        Caption = #8470
      end
      object Edit4: TEdit
        Left = 35
        Top = 24
        Width = 168
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 0
      Top = 142
      Width = 221
      Height = 58
      Margins.Bottom = 0
      Caption = #1055#1086#1095#1090#1086#1074#1099#1081' '#1080#1085#1076#1077#1082#1089':'
      TabOrder = 2
      object Edit6: TEdit
        Left = 16
        Top = 24
        Width = 187
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
    end
    object GroupBox5: TGroupBox
      Left = 224
      Top = 81
      Width = 221
      Height = 58
      Margins.Bottom = 0
      Caption = #1052#1077#1089#1103#1094' '#1074#1086#1079#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103'/'#1087#1088#1077#1082#1088#1072#1097#1077#1085#1080#1103':'
      TabOrder = 3
      object Edit7: TEdit
        Left = 16
        Top = 24
        Width = 187
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
    end
    object GroupBox6: TGroupBox
      Left = 227
      Top = 142
      Width = 107
      Height = 58
      Caption = 'C'#1091#1084#1084#1072' '#1074#1086#1079#1086#1073#1085#1086#1074#1083'.'
      TabOrder = 4
      object Edit8: TEdit
        Left = 16
        Top = 24
        Width = 73
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
    end
    object Panel1: TPanel
      Left = 224
      Top = 0
      Width = 221
      Height = 75
      BevelOuter = bvNone
      TabOrder = 5
      object CheckBox1: TCheckBox
        Left = 0
        Top = 58
        Width = 221
        Height = 17
        Margins.Bottom = 0
        Align = alTop
        Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100' ('#1060#1048#1054' '#1080#1085#1089#1087#1077#1082#1090#1086#1088#1072')'
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 221
        Height = 58
        Margins.Bottom = 0
        Align = alTop
        Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100':'
        TabOrder = 1
        object Edit5: TEdit
          Left = 16
          Top = 24
          Width = 187
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
        end
      end
    end
    object Button1: TButton
      Left = 348
      Top = 175
      Width = 97
      Height = 25
      Caption = 'Ok'
      TabOrder = 6
      OnClick = Button1Click
    end
  end
  object ScrollBox1: TScrollBox
    AlignWithMargins = True
    Left = 3
    Top = 206
    Width = 451
    Height = 187
    Margins.Top = 0
    HorzScrollBar.Visible = False
    Align = alTop
    AutoSize = True
    TabOrder = 1
    object StringGrid1: TStringGrid
      Left = 0
      Top = 0
      Width = 447
      Height = 183
      Align = alClient
      BorderStyle = bsNone
      ColCount = 2
      DefaultRowHeight = 20
      FixedCols = 0
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      ScrollBars = ssVertical
      TabOrder = 0
      OnClick = StringGrid1Click
      OnDrawCell = StringGrid1DrawCell
    end
  end
end
