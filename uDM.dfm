object DM: TDM
  OldCreateOrder = False
  Height = 203
  Width = 291
  object FDConexao: TFDConnection
    Params.Strings = (
      'ConnectionDef=dblembrete')
    LoginPrompt = False
    Left = 32
    Top = 32
  end
  object FDQryLembrete: TFDQuery
    OnNewRecord = FDQryLembreteNewRecord
    Connection = FDConexao
    SQL.Strings = (
      'select * from tblembrete'
      'where idusuario like :idusuario'
      '  and titulo like :titulo'
      'order by dataHora')
    Left = 104
    Top = 32
    ParamData = <
      item
        Name = 'IDUSUARIO'
        DataType = ftString
        ParamType = ptInput
        Value = '%'
      end
      item
        Name = 'TITULO'
        DataType = ftString
        ParamType = ptInput
        Value = '%%'
      end>
    object FDQryLembreteidlembrete: TFDAutoIncField
      FieldName = 'idlembrete'
      Origin = 'idlembrete'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQryLembretetitulo: TStringField
      FieldName = 'titulo'
      Origin = 'titulo'
      Required = True
      Size = 100
    end
    object FDQryLembretedescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 255
    end
    object FDQryLembretedataHora: TDateTimeField
      FieldName = 'dataHora'
      Origin = 'dataHora'
      Required = True
    end
    object FDQryLembreteidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
    end
  end
  object DSLembrete: TDataSource
    DataSet = FDQryLembrete
    Left = 184
    Top = 32
  end
  object FDQryUser: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'select * from tbusuarios'
      'where usuario = :usuario'
      '  and senha = :senha')
    Left = 104
    Top = 104
    ParamData = <
      item
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object DSUser: TDataSource
    AutoEdit = False
    DataSet = FDQryUser
    Left = 184
    Top = 104
  end
end
