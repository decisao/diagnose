unit laudo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Word97, OleServer, IBSQL, IBDatabase;

type
  TformLaudo = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    tmrLaudo: TTimer;
    WordDocument: TWordDocument;
    WordApplication: TWordApplication;
    OpenDialog1: TOpenDialog;
    traAdicionar: TIBTransaction;
    sqlAdicionar: TIBSQL;
    procedure tmrLaudoTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    arquivo: string;
    nome,
    exame,
    convenio,
    medico,
    data,
    numero: string;
    inRegistro: longint;
  end;

var
  formLaudo: TformLaudo;

implementation

uses data_principal;

{$R *.DFM}

procedure TformLaudo.tmrLaudoTimer(Sender: TObject);
var
  Template,
  NewTemplate,
  vend,
  ItemIndex,
  TmpVariant,
  TmpVariant2,
  R, B: OleVariant;
begin
  tmrLaudo.Enabled := False;

  { peço o modelo }
  if OpenDialog1.Execute then
  try

    Template := OpenDialog1.FileName;
    NewTemplate := False;
    ItemIndex := 1;

    { faço a conexão com o Microsoft Word }
    try
      Wordapplication.Connect;
    except
      MessageDlg('O Microsoft Word não foi encontrado.', mtError, [mbOk], 0);
      close;
    end;

    { abro o documento modelo }
    WordApplication.Caption := OpenDialog1.FileName;
    WordApplication.Documents.Add(Template, NewTemplate);
    WordDocument.ConnectTo(WordApplication.Documents.Item(ItemIndex));
    Wordapplication.Visible := True;
    WordApplication.Options.CheckSpellingAsYouType := False;
    WordApplication.Options.CheckGrammarAsYouType := False;

    { preenchimento de Bookmarks (indicadores) }
    B := 'laudo_nome';
    WordDocument.Bookmarks.Item(B).Range.Text := nome;
    B := 'laudo_exame';
    WordDocument.Bookmarks.Item(B).Range.Text := exame;
    B := 'laudo_convenio';
    WordDocument.Bookmarks.Item(B).Range.Text := convenio;
    B := 'laudo_medico';
    WordDocument.Bookmarks.Item(B).Range.Text := medico;
    B := 'laudo_data';
    WordDocument.Bookmarks.Item(B).Range.Text := data;
    B := 'laudo_numero';
    WordDocument.Bookmarks.Item(B).Range.Text := numero;

//    { substituição de sentenças }
//    WordDocument.Sentences.Item(2).Text := 'NOME: ' + #14 + nome + #13;
//    WordDocument.Sentences.Item(3).Text := 'EXAME: ' + exame + #9#9#9 +
//      'CONVÊNIO: ' + convenio + #13;
//    WordDocument.Sentences.Item(4).Text := 'REQUISITANTE: Dr(a) ' + medico + #13#10 +
//     'DATA: ' + data + #9#9#9#9#9#9 + 'NÚMERO: ' + numero + #13#13;
//    WordDocument.Sentences.Item(6).Text := ' ';
    
    { salvo as modificações }
    TmpVariant := arquivo;
    TmpVariant2 := False;
    WordDocument.SaveAs(TmpVariant, EmptyParam, EmptyParam,
      EmptyParam, TmpVariant2, EmptyParam, EmptyParam,
      EmptyParam, EmptyParam, EmptyParam, EmptyParam);

  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      WordApplication.Disconnect;
    end;

  end else close;

end;

procedure TformLaudo.FormShow(Sender: TObject);
begin
  tmrLaudo.Enabled := True;
end;

procedure TformLaudo.Button1Click(Sender: TObject);
var
  SaveChanges,
  OriginalFormat,
  RouteDocument,
  TmpVariant,
  TmpVariant2: OleVariant;
  arquivomem: TMemoryStream;
  tamanho_kb: longint;  
begin

  { salva o documento }
  try
    TmpVariant := arquivo;
    TmpVariant2 := False;
    WordDocument.SaveAs(TmpVariant, EmptyParam, EmptyParam,
      EmptyParam, TmpVariant2, EmptyParam, EmptyParam,
      EmptyParam, EmptyParam, EmptyParam, EmptyParam);
  except
  end;


  { fecha o Microsoft Word }
  SaveChanges := WdDoNotSaveChanges;
  OriginalFormat := UnAssigned;
  RouteDocument := UnAssigned;
  try
    WordApplication.Quit(SaveChanges, OriginalFormat, RouteDocument);
    WordApplication.Disconnect;
  except
    on E: Exception do
    begin
      WordApplication.Disconnect;
    end;
  end;

  { pergunto se deseja armazenar o laudo }
  if Application.MessageBox('Deseja armazenar o laudo criado no Banco de Dados?',
     'Aramazenar Laudo', mb_YesNo + mb_IconQuestion) = IDNO then
   close;

  { gravo o arquivo dentro dos arquivos do registro }
  with sqlAdicionar do
   begin

     { pego o tamanho do arquivo }
     tamanho_kb := dmoPrincipal.GetFileSize(arquivo).QuadPart;

     { carrego arquivo no Stream }
     arquivomem := TMemoryStream.Create;
     try
       arquivomem.LoadFromFile(arquivo);
     except
       on exception do
        begin
         ShowMessage('Erro ao abrir o arquivo!');
         arquivomem.Free;
         Screen.Cursor := crDefault;
         exit;
        end;
     end;

     { inicio a transação }
     if not Transaction.InTransaction then
       Transaction.StartTransaction;

     { carrego os parâmetros }
     with Params do
      begin
       byName('CODIGO').AsInteger     := dmoPrincipal.LerSequencia('REG_FILES');
       byName('CODREGISTRO').AsInteger := inRegistro;
       byName('NOME').AsString        := ExtractFileName(arquivo);
       byName('ORIGINAL').AsString    := arquivo;
       byName('DATA').AsDateTime      := dmoPrincipal.GetServerTime;
       byName('USUARIO').AsString     := dmoPrincipal.GetLogUser;
       byName('TAMANHO').AsInteger    := tamanho_kb;
       { carrego o arquivo }
       ByName('CONTEUDO').LoadFromStream(arquivomem);
      end;

     { preparo e executo }
     prepare;
     execQuery;

     { termino a transação }
     Transaction.Commit;

     { me livro do Stream }
     arquivomem.Free;

   end;
   
  close;
end;

end.
