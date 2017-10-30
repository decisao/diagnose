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
    Panel1: TPanel;
    PlannerCalendarGroup1: TPlannerCalendarGroup;
    Panel2: TPanel;
    Reclculodosregistros1: TMenuItem;
    auAutoUpgrader: TauAutoUpgrader;
    auHTTPupd: TauHTTP;
    Verificaratualizao1: TMenuItem;
    N1: TMenuItem;
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
    procedure btnSairClick(Sender: TObject);
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
     RegistroDirio1Click(Sender);
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
  btpRelatorios.Visible :=
    (uppercase(dmoPrincipal.GetLogUser) = 'SYSDBA') or
    (uppercase(dmoPrincipal.GetLogUser) = 'ISABEL');
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
  painelcor.Visible     := True;

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

procedure TformPrincipal.btnSairClick(Sender: TObject);
begin
  close;
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
