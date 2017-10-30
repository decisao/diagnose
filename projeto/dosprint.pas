{********************************************************}
{                                                        }
{    DOSPrint Component version 1.3 for Delphi           }
{    Copyright (C) 1999-2001 Elieser Morais              }
{    Portions by Gary Sick, 1991 Turbo Pascal How-To     }
{                                                        }
{    Any questions?                                      }
{    Please ask me on: eliesermorais@yahoo.com           }
{                                                        }
{    Version history:                                    }
{                                                        }
{       1.3 add BaseStyle feature for global effects     }
{       1.2 support to 6th printer effect                }
{       1.1 max fields bug fixed                         }
{       1.0 initial release                              }
{                                                        }
{********************************************************}

unit DOSPrint;

interface

    procedure DOSPrintOpen(PrnPort, InitCommands, BaseStyle: string);
    procedure DOSPrintAdd(X, Y: Integer; Text, Style: string);
    procedure DOSPrintSendPage(Copias: integer);
    procedure DOSPrintClose;

implementation

  uses
    printers;

  const
    { Numero maximo de campos na pagina }
    MaxPrnFields = 900;

    { Tabela Padrao para EPSON Raster Printers }
    TableCodes: array[1..6, 1..2] of string[4] = (
      { 1.1 = NEGRITO    ON  } ( #27+'G'   ,
      { 1.2 = NEGRITO    OFF }   #27+'H'  ),
      { 2.1 = ITALICO    ON  } ( #27+'4'   ,
      { 2.2 = ITALICO    OFF }   #27+'5'  ),
      { 3.1 = SUBLINHADO ON  } ( #27+'-1'  ,
      { 3.2 = SUBLINHADO OFF }   #27+'-0' ),
      { 4.1 = CONDENSADO ON  } ( #15       ,
      { 4.2 = CONDENSADO OFF }   #18      ),
      { 5.1 = EXPANDIDO  ON  } ( #27+'W1'  ,
      { 5.2 = EXPANDIDO  OFF }   #27+'W0' ),
      { 6.1 = SUPERCOMP  ON  } ( #27+'M'+#15 ,
      { 6.2 = SUPERCOMP  OFF }   #18+#27+'P'));

  type
    TPrnTextStr  = string[80];
    TPrnStyleStr = string[4];

    TPrnField = record
      Row, Col: byte;
      text: TPrnTextStr;
      style: TPrnStyleStr;
    end;

    TPrnForm = array[1..MaxPrnFields] of TPrnField;

  var
    TextPrinter: TextFile;
    DOSPrnFields: TPrnForm;
    nFields: word;

  procedure FormPrnPrint(Data: TPrnForm; Count: integer);
  var
    i, j: integer;

    { ordeno as linhas e colunas - a impressora nao faz milagres }
    procedure OrderRows;
    var
      i, j, h: integer;
      v: TPrnField;
    begin
      h := 1;
      repeat
        h := 3 * h + 1;
      until h > Count;
      repeat
        h := h div 3;
        for i := h + 1 to Count do
         begin
          v := Data[i];
          j := i;
          while ((Data[j - h].Row > v.Row) or ((Data[j - h].Row = v.Row) and
                (Data[j - h].Col > v.Col))) and (j > h) do
           begin
            Data[j] := Data[j - h];
            j := j - h;
           end;
          Data[j] := v;
         end;
      until h = 1;
    end;


    { imprime o texto - usando os efeitos, se houverem }
    procedure SendPrint(PrnText: TPrnTextStr; PrnStyle: TPrnStyleStr);
    var
      n, x: byte;
      UseStyle: boolean;
    begin
      UseStyle := false;
      if length(PrnStyle) > 0 then
       for n := 1 to length(PrnStyle) do
        if PrnStyle[n] in ['1'..'6'] then
         begin
          x := ord(PrnStyle[n]) - 48;
          write(TextPrinter, TableCodes[x, 1]);
          UseStyle := true;
         end;
      write(TextPrinter, PrnText);
      if UseStyle then
       for n := length(PrnStyle) downto 1 do
        if PrnStyle[n] in ['1'..'6'] then
         begin
          x := ord(PrnStyle[n]) - 48;
          write(TextPrinter, TableCodes[x, 2]);
         end;
    end;

  begin
    { impressao dos campos }
    OrderRows;
    for i := 1 to Count do
     begin
      if i = 1 then
       begin
        for j := 1 to Data[i].Row - 1 do writeln(TextPrinter);
        for j := 1 to Data[i].Col - 1 do write(TextPrinter, chr(32));
        SendPrint(Data[i].Text, Data[i].Style);
       end else
       begin
        if Data[i].Row > Data[i - 1].Row then
         begin
          for j := Data[i - 1].Row to Data[i].Row - 1 do writeln(TextPrinter);
          for j := 1 to Data[i].Col - 1 do write(TextPrinter, chr(32));
          SendPrint(Data[i].Text, Data[i].Style);
         end else
         begin
          for j := Data[i - 1].Col + length(Data[i - 1].Text) to
            Data[i].Col - 1 do write(TextPrinter, chr(32));
          SendPrint(Data[i].Text, Data[i].Style);
         end;
       end;
     end;
    write(TextPrinter, chr(13), chr(12));
  end;

  procedure DOSPrintOpen(PrnPort, InitCommands, BaseStyle: string);
  var
    x, n: byte;
  begin
    nFields := 0;
    Assign(TextPrinter, PrnPort);
    Rewrite(TextPrinter);
    write(TextPrinter, InitCommands);

    { estilo base }
    if length(BaseStyle) > 0 then
     for n := 1 to length(BaseStyle) do
      if BaseStyle[n] in ['1'..'6'] then
       begin
        x := ord(BaseStyle[n]) - 48;
        write(TextPrinter, TableCodes[x, 1]);
       end;
  end;

  procedure DOSPrintAdd(X, Y: Integer; Text, Style: string);
  begin
    inc(nFields);
    DOSPrnFields[nFields].Col   := X;
    DOSPrnFields[nFields].Row   := Y;
    DOSPrnFields[nFields].Text  := Text;
    DOSPrnFields[nFields].Style := Style;
  end;

  procedure DOSPrintSendPage(Copias: integer);
  var
    nc: integer;
  begin
    for nc := 1 to Copias do
       FormPrnPrint(DOSPrnFields, nFields);
    nFields := 0;
  end;

  procedure DOSPrintClose;
  begin
    CloseFile(TextPrinter);
    nFields := 0;
  end;

  begin
    nFields := 0;
  end.

