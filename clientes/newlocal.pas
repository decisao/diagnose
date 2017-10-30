unit newlocal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBQuery, IBUpdateSQL, IBCustomDataSet, IBStoredProc, StdCtrls, Buttons, Mask, ExtCtrls,
  IBDatabase;

type
  TformNovaLocalidade = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    edtLOGRADOURO: TEdit;
    Label2: TLabel;
    lb_Cidade: TLabel;
    cbxBAIRRO: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    edtCEP: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qryBairro: TIBQuery;
    FonteBairro: TDataSource;
    qryLogradouros: TIBQuery;
    qryBairros: TIBQuery;
    updBairros: TIBUpdateSQL;
    updLogradouros: TIBUpdateSQL;
    traLogradouros: TIBTransaction;
    traBairros: TIBTransaction;
    traBairro: TIBTransaction;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLOGRADOUROEnter(Sender: TObject);
    procedure edtLOGRADOUROExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    inCidade: longint;
    stEstado: string;
    stCidade: string;
    inLocal : longint;
  end;

var
  formNovaLocalidade: TformNovaLocalidade;

implementation

uses data_principal;

{$R *.DFM}




procedure TformNovaLocalidade.FormShow(Sender: TObject);
begin
     qryBairro.Prepare;
     qryLogradouros.Prepare;
     qryBairros.Prepare;

     lb_Cidade.Caption := Format('%s - %s',
       [stCidade, stEstado]);
     cbxBAIRRO.Clear;
     with qryBairro do
      begin
       ParamByName('CIDADE').AsInteger := inCidade;
       ParamByName('ESTADO').AsString := stEstado;
       open;
       if not IsEmpty then
        while not eof do
         begin
          cbxBairro.Items.Add(fieldByName('BAIRRO').AsString);
          next;
         end;
      end;
     edtLOGRADOURO.SetFocus;

end;

procedure TformNovaLocalidade.BitBtn2Click(Sender: TObject);
var
   cod_bairro, cod_localidade: longint;
begin
   if (edtLogradouro.Text > '') and
      (cbxBairro.Text > '') then
    begin

     { o bairro já está cadastrado }
     if qryBairro.Locate('BAIRRO', uppercase(cbxBairro.Text), []) then
       cod_bairro := qryBairro.FieldByName('CODIGO').AsInteger else
      begin
       { salvo o bairro }
       cod_bairro     := dmoPrincipal.LerSequencia('BAIRROS');
       qryBairros.open;
       qryBairros.InsertRecord([
          cod_bairro,                 { CODIGO }
          uppercase(cbxBairro.Text),  { BAIRRO }
          inCidade,                   { CIDADE }
          stEstado                    { ESTADO }
          ]);
       dmoPrincipal.SalvarRegistro(qryBairros);
      end;

     { salvo a localidade }
     cod_localidade := dmoPrincipal.LerSequencia('LOGRADOUROS');
     qryLogradouros.open;
     qryLogradouros.InsertRecord([
        cod_localidade,                 { CODIGO }
        uppercase(edtLogradouro.Text),  { LOGRADOUORO }
        cod_bairro,                     { BAIRRO }
        edtcep.text,                    { CEP    }
        inCidade,                       { CIDADE }
        stEstado,                       { ESTADO }
        ''                              { COMPLEMENTO }
        ]);
     dmoPrincipal.SalvarRegistro(qryLogradouros);

     { salvo o código da localidade }
     inLocal := cod_localidade;
    end else ShowMessage('Você precisa preencher todos os campos ou cancelar.');
end;

procedure TformNovaLocalidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  atag: integer;
begin
     if key = 27 then close;

     if ActiveControl = nil then atag := 0 else
       atag := ActiveControl.Tag;

     if (key = vk_Return) and (atag < 3) then
      if shift = [] then Perform(wm_NextDlgCtl, 0, 0) else
       if shift = [ssShift] then Perform(wm_NextDlgCtl, 0, 0);

     if not odd(atag) then
      begin
       case key of
        vk_Down: Perform(wm_NextDlgCtl, 0, 0);
        vk_Up: Perform(wm_NextDlgCtl, 1, 0);
       end;
      end;

end;

procedure TformNovaLocalidade.edtLOGRADOUROEnter(Sender: TObject);
begin
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clInfoBK;
       TEdit(Sender).Font.Style := [fsBold];
      end;
     if Sender is TMaskEdit then
      begin
       TMaskEdit(Sender).Color := clInfoBK;
       TMaskEdit(Sender).Font.Style := [fsBold];
      end;
end;

procedure TformNovaLocalidade.edtLOGRADOUROExit(Sender: TObject);
begin
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clWindow;
       TEdit(Sender).Font.Style := [];
      end;
     if Sender is TMaskEdit then
      begin
       TMaskEdit(Sender).Color := clWindow;
       TMaskEdit(Sender).Font.Style := [];
      end;

end;

procedure TformNovaLocalidade.FormDestroy(Sender: TObject);
begin
     if qryBairro.Active then qryBairro.Close;
     if qryLogradouros.Active then qryLogradouros.Close;
     if qryBairros.Active then qryBairros.Close;
     qryBairro.UnPrepare;
     qryLogradouros.UnPrepare;
     qryBairros.UnPrepare;

end;

end.
