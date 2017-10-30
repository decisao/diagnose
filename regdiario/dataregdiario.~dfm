object dmoRegDiario: TdmoRegDiario
  OldCreateOrder = False
  Left = 125
  Top = 120
  Height = 447
  Width = 634
  object traPaciente: TIBTransaction
    Tag = 1
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 28
    Top = 13
  end
  object qryPaciente: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traPaciente
    BufferChunks = 100
    CachedUpdates = False
    DataSource = formRegDiario.dsrDetalhes
    SQL.Strings = (
      'SELECT NOME, MATRICULA'
      'FROM clientes'
      'WHERE CODIGO = :CODPACIENTE ')
    UniDirectional = True
    Left = 28
    Top = 65
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODPACIENTE'
        ParamType = ptUnknown
      end>
  end
  object provPaciente: TDataSetProvider
    DataSet = qryPaciente
    Constraints = True
    Options = [poReadOnly]
    UpdateMode = upWhereKeyOnly
    Left = 97
    Top = 12
  end
  object cdsPaciente: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Constraints = <
      item
        FromDictionary = False
      end>
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CODEXAMB'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SETOR'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    FetchOnDemand = False
    PacketRecords = 1
    Params = <>
    ProviderName = 'provPaciente'
    ReadOnly = True
    StoreDefs = True
    Left = 97
    Top = 65
  end
  object dsrPaciente: TDataSource
    AutoEdit = False
    DataSet = cdsPaciente
    Left = 97
    Top = 121
  end
  object dsrExame: TDataSource
    AutoEdit = False
    DataSet = cdsExame
    Left = 249
    Top = 121
  end
  object cdsExame: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Constraints = <
      item
        FromDictionary = False
      end>
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CODEXAMB'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SETOR'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    FetchOnDemand = False
    PacketRecords = 1
    Params = <>
    ProviderName = 'provExame'
    ReadOnly = True
    StoreDefs = True
    Left = 249
    Top = 65
  end
  object provExame: TDataSetProvider
    DataSet = qryExame
    Constraints = True
    Options = [poReadOnly]
    UpdateMode = upWhereKeyOnly
    Left = 249
    Top = 12
  end
  object traExame: TIBTransaction
    Tag = 1
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 180
    Top = 13
  end
  object qryExame: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traExame
    BufferChunks = 100
    CachedUpdates = False
    DataSource = formRegDiario.dsrDetalhes
    SQL.Strings = (
      'SELECT NOME'
      'FROM exames'
      'WHERE CODIGO = :CODEXAME ')
    UniDirectional = True
    Left = 180
    Top = 65
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODEXAME'
        ParamType = ptUnknown
      end>
  end
  object traConvenio: TIBTransaction
    Tag = 1
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 340
    Top = 13
  end
  object qryConvenio: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traConvenio
    BufferChunks = 100
    CachedUpdates = False
    DataSource = formRegDiario.dsrDetalhes
    SQL.Strings = (
      'SELECT NOME'
      'FROM convenios'
      'WHERE CODIGO = :CODCONVENIO ')
    UniDirectional = True
    Left = 340
    Top = 65
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODCONVENIO'
        ParamType = ptUnknown
      end>
  end
  object provConvenio: TDataSetProvider
    DataSet = qryConvenio
    Constraints = True
    Options = [poReadOnly]
    UpdateMode = upWhereKeyOnly
    Left = 409
    Top = 13
  end
  object cdsConvenio: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Constraints = <
      item
        FromDictionary = False
      end>
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CODEXAMB'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SETOR'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    FetchOnDemand = False
    PacketRecords = 1
    Params = <>
    ProviderName = 'provConvenio'
    ReadOnly = True
    StoreDefs = True
    Left = 409
    Top = 65
  end
  object dsrConvenio: TDataSource
    AutoEdit = False
    DataSet = cdsConvenio
    Left = 409
    Top = 121
  end
  object traMedico_req: TIBTransaction
    Tag = 1
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 28
    Top = 189
  end
  object qryMedico_req: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traMedico_req
    BufferChunks = 100
    CachedUpdates = False
    DataSource = formRegDiario.dsrDetalhes
    SQL.Strings = (
      'SELECT NOME'
      'FROM medicos'
      'WHERE CODIGO = :CODMEDICO_REQ ')
    UniDirectional = True
    Left = 28
    Top = 241
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODMEDICO_REQ'
        ParamType = ptUnknown
      end>
  end
  object provMedico_req: TDataSetProvider
    DataSet = qryMedico_req
    Constraints = True
    Options = [poReadOnly]
    UpdateMode = upWhereKeyOnly
    Left = 105
    Top = 189
  end
  object cdsMedico_req: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Constraints = <
      item
        FromDictionary = False
      end>
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CODEXAMB'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SETOR'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    FetchOnDemand = False
    PacketRecords = 1
    Params = <>
    ProviderName = 'provMedico_req'
    ReadOnly = True
    StoreDefs = True
    Left = 105
    Top = 241
  end
  object dsrMedico_req: TDataSource
    AutoEdit = False
    DataSet = cdsMedico_req
    Left = 105
    Top = 297
  end
  object traMedico_exe: TIBTransaction
    Tag = 1
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 188
    Top = 189
  end
  object qryMedico_exe: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traMedico_exe
    BufferChunks = 100
    CachedUpdates = False
    DataSource = formRegDiario.dsrDetalhes
    SQL.Strings = (
      'SELECT NOME'
      'FROM medicos'
      'WHERE CODIGO = :CODMEDICO_EXE ')
    UniDirectional = True
    Left = 188
    Top = 241
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODMEDICO_EXE'
        ParamType = ptUnknown
      end>
  end
  object provMedico_exe: TDataSetProvider
    DataSet = qryMedico_exe
    Constraints = True
    Options = [poReadOnly]
    UpdateMode = upWhereKeyOnly
    Left = 265
    Top = 189
  end
  object cdsMedico_exe: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Constraints = <
      item
        FromDictionary = False
      end>
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CODEXAMB'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SETOR'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    FetchOnDemand = False
    PacketRecords = 1
    Params = <>
    ProviderName = 'provMedico_exe'
    ReadOnly = True
    StoreDefs = True
    Left = 265
    Top = 241
  end
  object dsrMedico_exe: TDataSource
    AutoEdit = False
    DataSet = cdsMedico_exe
    Left = 265
    Top = 297
  end
  object traEtiqueta: TIBTransaction
    Tag = 1
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 356
    Top = 189
  end
  object qryEtiqueta: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traEtiqueta
    BufferChunks = 100
    CachedUpdates = False
    DataSource = formRegDiario.dscSelecionar
    SQL.Strings = (
      'SELECT'
      '  REG.DATA,'
      '  REG.CODDIARIO AS REGISTRO,'
      '  CLI.NOME AS PACIENTE,'
      '  MED.NOME AS MEDICO,'
      '  CON.NOME AS CONVENIO,'
      '  EXA.NOME AS EXAME,'
      '  REG.NOME_LAUDO'
      'FROM'
      '  REGDIARIO REG'
      '  JOIN CLIENTES CLI ON'
      '    (CLI.CODIGO = REG.CODPACIENTE)'
      '  JOIN MEDICOS MED ON'
      '    (MED.CODIGO = REG.CODMEDICO_REQ)'
      '  JOIN CONVENIOS CON ON'
      '    (CON.CODIGO = REG.CODCONVENIO)'
      '  JOIN EXAMES EXA ON '
      '    (EXA.CODIGO = REG.CODEXAME)'
      'WHERE'
      '  REG.CODIGO = :CODIGO')
    UniDirectional = True
    Left = 356
    Top = 241
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
        Value = 0
      end>
  end
  object provEtiqueta: TDataSetProvider
    DataSet = qryEtiqueta
    Constraints = True
    Options = [poReadOnly]
    UpdateMode = upWhereKeyOnly
    Left = 425
    Top = 189
  end
  object cdsEtiqueta: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Constraints = <
      item
        FromDictionary = False
      end>
    FieldDefs = <
      item
        Name = 'DATA'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'REGISTRO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PACIENTE'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'MEDICO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CONVENIO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'EXAME'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NOME_LAUDO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    FetchOnDemand = False
    PacketRecords = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'provEtiqueta'
    ReadOnly = True
    StoreDefs = True
    Left = 425
    Top = 241
  end
  object dsrEtiqueta: TDataSource
    AutoEdit = False
    DataSet = cdsEtiqueta
    Left = 425
    Top = 297
  end
end
