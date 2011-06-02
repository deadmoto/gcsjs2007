object DModule: TDModule
  OldCreateOrder = True
  OnCreate = FormCreate
  Height = 286
  Width = 374
  object qTarif: TADOQuery
    Connection = dbfConnection
    CursorType = ctStatic
    Parameters = <>
    Left = 32
    Top = 200
  end
  object dbfConnection: TADOConnection
    LoginPrompt = False
    Left = 32
    Top = 144
  end
  object sqlConnection: TADOConnection
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object sqlQuery1: TADOQuery
    Connection = sqlConnection
    Parameters = <>
    Left = 128
    Top = 16
  end
  object sqlQuery2: TADOQuery
    Connection = sqlConnection
    Parameters = <>
    Left = 200
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = sqlQuery1
    Left = 128
    Top = 72
  end
end
