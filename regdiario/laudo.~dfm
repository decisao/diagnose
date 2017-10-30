object formLaudo: TformLaudo
  Left = 466
  Top = 415
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Laudo'
  ClientHeight = 97
  ClientWidth = 177
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 161
    Height = 49
    Alignment = taCenter
    AutoSize = False
    Caption = 'Quando terminar de editar o documento, clique no botão abaixo.'
    WordWrap = True
  end
  object Button1: TButton
    Left = 48
    Top = 64
    Width = 81
    Height = 25
    Cursor = crHandPoint
    Caption = '&Pronto!'
    TabOrder = 0
    OnClick = Button1Click
  end
  object tmrLaudo: TTimer
    Enabled = False
    Interval = 256
    OnTimer = tmrLaudoTimer
    Left = 264
    Top = 32
  end
  object WordDocument: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningInstance
    Left = 264
    Top = 88
  end
  object WordApplication: TWordApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 264
    Top = 144
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Microsoft Word (*.doc)|*.doc'
    Title = 'Modelo de Laudo'
    Left = 344
    Top = 32
  end
  object traAdicionar: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    IdleTimer = 1024
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 345
    Top = 133
  end
  object sqlAdicionar: TIBSQL
    Database = dmoPrincipal.Database
    ParamCheck = True
    SQL.Strings = (
      'INSERT INTO'
      '   REG_FILES ('
      '      CODIGO,'
      '      CODREGISTRO,'
      '      NOME,'
      '      DATA,'
      '      USUARIO,'
      '      TAMANHO,'
      '      ORIGINAL,'
      '      CONTEUDO)'
      '   VALUES ('
      '      :CODIGO,'
      '      :CODREGISTRO,'
      '      :NOME,'
      '      :DATA,'
      '      :USUARIO,'
      '      :TAMANHO,'
      '      :ORIGINAL,'
      '      :CONTEUDO)')
    Transaction = traAdicionar
    Left = 341
    Top = 192
  end
end
