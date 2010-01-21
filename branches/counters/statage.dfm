object Form22: TForm22
  Left = 212
  Top = 168
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1074#1086#1079#1088#1072#1089#1090#1091
  ClientHeight = 98
  ClientWidth = 263
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 47
    Top = 8
    Width = 66
    Height = 13
    Caption = '<='#1042#1086#1079#1088#1072#1089#1090'<='
  end
  object Label3: TLabel
    Left = 8
    Top = 35
    Width = 129
    Height = 49
    AutoSize = False
    Caption = #1050#1086#1083'-'#1074#1086' '#1095#1077#1083#1086#1074#1077#1082' '#1089' '#1074#1086#1079#1088#1072#1089#1090#1086#1084' '#1074' '#1091#1082#1072#1079#1072#1085#1085#1086#1084' '#1076#1080#1072#1087#1072#1079#1086#1085#1077':'
    Transparent = False
    WordWrap = True
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 33
    Height = 21
    TabOrder = 0
    Text = '5'
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object Edit2: TEdit
    Left = 119
    Top = 8
    Width = 33
    Height = 21
    TabOrder = 1
    Text = '6'
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object Edit3: TEdit
    Left = 152
    Top = 35
    Width = 41
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 4
    Text = '0'
  end
  object Button1: TButton
    Left = 200
    Top = 35
    Width = 57
    Height = 25
    Caption = #1056#1072#1089#1095#1077#1090
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 200
    Top = 67
    Width = 57
    Height = 25
    Caption = #1042' DBF'
    TabOrder = 3
    OnClick = Button3Click
  end
end
