unit clientehistorico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBDatabase, IBCustomDataSet, IBQuery, StdCtrls, Mask, DBCtrls,
  TeEngine, Series, TeeProcs, Chart, ExtCtrls, Buttons, DBChart, ComCtrls,
  Grids, DBGrids, zebdbgrid;

type
  TformClienteHistorico = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    qryHistorico: TIBQuery;
    traHistorico: TIBTransaction;
    dsrHistorico: TDataSource;
    Panel3: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    pgc_dados: TPageControl;
    tabGlobal: TTabSheet;
    tabAtraso: TTabSheet;
    lb_dias: TLabel;
    dbt_dias: TDBEdit;
    lb_total: TLabel;
    dbt_total: TDBEdit;
    lb_data: TLabel;
    dbt_data: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    lbBloqueio: TLabel;
    traAtrasoEmp: TIBTransaction;
    qryAtrasoEmp: TIBQuery;
    dsrAtrasoEmp: TDataSource;
    zebdbgrid1: Tzebdbgrid;
    procedure qryHistoricoBeforeOpen(DataSet: TDataSet);
    procedure qryHistoricoAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure qryAtrasoEmpBeforeOpen(DataSet: TDataSet);
    procedure qryAtrasoEmpAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    inCliente: longint;
  end;

var
  formClienteHistorico: TformClienteHistorico;

implementation

uses data_principal;

{$R *.DFM}

procedure TformClienteHistorico.qryHistoricoBeforeOpen(DataSet: TDataSet);
begin
   with (Dataset as TIBQuery) do
    begin
     ParamByName('CODCLIENTE').AsInteger := inCliente;
     ParamByName('CODEMPRESA').AsInteger :=
       dmoPrincipal.empresa;
     if not prepared then prepare;
    end;
end;

procedure TformClienteHistorico.qryHistoricoAfterOpen(DataSet: TDataSet);
begin
  with (Dataset as TIBQuery) do
   begin

     (fieldByName('TOTAL_MOVIMENTOS') as TIBBCDField).Currency := True;
     (fieldByName('TOTAL_PAGO')       as TIBBCDField).Currency := True;
     (fieldByName('TOTAL_ARECEBER')   as TIBBCDField).Currency := True;
     (fieldByName('TOTAL_ATRASO')     as TIBBCDField).Currency := True;
     fieldByName('DATA_MAISATRASADO').EditMask := '99/99/9999';

     if fieldByName('BLOQUEIO').AsString = 'S' then
      begin
       lbBloqueio.Caption := 'BLOQUEADO!';
       lbBloqueio.Font.Color := clRed;
      end;

     if fieldByName('TOTAL_ATRASO').AsFloat > 0 then
      begin
       lb_dias.visible   := true;
       lb_total.visible  := true;
       lb_data.visible   := true;
       dbt_dias.visible  := true;
       dbt_total.visible := true;
       dbt_data.visible  := true;

       if qryAtrasoEmp.active then
         qryAtrasoEmp.close;
       qryAtrasoEmp.open;

      end else tabAtraso.visible := false;

   end;
end;

procedure TformClienteHistorico.FormShow(Sender: TObject);
begin
  qryHistorico.open;
  Screen.Cursor := crDefault;
end;

procedure TformClienteHistorico.qryAtrasoEmpBeforeOpen(DataSet: TDataSet);
begin
   with (Dataset as TIBQuery) do
    begin
     ParamByName('CODCLIENTE').AsInteger := inCliente;
     if not prepared then prepare;
    end;
end;

procedure TformClienteHistorico.qryAtrasoEmpAfterOpen(DataSet: TDataSet);
begin
  with (Dataset as TIBQuery) do
   (fieldByName('TOTAL_ATRASO') as TIBBCDField).Currency := True;

end;

end.
