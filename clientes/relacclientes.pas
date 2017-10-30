unit relacclientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBQuery, IBCustomDataSet, IBStoredProc, IBDatabase, DBClient,
  Provider;

type
  TdmoRelacClientes = class(TDataModule)
    qryEstado: TIBQuery;
    dsrEstado: TDataSource;
    qryCidades: TIBQuery;
    dsrCidades: TDataSource;
    qryLocalidades: TIBQuery;
    dsrLocalidades: TDataSource;
    qryBairros: TIBQuery;
    dsrBairros: TDataSource;
    traEstado: TIBTransaction;
    traLocalidades: TIBTransaction;
    traCidades: TIBTransaction;
    traBairros: TIBTransaction;
    provEstado: TDataSetProvider;
    cdsEstado: TClientDataSet;
    provLocalidades: TDataSetProvider;
    cdsLocalidades: TClientDataSet;
    provCidades: TDataSetProvider;
    cdsCidades: TClientDataSet;
    provBairros: TDataSetProvider;
    cdsBairros: TClientDataSet;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmoRelacClientes: TdmoRelacClientes;

implementation

uses data_principal;

{$R *.DFM}

procedure TdmoRelacClientes.DataModuleDestroy(Sender: TObject);
begin
   qryEstado.UnPrepare;
   qryLocalidades.UnPrepare;
   qryCidades.UnPrepare;
   qryBairros.UnPrepare;
end;

end.
