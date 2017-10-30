unit relaccidades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBQuery, IBCustomDataSet, IBStoredProc, IBDatabase;

type
  TdmoRelacCidades = class(TDataModule)
    qryEstado: TIBQuery;
    dsrEstado: TDataSource;
    traEstado: TIBTransaction;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmoRelacCidades: TdmoRelacCidades;

implementation

uses data_principal;

{$R *.DFM}

procedure TdmoRelacCidades.DataModuleDestroy(Sender: TObject);
begin
  if qryEstado.Active then qryEstado.Close;
  qryEstado.Unprepare;
end;

procedure TdmoRelacCidades.DataModuleCreate(Sender: TObject);
begin
   qryEstado.prepare;
end;

end.
