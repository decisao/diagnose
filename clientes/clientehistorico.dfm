object formClienteHistorico: TformClienteHistorico
  Left = 278
  Top = 182
  BorderStyle = bsDialog
  Caption = 'Histórico'
  ClientHeight = 302
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
    Width = 344
    Height = 262
    Align = alClient
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 342
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 12
        Top = 8
        Width = 40
        Height = 13
        Caption = 'Cliente'
      end
      object DBEdit1: TDBEdit
        Left = 12
        Top = 24
        Width = 313
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'NOME'
        DataSource = dsrHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object pgc_dados: TPageControl
      Left = 1
      Top = 58
      Width = 342
      Height = 203
      ActivePage = tabGlobal
      Align = alClient
      TabOrder = 1
      object tabGlobal: TTabSheet
        Caption = 'Dados Globais'
        object lb_dias: TLabel
          Left = 80
          Top = 8
          Width = 65
          Height = 13
          Caption = 'Dias atraso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object lb_total: TLabel
          Left = 21
          Top = 48
          Width = 123
          Height = 13
          Alignment = taRightJustify
          Caption = 'A Receber - Atrasado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object lb_data: TLabel
          Left = 22
          Top = 88
          Width = 122
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data do maior atraso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label5: TLabel
          Left = 212
          Top = 128
          Width = 108
          Height = 13
          Alignment = taRightJustify
          Caption = 'A Receber - Futuro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 260
          Top = 88
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 283
          Top = 48
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'TOTAL'
        end
        object Label2: TLabel
          Left = 253
          Top = 8
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'Movimentos'
        end
        object lbBloqueio: TLabel
          Left = 8
          Top = 140
          Width = 169
          Height = 25
          AutoSize = False
          Caption = 'ATIVO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -21
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbt_dias: TDBEdit
          Left = 80
          Top = 24
          Width = 65
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'DIAS_ATRASO'
          DataSource = dsrHistorico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Visible = False
        end
        object dbt_total: TDBEdit
          Left = 8
          Top = 64
          Width = 137
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'TOTAL_ATRASO'
          DataSource = dsrHistorico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Visible = False
        end
        object dbt_data: TDBEdit
          Left = 8
          Top = 104
          Width = 137
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'DATA_MAISATRASADO'
          DataSource = dsrHistorico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Visible = False
        end
        object DBEdit5: TDBEdit
          Left = 184
          Top = 144
          Width = 137
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'TOTAL_ARECEBER'
          DataSource = dsrHistorico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit4: TDBEdit
          Left = 184
          Top = 104
          Width = 137
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'TOTAL_PAGO'
          DataSource = dsrHistorico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit3: TDBEdit
          Left = 184
          Top = 64
          Width = 137
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'TOTAL_MOVIMENTOS'
          DataSource = dsrHistorico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit2: TDBEdit
          Left = 248
          Top = 24
          Width = 73
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'MOVIMENTOS'
          DataSource = dsrHistorico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
      end
      object tabAtraso: TTabSheet
        Caption = 'Atraso por Empresa'
        ImageIndex = 1
        object zebdbgrid1: Tzebdbgrid
          Left = 0
          Top = 0
          Width = 334
          Height = 175
          Align = alClient
          DataSource = dsrAtrasoEmp
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          ZebraColor = clAqua
          ZebraFontColor = clWindowText
          Columns = <
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'EMPRESA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_ATRASO'
              Title.Alignment = taRightJustify
              Title.Caption = 'TOTAL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 95
              Visible = True
            end>
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 262
    Width = 344
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 227
      Top = 8
      Width = 99
      Height = 25
      Cursor = crHandPoint
      Caption = 'Fechar'
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object qryHistorico: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traHistorico
    AfterOpen = qryHistoricoAfterOpen
    BeforeOpen = qryHistoricoBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  HISTORICO(:CODCLIENTE, :CODEMPRESA)')
    Left = 49
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODCLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object traHistorico: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    IdleTimer = 1024
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 49
    Top = 97
  end
  object dsrHistorico: TDataSource
    AutoEdit = False
    DataSet = qryHistorico
    Left = 49
    Top = 193
  end
  object traAtrasoEmp: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    IdleTimer = 1024
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 121
    Top = 97
  end
  object qryAtrasoEmp: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traAtrasoEmp
    AfterOpen = qryAtrasoEmpAfterOpen
    BeforeOpen = qryAtrasoEmpBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '    CL.NOME AS NOME,'
      '    SUM(PA.TOTAL_PAGO) AS TOTAL_ATRASO'
      'FROM'
      '    MOVIMENTOS MO'
      '    LEFT JOIN PAGAMENTOS PA ON'
      '      (MO.CODIGO = PA.CODMOVIMENTO)'
      '    LEFT JOIN SISCONFIG SC ON'
      '      (MO.CODEMPRESA = SC.CODIGO)'
      '    LEFT JOIN CLIENTES CL ON'
      '      (SC.CODCLIENTE = CL.CODIGO)'
      'WHERE'
      '    MO.CODCLIENTE = :CODCLIENTE AND'
      '    MO.TIPO IN (3, 6) AND'
      '    PA.PAGO = 0 AND'
      '    PA.DATAVENCIMENTO < CURRENT_TIMESTAMP'
      'GROUP BY'
      '    CL.NOME')
    Left = 121
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODCLIENTE'
        ParamType = ptUnknown
      end>
  end
  object dsrAtrasoEmp: TDataSource
    AutoEdit = False
    DataSet = qryAtrasoEmp
    Left = 121
    Top = 193
  end
end
