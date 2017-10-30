object formConfig: TformConfig
  Left = 550
  Top = 349
  BorderStyle = bsDialog
  Caption = 'Configurações'
  ClientHeight = 158
  ClientWidth = 330
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 330
    Height = 117
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 93
      Height = 13
      Caption = 'Path dos Laudos'
    end
    object dxDBButtonEdit1: TdxDBButtonEdit
      Left = 8
      Top = 32
      Width = 313
      TabOrder = 0
      DataField = 'PATHTEMP'
      DataSource = DataSource1
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = dxDBButtonEdit1ButtonClick
      ExistButtons = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 117
    Width = 330
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = clInfoBk
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 120
      Top = 8
      Width = 91
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 224
      Top = 8
      Width = 91
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object traDetalhes: TIBTransaction
    Tag = 1
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 109
    Top = 13
  end
  object qryDetalhes: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traDetalhes
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM CONFIG')
    UniDirectional = True
    Left = 108
    Top = 65
    object qryDetalhesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"CONFIG"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDetalhesPATHTEMP: TIBStringField
      FieldName = 'PATHTEMP'
      Origin = '"CONFIG"."PATHTEMP"'
      Required = True
      Size = 254
    end
  end
  object provDetalhes: TDataSetProvider
    DataSet = qryDetalhes
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 193
    Top = 12
  end
  object cdsDetalhes: TClientDataSet
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
        Name = 'PATHTEMP'
        Attributes = [faRequired]
        DataType = ftString
        Size = 254
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'CODIGO'
    FetchOnDemand = False
    PacketRecords = 1
    Params = <>
    ProviderName = 'provDetalhes'
    StoreDefs = True
    Left = 189
    Top = 63
    object cdsDetalhesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDetalhesPATHTEMP: TStringField
      FieldName = 'PATHTEMP'
      Required = True
      Size = 254
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsDetalhes
    Left = 264
    Top = 64
  end
  object OpenDialog1: TOpenDialog
    Left = 32
    Top = 72
  end
end
