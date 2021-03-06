unit dataregdiario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, Provider, IBCustomDataSet, IBQuery, IBDatabase;

type
  TdmoRegDiario = class(TDataModule)
    traPaciente: TIBTransaction;
    qryPaciente: TIBQuery;
    provPaciente: TDataSetProvider;
    cdsPaciente: TClientDataSet;
    dsrPaciente: TDataSource;
    dsrExame: TDataSource;
    cdsExame: TClientDataSet;
    provExame: TDataSetProvider;
    traExame: TIBTransaction;
    qryExame: TIBQuery;
    traConvenio: TIBTransaction;
    qryConvenio: TIBQuery;
    provConvenio: TDataSetProvider;
    cdsConvenio: TClientDataSet;
    dsrConvenio: TDataSource;
    traMedico_req: TIBTransaction;
    qryMedico_req: TIBQuery;
    provMedico_req: TDataSetProvider;
    cdsMedico_req: TClientDataSet;
    dsrMedico_req: TDataSource;
    traMedico_exe: TIBTransaction;
    qryMedico_exe: TIBQuery;
    provMedico_exe: TDataSetProvider;
    cdsMedico_exe: TClientDataSet;
    dsrMedico_exe: TDataSource;
    traEtiqueta: TIBTransaction;
    qryEtiqueta: TIBQuery;
    provEtiqueta: TDataSetProvider;
    cdsEtiqueta: TClientDataSet;
    dsrEtiqueta: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmoRegDiario: TdmoRegDiario;

implementation

{$R *.DFM}

end.
