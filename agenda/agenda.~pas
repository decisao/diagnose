unit agenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Db, IBCustomDataSet, IBQuery, IBDatabase,
  Grids, DBGrids, ComCtrls, ExtCtrls, TB97Tlbr, TB97Ctls, TB97, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms, DBCtrls, ppCtrls, ppPrnabl,
  ppClass, ppDB, ppBands, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDBPipe, ppVar, PlannerCal;

type
  TformAgenda = class(TForm)
    Dock972: TDock97;
    Toolbar972: TToolbar97;
    btnSair: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    btnAdicionar: TToolbarButton97;
    btnImprimir: TToolbarButton97;
    btnModificar: TToolbarButton97;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Panel3: TPanel;
    DateEdit: TDateEdit;
    Label1: TLabel;
    DBGrid1: TdxDBGrid;
    DBGrid1Column1: TdxDBGridColumn;
    DBGrid1Column2: TdxDBGridColumn;
    DBGrid1Column3: TdxDBGridColumn;
    DBGrid1Column4: TdxDBGridColumn;
    DBGrid1Column5: TdxDBGridColumn;
    DBGrid1Column6: TdxDBGridColumn;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DBGrid1Column7: TdxDBGridColumn;
    DBGrid1Column8: TdxDBGridColumn;
    procedure btnSairClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qryAgendaAfterScroll(DataSet: TDataSet);
    procedure PlannerCalendarGroup1DaySelect(Sender: TObject;
      SelDate: TDateTime);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formAgenda: TformAgenda;

implementation

uses data_principal, regdiario;

{$R *.DFM}

procedure TformAgenda.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TformAgenda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//  if State = [] then
//   begin
//    if qryAgenda.FieldByName('REGISTRO').IsNull and qryAgenda.FieldByName('REALIZADO').IsNull then
//      Column.Color := clYellow
//    else
//      if qryAgenda.FieldByName('REALIZADO').AsString = 'A' then
//        Column.Color := clAqua
//      else
//        Column.Color := clWhite;
//   end;
end;

procedure TformAgenda.qryAgendaAfterScroll(DataSet: TDataSet);
begin
//  btnModificar.Enabled := not Dataset.fieldByName('NOME').IsNull;
end;

procedure TformAgenda.PlannerCalendarGroup1DaySelect(Sender: TObject;
  SelDate: TDateTime);
begin
  DateEdit.Date := SelDate;
end;

end.
