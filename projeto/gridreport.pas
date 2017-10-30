{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 2.0 for Delphi 1.0/2.0/3.0                  ::
  ::                                                         ::
  :: Example QRCreateList() project (32 bit)                 ::
  :: Last update: March 8th, 1998                            ::
  ::                                                         ::
  :: Copyright (c) 1998 QuSoft AS                            ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.com  fax: +47 22 41 74 91        ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }
unit gridreport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Grids, DBGrids, IBQuery, IBCustomDataSet, Db, ExtCtrls, StdCtrls,
  quickrpt, qrextra, qrprntr, qrctrls, Buttons, preview, TB97Tlbr,
  TB97Ctls, TB97;

type
  TformGridReport = class(TForm)
    Panel1: TPanel;
    GroupBoxFields: TGroupBox;
    rbAllFields: TRadioButton;
    rbSelectFields: TRadioButton;
    ListBoxFields: TListBox;
    Dock972: TDock97;
    Toolbar972: TToolbar97;
    btnSair: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    btnImprimir: TToolbarButton97;
    DBGrid1: TDBGrid;
    procedure btnPreviewClick(Sender: TObject);
    procedure rbAllFieldsClick(Sender: TObject);
    procedure rgRecordsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QuickRepPreview(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnImprimirMouseEnter(Sender: TObject);
    procedure btnImprimirMouseExit(Sender: TObject);
  private
    { Private declarations }
    aReport: TCustomQuickRep;
  public
    { Public declarations }
    titulo: string;
  end;

var
  formGridReport: TformGridReport;

implementation

uses data_principal;

{$R *.DFM}

{ dup function from qrexta, used to guess the maximum width of a field }

procedure TformGridReport.rbAllFieldsClick(Sender: TObject);
begin
  {
  If you click one field, clear the other.  This emulates the radiogroup
  control, but gives finer placment over the items
  }

  { disable this event so it doesn't get stuck in an endless loop }
  rbAllFields.OnClick := nil;
  rbSelectFields.OnClick := rbAllFields.OnClick;

  if Sender = rbAllFields then
    rbSelectFields.Checked := not rbAllFields.Checked
  else
    rbAllFields.Checked := not rbSelectFields.Checked;

  rbAllFields.OnClick := rbAllFieldsClick;
  rbSelectFields.OnClick := rbAllFields.OnClick;

  { We only enable the field list when the rbSelectFields button is set }
  ListBoxFields.Enabled := rbSelectFields.Checked;
end;

procedure TformGridReport.rgRecordsClick(Sender: TObject);
begin
  {
  We only allow summary information when more than one record is being
  output
  }
end;

function dup(aChar : Char; Count : integer) : string;
var
  I : integer;
begin
  result := '';
  for I := 1 to Count do result := result + aChar;
end;

procedure TformGridReport.btnPreviewClick(Sender: TObject);
var
  QRGroup1: TQRGroup;
  QRGroupFooter: TQRBand;
  FieldList: TStringList;
  nIdx: integer;
  SumArea, SumPopulation,
  SumGroupArea, SumGroupPopulation: TQRExpr;
begin
{
   We can pass in a list of dataset fields to include on the report.  If the
   list is nil or contains 0 items, all of the fields will be used.
}

  { default the list to nil }
  FieldList := nil;

  { default the group footer to nil }
  QRGroupFooter := nil;
  SumArea := nil;
  SumGroupArea := nil;

{
  Check to see if the user has slected any fields and add the selected
  fields to the list
}
  with ListBoxFields do
    if Enabled then
    begin
      FieldList := TStringList.Create;
      for nIdx := 0 to Items.Count - 1 do
        if Selected[nIdx] then
          FieldList.Add(Items[nIdx]);
    end;

{
  Make sure the new report object is set to nil, otherwise the
  QRCreateList function will not create it and you will get an access
  violation
}
  aReport := nil;

{
  Make the call to create the report.  This will create the report with
  a Column Header band and a Detail band.  You can customize the report
  before you call preview or print.
}
  QRCreateList(aReport, Self, DBGrid1.DataSource.DataSet, titulo, FieldList);

  { Here's where we customize the report...  }
  (aReport as TQuickRep).OnPreview := QuickRepPreview;

  {
    Here's how to add a group band at runtime
  }

{
  If the user has selected all of the records, we check to see if summary
  information is desired.  I have added some simple code to do a summary
  band with a couple of SUM()s.
}
  {
  Loop through the controls on the detail band and set the format
  mask to display "," in the numbers.
  }
//  with areport.bands.detailband do
//    for nIdx := 0 to ControlCount - 1 do
//      if Controls[nIdx] is TQRDBText then
//        with TQRDBText(Controls[nIdx]) do
//          if Alignment = taRightJustify then
//            Mask := '#.##0,00;;Zero';

  aReport.Preview;
  aReport.Free;

  {
  If we created a list of fields, then we free it when we are done with it.
  }
  if FieldList <> nil then
    FieldList.Free;

  close;
end;

procedure TformGridReport.FormShow(Sender: TObject);
var
  nIdx: integer;
begin
  { Prefill the listbox with the list of fields from the table }
  with DBGrid1.DataSource.DataSet do
    for nIdx := 0 to FieldCount - 1 do
      ListBoxFields.Items.Add(Fields[nIdx].FieldName);

  { Call the field selection event to initialize the values}
  rbAllFieldsClick(rbAllFields);
end;

procedure TformGridReport.QuickRepPreview(Sender: TObject);
begin
     with TformPreview.Create(Self) do
      try

       pQuickReport := (aReport as TQuickRep);
       QRPreview.QRPrinter := TQRPrinter(Sender);
       Show;

      except
       on exception do release;
      end;
end;

procedure TformGridReport.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TformGridReport.btnImprimirMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformGridReport.btnImprimirMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

end.
