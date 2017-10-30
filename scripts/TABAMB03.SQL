/* NOVOS RECURSOS NO DIAGNOS */
/* CORREÇÃO DE BUGS */

SET TERM ^ ;

ALTER TRIGGER REGDIARIO_BI0
ACTIVE BEFORE INSERT POSITION 0
AS
declare variable ANO INTEGER;
declare variable CODTABAMB INTEGER;
DECLARE VARIABLE CALCULO_NOVO CHAR(1);
DECLARE VARIABLE SETOR INTEGER;
DECLARE VARIABLE DATANOVA TIMESTAMP;
DECLARE VARIABLE CONTADOR INTEGER;
begin

  DATANOVA   = NEW.DATA;

  /* VERIFICO SE EXISTE NA MESMA DATA */
  IF (NEW.TIPO = 'A') THEN
   BEGIN

      SELECT
        SETOR
      FROM
        EXAMES
      WHERE
        CODIGO = NEW.CODEXAME 
      INTO
        :SETOR;

      SELECT
        COUNT(*)
      FROM
        REGDIARIO RE
        JOIN EXAMES EX ON
          (EX.CODIGO = RE.CODEXAME)
      WHERE
        RE.TIPO = 'A' AND
        CAST(RE.DATA AS DATE) = CAST(:DATANOVA AS DATE) AND
        EXTRACT(HOUR FROM RE.DATA) = EXTRACT(HOUR FROM :DATANOVA) AND
        EXTRACT(MINUTE FROM RE.DATA) = EXTRACT(MINUTE FROM :DATANOVA) AND
        EX.SETOR = :SETOR
      INTO
        :CONTADOR;

      IF (CONTADOR IS NULL) THEN
       CONTADOR = 0;

     IF (CONTADOR > 0) THEN
       EXCEPTION REGDIARIO_DATAIGUAL;

   END


  /* ACHO O CODIGO DIARIO */
  if (new.tipo = 'R') then
   begin

     NEW.COD_MES = EXTRACT(MONTH FROM NEW.DATA);
     ANO = EXTRACT(YEAR FROM NEW.DATA);

     SELECT
       MAX(COD_NUMERO) + 1
     FROM
       REGDIARIO
     WHERE
       COD_MES = NEW.COD_MES AND
       EXTRACT(YEAR FROM DATA) = :ANO
     INTO
       NEW.COD_NUMERO;

     IF (NEW.COD_NUMERO IS NULL) THEN
       NEW.COD_NUMERO = 1;

     NEW.CODDIARIO = UDF_PADL(NEW.COD_NUMERO, '0', 4) || '/' || UDF_PADL(NEW.COD_MES, '0', 2);

     /* VALORES DO EXAME */
     SELECT
       CODTABAMB,
       VALOR_CH,
       VALOR_FILME
     FROM
       CONVENIOS
     WHERE
       CODIGO = NEW.CODCONVENIO
     INTO
       :CODTABAMB,
       NEW.VALOR_CH,
       NEW.VALOR_FILME;

     SELECT
       CALCULO_NOVO
     FROM
       TABAMB
     WHERE
       CODIGO = :CODTABAMB
     INTO
       :CALCULO_NOVO;

     IF (CALCULO_NOVO = 'S') THEN
      BEGIN

        SELECT
          QTDE_CO,
          QTDE_HONORARIO,
          QTDE_CH,
          QTDE_FILME,
          MATERIAL
        FROM
          ITTABAMB
        WHERE
          CODTABAMB = :CODTABAMB AND
          CODEXAME = NEW.CODEXAME
        INTO
          NEW.QTDE_CO,
          NEW.QTDE_HONORARIO,
          NEW.QTDE_CH,
          NEW.QTDE_FILME,
          NEW.MATERIAL;

        SELECT FIRST 1
          PO.VALOR
        FROM
          PORTES PO
          JOIN EXAMES EX ON
            (EX.CODPORTE = PO.CODPORTE)
        WHERE
          EX.CODIGO = NEW.CODEXAME
        INTO
          NEW.VALOR_PORTE;

        IF (NEW.VALOR_PORTE IS NULL) THEN
          NEW.VALOR_PORTE = 0;

      END ELSE
      BEGIN

        SELECT
          QTDE_CO,
          QTDE_HONORARIO,
          QTDE_CH,
          QTDE_FILME,
          MATERIAL,
          0
        FROM
          ITTABAMB
        WHERE
          CODTABAMB = :CODTABAMB AND
          CODEXAME = NEW.CODEXAME
        INTO
          NEW.QTDE_CO,
          NEW.QTDE_HONORARIO,
          NEW.QTDE_CH,
          NEW.QTDE_FILME,
          NEW.MATERIAL,
          NEW.VALOR_PORTE;

      END


   end

  NEW.OPERADOR = USER;

end

^

SET TERM ; ^

COMMIT WORK;
