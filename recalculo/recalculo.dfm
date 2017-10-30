object formRecalculo: TformRecalculo
  Left = 281
  Top = 176
  BorderStyle = bsSingle
  Caption = 'Recálculo dos Registros'
  ClientHeight = 195
  ClientWidth = 346
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
    Width = 346
    Height = 154
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 329
      Height = 73
      Caption = ' Período '
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 65
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label2: TLabel
        Left = 192
        Top = 24
        Width = 57
        Height = 13
        Caption = 'Data Final'
      end
      object DateEdit1: TDateEdit
        Left = 16
        Top = 40
        Width = 121
        Height = 21
        Cursor = crHandPoint
        NumGlyphs = 2
        TabOrder = 0
      end
      object DateEdit2: TDateEdit
        Left = 192
        Top = 40
        Width = 121
        Height = 21
        Cursor = crHandPoint
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 88
      Width = 329
      Height = 57
      Caption = ' Convênio '
      TabOrder = 1
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 16
        Top = 24
        Width = 297
        Height = 21
        KeyField = 'CONVENIO'
        ListField = 'CONVENIO'
        ListSource = dsrConvenio
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 154
    Width = 346
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 240
      Top = 8
      Width = 91
      Height = 25
      Cursor = crHandPoint
      Caption = 'Cancelar'
      TabOrder = 0
      Kind = bkCancel
    end
    object BitBtn2: TBitBtn
      Left = 136
      Top = 8
      Width = 91
      Height = 25
      Cursor = crHandPoint
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 1
      OnClick = BitBtn2Click
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
  end
  object traRecalculo: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 112
    Top = 8
  end
  object spRecalculo: TIBStoredProc
    Database = dmoPrincipal.Database
    Transaction = traRecalculo
    StoredProcName = 'RECALCULO'
    Left = 176
    Top = 8
  end
  object traConvenio: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommitRetaining
    Left = 280
    Top = 8
  end
  object qryConvenio: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traConvenio
    AfterOpen = qryConvenioAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  CODIGO || '#39' - '#39' || NOME AS CONVENIO'
      'FROM'
      '  CONVENIOS'
      'ORDER BY'
      '  NOME')
    Left = 280
    Top = 56
  end
  object dsrConvenio: TDataSource
    AutoEdit = False
    DataSet = qryConvenio
    Left = 280
    Top = 104
  end
end
