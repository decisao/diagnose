unit regdiario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, ComCtrls, StdCtrls, TB97, TB97Tlwn, ExtCtrls, Grids,
  DBGrids, zebdbgrid, Placemnt, Menus, Db, IBQuery, IBCustomDataSet,
  IBStoredProc, DBCtrls, Mask,
  TB97Ctls, ExtDlgs, TimerLst, ToolEdit, RXDBCtrl, Mailit, IBUpdateSQL,
  IBDatabase, gridreport, ShellApi, Buttons, jpeg, DBClient, Provider,
  DOSPRINT;

type
  TformRegDiario = class(TForm)
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
    Panel3: TPanel;
    lblWhere: TLabel;
    FotoMenu: TPopupMenu;
    Colardareadetransferncia1: TMenuItem;
    Abrirdoarquivo1: TMenuItem;
    N2: TMenuItem;
    Apagar1: TMenuItem;
    OpenPictureDialog: TOpenPictureDialog;
    edtSelecionar: TEdit;
    FormStorage: TFormStorage;
    traSelecionar: TIBTransaction;
    traDetalhes: TIBTransaction;
    provSelecionar: TDataSetProvider;
    cdsSelecionar: TClientDataSet;
    Barra: TStatusBar;
    provDetalhes: TDataSetProvider;
    cdsDetalhes: TClientDataSet;
    grdDados: Tzebdbgrid;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    dedNOME: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    Grade1: TMenuItem;
    N3: TMenuItem;
    Etiquetas1: TMenuItem;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    EtiquetadoMdico1: TMenuItem;
    EtiquetadoExame1: TMenuItem;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    N4: TMenuItem;
    Laudo1: TMenuItem;
    Dock974: TDock97;
    Toolbar973: TToolbar97;
    btnArquivos: TToolbarButton97;
    Label15: TLabel;
    DBMemo1: TDBMemo;
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtSelecionarKeyPress(Sender: TObject; var Key: Char);
    procedure cmbOrdenarChange(Sender: TObject);
    procedure cmbSelecionarChange(Sender: TObject);
    procedure btnImprimirMouseEnter(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
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
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit17Enter(Sender: TObject);
    procedure DBEdit17Exit(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
    procedure qrySelecionarAfterScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure btnAdicionarMouseEnter(Sender: TObject);
    procedure btnAdicionarMouseExit(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure cdsSelecionarAfterOpen(DataSet: TDataSet);
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
    procedure Label9Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure cdsDetalhesAfterClose(DataSet: TDataSet);
    procedure Grade1Click(Sender: TObject);
    procedure Etiquetas1Click(Sender: TObject);
    procedure EtiquetadoMdico1Click(Sender: TObject);
    procedure EtiquetadoExame1Click(Sender: TObject);
    procedure Laudo1Click(Sender: TObject);
    procedure cdsSelecionarAfterScroll(DataSet: TDataSet);
    procedure btnArquivosClick(Sender: TObject);
  private
    { Private declarations }
    WhereArgDynamic: string;
    acao: TReconcileAction;
    { chamadas de rotina }
    procedure fldCODPACIENTEmudar(Sender: TField);
    procedure fldCODEXAMEmudar(Sender: TField);
    procedure fldCODCONVENIOmudar(Sender: TField);
    procedure fldCODMEDICO_REQmudar(Sender: TField);
    procedure fldCODMEDICO_EXEmudar(Sender: TField);
  public
    { Public declarations }
    inCliente: longint;
    inAgenda: integer;
    inData: TDateTime;
    procedure SetWhereDynamic(st, stmsg: string);
  end;

var
  formRegDiario: TformRegDiario;

implementation

uses data_principal, reconcile, dataregdiario, clientes, exames, convenios,
  medicos, laudo, principal, reg_files;

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
  tblCount  = 4;
  ixTabelas : array[1..tblCount] of TCampoStr =
     ( 'REGDIARIO',
       'CLIENTES',
       'EXAMES',
       'CONVENIOS' );

  { entrada no registro do Windows }
  NomeCurto = 'regdiario';

  { rotulos e nomes fisicos dos campos }
  ixMaximo  = 7;
  ixCampos  : array[1..ixMaximo] of TCampoDes =
     ( (rotulo: 'Código'      ; fisico: 'CODIGO'     ; iTab: 1; ),
       (rotulo: 'T'           ; fisico: 'TIPO'       ; iTab: 1; ),
       (rotulo: 'Registro'    ; fisico: 'CODDIARIO'  ; iTab: 1; ),
       (rotulo: 'Data/Hora'   ; fisico: 'DATA'       ; iTab: 1; ),
       (rotulo: 'Nome'        ; fisico: 'NOME'       ; iTab: 2; ),
       (rotulo: 'Exame'       ; fisico: 'NOME'       ; iTab: 3; ),
       (rotulo: 'Convênio'    ; fisico: 'NOME'       ; iTab: 4; ));

  { expressão adicional do where - não pode ser mudada em run-time }
  { para acrescentar parâmentos em run-time use SetWhereDynamic!   }
  WhereArgStatic = 'REGDIARIO.CODPACIENTE = CLIENTES.CODIGO AND ' +
    'REGDIARIO.CODEXAME = EXAMES.CODIGO AND ' +
    'REGDIARIO.CODCONVENIO = CONVENIOS.CODIGO';

  { indexes iniciais padrao para os combos }
  ixDefSel = 5;
  ixDefOrd = 4;

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

procedure TformRegDiario.SetWhereDynamic(st, stmsg: string);
begin
  WhereArgDynamic := st;
  with lblWhere do
   begin
    Visible := (stmsg > '');
    if Visible then Caption := ' ' + stmsg;
   end;
end;

procedure TformRegDiario.btnAdicionarClick(Sender: TObject);
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
     novo_registro := true;
     if dedNOME.Canfocus then dedNOME.Setfocus;
     Screen.Cursor := crDefault;
end;

procedure TformRegDiario.FormShow(Sender: TObject);
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

     if InAgenda = -1 then
      begin
       btnAdicionarClick(Sender);
       cdsDetalhes.fieldByName('TIPO').AsString := 'A';
       DBEdit3.SetFocus;
      end;

     if InAgenda > 0 then
      begin
       cmbSelecionar.ItemIndex := 0;
       edtSelecionar.Text := IntToStr(InAgenda);
       edtSelecionarKeyPress(Sender, tecla);
       cmbSelecionar.ItemIndex := pred(ixDefSel);
       edtSelecionar.Clear;
       btnModificarClick(Sender);
      end;

     Screen.Cursor := crDefault;
end;

procedure TformRegDiario.FormCreate(Sender: TObject);
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
     dmoRegDiario := TdmoRegDiario.Create(Self);

     { defino a atualização das informações }
     with formStorage do
      begin
       IniSection := NomeCurto;
       Active := True;
      end;

     { inicializo a expressão dinâmica do WHERE }
     WhereArgDynamic := '';
end;

procedure TformRegDiario.edtSelecionarKeyPress(Sender: TObject;
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
          end else btnAdicionar.Enabled := True;
        end;

       if edtPesquisar.CanFocus then edtPesquisar.SetFocus;
       Screen.Cursor := crDefault;

      end;
end;

procedure TformRegDiario.cmbOrdenarChange(Sender: TObject);
begin
     edtPesquisar.Clear;
     cdsSelecionar.IndexFieldNames :=
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico;
     if edtPesquisar.CanFocus then edtPesquisar.SetFocus;
end;

procedure TformRegDiario.cmbSelecionarChange(Sender: TObject);
begin
     edtSelecionar.Clear;
     edtSelecionar.SetFocus;
end;

procedure TformRegDiario.btnImprimirMouseEnter(Sender: TObject);
begin
//     if PrinterMenu.Items.Count = 0 then
//      btnImprimir.Enabled := False;
end;

procedure TformRegDiario.edtPesquisarChange(Sender: TObject);
begin
   if edtPesquisar.Text > '' then
    cdsSelecionar.Locate(
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico,
       edtPesquisar.Text,
       [loPartialKey]);

end;

procedure TformRegDiario.Cordalinha1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraColor;
       if Execute then
        grdDados.ZebraColor := Color;
      end;
end;

procedure TformRegDiario.Cordotexto1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraFontColor;
       if Execute then
        grdDados.ZebraFontColor := Color;
      end;
end;

procedure TformRegDiario.qrySelecionarAfterOpen(DataSet: TDataSet);
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

procedure TformRegDiario.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (cmbOrdenar.ItemIndex = 0) and (not (Key in ['0'..'9', #8])) then
       Key := chr(0);
end;








procedure TformRegDiario.btnExcluirClick(Sender: TObject);
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

     cmbOrdenarChange(Sender);
     Screen.Cursor := crDefault;
end;

procedure TformRegDiario.btnCancelarClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
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

procedure TformRegDiario.btnModificarClick(Sender: TObject);
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
     Screen.Cursor := crDefault;
end;

procedure TformRegDiario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := not cdsDetalhes.Active;
end;

procedure TformRegDiario.FormKeyDown(Sender: TObject; var Key: Word;
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

end;

procedure TformRegDiario.edtPesquisarEnter(Sender: TObject);
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

procedure TformRegDiario.edtPesquisarExit(Sender: TObject);
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

procedure TformRegDiario.btnSalvarClick(Sender: TObject);
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

     cdsDetalhes.Close;
     Screen.Cursor := crDefault;

end;

procedure TformRegDiario.DBEdit6Exit(Sender: TObject);
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

procedure TformRegDiario.DBEdit17Enter(Sender: TObject);
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

procedure TformRegDiario.DBEdit17Exit(Sender: TObject);
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

procedure TformRegDiario.grdDadosDblClick(Sender: TObject);
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

procedure TformRegDiario.qrySelecionarAfterScroll(DataSet: TDataSet);
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

procedure TformRegDiario.FormDestroy(Sender: TObject);
var
  inI: integer;
begin
     qrySelecionar.Unprepare;
     qryDetalhes.Unprepare;
     dmoRegDiario.free;

     { configuração das transações }
     for inI := 0 to Pred(ComponentCount) do
      if (Components[inI] is TIBTransaction) then
        if (Components[inI] as TIBTransaction).InTransaction then
          ShowMessage(Format('%s esta aberto!', [(Components[inI] as TIBTransaction).name]));
end;

procedure TformRegDiario.btnAdicionarMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformRegDiario.btnAdicionarMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

procedure TformRegDiario.btnEmailClick(Sender: TObject);
var
  x: string;
begin
  x := 'mailto:'+(Sender as TToolbarButton97).Hint+'?Subject=&cc=&bcc=';
  ShellExecute(0, nil, PChar(x), nil, nil, SW_SHOWDEFAULT);
end;

procedure TformRegDiario.cdsSelecionarAfterOpen(DataSet: TDataSet);
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

   (cdsSelecionar.fieldByName('DATA') as TDateTimeField).DisplayFormat := 'DD/MM/YYYY HH:NN';

   { apago a quarta coluna @!! método mágico! }
   grdDados.Columns[0].Width      := 0;
   grdDados.Columns[1].Font.Style := [fsBold];
   grdDados.Columns[2].Alignment  := taCenter;
   grdDados.Columns[3].Alignment  := taCenter;

   grdDados.Columns[4].Title.Caption := 'Nome';
   grdDados.Columns[5].Title.Caption := 'Exame';
   grdDados.Columns[6].Title.Caption := 'Convênio';
end;

procedure TformRegDiario.cdsDetalhesNewRecord(DataSet: TDataSet);
begin

  with Dataset do
   begin
    fieldByName(ixCampos[1].fisico).AsInteger :=
      dmoPrincipal.LerSequencia(ixTabelas[1]);

    if inAgenda = -1 then
      fieldByName('DATA').AsDateTime  := inData
    else
      fieldByName('DATA').AsDateTime         := now;
    fieldByName('TIPO').AsString             := 'R';
    fieldByName('TIPOPACIENTE').AsString     := 'E';
    fieldByName('QTDE_CH').AsCurrency        := 0;
    fieldByName('QTDE_FILME').AsCurrency     := 0;
    fieldByName('MATERIAL').AsCurrency       := 0;
    fieldByName('VALOR_CH').AsCurrency       := 0;
    fieldByName('VALOR_FILME').AsCurrency    := 0;
    fieldByName('QTDE_CO').AsCurrency        := 0;
    fieldByName('QTDE_HONORARIO').AsCurrency := 0;
    fieldByName('RECALCULO').AsString        := 'N';
    fieldByName('VALOR_PORTE').AsCurrency    := 0;
   end;

end;

procedure TformRegDiario.cdsDetalhesAfterOpen(DataSet: TDataSet);
begin

  with Dataset do
   begin
    fieldByName('DATA').EditMask := '99/99/99 99:99';
    (fieldByName('DATA') as TDateTimeField).DisplayFormat := 'DD/MM/YY HH:NN';

    fieldByName('CODPACIENTE').OnChange   := fldCODPACIENTEmudar;
    fieldByName('CODEXAME').OnChange      := fldCODEXAMEmudar;
    fieldByName('CODCONVENIO').OnChange   := fldCODCONVENIOmudar;
    fieldByName('CODMEDICO_REQ').OnChange := fldCODMEDICO_REQmudar;
    fieldByName('CODMEDICO_EXE').OnChange := fldCODMEDICO_EXEmudar;

    fldCODPACIENTEmudar(fieldByName('CODPACIENTE'));
    fldCODEXAMEmudar(fieldByName('CODEXAME'));
    fldCODCONVENIOmudar(fieldByName('CODCONVENIO'));
    fldCODMEDICO_REQmudar(fieldByName('CODMEDICO_REQ'));
    fldCODMEDICO_EXEmudar(fieldByName('CODMEDICO_EXE'));
   end;

  busca_local := 0;

end;

procedure TformRegDiario.fldCODPACIENTEmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRegDiario.cdsPaciente do
    begin
     if not active then open else refresh;
     if cdsDetalhes.State in [dsInsert, dsEdit] then
       cdsDetalhes.fieldByName('MATRICULA').AsString :=
         fieldByName('MATRICULA').AsString;
    end;
end;

procedure TformRegDiario.fldCODEXAMEmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRegDiario.cdsExame do
    begin
     if not active then open else refresh;
     if cdsDetalhes.State in [dsInsert, dsEdit] then
       cdsDetalhes.fieldByName('NOME_LAUDO').AsString :=
         fieldByName('NOME').AsString;
    end
end;

procedure TformRegDiario.fldCODCONVENIOmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRegDiario.cdsConvenio do
     if not active then open else refresh;
end;

procedure TformRegDiario.fldCODMEDICO_REQmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRegDiario.cdsMedico_req do
     if not active then open else refresh;
end;

procedure TformRegDiario.fldCODMEDICO_EXEmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRegDiario.cdsMedico_exe do
     if not active then open else refresh;
end;

procedure TformRegDiario.cdsDetalhesAfterPost(DataSet: TDataSet);
begin
  with (Dataset as TClientDataset) do
   if ChangeCount > 0 then
    begin
     ApplyUpdates(1);
     if not novo_registro then cdsSelecionar.refresh;
    end;
end;

procedure TformRegDiario.cdsSelecionarAfterRefresh(DataSet: TDataSet);
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

procedure TformRegDiario.cdsDetalhesAfterDelete(DataSet: TDataSet);
begin
  with (dataset as TClientDataset) do
    ApplyUpdates(1);
end;

procedure TformRegDiario.provDetalhesUpdateData(Sender: TObject;
  DataSet: TClientDataSet);
begin
  with Dataset.fieldByName('CODIGO') do
    ProviderFlags := ProviderFlags + [pfInWhere, pfInKey]; 
end;

procedure TformRegDiario.cdsDetalhesReconcileError(DataSet: TClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  acao := Action;
end;

procedure TformRegDiario.cdsDetalhesBeforePost(DataSet: TDataSet);
begin
  acao := raCorrect;
end;

procedure TformRegDiario.dedNOMEKeyPress(Sender: TObject; var Key: Char);
begin
  if (length(dedNOME.Text) > 23) and (key <> #8) then
    Key := #0;
end;

procedure TformRegDiario.Label9Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformClientes.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (cdsSelecionar.Active) then
         Self.cdsDetalhes.fieldByName('CODPACIENTE').AsInteger :=
           cdsSelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformRegDiario.Label8Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformExames.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (cdsSelecionar.Active) then
         Self.cdsDetalhes.fieldByName('CODEXAME').AsInteger :=
           cdsSelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformRegDiario.Label10Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformConvenios.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (cdsSelecionar.Active) then
         Self.cdsDetalhes.fieldByName('CODCONVENIO').AsInteger :=
           cdsSelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformRegDiario.Label11Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformMedicos.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (cdsSelecionar.Active) then
         Self.cdsDetalhes.fieldByName('CODMEDICO_REQ').AsInteger :=
           cdsSelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformRegDiario.Label12Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformMedicos.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (cdsSelecionar.Active) then
         Self.cdsDetalhes.fieldByName('CODMEDICO_EXE').AsInteger :=
           cdsSelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformRegDiario.cdsDetalhesAfterClose(DataSet: TDataSet);
begin
  with dmoRegDiario do
   begin
    with cdsPaciente do
     if active then close;
    with cdsExame do
     if active then close;
    with cdsConvenio do
     if active then close;
    with cdsMedico_req do
     if active then close;
    with cdsMedico_exe do
     if active then close;
   end;
end;

procedure TformRegDiario.Grade1Click(Sender: TObject);
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

procedure TformRegDiario.Etiquetas1Click(Sender: TObject);
var
  IniComm: string;
begin

   with dmoRegDiario.cdsEtiqueta do
    begin
     if active then Close;
     Open;
    end;

   IniComm := IniComm + #27#67 + Chr(12);

   DOSPrintOpen(ParamStr(2), IniComm, '');

   { linhas da etiqueta 1 }
   DOSPrintAdd(1, 0, 'Nome:',  '');
   DOSPrintAdd(6, 0,
       dmoRegDiario.cdsEtiqueta.fieldByname('PACIENTE').AsString, '');

   DOSPrintAdd(1, 1, 'Dr(a):', '');
   DOSPrintAdd(7, 1,
       dmoRegDiario.cdsEtiqueta.fieldByname('MEDICO').AsString,   '');

   DOSPrintAdd(1, 2, 'Data:',  '');
   DOSPrintAdd(6, 2,
       FormatDateTime('dd/mm/yyyy',
       dmoRegDiario.cdsEtiqueta.fieldByname('DATA').AsDateTime),  '');

   DOSPrintAdd(19, 2, 'No.:', '');
   DOSPrintAdd(23, 2,
       copy(dmoRegDiario.cdsEtiqueta.fieldByname('REGISTRO').AsString, 1, 7), '');

   DOSPrintAdd(1, 3, 'Convenio:', '');
   DOSPrintAdd(10, 3,
       dmoRegDiario.cdsEtiqueta.fieldByname('CONVENIO').AsString, '');


   { linhas da etiqueta 2 }
   DOSPrintAdd(1, 5, 'Nome:',  '');
   DOSPrintAdd(6, 5,
       dmoRegDiario.cdsEtiqueta.fieldByname('PACIENTE').AsString, '');

   DOSPrintAdd(1, 6, 'Exame:', '');
   DOSPrintAdd(7, 6,
       dmoRegDiario.cdsEtiqueta.fieldByname('EXAME').AsString,   '');

   DOSPrintAdd(1, 7, 'Data:',  '');
   DOSPrintAdd(6, 7,
       FormatDateTime('dd/mm/yyyy',
       dmoRegDiario.cdsEtiqueta.fieldByname('DATA').AsDateTime),  '');

   DOSPrintAdd(19, 7, 'No.:', '');
   DOSPrintAdd(23, 7,
       copy(dmoRegDiario.cdsEtiqueta.fieldByname('REGISTRO').AsString, 1, 7), '');

   DOSPrintAdd(35, 7,
       FormatDateTime('hh:nn',
       dmoRegDiario.cdsEtiqueta.fieldByname('DATA').AsDateTime),  '');

   DOSPrintAdd(1, 8,
       dmoRegDiario.cdsEtiqueta.fieldByname('CONVENIO').AsString, '');

   DOSPrintSendPage(1);
   DOSPrintClose;

end;

procedure TformRegDiario.EtiquetadoMdico1Click(Sender: TObject);
var
  IniComm: string;
begin

   with dmoRegDiario.cdsEtiqueta do
    begin
     if active then Close;
     Open;
    end;

   IniComm := IniComm + #27#67 + Chr(6);

   DOSPrintOpen(ParamStr(2), IniComm, '');

   { linhas da etiqueta 1 }
   DOSPrintAdd(1, 0, 'Nome:',  '');
   DOSPrintAdd(6, 0,
       dmoRegDiario.cdsEtiqueta.fieldByname('PACIENTE').AsString, '');

   DOSPrintAdd(1, 1, 'Dr(a):', '');
   DOSPrintAdd(7, 1,
       dmoRegDiario.cdsEtiqueta.fieldByname('MEDICO').AsString,   '');

   DOSPrintAdd(1, 2, 'Data:',  '');
   DOSPrintAdd(6, 2,
       FormatDateTime('dd/mm/yyyy',
       dmoRegDiario.cdsEtiqueta.fieldByname('DATA').AsDateTime),  '');

   DOSPrintAdd(19, 2, 'No.:', '');
   DOSPrintAdd(23, 2,
       copy(dmoRegDiario.cdsEtiqueta.fieldByname('REGISTRO').AsString, 1, 7), '');

   DOSPrintAdd(1, 3, 'Convenio:', '');
   DOSPrintAdd(10, 3,
       dmoRegDiario.cdsEtiqueta.fieldByname('CONVENIO').AsString, '');


   DOSPrintSendPage(1);
   DOSPrintClose;


end;

procedure TformRegDiario.EtiquetadoExame1Click(Sender: TObject);
var
  IniComm: string;
begin

   with dmoRegDiario.cdsEtiqueta do
    begin
     if active then Close;
     Open;
    end;

   IniComm := IniComm + #27#67 + Chr(6);

   DOSPrintOpen(ParamStr(2), IniComm, '');

   { linhas da etiqueta 2 }
   DOSPrintAdd(1, 0, 'Nome:',  '');
   DOSPrintAdd(6, 0,
       dmoRegDiario.cdsEtiqueta.fieldByname('PACIENTE').AsString, '');

   DOSPrintAdd(1, 1, 'Exame:', '');
   DOSPrintAdd(7, 1,
       dmoRegDiario.cdsEtiqueta.fieldByname('EXAME').AsString,   '');

   DOSPrintAdd(1, 2, 'Data:',  '');
   DOSPrintAdd(6, 2,
       FormatDateTime('dd/mm/yyyy',
       dmoRegDiario.cdsEtiqueta.fieldByname('DATA').AsDateTime),  '');

   DOSPrintAdd(19, 2, 'No.:', '');
   DOSPrintAdd(23, 2,
       copy(dmoRegDiario.cdsEtiqueta.fieldByname('REGISTRO').AsString, 1, 7), '');

   DOSPrintAdd(35, 2,
       FormatDateTime('hh:nn',
       dmoRegDiario.cdsEtiqueta.fieldByname('DATA').AsDateTime),  '');

   DOSPrintAdd(1, 3,
       dmoRegDiario.cdsEtiqueta.fieldByname('CONVENIO').AsString, '');

   DOSPrintSendPage(1);
   DOSPrintClose;

end;

procedure TformRegDiario.Laudo1Click(Sender: TObject);
begin
   with dmoRegDiario.cdsEtiqueta do
    begin
     if active then Close;
     Open;
    end;

  with TformLaudo.Create(Self) do
   try

     { nome do arquivo }
     arquivo := dmoPrincipal.GetTempDir +
       copy(dmoRegDiario.cdsEtiqueta.fieldByname('REGISTRO').AsString, 1, 4) +
       '_' +
       copy(dmoRegDiario.cdsEtiqueta.fieldByname('REGISTRO').AsString, 7, 2) +
       '.doc';

     { dados do registro diário }
     inRegistro := cdsSelecionar.fieldByname('CODIGO').AsInteger;
     nome     := dmoPrincipal.rmpts(dmoRegDiario.cdsEtiqueta.fieldByName('PACIENTE').AsString);
     exame    := dmoPrincipal.rmpts(dmoRegDiario.cdsEtiqueta.fieldByName('EXAME').AsString);
     convenio := dmoPrincipal.rmpts(dmoRegDiario.cdsEtiqueta.fieldByName('CONVENIO').AsString);
     medico   := dmoPrincipal.rmpts(dmoRegDiario.cdsEtiqueta.fieldByName('MEDICO').AsString);
     data     := FormatDateTime('DD "de" mmmm "de" yyyy', dmoRegDiario.cdsEtiqueta.fieldByName('DATA').AsDateTime);
     numero   := dmoPrincipal.rmpts(dmoRegDiario.cdsEtiqueta.fieldByName('REGISTRO').AsString);

     ShowModal;
   finally
     Release;
   end;
end;

procedure TformRegDiario.cdsSelecionarAfterScroll(DataSet: TDataSet);
begin
  Laudo1.Enabled := (trim(cdsSelecionar.FieldByName('CODDIARIO').AsString) > '');
end;

procedure TformRegDiario.btnArquivosClick(Sender: TObject);
begin
   if cdsSelecionar.Active then
    if not cdsSelecionar.IsEmpty then
     with TformReg_files.Create(Self) do
      try
       inCliente := Self.cdsSelecionar.fieldByName('CODIGO').AsInteger;
       SetWhereDynamic(Format('(CODREGISTRO = %d)',
        [Self.cdsSelecionar.fieldByName('CODIGO').AsInteger]),
        Format('Arquivos de %s - %s',
          [Self.cdsSelecionar.fieldByName('CODDIARIO').AsString,
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

end.
