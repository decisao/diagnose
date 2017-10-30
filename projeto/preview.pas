unit preview;
{
  A sample custom preview for QuickReport 2.0
  Last update: March 5th, 1998
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Spin, qrprntr, quickrpt, qrextra, 
  Buttons, TB97Tlbr, TB97Ctls, TB97, Placemnt, QRExport, PsQrExpRtns,
  PsQrExport;

type
  TformPreview = class(TForm)
    QRPreview: TQRPreview;
    SaveDialogExport: TSaveDialog;
    Dock971: TDock97;
    StatusBar1: TStatusBar;
    FormStorage: TFormStorage;
    sePage: TSpinEdit;
    seZoom: TSpinEdit;
    Toolbar971: TToolbar97;
    ToolbarSep974: TToolbarSep97;
    Print: TToolbarButton97;
    PreviousPage1: TToolbarButton97;
    sbNextPage: TToolbarButton97;
    ZoomToFit: TToolbarButton97;
    ToolbarSep973: TToolbarSep97;
    Save: TToolbarButton97;
    NextPage1: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    SaveDialog: TSaveDialog;
    PsQRFilters: TPsQRFilters;
    procedure Init;
    procedure seZoomChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRPreviewPageAvailable(Sender: TObject; PageNum: Integer);
    procedure FormCreate(Sender: TObject);
    procedure sbFirstPageClick(Sender: TObject);
    procedure PreviousPage1Click(Sender: TObject);
    procedure sbNextPageClick(Sender: TObject);
    procedure sbLastPageClick(Sender: TObject);
    procedure ZoomToFitClick(Sender: TObject);
    procedure PrintSetupClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure BitBtnExitClick(Sender: TObject);
    procedure CancelReport;
    procedure LoadClick(Sender: TObject);
    procedure NextPage1Click(Sender: TObject);
    procedure ZoomToFitMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbZoom100Click(Sender: TObject);
    procedure PrintMouseEnter(Sender: TObject);
    procedure PrintMouseExit(Sender: TObject);
  private
    { Private declarations }
  public
    pQuickreport : TQuickRep;
    bPleaseInit : Boolean;
    sTitle : string;
    bCanPrint: boolean;
    rep_ratio: integer;
    { Public declarations }
  end;

var
  formPreview: TformPreview;

implementation

uses data_principal;

{$R *.DFM}

procedure TformPreview.seZoomChange(Sender: TObject);
begin
  QRPreview.Zoom:=seZoom.Value;
end;

procedure TformPreview.Init;
begin
  if bPleaseInit then
  begin

    { Force the preview to come up in the zoom setting that we want}
    QRPreview.ZoomToFit;
    seZoom.Value:= QRPreview.Zoom;
    sePage.Value:= 1;
    StatusBar1.SimpleText := Format('Visualizando a página %d', [sePage.Value]);
    bPleaseInit := False;
  end;
end;
procedure TformPreview.FormShow(Sender: TObject);
begin
  { Signal ourselves that we need to update the form }
  bPleaseInit := True;

  { If the caller reports want to disable printing, then it will set}
  { the following boolean to false }
  if not bCanPrint then
  begin
    Print.Enabled := bCanPrint;
    Save.Enabled := bCanPrint;
  end;
//  seZoom.Height := 25;
  StatusBar1.SimpleText := Format('Visualizando a página %d', [sePage.Value]);

end;

procedure TformPreview.cmdExitClick(Sender: TObject);
begin
  Close;
end;

procedure TformPreview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  { You must clear the preview's qrpinter property}
  QRPreview.QRPrinter := nil;
  { tell Delphi to free this form automaticly }
  Action := caFree;
end;

procedure TformPreview.QRPreviewPageAvailable(Sender: TObject;
  PageNum: Integer);
begin

  { Here's one way to show the current status of the report }
  case QRPreview.QRPrinter.Status of
    mpReady: Caption := Caption + ' (pronto)';
    mpBusy: Caption := Caption + ' - Aguarde! Gerando relatório';
    mpFinished:
     begin
      Print.Enabled := True;
      Save.Enabled := True;
      Caption := Caption + ' - Pronto para imprimir!';

      Init;

      { Display the number of rendered pages }
      if PageNum = 1 then
       begin
        Caption := QRPreview.QRPrinter.Title + ' - 1 página';
        NextPage1.Enabled := False;
        PreviousPage1.Enabled := False;
       end
      else
        Caption := QRPreview.QRPrinter.Title + ' - ' + IntToStr(PageNum) + ' páginas';

      sbFirstPageClick(Sender);
      ZoomToFitClick(Sender);
      ZoomToFitMouseUp(Sender, mbMiddle, [ssCtrl], 0, 0);
     end;
  end;
end;

procedure TformPreview.FormCreate(Sender: TObject);
begin
{ this is temporary. Not exists the resourcestring in qr2const.rc }
//  Exit.Caption := LoadStr( SqrCancel );


  { You can put code in here to control how the form behaves}
  //WindowState := wsMaximized;
  //FormStyle := fsStayOnTop;

  { We can disable functionality at runtime }
  bCanPrint := False;
end;

procedure TformPreview.sbFirstPageClick(Sender: TObject);
begin
  QRPreview.PageNumber:=sePage.Value;
end;

procedure TformPreview.PreviousPage1Click(Sender: TObject);
begin
  if sePage.Value > 1 then
  begin
    sePage.Value := sePage.Value - 1;
    QRPreview.PageNumber:=sePage.Value;
    StatusBar1.SimpleText := Format('Visualizando a página %d', [sePage.Value]);
  end;
end;

procedure TformPreview.sbNextPageClick(Sender: TObject);
begin
     close;
end;

procedure TformPreview.sbLastPageClick(Sender: TObject);
begin
  sePage.Value := QRPreview.QRPrinter.PageCount;
  QRPreview.PageNumber:=sePage.Value;
end;

procedure TformPreview.ZoomToFitClick(Sender: TObject);
begin
  QRPreview.ZoomToFit;
  seZoom.Value:=QRPreview.Zoom;
end;

procedure TformPreview.PrintSetupClick(Sender: TObject);
begin
  {
     With 2.0j, QuickReport will set the report's tag property to -1 if the
     user cancels the printersetup.  By checking for this value, we can call
     the print method directly from setup if the users selects OK
  }
  with pQuickReport do
  begin
    tag := -1; { Just in case you are using an older version }
    PrinterSetup;
    if tag = 0 then
      print;
  end;
end;

procedure TformPreview.PrintClick(Sender: TObject);
begin
  Print.Enabled := False;
  QRPreview.qrprinter.Print;
  Print.Enabled := True;
end;

procedure TformPreview.SaveClick(Sender: TObject);
var
  aExportFilter : TQRExportFilter;
{$ifndef win32}
  FileExt : string;
  I : integer;
{$endif}
begin
   aExportFilter := nil;   
  with SaveDialogExport do
  try
    //Filter := QRExportFilterLibrary.SaveDialogFilterString;
{    DefaultExt := cQRPDefaultExt;}
    if Execute then
    begin
     if FilterIndex = 1 then
      begin
        if Pos('.', Filename) = 0 then
          Filename := Filename + '.qrp';
        QRPreview.QRPrinter.Save(Filename);
      end
      else
      begin
        try
          aExportFilter := TQRExportFilterLibraryEntry(
            QRExportFilterLibrary.Filters[FilterIndex - 2]).ExportFilterClass.Create(Filename);
          QRPreview.QRPrinter.ExportToFilter(aExportFilter);
        finally
          aExportFilter.Free
        end
      end
    end;
  except
    on exception do ShowMessage('Um erro ocorreu durante a exportação.');
  end;
end;

procedure TformPreview.BitBtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TformPreview.CancelReport;
begin
  if pQuickReport.qrprinter.status = mpBusy then
    if MessageDlg('Interromper este relatório?', mtConfirmation, mbOKCancel,0) = mrOK then
    begin
      QRPrinter.Cancel;
      QRPreview.qrprinter := nil;
    end;
end;

procedure TformPreview.LoadClick(Sender: TObject);
begin
  with TOpenDialog.Create(Self) do
  try
    Filter := 'QuickReport files (*.qrp)|*.qrp';
    if Execute then
      if FileExists(FileName) then
      begin
        QRPreview.QRPrinter.Load(Filename);
        QRPreview.PageNumber := 1;
        QRPreview.PreviewImage.PageNumber := 1;
        if QRPreview.QRPrinter.Title = '' then
          QRPreview.QRPrinter.Title := Filename;
        if QRPreview.QRPrinter.PageCount = 1 then
          Self.Caption := QRPreview.QRPrinter.Title + ' - ' + IntToStr(QRPreview.QRPrinter.PageCount) + ' página'
        else
          Self.Caption := QRPreview.QRPrinter.Title + ' - ' + IntToStr(QRPreview.QRPrinter.PageCount) + ' páginas';
        bPleaseInit := True;
        Init;
      end
      else
        ShowMessage('Não foi possível abrir o arquivo: ' + FileName);
  finally
    release;
  end;
end;






procedure TformPreview.NextPage1Click(Sender: TObject);
begin
  if sePage.Value < QRPreview.QRPrinter.PageCount then
  begin
    sePage.Value := sePage.Value + 1;
    QRPreview.PageNumber:=sePage.Value;
    StatusBar1.SimpleText := Format('Visualizando a página %d', [sePage.Value]);
  end;
end;



procedure TformPreview.ZoomToFitMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Shift = [ssShift] then
    rep_ratio := -15
  else
    rep_ratio := +15;
  QRPreview.Zoom := QRPreview.Zoom + rep_ratio;
  seZoom.Value:=QRPreview.Zoom;
end;

procedure TformPreview.sbZoom100Click(Sender: TObject);
var
  arquivo: string;
begin
   with SaveDialog do
    begin

     { sugestão do nome }
     case filterindex of
      1: filename := 'preview.htm';
      2: filename := 'preview.txt';
      3: filename := 'preview.pdf';
      4: filename := 'preview.bmp';
      5: filename := 'preview.gif';
      6: filename := 'preview.jpg';
      7: filename := 'preview.xls';
     end;

     if execute then
      arquivo := filename
     else
      exit;
    end;

  case SaveDialog.filterindex of
   1: ExportToHTML (pQuickReport, arquivo);
   2: ExportToText (pQuickReport, arquivo);
   3: ExportToPDF  (pQuickReport, arquivo);
   4: ExportToBMP  (pQuickReport, arquivo);
   5: ExportToGIF  (pQuickReport, arquivo);
   6: ExportToJPEG (pQuickReport, arquivo);
   7: ExportToExcel(pQuickReport, arquivo);
  end;

  close;
end;

procedure TformPreview.PrintMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformPreview.PrintMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

end.
