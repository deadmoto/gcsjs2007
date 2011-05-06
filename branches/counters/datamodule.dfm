object DModule: TDModule
  OldCreateOrder = True
  OnCreate = FormCreate
  Height = 286
  Width = 374
  object Query1: TQuery
    DatabaseName = 'Subsidy'
    SQL.Strings = (
      '')
    Left = 176
    Top = 8
  end
  object Database1: TDatabase
    AliasName = 'SQLSub'
    DatabaseName = 'Subsidy'
    LoginPrompt = False
    Params.Strings = (
      'DATABASE NAME=Subsidy'
      'USER NAME='
      'ODBC DSN=SQLSub'
      'OPEN MODE=READ/WRITE'
      'BATCH COUNT=200'
      'LANGDRIVER='
      'MAX ROWS=-1'
      'SCHEMA CACHE DIR='
      'SCHEMA CACHE SIZE=8'
      'SCHEMA CACHE TIME=-1'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SQLQRYMODE='
      'ENABLE SCHEMA CACHE=FALSE'
      'ENABLE BCD=FALSE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'PASSWORD=')
    SessionName = 'Default'
    Left = 32
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 104
    Top = 8
  end
  object qTarif: TADOQuery
    Connection = dbfConnection
    CursorType = ctStatic
    Parameters = <>
    Left = 24
    Top = 144
  end
  object dbfConnection: TADOConnection
    LoginPrompt = False
    Left = 24
    Top = 88
  end
  object sqlConnection: TADOConnection
    LoginPrompt = False
    Left = 144
    Top = 88
  end
  object sqlQuery1: TADOQuery
    Connection = sqlConnection
    Parameters = <>
    Left = 144
    Top = 144
  end
  object sqlDataSource: TDataSource
    DataSet = sqlQuery1
    Left = 216
    Top = 88
  end
  object sqlQuery2: TADOQuery
    Connection = sqlConnection
    Parameters = <>
    Left = 144
    Top = 200
  end
end
