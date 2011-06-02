object Form40: TForm40
  Left = 314
  Top = 357
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1087#1088#1086#1078#1080#1090'.'#1084#1080#1085#1080#1084#1091#1084#1091' '#1080' '#1052#1044#1044
  ClientHeight = 159
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 8
    Top = 128
    Width = 297
    Height = 26
    Caption = 
      #1050#1086#1083'-'#1074#1086' '#1082#1083#1080#1077#1085#1090#1086#1074' '#1089' '#1085#1091#1083#1077#1074#1086#1081' '#1089#1091#1073#1089#1080#1076#1080#1077#1081' '#1089' '#1091#1095#1077#1090#1086#1084' '#1091#1082#1072#1079#1072#1085#1085#1099#1093' '#1087#1086#1082#1072#1079#1072#1090#1077#1083 +
      #1077#1081':'
    WordWrap = True
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 241
    Height = 105
    Caption = #1055#1088#1086#1078#1080#1090#1086#1095#1085#1099#1081' '#1084#1080#1085#1080#1084#1091#1084
    TabOrder = 0
    TabStop = True
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 110
      Height = 13
      Caption = #1044#1077#1090#1080' '#1084#1083#1072#1076#1096#1077' 16 '#1083#1077#1090': '
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 67
      Height = 13
      Caption = #1055#1077#1085#1089#1080#1086#1085#1077#1088#1099':'
    end
    object Label3: TLabel
      Left = 16
      Top = 72
      Width = 144
      Height = 13
      Caption = #1058#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1086#1077' '#1085#1072#1089#1077#1083#1077#1085#1080#1077':'
    end
    object Edit1: TEdit
      Left = 168
      Top = 24
      Width = 57
      Height = 21
      TabOrder = 0
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object Edit3: TEdit
      Left = 168
      Top = 72
      Width = 57
      Height = 21
      TabOrder = 2
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object Edit2: TEdit
      Left = 168
      Top = 48
      Width = 57
      Height = 21
      TabOrder = 1
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
  end
  object GroupBox2: TGroupBox
    Left = 256
    Top = 8
    Width = 241
    Height = 105
    Caption = #1052#1044#1044
    TabOrder = 1
    TabStop = True
    object Label4: TLabel
      Left = 16
      Top = 24
      Width = 183
      Height = 13
      Caption = #1054#1076#1080#1085#1086#1082#1080#1077' '#1080#1085#1074#1072#1083#1080#1076#1099' '#1080' '#1087#1077#1085#1089#1080#1086#1085#1077#1088#1099': '
    end
    object Label5: TLabel
      Left = 16
      Top = 48
      Width = 53
      Height = 13
      Caption = #1054#1089#1085#1086#1074#1085#1086#1081':'
    end
    object Edit4: TEdit
      Left = 200
      Top = 24
      Width = 25
      Height = 21
      TabOrder = 0
      OnExit = Edit4Exit
      OnKeyDown = Edit4KeyDown
    end
    object Edit5: TEdit
      Left = 200
      Top = 48
      Width = 25
      Height = 21
      TabOrder = 1
      OnExit = Edit4Exit
      OnKeyDown = Edit4KeyDown
    end
    object Button2: TButton
      Left = 16
      Top = 72
      Width = 75
      Height = 25
      Caption = #1048#1079#1084'. '#1085#1086#1088#1084#1099
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object Edit6: TEdit
    Left = 312
    Top = 128
    Width = 41
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 4
    Text = '0'
  end
  object Button1: TButton
    Left = 369
    Top = 126
    Width = 57
    Height = 25
    Caption = #1056#1072#1089#1095#1077#1090
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 432
    Top = 126
    Width = 65
    Height = 25
    Caption = #1042' DBF'
    TabOrder = 3
    OnClick = Button3Click
  end
end
