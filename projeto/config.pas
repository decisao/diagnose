unit config;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBCustomDataSet, DBClient, Provider, IBQuery, IBDatabase, dxCntner,
  dxEditor, dxExEdtr, dxEdLib, dxDBELib, StdCtrls, Buttons, ExtCtrls;

type
  TformConfig = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    dxDBButtonEdit1: TdxDBButtonEdit;
    traDetalhes: TIBTransaction;
    qryDetalhes: TIBQuery;
    provDetalhes: TDataSetProvider;
    cdsDetalhes: TClientDataSet;
    qryDetalhesCODIGO: TIntegerField;
    qryDetalhesPATHTEMP: TIBStringField;
    cdsDetalhesCODIGO: TIntegerField;
    cdsDetalhesPATHTEMP: TStringField;
    DataSource1: TDataSource;
    OpenDialog1: TOpenDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxDBButtonEdit1ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConfig: TformConfig;

implementation

{$R *.DFM}

procedure TformConfig.BitBtn1Click(Sender: TObject);
begin
  with cdsDetalhes do
   begin
     if state = dsEdit then
       post;
     if changecount > 0 then
       applyupdates(-1);
   end;
  close;
end;

procedure TformConfig.FormShow(Sender: TObject);
begin
   cdsDetalhes.Open;
end;

procedure TformConfig.dxDBButtonEdit1ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  with OpenDialog1 do
   if Execute then
    begin
      cdsDetalhes.Edit;
      cdsDetalhes.fieldByName('PATHTEMP').AsString :=
        ExtractFilePath(FileName);
      cdsDetalhes.Post;
    end;
end;

end.
