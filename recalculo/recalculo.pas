unit recalculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBCustomDataSet, IBStoredProc, IBDatabase, StdCtrls, Mask, ToolEdit,
  Buttons, ExtCtrls, DBCtrls, IBQuery;

type
  TformRecalculo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    traRecalculo: TIBTransaction;
    spRecalculo: TIBStoredProc;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    traConvenio: TIBTransaction;
    qryConvenio: TIBQuery;
    dsrConvenio: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryConvenioAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRecalculo: TformRecalculo;

implementation

uses data_principal;

{$R *.DFM}

procedure TformRecalculo.BitBtn2Click(Sender: TObject);
begin
  with spRecalculo do
   try
    Screen.Cursor := crHourGlass;
    if not Transaction.InTransaction then
      Transaction.StartTransaction;
    ParamByname('DATAINI').AsDate := DateEdit1.Date;
    ParamByname('DATAFIM').AsDate := DateEdit2.Date;
    ParamByname('CONVENIO').AsInteger :=
      qryConvenio.fieldByname('CODIGO').AsInteger;
    ExecProc;
    Transaction.Commit;
    Screen.Cursor := crDefault;
    ShowMessage('Recálculo concluído!');
   except
    on exception do
     begin
       Screen.Cursor := crDefault;
       raise;
       Transaction.Rollback;
     end;
   end
end;

procedure TformRecalculo.FormShow(Sender: TObject);
begin
    qryConvenio.Open;
    Screen.Cursor := crDefault;
end;

procedure TformRecalculo.qryConvenioAfterOpen(DataSet: TDataSet);
begin
  qryConvenio.FetchAll;
  DBLookupComboBox1.KeyValue :=
    qryConvenio.fieldByName('CONVENIO').AsString;
end;

end.
