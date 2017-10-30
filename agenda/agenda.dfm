object formAgenda: TformAgenda
  Left = 0
  Top = 536
  Width = 160
  Height = 34
  Caption = 'Agenda'
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Dock972: TDock97
    Left = 49
    Top = 0
    Width = 86
    Height = 0
    BoundLines = [blTop, blBottom, blLeft, blRight]
    Position = dpRight
    object Toolbar972: TToolbar97
      Left = 0
      Top = 0
      Caption = 'Toolbar972'
      Color = clBtnHighlight
      DockPos = 0
      FullSize = True
      TabOrder = 0
      object btnSair: TToolbarButton97
        Left = 0
        Top = 186
        Width = 80
        Height = 60
        Cursor = crHandPoint
        Hint = 'Sair desta janela'
        Caption = '&Saída'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ImageIndex = 6
        Images = dmoPrincipal.imgBotoes
        Layout = blGlyphTop
        ModalResult = 1
        Opaque = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSairClick
      end
      object ToolbarSep971: TToolbarSep97
        Left = 0
        Top = 180
      end
      object btnAdicionar: TToolbarButton97
        Left = 0
        Top = 0
        Width = 80
        Height = 60
        Cursor = crHandPoint
        Hint = 'Adiciona um novo registro'
        Caption = '&Adicionar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ImageIndex = 0
        Images = dmoPrincipal.imgBotoes
        Layout = blGlyphTop
        Opaque = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object btnImprimir: TToolbarButton97
        Left = 0
        Top = 120
        Width = 80
        Height = 60
        Cursor = crHandPoint
        Hint = 'Opções de Impressão'
        Caption = '&Impressão'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ImageIndex = 2
        Images = dmoPrincipal.imgBotoes
        Layout = blGlyphTop
        Opaque = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object btnModificar: TToolbarButton97
        Left = 0
        Top = 60
        Width = 80
        Height = 60
        Cursor = crHandPoint
        Hint = 'Modifica os dados do registro selecionado'
        Caption = '&Detalhes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ImageIndex = 1
        Images = dmoPrincipal.imgBotoes
        Layout = blGlyphTop
        Opaque = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 49
    Height = 0
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = -59
      Width = 47
      Height = 58
      Align = alBottom
      Color = clInfoBk
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 92
        Height = 13
        Caption = 'Data da Agenda'
      end
      object Label2: TLabel
        Left = 192
        Top = 8
        Width = 31
        Height = 13
        Caption = 'Setor'
      end
      object DateEdit: TDateEdit
        Left = 16
        Top = 24
        Width = 113
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 192
        Top = 24
        Width = 201
        Height = 21
        KeyField = 'NOME'
        ListField = 'NOME'
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 47
      Height = 411
      Align = alClient
      Caption = 'Nenhum registro encontrado!'
      TabOrder = 1
      object DBGrid1: TdxDBGrid
        Left = 1
        Top = 1
        Width = 45
        Height = 409
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        TabOrder = 0
        Filter.Criteria = {00000000}
        GridLineColor = clNavy
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
        ShowHeader = False
        object DBGrid1Column1: TdxDBGridColumn
          Alignment = taCenter
          Width = 60
          BandIndex = 0
          RowIndex = 0
          FieldName = 'HORA'
        end
        object DBGrid1Column2: TdxDBGridColumn
          Alignment = taCenter
          Width = 60
          BandIndex = 0
          RowIndex = 0
          FieldName = 'HORAEXAME'
        end
        object DBGrid1Column3: TdxDBGridColumn
          Alignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'REGISTRO'
        end
        object DBGrid1Column4: TdxDBGridColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NOME'
        end
        object DBGrid1Column5: TdxDBGridColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NOMELAUDO'
        end
        object DBGrid1Column6: TdxDBGridColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CONVENIO'
        end
        object DBGrid1Column7: TdxDBGridColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MEDICOREQ'
        end
        object DBGrid1Column8: TdxDBGridColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MEDICOEXE'
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 0
    Width = 135
    Height = 19
    Panels = <>
    SimplePanel = False
  end
end
