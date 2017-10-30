unit principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TimerLst, ComCtrls, Menus, RxCalc, RxGrdCpt, Placemnt, RXShell, ExtCtrls,
  TB97Tlbr, TB97Ctls, TB97, SpeedBar, StdCtrls, Just1_32, db, ImgList, 
  Grids, DBGrids, IBSQLMonitor, RxMemDS, zebdbgrid, dxTL, dxDBCtrl,
  dxDBGrid, dxCntner, DBCtrls, Mask, ToolEdit, PlannerCal, ppBands,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, IBCustomDataSet, IBQuery, IBDatabase, auHTTP,
  auAutoUpgrader;

const
  CM_FORMSETUP = WM_USER + 1;

type
  TformPrincipal = class(TForm)
    MenuPrincipal: TMainMenu;
    Sistema1: TMenuItem;
    Sair1: TMenuItem;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Calculadora: TRxCalculator;
    FormStorage: TFormStorage;
    StatusBar1: TStatusBar;
    Relogio: TTimer;
    Ferramentas1: TMenuItem;
    Dock975: TDock97;
    Toolbar971: TToolbar97;
    btpClientes: TToolbarButton97;
    btpAjuda: TToolbarButton97;
    btpRelatorios: TToolbarButton97;
    PainelCor: TPanel;
    MenuContexto: TPopupMenu;
    Cordefundo1: TMenuItem;
    ColorDialog: TColorDialog;
    Seqncia1: TMenuItem;
    MenuOff: TMainMenu;
    Conectar1: TMenuItem;
    btpConectar: TToolbarButton97;
    Desconectar1: TMenuItem;
    PrintDialog: TPrintDialog;
    ToolbarSep974: TToolbarSep97;
    ToolbarSep975: TToolbarSep97;
    ToolbarSep976: TToolbarSep97;
    imgMenu: TImageList;
    Mdicos1: TMenuItem;
    Convnios1: TMenuItem;
    Exames1: TMenuItem;
    TabelasAMB1: TMenuItem;
    RegistroDirio1: TMenuItem;
    Setores1: TMenuItem;
    Dock972: TDock97;
    Toolbar972: TToolbar97;
    btnSair: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    btnAdicionar: TToolbarButton97;
    btnImprimir: TToolbarButton97;
    btnModificar: TToolbarButton97;
    Panel1: TPanel;
    PlannerCalendarGroup1: TPlannerCalendarGroup;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DateEdit: TDateEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel4: TPanel;
    DBGrid1: TdxDBGrid;
    DBGrid1Column1: TdxDBGridColumn;
    DBGrid1Column2: TdxDBGridColumn;
    DBGrid1Column3: TdxDBGridColumn;
    DBGrid1Column4: TdxDBGridColumn;
    DBGrid1Column5: TdxDBGridColumn;
    DBGrid1Column6: TdxDBGridColumn;
    DBGrid1Column7: TdxDBGridColumn;
    DBGrid1Column8: TdxDBGridColumn;
    traAgenda: TIBTransaction;
    qryAgenda: TIBQuery;
    dsrAgenda: TDataSource;
    traSetor: TIBTransaction;
    qrySetor: TIBQuery;
    qrySetorCODIGO: TIntegerField;
    qrySetorNOME: TIBStringField;
    dsrSetor: TDataSource;
    ppDBPipeline: TppDBPipeline;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    qryAgendaCODIGO: TIntegerField;
    qryAgendaHORA: TTimeField;
    qryAgendaHORAEXAME: TTimeField;
    qryAgendaREGISTRO: TIBStringField;
    qryAgendaNOME: TIBStringField;
    qryAgendaSETOR: TIBStringField;
    qryAgendaREALIZADO: TIBStringField;
    qryAgendaEXAME: TIBStringField;
    qryAgendaINDICE: TIntegerField;
    qryAgendaCONVENIO: TIBStringField;
    qryAgendaMEDICOREQ: TIBStringField;
    qryAgendaMEDICOEXE: TIBStringField;
    qryAgendaNOMELAUDO: TIBStringField;
    Panel5: TPanel;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    Reclculodosregistros1: TMenuItem;
    auAutoUpgrader: TauAutoUpgrader;
    auHTTPupd: TauHTTP;
    Verificaratualizao1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Configuraes1: TMenuItem;
    Portes1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure RelogioTimer(Sender: TObject);
    procedure Localidades1Click(Sender: TObject);
    procedure btpClientesClick(Sender: TObject);
    procedure View2BtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btpRelatoriosClick(Sender: TObject);
    procedure Cordefundo1Click(Sender: TObject);
    procedure Seqncia1Click(Sender: TObject);
    procedure Conectar1Click(Sender: TObject);
    procedure btpConectarClick(Sender: TObject);
    procedure Desconectar1Click(Sender: TObject);
    procedure Relatrioexplorer1Click(Sender: TObject);
    procedure btpAjudaMouseEnter(Sender: TObject);
    procedure btpAjudaMouseExit(Sender: TObject);
    procedure Mdicos1Click(Sender: TObject);
    procedure Convnios1Click(Sender: TObject);
    procedure Exames1Click(Sender: TObject);
    procedure TabelasAMB1Click(Sender: TObject);
    procedure RegistroDirio1Click(Sender: TObject);
    procedure Agenda1Click(Sender: TObject);
    procedure Setores1Click(Sender: TObject);
    procedure qryAgendaBeforeOpen(DataSet: TDataSet);
    procedure DBGrid1CustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure btnModificarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure qrySetorAfterOpen(DataSet: TDataSet);
    procedure btnAdicionarClick(Sender: TObject);
    procedure qryAgendaAfterOpen(DataSet: TDataSet);
    procedure btnSairClick(Sender: TObject);
    procedure PlannerCalendarGroup1DaySelect(Sender: TObject;
      SelDate: TDateTime);
    procedure DateEditKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure Reclculodosregistros1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Verificaratualizao1Click(Sender: TObject);
    procedure auAutoUpgraderEndUpgrade(Sender: TObject);
    procedure auAutoUpgraderNoUpdateAvailable(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure Portes1Click(Sender: TObject);
  private
    { Private declarations }
    procedure FormStart(var Message: TMessage); message CM_FORMSETUP;
    procedure DisplayHint(Sender: TObject);
    procedure EsconderBotoes;
    procedure MostrarBotoes;
    procedure Desconectar;
  public
    timelogoff,
    maxtimelogoff: integer;
    contlogoff: boolean;
    { Public declarations }
    procedure LoadProfile;
    procedure UseIn;
    procedure UseOut;
  end;

var
  formPrincipal: TformPrincipal;

implementation

uses clientes, relaclocalidades, localidades, estados, data_principal, sequencia,
  medicos, convenios, exames, tabamb, regdiario, agenda, setores, recalculo,
  config, portes;

{$R *.DFM}

procedure TformPrincipal.FormStart(var Message: TMessage);
var
  dia, mes, ano: word;
begin

  LoadProfile;
  UseOut;

  { versao do sistema }
  StatusBar1.Panels[3].Text := dmoPrincipal.GetMyVersion;

  Screen.Cursor := crDefault;
  qrySetor.Open;

  DateEdit.Date := date;

  decodedate(date, ano, mes, dia);
  with PlannerCalendarGroup1 do
   begin
     Year := ano;
     Month := mes;
     Day := dia;
   end;

end;

procedure TformPrincipal.DisplayHint(Sender: TObject);
begin
     StatusBar1.Panels[1].Text := GetLongHint(Application.Hint);
end;

procedure TformPrincipal.Sair1Click(Sender: TObject);
begin
     close;
end;

procedure TformPrincipal.Clientes1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformClientes.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.RelogioTimer(Sender: TObject);
begin
     StatusBar1.Panels[0].Text := FormatDateTime('hh:mm am/pm', Now);
end;

procedure TformPrincipal.Localidades1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformLocalidades.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.btpClientesClick(Sender: TObject);
begin
     Clientes1Click(Sender);
end;

procedure TformPrincipal.View2BtnClick(Sender: TObject);
begin
   Clientes1Click(Sender);
end;

procedure TformPrincipal.FormCreate(Sender: TObject);
begin
  contlogoff := false;
  Application.OnHint := DisplayHint;
end;

procedure TformPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
const
  maxmsg = 5;
  msg: array[1..maxmsg] of String =
   (  'Recebi um pedido para encerrar o sistema, #. Você tem certeza?'    ,
      'Estou prestes a encerrar o sistema. Você ainda quer terminar, #?'  ,
      'Por favor #, diga se deseja mesmo encerrar o sistema...'           ,
      'Gostaria de continuar usando o sistema #? Então clique em Não!'    ,
      '#, estou quase encerrando... apenas confirme o fechamento.'       );
var
  n: integer;
begin
  n := random(maxmsg) + 1;
  CanClose := dmoPrincipal.Pergunta(
    msg[n], 'Atenção, #!', 2) = IDYES;
end;

procedure TformPrincipal.btpRelatoriosClick(Sender: TObject);
begin
  Relatrioexplorer1Click(Sender);
end;

procedure TformPrincipal.Cordefundo1Click(Sender: TObject);
begin
    ColorDialog.Color := PainelCor.Color;
    if ColorDialog.Execute then
      PainelCor.Color := ColorDialog.Color;
end;

procedure TformPrincipal.LoadProfile;
begin
  maxtimelogoff := 180;
end;

procedure TformPrincipal.Seqncia1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformSequencia.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.UseIn;
begin
  if not dmoPrincipal.Database.Connected then
   begin
    dmoPrincipal.DataModuleCreate(nil);
    LoadProfile;
    Menu := MenuPrincipal;
    MostrarBotoes;
   end;
  StatusBar1.Panels[2].Text := dmoPrincipal.GetLogUser;
  if not contlogoff then
   begin
     contlogoff := true;
     maxtimelogoff := 180;
   end;
end;

procedure TformPrincipal.UseOut;
begin
  if dmoPrincipal.Database.Connected then
   begin
    StatusBar1.Panels[2].Text :=
     dmoPrincipal.GetLogUser;
    timelogoff := maxtimelogoff;
    contlogoff := True;
//    dmoPrincipal.resolver_transacao;
   end else
   begin
    StatusBar1.Panels[2].Text := Format(
      '%s desconectou.',
      [dmoPrincipal.GetLogUser]);
   end;
end;

procedure TformPrincipal.Conectar1Click(Sender: TObject);
begin
     UseIn;
     UseOut;
end;

procedure TformPrincipal.btpConectarClick(Sender: TObject);
begin
        Conectar1Click(Sender);
end;

procedure TformPrincipal.MostrarBotoes;
begin
  { escondo os botoes de conexao }
  panel5.Visible        := True;
  painelcor.Visible     := True;
  with qrySetor do
   begin
    if active then close;
    open;
   end;
  DateEdit.Date := date;

  btpConectar.Visible   := False;

  { mostro os botoes padroes }
  btpAjuda.Visible      := True;
  btpClientes.Visible   := Clientes1.Visible;
  btpRelatorios.Visible := True;
end;

procedure TformPrincipal.EsconderBotoes;
begin
  { escondo os botoes padroes }
  btpAjuda.Visible      := False;
  btpClientes.Visible   := False;
  btpRelatorios.Visible := False;

  { escondo os botoes de conexao }
  btpConectar.Visible   := True;

  painelcor.Visible     := False;
  panel5.Visible        := False;
end;

procedure TformPrincipal.Desconectar;
begin
   StatusBar1.Panels[2].Text := Format(
     '%s desconectou.',
     [dmoPrincipal.GetLogUser]);
   contlogoff := false;
   Menu := MenuOff;
   EsconderBotoes;
   dmoPrincipal.Database.Close;
end;

procedure TformPrincipal.Desconectar1Click(Sender: TObject);
begin
  desconectar;
end;

procedure TformPrincipal.Relatrioexplorer1Click(Sender: TObject);
begin
  UseIn;
  with dmoPrincipal do
    relatorio_explorer;
  UseOut;
end;

procedure TformPrincipal.btpAjudaMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformPrincipal.btpAjudaMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

procedure TformPrincipal.Mdicos1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformMedicos.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Convnios1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformConvenios.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Exames1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformExames.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.TabelasAMB1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformTabelaAMB.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.RegistroDirio1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformRegDiario.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Agenda1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformAgenda.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Setores1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformSetores.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.qryAgendaBeforeOpen(DataSet: TDataSet);
begin
  with Dataset as TIBQuery do
   begin
    paramByName('DATA').AsDateTime := DateEdit.Date;
    paramByName('CODSETOR').AsInteger :=
      qrySetor.fieldByName('CODIGO').AsInteger;
   end
end;

procedure TformPrincipal.DBGrid1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  with qryAgenda do
   begin

     if fieldByName('NOME').IsNull and fieldByName('REALIZADO').IsNull then
      begin
       AColor := clNavy;
       AFont.Color := clWhite;
       AFont.Style := [fsBold];
      end
     else
       if fieldByName('REALIZADO').AsString = 'A' then
         AColor := clWhite
       else
         AColor := clSilver;

     if ASelected then
      begin
        if AColor <> clNavy then AFont.Color := clBlack;
        AFont.Style := [fsBold];
      end

   end

end;

procedure TformPrincipal.btnModificarClick(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   with TformRegDiario.Create(Self) do
    try
      Caption  := Self.Caption + ' -> ' + Caption;
      inAgenda := Self.qryAgenda.fieldByName('CODIGO').AsInteger;
      showmodal;
    finally
      release;
    end;

end;

procedure TformPrincipal.btnImprimirClick(Sender: TObject);
begin
  ppLabel2.Caption := 'NIKKEI - Agenda ' + DateEdit.Text + ' - ' +
    'Setor: ' + qrySetor.FieldByName('NOME').AsString;
  ppReport.print;
end;

procedure TformPrincipal.qrySetorAfterOpen(DataSet: TDataSet);
begin
  (Dataset as TIBQuery).FetchAll;
  DBLookupComboBox1.KeyValue := qrySetor.FieldByName('NOME').AsString;

  with qryAgenda do
   begin
    if active then close;
    open;
   end;
end;

procedure TformPrincipal.btnAdicionarClick(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   with TformRegDiario.Create(Self) do
    try
      Caption  := Self.Caption + ' -> ' + Caption;
      inAgenda := -1;
      inData   := Self.DateEdit.Date;
      showmodal;
    finally
      release;
    end;

end;

procedure TformPrincipal.qryAgendaAfterOpen(DataSet: TDataSet);
begin
  with Dataset as TIBquery do
   begin
    DBGrid1.Visible := not IsEmpty;
    btnImprimir.Enabled := not IsEmpty;

    (fieldByName('HORA') as TDateTimeField).DisplayFormat      := 'HH:NN';
    (fieldByName('HORAEXAME') as TDateTimeField).DisplayFormat := 'HH:NN';
   end;
  Panel5.Caption := ' AGENDA ' +
     trim(qrySetor.fieldByName('NOME').AsString) + ' - ' +
     FormatDateTime('dddd, dd "de" mmmm "de" yyyy',
       DateEdit.Date);
end;

procedure TformPrincipal.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TformPrincipal.PlannerCalendarGroup1DaySelect(Sender: TObject;
  SelDate: TDateTime);
const
  Key: char = #13;
begin
  DateEdit.Date := SelDate;
  DateEditKeyPress(Sender, Key)
end;

procedure TformPrincipal.DateEditKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    with qryAgenda do
     begin
      if active then close;
      open;
     end;
  end;
end;

procedure TformPrincipal.DBLookupComboBox1CloseUp(Sender: TObject);
begin
  with qryAgenda do
   begin
    if active then close;
    open;
   end
end;

procedure TformPrincipal.Reclculodosregistros1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformRecalculo.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.FormShow(Sender: TObject);
begin
  PostMessage(Handle, CM_FORMSETUP, 0, 0);
end;

procedure TformPrincipal.Verificaratualizao1Click(Sender: TObject);
begin
   auAutoUpgrader.RestartParams := ParamStr(1) + ' ' + ParamStr(2);
   auAutoUpgrader.CheckUpdate;
end;

procedure TformPrincipal.auAutoUpgraderEndUpgrade(Sender: TObject);
begin
  auHTTPupd.POSTData :=
    'empresa=' + Caption + '&' +
    'data=' + FormatDateTime('MM/DD/YYYY HH:NN', now) + '&' +
    'sistema=DIAGNOS ' + dmoPrincipal.GetMyVersion + ' - ' +
       auAutoUpgrader.VersionNumber + '&' +
    'usuario=' + dmoPrincipal.GetLogUser + '&' +
    'resultado=ATUALIZADO' + '&' +
    'maquina=' + dmoPrincipal.NomeComputador + '&' +
    'id=' + '1';
  auHTTPupd.Read;
end;

procedure TformPrincipal.auAutoUpgraderNoUpdateAvailable(Sender: TObject);
begin
  auHTTPupd.POSTData :=
    'empresa=' + Caption + '&' +
    'data=' + FormatDateTime('MM/DD/YYYY HH:NN', now) + '&' +
    'sistema=DIAGNOS ' + dmoPrincipal.GetMyVersion + ' - ' +
       auAutoUpgrader.VersionNumber + '&' +
    'usuario=' + dmoPrincipal.GetLogUser + '&' +
    'resultado=Sem versão nova' + '&' +
    'maquina=' + dmoPrincipal.NomeComputador + '&' +
    'id=' + '1';
  auHTTPupd.Read;
end;

procedure TformPrincipal.Configuraes1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformConfig.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
     Screen.Cursor := crDefault;

end;

procedure TformPrincipal.Portes1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformPortes.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

end.
