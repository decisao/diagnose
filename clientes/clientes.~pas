unit clientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, ComCtrls, StdCtrls, TB97, TB97Tlwn, ExtCtrls, Grids,
  DBGrids, zebdbgrid, Placemnt, Menus, Db, IBQuery, IBCustomDataSet,
  IBStoredProc, DBCtrls, Mask,
  TB97Ctls, ExtDlgs, TimerLst, ToolEdit, RXDBCtrl, Mailit, IBUpdateSQL,
  IBDatabase, gridreport, ShellApi, Buttons, jpeg, DBClient, Provider;

type
  TformClientes = class(TForm)
    pgcDados: TPageControl;
    tabVisual: TTabSheet;
    tabDetalhe: TTabSheet;
    Dock975: TDock97;
    Toolbar971: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    btnSalvar: TToolbarButton97;
    btnExcluir: TToolbarButton97;
    btnCancelar: TToolbarButton97;
    Panel1: TPanel;
    Dock971: TDock97;
    ToolWindow971: TToolWindow97;
    Label1: TLabel;
    Label2: TLabel;
    cmbOrdenar: TComboBox;
    edtPesquisar: TEdit;
    Dock973: TDock97;
    ToolWindow972: TToolWindow97;
    Label3: TLabel;
    Label4: TLabel;
    cmbSelecionar: TComboBox;
    Dock972: TDock97;
    Toolbar972: TToolbar97;
    btnSair: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    btnAdicionar: TToolbarButton97;
    btnImprimir: TToolbarButton97;
    btnModificar: TToolbarButton97;
    PrinterMenu: TPopupMenu;
    qrySelecionar: TIBQuery;
    dscSelecionar: TDataSource;
    GridMenu: TPopupMenu;
    Ativarzebra1: TMenuItem;
    N1: TMenuItem;
    Cordalinha1: TMenuItem;
    Cordotexto1: TMenuItem;
    ColorDialog: TColorDialog;
    panDados: TPanel;
    qryDetalhes: TIBQuery;
    dsrDetalhes: TDataSource;
    dbnDetalhes: TDBNavigator;
    Panel2: TPanel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    dedNOME: TDBEdit;
    pgcDetalhes: TPageControl;
    tabPessoaFisica: TTabSheet;
    tabEndereco: TTabSheet;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    lblCIDADE: TLabel;
    DBEdit13: TDBEdit;
    lblESTADO: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    lblLOCALIZACAO: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Label22: TLabel;
    DBEdit19: TDBEdit;
    Label23: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit23: TDBEdit;
    Label29: TLabel;
    DBEdit24: TDBEdit;
    Label30: TLabel;
    DBEdit25: TDBEdit;
    Label32: TLabel;
    DBEdit27: TDBEdit;
    tabOutros: TTabSheet;
    Label33: TLabel;
    DBEdit28: TDBEdit;
    Label34: TLabel;
    DBMemo1: TDBMemo;
    Label35: TLabel;
    DBImage1: TDBImage;
    Panel3: TPanel;
    lblWhere: TLabel;
    FotoMenu: TPopupMenu;
    Colardareadetransferncia1: TMenuItem;
    Abrirdoarquivo1: TMenuItem;
    N2: TMenuItem;
    Apagar1: TMenuItem;
    OpenPictureDialog: TOpenPictureDialog;
    Label19: TLabel;
    DBEdit2: TDBEdit;
    Label21: TLabel;
    DBEdit30: TDBEdit;
    edtSelecionar: TEdit;
    FormStorage: TFormStorage;
    traSelecionar: TIBTransaction;
    traDetalhes: TIBTransaction;
    Dock974: TDock97;
    Toolbar973: TToolbar97;
    btnArquivos: TToolbarButton97;
    btnEmail: TToolbarButton97;
    provSelecionar: TDataSetProvider;
    cdsSelecionar: TClientDataSet;
    Barra: TStatusBar;
    TabSheet3: TTabSheet;
    dbrTipo: TDBRadioGroup;
    provDetalhes: TDataSetProvider;
    cdsDetalhes: TClientDataSet;
    grdDados: Tzebdbgrid;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtSelecionarKeyPress(Sender: TObject; var Key: Char);
    procedure cmbOrdenarChange(Sender: TObject);
    procedure cmbSelecionarChange(Sender: TObject);
    procedure btnImprimirMouseEnter(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure GridMenuPopup(Sender: TObject);
    procedure Ativarzebra1Click(Sender: TObject);
    procedure Cordalinha1Click(Sender: TObject);
    procedure Cordotexto1Click(Sender: TObject);
    procedure qrySelecionarAfterOpen(DataSet: TDataSet);
    procedure edtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPesquisarEnter(Sender: TObject);
    procedure edtPesquisarExit(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure lblESTADOClick(Sender: TObject);
    procedure lblCIDADEClick(Sender: TObject);
    procedure lblLOCALIZACAOClick(Sender: TObject);
    procedure Abrirdoarquivo1Click(Sender: TObject);
    procedure Colardareadetransferncia1Click(Sender: TObject);
    procedure Apagar1Click(Sender: TObject);
    procedure CheckCGC1Error(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit17Enter(Sender: TObject);
    procedure DBEdit17Exit(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
    procedure qrySelecionarAfterScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnAdicionarMouseEnter(Sender: TObject);
    procedure btnAdicionarMouseExit(Sender: TObject);
    procedure btnArquivosClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure cdsSelecionarAfterOpen(DataSet: TDataSet);
    procedure cdsSelecionarAfterScroll(DataSet: TDataSet);
    procedure cdsDetalhesNewRecord(DataSet: TDataSet);
    procedure cdsDetalhesAfterOpen(DataSet: TDataSet);
    procedure cdsDetalhesAfterPost(DataSet: TDataSet);
    procedure cdsSelecionarAfterRefresh(DataSet: TDataSet);
    procedure cdsDetalhesAfterDelete(DataSet: TDataSet);
    procedure provDetalhesUpdateData(Sender: TObject;
      DataSet: TClientDataSet);
    procedure cdsDetalhesReconcileError(DataSet: TClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsDetalhesBeforePost(DataSet: TDataSet);
    procedure dedNOMEKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    WhereArgDynamic: string;
    acao: TReconcileAction;
    { chamadas de rotina }
    procedure fldESTADOmudar(Sender: TField);
    procedure fldCIDADEmudar(Sender: TField);
    procedure fldLOCALIDADEmudar(Sender: TField);
    procedure fldBAIRROmudar(Sender: TField);
    procedure qryDetalhesSEXOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryDetalhesESTADOCIVILGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  public
    { Public declarations }
    inCliente: longint;
    procedure SetWhereDynamic(st, stmsg: string);
  end;

var
  formClientes: TformClientes;

implementation

uses data_principal, relacclientes, estados, cidades, localidades, newlocal,
  cli_files, reconcile;

type
  TCampoStr = string[30];
  TCampoDes = record
     rotulo, fisico: TCampoStr;
     iTab: byte;
  end;

const

{######################################################################
 #                                                                    #
 #   O CODIGO ABAIXO É O ÚNICO QUE PRECISA SER MODIFICADO!!!          #
 #                                                                    #
 #   Lembre-se, porém, do seguinte CHECKLIST:                         #
 #   1 - Modificar os parâmetros abaixo conforme a tabela usada       #
 #   2 - ...                                                          #
 #                                                                    #
 ######################################################################}

  { tabelas usadas }
  tblCount  = 1;
  ixTabelas : array[1..tblCount] of TCampoStr =
     ( 'CLIENTES' );

  { entrada no registro do Windows }
  NomeCurto = 'clientes';

  { rotulos e nomes fisicos dos campos }
  ixMaximo  = 8;
  ixCampos  : array[1..ixMaximo] of TCampoDes =
     ( (rotulo: 'Código'      ; fisico: 'CODIGO'     ; iTab: 1; ),
       (rotulo: 'Tipo'        ; fisico: 'TIPO'       ; iTab: 1; ),
       (rotulo: 'Nome'        ; fisico: 'NOME'       ; iTab: 1; ),
       (rotulo: 'email'       ; fisico: 'EMAIL'      ; iTab: 1; ),
       (rotulo: 'Telefone'    ; fisico: 'FONE'       ; iTab: 1; ),
       (rotulo: 'Celular'     ; fisico: 'CELULAR'    ; iTab: 1; ),
       (rotulo: 'RG'          ; fisico: 'RG'         ; iTab: 1; ),
       (rotulo: 'CPF'         ; fisico: 'CPF'        ; iTab: 1; ));

  { expressão adicional do where - não pode ser mudada em run-time }
  { para acrescentar parâmentos em run-time use SetWhereDynamic!   }
  WhereArgStatic = '';

  { indexes iniciais padrao para os combos }
  ixDefSel = 3;
  ixDefOrd = 3;

{######################################################################
 #                                                                    #
 #                 FINAL DO CÓDIGO CUSTOMIZÁVEL                       #
 #                                                                    #
 ######################################################################}

  { uso interno das rotinas }
  tmpSQLSel : string = '';
  tmpSQLOrd : string = '';

 var
  busca_local: byte;
  novo_registro: boolean;

{$R *.DFM}

function FldQName(i: byte): string;
begin
  result := ixTabelas[ixCampos[i].iTab] + '.' + ixCampos[i].fisico;
end;

procedure TformClientes.SetWhereDynamic(st, stmsg: string);
begin
  WhereArgDynamic := st;
  with lblWhere do
   begin
    Visible := (stmsg > '');
    if Visible then Caption := ' ' + stmsg;
   end;
end;

procedure TformClientes.btnAdicionarClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with pgcDados do
      begin
       tabDetalhe.TabVisible := True;
       tabDetalhe.Caption := 'Adicionar um registro';
       ActivePage := Pages[1];
       tabVisual.TabVisible := False;
      end;
     btnExcluir.Enabled := False;

     { código de adição vai aqui }
     qryDetalhes.ParamByName('CODIGO').Clear;
     with cdsDetalhes do
      begin
       Open;
       dbnDetalhes.BtnClick(nbInsert);
      end;

     { mostro a página do endereço }
     with pgcDetalhes do
       ActivePage := Pages[0];

     novo_registro := true;
     if dedNOME.Canfocus then dedNOME.Setfocus;
     Screen.Cursor := crDefault;
end;

procedure TformClientes.FormShow(Sender: TObject);
var
  i: byte;
  tecla: Char;
begin
     tecla := #13;

     { escondo a página de detalhes }
     tabDetalhe.TabVisible := False;

     { se existirem itens no Menu de Impressão, ligo o botão }
     if PrinterMenu.Items.Count > 0 then
       btnImprimir.DropDownMenu := PrinterMenu;

     { carrego os combos com as opções }
     cmbSelecionar.Clear;
     cmbOrdenar.Clear;
     for i := 1 to ixMaximo do
      begin
         cmbOrdenar.Items.Add(ixCampos[i].rotulo);
         cmbSelecionar.Items.Add(ixCampos[i].rotulo);
      end;
     cmbOrdenar.ItemIndex := pred(ixDefOrd);
     cmbSelecionar.ItemIndex := pred(ixDefSel);

     { desativo os botões - nenhuma seleção inicial }
     btnAdicionar.Enabled := True;
     btnModificar.Enabled := False;
     btnImprimir.Enabled  := False;

     { desativo a ordenação e pesquisa }
     cmbOrdenar.Enabled := False;
     edtPesquisar.Enabled := False;

     { desativo a grid }
     grdDados.Visible := False;

     { forço atualização }
     cmbSelecionarChange(Sender);

     { verifico se existe JumpStart }
     if inCliente > 0 then
      begin
       cmbSelecionar.ItemIndex := 0;
       edtSelecionar.text := IntToStr(inCliente);
       edtSelecionarKeyPress(Sender, tecla);
       cmbSelecionar.ItemIndex := pred(ixDefSel);
       edtSelecionar.Text := '';
       btnModificarClick(Sender);
      end;

     Screen.Cursor := crDefault;
end;

procedure TformClientes.FormCreate(Sender: TObject);
var
  inI: integer;
begin
     { configuração das transações }
//     for inI := 0 to Pred(ComponentCount) do
//      if (Components[inI] is TIBTransaction) then
//       begin
//        dmoPrincipal.config_transacao(Components[inI] as TIBTransaction);
//        ShowMessage((Components[inI] as TIBTransaction).TPB);
//       end;
       
     { inicializo o JumpStart }
     inCliente := 0;

     { crio o módulo de dados do relacionamento }
     dmoRelacClientes := TdmoRelacClientes.Create(Self);

     { defino a atualização das informações }
     with formStorage do
      begin
       IniSection := NomeCurto;
       Active := True;
      end;

     { inicializo a expressão dinâmica do WHERE }
     WhereArgDynamic := '';
end;

procedure TformClientes.edtSelecionarKeyPress(Sender: TObject;
  var Key: Char);
var
  i, sel: byte;
  StrSQL: string;
begin
     if (cmbSelecionar.ItemIndex = 0) and (not (Key in ['0'..'9', #8, #13])) then
       Key := chr(0);

     { se foi apertado enter }
     if (key = #13) and (edtSelecionar.Text > '') then
      begin

       Screen.Cursor := crHourGlass;
       sel := succ(cmbSelecionar.ItemIndex);
       with qrySelecionar do
        begin

         { cláusula SELECT }
         StrSQL := 'SELECT ';
         for i := 1 to ixMaximo do
          begin
           StrSQL := StrSQL + ixTabelas[ixCampos[i].iTab] + '.' +
             ixCampos[i].fisico;
           if i < ixMaximo then StrSQL := StrSQL + ', '
             else StrSQL := StrSQL + ' ';
          end;

         { cláusula FROM }
         StrSQL := StrSQL + 'FROM ';
         for i := 1 to tblCount do
          begin
           StrSQL := StrSQL + ixTabelas[i];
           if i < tblCount then StrSQL := StrSQL + ', '
             else StrSQL := StrSQL + ' ';
          end;

         { cláusula WHERE }
         { ATENÇÃO: ESSA ROTINA FOI MODIFICADA PARA FUNCIONAR
           EXPRESSAO+ E CAMPO NOME (sel=1) USANDO SOUNDBYTES  }
         if (Pos('+', edtSelecionar.Text) > 0) and (sel = 2) then
          StrSQL := StrSQL + ' WHERE (SOUNDBYTES = ' +
            IntToStr(dmoPrincipal.SoundBts(PChar(edtSelecionar.Text))) +
            ')' else
          begin
            { ROTINA COMUM }
            StrSQL := StrSQL + ' WHERE (' +
              ixTabelas[ixCampos[sel].iTab] + '.' + ixCampos[sel].fisico;
            if sel > 1 then StrSQL := StrSQL + ' LIKE ''' +
                dmoPrincipal.Coringa(edtSelecionar.Text) + ''')'
              else StrSQL := StrSQL + ' = ' + edtSelecionar.Text + ')';
          end;

         { argumento especial do WHERE }
         if WhereArgStatic > '' then
           StrSQL := StrSQL + ' AND (' + WhereArgStatic + ')';
         if WhereArgDynamic > '' then
           StrSQL := StrSQL + ' AND (' + WhereArgDynamic + ')';

         { salvo antes do ORDER BY }
         tmpSQLSel := StrSQL;

         { cláusula ORDER BY }
         tmpSQLOrd := ' ORDER BY ' +
            ixTabelas[ixCampos[succ(cmbOrdenar.ItemIndex)].iTab] + '.' +
            ixCampos[succ(cmbOrdenar.ItemIndex)].fisico;

         SQL.Clear;
         SQL.Add(tmpSQLSel + tmpSQLOrd);
         open;

         with cdsSelecionar do
          begin
           if active then close;
           open;
          end;

         if not cdsSelecionar.IsEmpty then
          begin
           btnAdicionar.Enabled := True;
           btnModificar.Enabled := True;
           btnImprimir.Enabled  := True;
           edtPesquisar.Enabled := True;
           cmbOrdenar.Enabled   := True;
           grdDados.Visible     := True;
          end else btnAdicionar.Enabled := True;
        end;

       if edtPesquisar.CanFocus then edtPesquisar.SetFocus;
       Screen.Cursor := crDefault;

      end;
end;

procedure TformClientes.cmbOrdenarChange(Sender: TObject);
begin
     edtPesquisar.Clear;
     cdsSelecionar.IndexFieldNames :=
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico;
     if edtPesquisar.CanFocus then edtPesquisar.SetFocus;
end;

procedure TformClientes.cmbSelecionarChange(Sender: TObject);
begin
     edtSelecionar.Clear;
     edtSelecionar.SetFocus;
end;

procedure TformClientes.btnImprimirMouseEnter(Sender: TObject);
begin
//     if PrinterMenu.Items.Count = 0 then
//      btnImprimir.Enabled := False;
end;

procedure TformClientes.edtPesquisarChange(Sender: TObject);
begin
   if edtPesquisar.Text > '' then
    cdsSelecionar.Locate(
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico,
       edtPesquisar.Text,
       [loPartialKey]);

end;

procedure TformClientes.GridMenuPopup(Sender: TObject);
begin
     AtivarZebra1.Checked := grdDados.Zebra;
end;

procedure TformClientes.Ativarzebra1Click(Sender: TObject);
begin
     grdDados.Zebra := not grdDados.Zebra;
end;

procedure TformClientes.Cordalinha1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraColor;
       if Execute then
        grdDados.ZebraColor := Color;
      end;
end;

procedure TformClientes.Cordotexto1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraFontColor;
       if Execute then
        grdDados.ZebraFontColor := Color;
      end;
end;

procedure TformClientes.qrySelecionarAfterOpen(DataSet: TDataSet);
var
  i: byte;
begin
//     qrySelecionar.tag := 0;
//     { preencho os nomes reais dos campos }
//     for i := 1 to ixMaximo do
//        qrySelecionar.fieldByName(ixCampos[i].fisico).DisplayLabel :=
//          ixCampos[i].rotulo;
//
//     { apago a quarta coluna @!! método mágico! }
//     grdDados.Columns[1].Alignment  := taCenter;
//     grdDados.Columns[1].Font.Style := [fsBold, fsItalic];
//     grdDados.Columns[3].Width      := 0;
end;

procedure TformClientes.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (cmbOrdenar.ItemIndex = 0) and (not (Key in ['0'..'9', #8])) then
       Key := chr(0);
end;








procedure TformClientes.btnExcluirClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     { salvo o registro }
     dbnDetalhes.BtnClick(nbDelete);
     cdsDetalhes.Close;

     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
      end;

     with dmoRelacClientes do
      begin
       cdsEstado.Close;
       cdsCidades.Close;
       cdsLocalidades.Close;
      end;

     cmbOrdenarChange(Sender);
     Screen.Cursor := crDefault;
end;

procedure TformClientes.btnCancelarClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
      end;

     with dmoRelacClientes do
      begin
       cdsEstado.Close;
       cdsCidades.Close;
       cdsLocalidades.Close;
      end;

     { cancelo o registro }
     if cdsDetalhes.State = dsInsert then
       dmoPrincipal.CancelarSequencia(ixTabelas[1],
         cdsDetalhes.fieldByName(ixCampos[1].fisico).asInteger);
     dbnDetalhes.BtnClick(nbCancel);
     cdsDetalhes.Close;

     if novo_registro then
       novo_registro := false;

     Screen.Cursor := crDefault;
end;

procedure TformClientes.btnModificarClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with pgcDados do
      begin
       tabDetalhe.TabVisible := True;
       tabDetalhe.Caption := 'Modificar um registro';
       ActivePage := Pages[1];
       tabVisual.TabVisible := False;
      end;
     btnExcluir.Enabled := True;

     { código de edição vai aqui }
     qryDetalhes.paramByName('CODIGO').AsInteger :=
       cdsSelecionar.fieldByName('CODIGO').AsInteger;
     with cdsDetalhes do
       Open;

     dbnDetalhes.BtnClick(nbEdit);


     { mostro a página do endereço }
     with pgcDetalhes do
       ActivePage := Pages[1];

     Screen.Cursor := crDefault;
end;

procedure TformClientes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := not cdsDetalhes.Active;
end;

procedure TformClientes.fldESTADOmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRelacClientes do
    begin
     qryEstado.ParamByName('SIGLA').AsString := Sender.AsString;
     with cdsEstado do
       if not active then open else refresh;
    end;
end;

procedure TformClientes.fldCIDADEmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRelacClientes do
    begin
     with qryCidades do
      begin
       ParamByName('CODIGO').AsInteger := Sender.AsInteger;
       ParamByName('ESTADO').AsString :=
          cdsDetalhes.fieldByName('ESTADO').AsString;
      end;
     with cdsCidades do
       if not active then open else refresh;
    end;
end;

procedure TformClientes.fldLOCALIDADEmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRelacClientes do
    begin
     with qryLocalidades do
      begin
       ParamByName('CODIGO').AsInteger := Sender.AsInteger;
       ParamByName('CIDADE').AsInteger :=
          cdsDetalhes.fieldByName('CIDADE').AsInteger;
       ParamByName('ESTADO').AsString :=
          cdsDetalhes.fieldByName('ESTADO').AsString;
      end;
     with cdsLocalidades do
       if not active then open else refresh;
     if cdsDetalhes.State in [dsInsert, dsEdit] then
       cdsDetalhes.fieldByName('BAIRRO').AsInteger :=
         cdsLocalidades.fieldByName('BAIRRO').AsInteger;
    end;
end;

procedure TformClientes.fldBAIRROmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRelacClientes do
    begin
     with qryBairros do
      begin
       ParamByName('CODIGO').AsInteger := Sender.AsInteger;
       ParamByName('CIDADE').AsInteger :=
          cdsDetalhes.fieldByName('CIDADE').AsInteger;
       ParamByName('ESTADO').AsString :=
          cdsDetalhes.fieldByName('ESTADO').AsString;
      end;
     with cdsBairros do
       if not active then open else refresh;
    end;
end;

procedure TformClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  atag: byte;
begin
     if key = vk_escape then
       if cdsDetalhes.Active then btnCancelarClick(Sender) else
        begin
         Self.ModalResult := mrCancel;
        end;

     if not cdsDetalhes.Active then
      begin
       case key of
        vk_F2: btnAdicionarClick(Sender);
        vk_F3: btnModificarClick(Sender);
       end;
      end else
      begin
       case key of
        vk_f2: begin
                if busca_local > 0 then
                 with TformNovaLocalidade.Create(Self) do
                  try
                   inCidade := cdsDetalhes.fieldByName('CIDADE').AsInteger;
                   stEstado := cdsDetalhes.fieldByName('ESTADO').AsString;
                   stCidade := dmoRelacClientes.cdsCidades.fieldByName('CIDADE').AsString;
                   inLocal  := 0;
                   ShowModal;
                   if inLocal > 0 then cdsDetalhes.FieldByName('LOCALIZACAO').AsInteger := inLocal;
                  finally
                   release;
                  end;
               end;
        vk_F9: btnSalvarClick(Sender);
       end;
      end;

     if ActiveControl = nil then atag := 0 else
       atag := ActiveControl.Tag;

     if (key = vk_Return) and (atag < 3) then
      if shift = [] then Perform(wm_NextDlgCtl, 0, 0) else
       if shift = [ssShift] then Perform(wm_NextDlgCtl, 0, 0);

     if not odd(atag) then
      begin
       case key of
        vk_Down: Perform(wm_NextDlgCtl, 0, 0);
        vk_Up: Perform(wm_NextDlgCtl, 1, 0);
       end;
       if (atag = 2) and (key = vk_return) then key := 34; 
      end;

     if key = 34 then
       with pgcDetalhes do
         ActivePage := FindNextPage(ActivePage, True, True);
     if key = 33 then
       with pgcDetalhes do
         ActivePage := FindNextPage(ActivePage, False, True);

     if qryDetalhes.Active and (Shift = [ssCtrl]) then
      case Key of
       69: lblESTADOClick(Sender);
       67: lblCIDADEClick(Sender);
       76: lblLOCALIZACAOClick(Sender);
      end;
end;

procedure TformClientes.edtPesquisarEnter(Sender: TObject);
begin
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clInfoBK;
       TEdit(Sender).Font.Style := [fsBold];
      end;
     if Sender is TDBEdit then
      begin
       TDBEdit(Sender).Color := clInfoBK;
       TDBEdit(Sender).Font.Style := [fsBold];
      end;
     if Sender is TDBMemo then
      begin
       TDBMemo(Sender).Color := clInfoBK;
       TDBMemo(Sender).Font.Style := [fsBold];
      end;
end;

procedure TformClientes.edtPesquisarExit(Sender: TObject);
begin
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clWindow;
       TEdit(Sender).Font.Style := [];
      end;
     if Sender is TDBEdit then
      begin
       TDBEdit(Sender).Color := clWindow;
       TDBEdit(Sender).Font.Style := [];
      end;
     if Sender is TDBMemo then
      begin
       TDBMemo(Sender).Color := clWindow;
       TDBMemo(Sender).Font.Style := [];
      end;
end;

procedure TformClientes.btnSalvarClick(Sender: TObject);
const
  myEnter: Char = #13;
begin
     Screen.Cursor := crHourGlass;
     { salvo o registro }
     cdsDetalhes.Post;
     if acao in [raSkip, raAbort] then
      begin
       cdsDetalhes.edit;
       Screen.Cursor := crDefault;
       exit;
      end;


     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
      end;

     { verifico se é necessario ativar o grid }
     if (not grdDados.Visible) or novo_registro then
      begin
       novo_registro := false;
       cmbSelecionar.ItemIndex := 0;
       edtSelecionar.Text := cdsDetalhes.fieldByName(ixCampos[1].fisico).asstring;
       edtSelecionarKeyPress(Sender, myEnter);
       cmbSelecionar.ItemIndex := pred(ixDefSel);
       edtSelecionar.Clear;
      end;

     with dmoRelacClientes do
      begin
       cdsEstado.Close;
       cdsCidades.Close;
       cdsLocalidades.Close;
      end;

     cdsDetalhes.Close;
     Screen.Cursor := crDefault;

end;

procedure TformClientes.lblESTADOClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformEstados.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.cdsDetalhes.fieldByName('ESTADO').AsString :=
           qrySelecionar.fieldByName('SIGLA').AsString;
      finally
       release;
      end;
end;

procedure TformClientes.lblCIDADEClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformCidades.Create(Self) do
      try
       SetWhereDynamic(Format('(ESTADO = ''%s'')',
         [Self.cdsDetalhes.fieldByName('ESTADO').AsString]),
         Format('Cidades no estado "%s"',
         [Self.cdsDetalhes.fieldByName('ESTADO').AsString]));
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.cdsDetalhes.fieldByName('CIDADE').AsString :=
           qrySelecionar.fieldByName('CODIGO').AsString;
      finally
       release;
      end;
end;

procedure TformClientes.lblLOCALIZACAOClick(Sender: TObject);
var
  nova: boolean;
begin
     Screen.Cursor := crHourGlass;
     inc(busca_local);
     nova := false;
     with TformLocalidades.Create(Self) do
      try
       SetWhereDynamic(Format('(ESTADO = ''%s'') AND ' +
         '(CIDADE = %d)',
         [Self.cdsDetalhes.fieldByName('ESTADO').AsString,
          Self.cdsDetalhes.fieldByName('CIDADE').AsInteger]),
         Format('Localidades para %s - %s',
         [Trim(dmoRelacClientes.cdsCidades.fieldByName('CIDADE').AsString),
          Self.cdsDetalhes.fieldByName('ESTADO').AsString]));
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        begin
         Self.cdsDetalhes.fieldByName('LOCALIZACAO').AsString :=
           qrySelecionar.fieldByName('CODIGO').AsString;
         nova := not (qrySelecionar.fieldByName('CODIGO').AsString > '');
        end;
      finally
       release;
      end;

     if nova then
       with TformNovaLocalidade.Create(Self) do
        try
         inCidade := cdsDetalhes.fieldByName('CIDADE').AsInteger;
         stEstado := cdsDetalhes.fieldByName('ESTADO').AsString;
         stCidade := dmoRelacClientes.cdsCidades.fieldByName('CIDADE').AsString;
         inLocal  := 0;
         ShowModal;
         if inLocal > 0 then cdsDetalhes.FieldByName('LOCALIZACAO').AsInteger := inLocal;
        finally
         release;
        end;

end;

procedure TformClientes.Abrirdoarquivo1Click(Sender: TObject);
begin
  with OpenPictureDialog do
   if Execute then
     DBImage1.Picture.LoadFromFile(FileName);
end;

procedure TformClientes.Colardareadetransferncia1Click(Sender: TObject);
begin
     DBImage1.PasteFromClipboard;
end;

procedure TformClientes.Apagar1Click(Sender: TObject);
begin
        DBImage1.CutToClipboard;
end;




procedure TformClientes.CheckCGC1Error(Sender: TObject);
begin
     ShowMessage('O CNPJ digitado não é um CNPJ válido.');
end;

procedure TformClientes.DBEdit6Exit(Sender: TObject);
begin
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clWindow;
       TEdit(Sender).Font.Style := [];
      end;
     if Sender is TDBEdit then
      begin
       TDBEdit(Sender).Color := clWindow;
       TDBEdit(Sender).Font.Style := [];
      end;
     if Sender is TDBMemo then
      begin
       TDBMemo(Sender).Color := clWindow;
       TDBMemo(Sender).Font.Style := [];
      end;
end;

procedure TformClientes.DBEdit17Enter(Sender: TObject);
begin
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clInfoBK;
       TEdit(Sender).Font.Style := [fsBold];
      end;
     if Sender is TDBEdit then
      begin
       TDBEdit(Sender).Color := clInfoBK;
       TDBEdit(Sender).Font.Style := [fsBold];
      end;
     if Sender is TDBMemo then
      begin
       TDBMemo(Sender).Color := clInfoBK;
       TDBMemo(Sender).Font.Style := [fsBold];
      end;

     { AutoStart }
     if cdsDetalhes.fieldByName('LOCALIZACAO').AsString = '' then
       lblLOCALIZACAOClick(Sender);
end;

procedure TformClientes.DBEdit17Exit(Sender: TObject);
begin
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clWindow;
       TEdit(Sender).Font.Style := [];
      end;
     if Sender is TDBEdit then
      begin
       TDBEdit(Sender).Color := clWindow;
       TDBEdit(Sender).Font.Style := [];
      end;
     if Sender is TDBMemo then
      begin
       TDBMemo(Sender).Color := clWindow;
       TDBMemo(Sender).Font.Style := [];
      end;
end;

procedure TformClientes.grdDadosDblClick(Sender: TObject);
var
  scap: string;
begin
  scap := Caption;
  if Pos('->', scap) > 0 then
   begin
    scap := copy(scap, Pos('->', scap) + 2, length(scap) - Pos('->', scap) - 1);
    if Pos('->', scap) > 0 then
      ModalResult := mrOk;
   end;
end;

procedure TformClientes.qrySelecionarAfterScroll(DataSet: TDataSet);
begin
//   if not Dataset.fieldByName('EMAIL').IsNull then
//    begin
//      btnEmail.Hint      := Trim(Dataset.fieldByName('EMAIL').AsString);
//      btnEmail.Visible   := True;
//    end else
//    begin
//      btnEmail.Hint      := '';
//      btnEmail.Visible   := False;
//    end;
end;

procedure TformClientes.qryDetalhesSEXOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := Trim(Sender.AsString);
end;

procedure TformClientes.qryDetalhesESTADOCIVILGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := Trim(Sender.AsString);
end;

procedure TformClientes.FormDestroy(Sender: TObject);
var
  inI: integer;
begin
     qrySelecionar.Unprepare;
     qryDetalhes.Unprepare;
     dmoRelacClientes.free;

     { configuração das transações }
     for inI := 0 to Pred(ComponentCount) do
      if (Components[inI] is TIBTransaction) then
        if (Components[inI] as TIBTransaction).InTransaction then
          ShowMessage(Format('%s esta aberto!', [(Components[inI] as TIBTransaction).name]));
end;

procedure TformClientes.btnImprimirClick(Sender: TObject);
begin
   with TformGridReport.Create(Self) do
    try
      DBGrid1.DataSource := Self.dscSelecionar;
      titulo := Self.Caption;
      showmodal;
    finally
      release;
    end;

end;

procedure TformClientes.btnAdicionarMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformClientes.btnAdicionarMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

procedure TformClientes.btnArquivosClick(Sender: TObject);
begin

   if cdsSelecionar.Active then
    if not cdsSelecionar.IsEmpty then
     with TformCli_files.Create(Self) do
      try
       inCliente := Self.cdsSelecionar.fieldByName('CODIGO').AsInteger;
       SetWhereDynamic(Format('(CODCLIENTE = %d)',
        [Self.cdsSelecionar.fieldByName('CODIGO').AsInteger]),
        Format('Arquivos de %d - %s',
          [Self.cdsSelecionar.fieldByName('CODIGO').AsInteger,
          Self.cdsSelecionar.fieldByName('NOME').AsString]));
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        { calcular a soma aqui }
        beep;

      finally
       release;
      end;

end;

procedure TformClientes.btnEmailClick(Sender: TObject);
var
  x: string;
begin
  x := 'mailto:'+(Sender as TToolbarButton97).Hint+'?Subject=&cc=&bcc=';
  ShellExecute(0, nil, PChar(x), nil, nil, SW_SHOWDEFAULT);
end;

procedure TformClientes.cdsSelecionarAfterOpen(DataSet: TDataSet);
var
  i: byte;
begin

  { trato o resultado das tabelas e exibo }
  with qrySelecionar do
   begin
    if cdsSelecionar.RecordCount > 1 then
       Barra.SimpleText := Format('Exibindo %d registros', [cdsSelecionar.RecordCount])
    else if cdsSelecionar.RecordCount = 1 then
       Barra.SimpleText := 'Exibindo 1 registro'
    else Barra.SimpleText := 'Nenhum registro encontrado.';
    if active then
     begin
      close;
      Barra.SimpleText := Barra.SimpleText +
        ' - os excedentes foram ignorados!';
     end;
   end;

   { preencho os nomes reais dos campos }
   for i := 1 to ixMaximo do
     cdsSelecionar.fieldByName(ixCampos[i].fisico).DisplayLabel :=
       ixCampos[i].rotulo;

   { apago a quarta coluna @!! método mágico! }
   grdDados.Columns[1].Alignment  := taCenter;
   grdDados.Columns[1].Font.Style := [fsBold, fsItalic];
   grdDados.Columns[3].Width      := 0;

end;

procedure TformClientes.cdsSelecionarAfterScroll(DataSet: TDataSet);
begin
  if not Dataset.fieldByName('EMAIL').IsNull then
   begin
    btnEmail.Hint      := Trim(Dataset.fieldByName('EMAIL').AsString);
    btnEmail.Visible   := True;
   end else
   begin
    btnEmail.Hint      := '';
    btnEmail.Visible   := False;
   end;
end;

procedure TformClientes.cdsDetalhesNewRecord(DataSet: TDataSet);
begin

  with Dataset do
   begin
    fieldByName(ixCampos[1].fisico).AsInteger :=
      dmoPrincipal.LerSequencia(ixTabelas[1]);

    { valores iniciais }
    fieldByName('DATACADAST').AsDateTime :=
      dmoPrincipal.GetServerTime;
    fieldByName('SOUNDBYTES').AsInteger := 0;

    fieldByName('ESTADO').AsString := 'SP';
    fieldByName('CIDADE').AsInteger := 83178;

    fieldByName('NOMEUSER').AsString := 'CLI' + IntToStr(
       fieldByName('CODIGO').AsInteger);
    fieldByName('TIPO').AsString := 'C';

   end;

end;

procedure TformClientes.cdsDetalhesAfterOpen(DataSet: TDataSet);
begin

     { mascaras }
     with Dataset do
      begin
       fieldByName('DATANASC').EditMask := '99/99/9999';
       fieldByName('CPF').EditMask := '999.999.999-99';
       fieldByName('DATACADAST').EditMask := '99/99/9999';
       fieldByName('FONE').EditMask := '(99)c999-9999';
       fieldByName('FAX').EditMask := '(99)c999-9999';
       fieldByName('CELULAR').EditMask := '(99)c999-9999';
       fieldByName('RG').EditMask := '999999999999999';
       fieldByName('ORGAOEXP').EditMask := 'CCC/CC';

       { rotinas de chamada }
       fieldByName('ESTADO').OnChange       := fldESTADOmudar;
       fieldByName('CIDADE').OnChange       := fldCIDADEmudar;
       fieldByName('LOCALIZACAO').OnChange  := fldLOCALIDADEmudar;
       fieldByName('BAIRRO').OnChange       := fldBAIRROmudar;
       fieldByName('SEXO').OnGetText        := qryDetalhesSEXOGetText;
       fieldByName('ESTADOCIVIL').OnGetText := qryDetalhesESTADOCIVILGetText;

       { forço a primeira chamada }
       fldESTADOmudar(fieldByName('ESTADO'));
       fldCIDADEmudar(fieldByName('CIDADE'));
       fldLOCALIDADEmudar(fieldByName('LOCALIZACAO'));
       fldBAIRROmudar(fieldByName('BAIRRO'));

      end;

     busca_local := 0;

end;

procedure TformClientes.cdsDetalhesAfterPost(DataSet: TDataSet);
begin
  with (Dataset as TClientDataset) do
   if ChangeCount > 0 then
    begin
     ApplyUpdates(1);
     if not novo_registro then cdsSelecionar.refresh;
    end;
end;

procedure TformClientes.cdsSelecionarAfterRefresh(DataSet: TDataSet);
begin
  with qrySelecionar do
   begin
    if cdsSelecionar.RecordCount > 1 then
       Barra.SimpleText := Format('Exibindo %d registros', [cdsSelecionar.RecordCount])
    else if cdsSelecionar.RecordCount = 1 then
       Barra.SimpleText := 'Exibindo 1 registro'
    else Barra.SimpleText := 'Nenhum registro encontrado.';
    if active then
     begin
      close;
      Barra.SimpleText := Barra.SimpleText +
        ' - os excedentes foram ignorados!';
     end;
   end;
end;

procedure TformClientes.cdsDetalhesAfterDelete(DataSet: TDataSet);
begin
  with (dataset as TClientDataset) do
    ApplyUpdates(1);
end;

procedure TformClientes.provDetalhesUpdateData(Sender: TObject;
  DataSet: TClientDataSet);
begin
  with Dataset.fieldByName('CODIGO') do
    ProviderFlags := ProviderFlags + [pfInWhere, pfInKey]; 
end;

procedure TformClientes.cdsDetalhesReconcileError(DataSet: TClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  acao := Action;
end;

procedure TformClientes.cdsDetalhesBeforePost(DataSet: TDataSet);
begin
  acao := raCorrect;
end;

procedure TformClientes.dedNOMEKeyPress(Sender: TObject; var Key: Char);
begin
  if (length(dedNOME.Text) > 23) and (key <> #8) then
    Key := #0;
end;

end.
