unit relaclocalidades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBQuery, IBCustomDataSet, IBStoredProc, IBDatabase;

type
  TdmoRelacLocalidades = class(TDataModule)
    qryEstado: TIBQuery;
    dsrEstado: TDataSource;
    qryCidades: TIBQuery;
    dsrCidades: TDataSource;
    qryBairros: TIBQuery;
    dsrBairros: TDataSource;
    traEstado: TIBTransaction;
    traCidades: TIBTransaction;
    traBairros: TIBTransaction;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmoRelacLocalidades: TdmoRelacLocalidades;

implementation

uses data_principal;

{$R *.DFM}

procedure TdmoRelacLocalidades.DataModuleDestroy(Sender: TObject);
begin
   if qryEstado.Active then qryEstado.Close;
   if qryCidades.Active then qryCidades.Close;
   if qryBairros.Active then qryBairros.Close;
   qryEstado.UnPrepare;
   qryCidades.Unprepare;
   qryBairros.Unprepare;
end;

procedure TdmoRelacLocalidades.DataModuleCreate(Sender: TObject);
begin
   qryEstado.Prepare;
   qryCidades.prepare;
   qryBairros.prepare;
end;

end.
