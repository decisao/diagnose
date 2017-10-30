unit data_principal;

interface

{ By removing the 'x' which begins each of these compiler directives,
  you can enable different functionality within the end-user reporting
  solution.

  DADE - the data tab where queries can be created by the end-user

  BDE  - BDE support for the Query Tools

  ADO  - ADO support for the Query Tools

  IBExpress - Interbase Express support for the Query Tools


  RAP -  the calc tab, where calculations can be coded at run-time
         (You must download and install a copy of the RAP beta in order
         to enable this feature)

  CrossTab - adds the CrossTab component to the component palette in the
             report designer.

  CheckBox - adds a checkbox component to the component palette in the
         report designer.

  TeeChart - adds a teechart component to the report designer component
         palette. This component works with the TeeChart delivered
         with Delphi 3 and 4.  It does NOT work with TeeChart 4.01,
         which must be purchased from TeeMach.

  TeeChart401 - adds a teechart component for use with TeeChart 4.01 from
         TeeMach.

  UseDesignPath - determines whether the path used by the Database
         object on this form is replaced in the OnCreate event handler of
         this form with the current path.}

{$DEFINE DADE}             {remove the 'x' to enable DADE}
{x$DEFINE BDE}             {remove the 'x' to enable Borland Database Engine (BDE) }
{x$DEFINE ADO}             {remove the 'x' to enable ADO}
{$DEFINE IBExpress}        {remove the 'x' to enable Interbase Express}
{$DEFINE CrossTab}         {remove the 'x' to enable CrossTab}
{$DEFINE RAP}              {remove the 'x' to enable RAP}
{$DEFINE CheckBox}         {remove the 'x' to enable CheckBox}
{x$DEFINE TeeChart}        {remove the 'x' to enable standard TeeChart}
{$DEFINE TeeChart401}     {remove the 'x' to enable TeeChart 4.01}
{$DEFINE UseDesignPath}    {remove the 'x' to use the design-time settings of Database object on this form}

uses

{$IFDEF DADE}
  daDatMan,
{$ENDIF}

{$IFDEF BDE}
  daDBBDE,
{$ENDIF}

{$IFDEF ADO}
  daADO,
{$ENDIF}

{$IFDEF IBExpress}
  daIBExpress,
{$ENDIF}

{$IFDEF CrossTab}
  ppCTDsgn,
{$ENDIF}

{$IFDEF RAP}
  raIDE,
{$ENDIF}

{$IFDEF CheckBox}
  myChkBox,
{$ENDIF}

{$IFDEF TeeChart}
  ppChrt, ppChrtDB,
{$ENDIF}

{$IFDEF TeeChart401}
  ppChrt, ppChrtDP,
{$ENDIF}

  Windows, Classes, Controls, SysUtils, Forms, StdCtrls, ExtCtrls, Dialogs, Graphics,
  DB, IBQuery, IBCustomDataSet, IBStoredProc,  ppComm, ppCache, ppClass, ppProd,
  ppReport, ppRptExp, ppBands,
  ppDBBDE, ppEndUsr, ppDBPipe, ppDB, ppPrnabl, ppStrtch, ppDsgnDB,
  ppRelatv, ppModule, ppViewr, daDatMod, ppSubRpt, IBTable, IBDatabase,
  Messages, ImgList, registry, login,

  ppTypes, ppCtrls, ppVar,
  daDataVw, daQuery, daQClass, DBClient, Provider, RxMemDS, IBSQLMonitor,
  Just1_32, ppFormWrapper;

type
  TdmoPrincipal = class(TDataModule)
    Database: TIBDatabase;
    qryObterSequencia: TIBQuery;
    qryTempo: TIBQuery;
    ppDesigner1: TppDesigner;
    plItem: TppBDEPipeline;
    dsItem: TDataSource;
    tblItems: TIBTable;
    tblFolder: TIBTable;
    dsFolder: TDataSource;
    plFolder: TppBDEPipeline;
    ppReportExplorer1: TppReportExplorer;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppFooterBand1: TppFooterBand;
    traObterSequencia: TIBTransaction;
    traTempo: TIBTransaction;
    traFolder: TIBTransaction;
    traItems: TIBTransaction;
    imgBotoes: TImageList;
    imgBotoesPeq: TImageList;
    IBSQLMonitor: TIBSQLMonitor;
    MonitorData: TRxMemoryData;
    MonitorDatadata_hora: TDateTimeField;
    MonitorDataevento: TStringField;
    DataSource: TDataSource;
    traDevolverSequencia: TIBTransaction;
    DevolverSequencia: TIBStoredProc;
    traTempDir: TIBTransaction;
    qryTempDir: TIBQuery;
    qryTempDirCODIGO: TIntegerField;
    qryTempDirPATHTEMP: TIBStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryVendedorInfoBeforeOpen(DataSet: TDataSet);
    procedure DatabaseLogin(Database: TIBDatabase; LoginParams: TStrings);
    procedure IBSQLMonitorSQL(EventText: String; EventTime: TDateTime);
  private
    { Private declarations }
    function TrataMsg(msg: string): string;
  public
    { Public declarations }
    numlogs: integer;
//    procedure Loaded; override;
    function GetTempDir: string;
    function GetMyVersion: String;
    function NomeComputador : String;
    function Ean13(codi: string): string;
    function LogMachine : String;
    function GetUserAppName: string;
    function GetLogUser: string;
    function GetServerTime: TDateTime;
    function LerSequencia(tab: string): integer;
    procedure CancelarSequencia(tab: string; seq: longint);
    procedure SalvarRegistro(qr: TIBQuery);
    function Coringa(s: string): string;
    function Repreview: boolean;
    function QueryLocate(AQuery: TIBQuery; AField, AValue: String): Boolean;
    function SoundBts(Name: PChar): SmallInt;
    procedure PointToComma(var Key: Char);
    function DecimalToHexa(esn: string): string;
    function Interdata(entrada: string): string;
    function Pergunta(msg1, msg2: string; def: integer): word;
    procedure relatorio_explorer;
    function GetFileSize(const FileName: string): TULargeInteger;
    function SizeToStr(tamanho: longint): string;
    function rmpts(s: string): string;
  end;

var
  dmoPrincipal: TdmoPrincipal;

const
  AppNome: string = 'NIKKEI';
  CoringaDefault: string = '*';
  CoringaDireita: boolean = True;
  ReportPreview = True;

implementation

{$R *.DFM}

var
   log_control: longint;

function TdmoPrincipal.TrataMsg(msg: string): string;
var
  n: integer;
begin
  n := pos('#', msg);
  if n > 0 then
   begin
    delete(msg, n, 1);
    insert(GetLogUser, msg, n);
   end;
  result := msg;
end;

function TdmoPrincipal.rmpts(s: string): string;
var
  i: word;
begin
  s := trim(s);
  while pos('.', s) > 0 do
    delete(s, pos('.', s), 1);
  result := s;
end;

function TdmoPrincipal.Pergunta(msg1, msg2: string; def: integer): word;
begin
  if def = 1 then
    result := Application.MessageBox(PChar(TrataMsg(msg1)), PChar(TrataMsg(msg2)),
       mb_IconQuestion + mb_YesNo)
  else
    result := Application.MessageBox(PChar(TrataMsg(msg1)), PChar(TrataMsg(msg2)),
       mb_IconQuestion + mb_YesNo + mb_DefButton2);
end;

function TdmoPrincipal.GetMyVersion: string;
const
  InfoNum = 10;
  InfoStr : array [1..InfoNum] of String =
    ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName',
     'LegalCopyright', 'LegalTradeMarks', 'OriginalFilename',
     'ProductName', 'ProductVersion', 'Comments');
var
  S         : String;
  n, Len, i : DWORD;
  Buf       : PChar;
  Value     : PChar;
begin
  S := Application.ExeName;
  n := GetFileVersionInfoSize(PChar(S),n);
  if n > 0 then
   begin
    Buf := AllocMem(n);
    GetFileVersionInfo(PChar(S),0,n,Buf);
    for i:=1 to 3 do
      if VerQueryValue(Buf,PChar('StringFileInfo\041604E4\'+
        InfoStr[i]),Pointer(Value),Len) then
         Result := Value;
    FreeMem(Buf,n);
   end else
    Result := '[beta]';
end;

Function TdmoPrincipal.NomeComputador : String;
Var
  Name : PChar;
  Size : DWord;
Begin
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  GetMem(Name, Size);
  try
    GetComputerName(Name, Size);
    Result := Trim(StrPas(Name));
  finally
    FreeMem(Name, Size);
  end;
End;


function TdmoPrincipal.Ean13(codi: string): string;
var
  soma: word;
  i: byte;
begin
  soma := 0;
  for i := 1 to 12 do
   if not odd(i) then soma := soma + (ord(codi[i]) - 48) * 3 else
     soma := soma + (ord(codi[i]) - 48);
  soma := 10 - (soma mod 10);
  if soma = 10 then soma := 0;
  codi[13] := chr(soma + 48);
  Result := codi;
end;

function TdmoPrincipal.Coringa(s: string): string;
var
  i, j: word;
begin
  while Pos(CoringaDefault, s) > 0 do
    s[Pos(CoringaDefault, s)] := '%';
  if CoringaDireita and (s[length(s)] <> '%') then s := s + '%';
  result := s;
end;

function TdmoPrincipal.LogMachine : String;
  {Retorna o nome do usuário logado na rede
   Requer a unit Registry declarada na clausula Uses da Unit}
var
  Registro: TRegistry;
begin
  Registro := TRegistry.Create;
  Registro.RootKey := HKEY_LOCAL_MACHINE;
  if Registro.OpenKey('Network\Logon', false) then
   begin
    result := uppercase(Registro.ReadString('username'));
   end;
  Registro.Free;
end;

function TdmoPrincipal.Repreview: boolean;
begin
  result := ReportPreview;
end;

function TdmoPrincipal.GetUserAppName: string;
begin
   result := AppNome + ' - ';
end;

function TdmoPrincipal.GetLogUser: string;
begin
  Result := Database.Params[0];
  if Pos('=', Result) > 0 then
   Result := copy(Result, Pos('=', Result) + 1, length(Result) -
     Pos('=', Result));
  Result := uppercase(Result);
end;

function TdmoPrincipal.GetServerTime: TDateTime;
begin
  with qryTempo do
   begin
    if active then close;
    open;
    Result := fieldByName('DATAHORA').AsDateTime;
    close;
   end;
end;

function TdmoPrincipal.LerSequencia(tab: string): longint;
begin
   with qryObterSequencia do
    try
     if Active then close;
     Transaction.StartTransaction;
     ParamByName('tabela').AsString := tab;
     prepare;
     open;
     result := fieldByName('sequencia').AsInteger;
     Transaction.Commit;
     close;
     if prepared then unprepare;
    except
     on exception do
      begin
       Transaction.Rollback;
       raise;
      end
    end;
end;

procedure TdmoPrincipal.CancelarSequencia(tab: string; seq: longint);
begin
   with DevolverSequencia do
    try
     if not Transaction.InTransaction then
       Transaction.StartTransaction;
     ParamByName('tabela').AsString := tab;
     ParamByName('sequencia').AsInteger := seq;
     Prepare;
     ExecProc;
     if prepared then unprepare;
     Transaction.Commit;
    except
     on exception do
      begin
       if prepared then unprepare;
       Transaction.Rollback;
       raise;
      end;
    end;
end;

procedure TdmoPrincipal.SalvarRegistro(qr: TIBQuery);
begin
  with qr do
   begin
    if not Transaction.InTransaction then
      Transaction.StartTransaction;
    try
     ApplyUpdates; {try to write the updates to the database};
     Transaction.CommitRetaining; {on success, commit the changes};
    except
     Transaction.RollbackRetaining; {on failure, undo the changes};
     raise; {raise the exception to prevent a call to CommitUpdates!}
    end;
//    CommitUpdates; {on success, clear the cache}
   end;
end;

function TdmoPrincipal.QueryLocate(AQuery: TIBQuery; AField, AValue: String): Boolean;
var
  Hi, Lo: Integer;
  xtag: byte;
begin
   xtag := AQuery.tag;
   with AQuery do
    begin
      if length(AValue) = 0 then exit;
      Screen.Cursor := crHourGlass;
      if xtag = 0 then
       begin
        AQuery.fetchall;
        AQuery.tag := 1;
       end;
      disablecontrols;
      First;
      {Set high end of range of rows}
      Hi := RecordCount;
      {Set low end of range of rows}
      Lo := 0;
      {Move to point half way between high and low ends of range}
      MoveBy(RecordCount div 2);
      while (Hi - Lo) > 1 do begin
        {Search field greater than search value, value in first half}
        if (FieldByName(AField).AsString > AValue) then begin
          {Lower high end of range by half of total range}
          Hi := Hi - ((Hi - Lo) div 2);
          MoveBy(((Hi - Lo) div 2) * -1);
        end
        {Search field less than search value, value in far half}
        else begin
          {Raise low end of range by half of total range}
          Lo := Lo + ((Hi - Lo) div 2);
          MoveBy((Hi - Lo) div 2);
        end;
      end;
      {Fudge for odd numbered rows}
      if (FieldByName(AField).AsString < AValue) then Next;
      enablecontrols;
      Screen.Cursor := crDefault;
      QueryLocate := (FieldByName(AField).AsString = AValue)
    end;
end;

function TdmoPrincipal.SoundBts(Name: PChar): SmallInt;
const
  SoundExTable: array[65..122] of byte =
   (0,1,2,3,0,1,2,0,0,2,2,4,5,5,0,1,2,6,2,3,0,1,0,2,0,2,0,0,0,0,0,0,
    0,1,2,3,0,1,2,0,0,2,2,4,5,5,0,1,2,6,2,3,0,1,0,2,0,2);
var
  i, l, s, SO, x: byte;
  Multiple: word;
begin
  if Name > '' then
   begin
    Result := Ord(UpCase(Name[0]));
    SO := 0;
    Multiple := 26;
    l := Pred(StrLen(Name));
    for i := 1 to l do
     begin
      s := Ord(Name[i]);
      if (s > 64) and (s < 123) then
       begin
        x := SoundExTable[s];
        if (x > 0) and (x <> SO) then
         begin
          Result := Result + (x * Multiple);
          if (Multiple = 26 * 6 * 6) then break;
          Multiple := Multiple * 6;
          SO := x;
         end;
       end;
     end;
   end else Result := 0;
end;

procedure TdmoPrincipal.PointToComma(var Key: Char);
begin
  if key = '.' then key := ',';
end;

function TdmoPrincipal.DecimalToHexa(esn: string): string;
var
  str_esn: string;
  p1, p2: longint;

    function DecToBase( Decimal: LongInt; const Base: Byte): String;
    const
      Symbols: String[16] = '0123456789ABCDEF';
    var
      scratch: String;
      remainder: Byte;
    begin
      scratch := '';
      repeat
        remainder := Decimal mod Base;
        scratch := Symbols[remainder + 1] + scratch;
        Decimal := Decimal div Base;
      until ( Decimal = 0 );
      Result := PChar(scratch);
    end;

begin
  if esn = '' then esn := 'N/F';
  if Length(esn) < 11 then Result := esn else
   try
    p1 := StrToInt(copy(esn, 1, 3));
    p2 := StrToInt(copy(esn, 4, length(esn) - 3));
    esn := DecToBase(p2, 16);
    while length(esn) < 6 do esn := '0' + esn;
    esn := DecToBase(p1, 16) + esn;
    Result := esn;
   except
    on exception do Result := 'N/F';
   end;
end;

function TdmoPrincipal.Interdata(entrada: string): string;
var
  data: TDateTime;
  dia, mes, ano: word;
begin
  try
    data := StrToDate(entrada);
    decodedate(data, ano, mes, dia);
    Result := Concat(IntToStr(mes), '/',
       IntToStr(dia), '/', IntToStr(ano));
  except
    on exception do Result := '';
  end;
end;

procedure TdmoPrincipal.DataModuleCreate(Sender: TObject);
var
  saida: word;
  erro: boolean;
begin

  { string de acesso ao banco de dados }
  Database.DatabaseName := ParamStr(1);

  { haverá monitoramento? }
  IBSQLMonitor.Enabled := (uppercase(ParamStr(2)) = '/M');

  log_control := 0;
  repeat
    erro := false;
    saida := IDNO;
    inc(numlogs);
    try
      Database.Params.Clear;
      Database.Open;
    except
      on exception do
       begin
        erro := true;
        ShowMessage('Não foi possível estabelecer uma ligação com o ' +
          'servidor. Isso pode acontecer por um dos seguintes motivos:' +
          #13#10#13#10 +
          'o   Você cancelou a entrada de nome e senha' +
          #13#10 +
          'o   Sua senha foi digitada incorretamente' +
          #13#10 +
          'o   Este computador está desconectado da rede' +
          #13#10 +
          'o   O servidor está desconectado ou com dificuldades' +
          #13#10#13#10 +
          'Tente verificar os itens acima antes de tentar novamente. ' +
          'Se o problema persistir, podem existir outros fatores que ' +
          'o impedem de iniciar o sistema. Neste caso, chame o ' +
          'suporte técnico.');
        if numlogs < 3 then
          saida := Application.MessageBox('Deseja tentar novamente?', 'Logon',
             mb_YesNo + mb_IconQuestion);
       end;
    end;
  until saida = IDNO;
end;

procedure TdmoPrincipal.qryVendedorInfoBeforeOpen(DataSet: TDataSet);
begin
   (Dataset as TIBQuery).paramByName('NOME').AsString :=
      dmoPrincipal.GetLogUser;
end;

procedure TdmoPrincipal.DatabaseLogin(Database: TIBDatabase;
  LoginParams: TStrings);
begin
  with TformLogin.Create(Self) do
   try
     if showmodal = mrOK then
      begin
       LoginParams.Clear;
       LoginParams.Add('user_name=' + edtUSER.Text     );
       LoginParams.Add('password='  + edtPASSWORD.Text );
      end;
   finally
     release;
   end;
end;

procedure TdmoPrincipal.relatorio_explorer;
begin
    if not(ppReportExplorer1.Execute) then
      ShowMessage(ppReportExplorer1.ErrorMessage);
    tblFolder.Close;
    tblItems.Close;
end;

function TdmoPrincipal.GetFileSize(const FileName: string): TULargeInteger;
var
  Find: THandle;
  Data: TWin32FindData;
begin
  Result.QuadPart := -1;
  Find := FindFirstFile(PChar(FileName), Data);
  if (Find <> INVALID_HANDLE_VALUE) then
   begin
    Result.LowPart   := Data.nFileSizeLow;
    Result.HighPart  := Data.nFileSizeHigh;
    Windows.FindClose(Find);
   end;
end;

function TdmoPrincipal.SizeToStr(tamanho: longint): string;
begin
  if tamanho < 1024 then
    Result := IntToStr(tamanho) + ' bytes'
  else
    if tamanho < 1048576 then
      Result := IntToStr(tamanho div 1024) + ' KB'
    else
      Result := FloatToStrF(tamanho / 1048576, ffFixed, 18, 2) + ' MB';
end;

function TdmoPrincipal.GetTempDir: string;
//var
//  Buffer: array[0..MAX_PATH] of char;
begin
//  GetTempPath(SizeOf(Buffer) - 1, Buffer);
//  Result := StrPas(Buffer);
  with qryTempDir do
   begin
     if active then close;
     open;
     Result := trim(fieldByName('PATHTEMP').AsString);
     close;
   end;
end;

procedure TdmoPrincipal.IBSQLMonitorSQL(EventText: String;
  EventTime: TDateTime);
begin
  with MonitorData do
   begin
    if not active then open;

    AppendRecord([
      EventTime,
      EventText
    ]);
   end;
end;

end.
