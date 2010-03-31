object DModule: TDModule
  OldCreateOrder = True
  OnCreate = FormCreate
  Height = 236
  Width = 374
  object Query1: TQuery
    DatabaseName = 'Subsidy'
    SQL.Strings = (
      '')
    Left = 136
    Top = 8
  end
  object Query2: TQuery
    DatabaseName = 'Subsidy'
    Left = 192
    Top = 8
  end
  object Database1: TDatabase
    AliasName = 'SQLSub'
    DatabaseName = 'Subsidy'
    LoginPrompt = False
    Params.Strings = (
      'DATABASE NAME=Subsidy'
      'USER NAME=sa'
      'ODBC DSN=SQLSUB'
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
    Left = 16
    Top = 8
  end
  object Query3: TQuery
    DatabaseName = 'Subsidy'
    Left = 248
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 80
    Top = 8
  end
  object qTarif: TADOQuery
    Connection = dbfConnection
    CursorType = ctStatic
    Parameters = <>
    Left = 32
    Top = 128
  end
  object DataSource2: TDataSource
    DataSet = qTarif
    Left = 32
    Top = 184
  end
  object dbfConnection: TADOConnection
    LoginPrompt = False
    Left = 32
    Top = 72
  end
end
