unit login;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ExtCtrls, StdCtrls, Buttons;

type
  TformLogin = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    Panel2: TPanel;
    edtUSER: TEdit;
    edtPASSWORD: TEdit;
    lbUSER: TLabel;
    lbPASSWORD: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ImageList: TImageList;
    Panel3: TPanel;
    Image: TImage;
    procedure FormShow(Sender: TObject);
    procedure edtUSEREnter(Sender: TObject);
    procedure edtUSERExit(Sender: TObject);
    procedure edtPASSWORDEnter(Sender: TObject);
    procedure edtPASSWORDExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLogin: TformLogin;

implementation

{$R *.DFM}

procedure TformLogin.FormShow(Sender: TObject);
var
  n: integer;
  imagem: TBitmap;
begin
  n := StrToInt(FormatDateTime('ss', Now)) mod ImageList.Count;
  imagem := TBitmap.Create;
  ImageList.getBitmap(n, imagem);
  Image.Picture.Bitmap := imagem;
  imagem.free;
  edtUSER.SetFocus;
end;

procedure TformLogin.edtUSEREnter(Sender: TObject);
begin
     lbUSER.Font.Style := [fsBold];
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clInfoBK;
       TEdit(Sender).Font.Style := [fsBold];
      end;
end;

procedure TformLogin.edtUSERExit(Sender: TObject);
begin
     lbUSER.Font.Style := [];
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clWindow;
       TEdit(Sender).Font.Style := [];
      end;
end;

procedure TformLogin.edtPASSWORDEnter(Sender: TObject);
begin
     lbPASSWORD.Font.Style := [fsBold];
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clInfoBK;
       TEdit(Sender).Font.Style := [fsBold];
      end;
end;

procedure TformLogin.edtPASSWORDExit(Sender: TObject);
begin
     lbPASSWORD.Font.Style := [];
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clWindow;
       TEdit(Sender).Font.Style := [];
      end;
end;

procedure TformLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  atag: byte;
begin
     if key = vk_escape then
         Self.ModalResult := mrCancel;

     if ActiveControl = nil then atag := 0 else
       atag := ActiveControl.Tag;

     if key = vk_Return then
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

end.
