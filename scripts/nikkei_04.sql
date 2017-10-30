/*
** CONVENIO PARTICULAR, CONVENIO NO RECALCULO, HONORARIOS 
*/

CREATE DOMAIN INTEXTPAR AS 
CHAR(1)
DEFAULT 'E' 
CHECK (VALUE IN ('E', 'P', 'I')) ;

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'INTEXTPAR'
where (RDB$FIELD_NAME = 'TIPO') and
(RDB$RELATION_NAME = 'CONVENIOS');

SET TERM ^ ;

ALTER PROCEDURE RECALCULO (
    DATAINI DATE,
    DATAFIM DATE,
    CONVENIO INTEGER)
AS
DECLARE VARIABLE CODIGO INTEGER;
DECLARE VARIABLE CODCONVENIO INTEGER;
DECLARE VARIABLE CODEXAME INTEGER;
DECLARE VARIABLE CODTABAMB INTEGER;
DECLARE VARIABLE VALOR_CH NUMERIC(9,4);
DECLARE VARIABLE VALOR_FILME NUMERIC(9,4);
DECLARE VARIABLE QTDE_CH NUMERIC(9,4);
DECLARE VARIABLE QTDE_FILME NUMERIC(9,4);
DECLARE VARIABLE MATERIAL NUMERIC(9,4);
begin

  for
  select
    codigo,
    codconvenio,
    codexame
  from
    regdiario
  where
    tipo = 'R' and
    codconvenio = :convenio and
    cast(data as date) between :dataini and :datafim
  into
    :codigo,
    :codconvenio,
    :codexame
  do
  begin

    /* dados vindos do convenio */
    select
      codtabamb,
      valor_ch,
      valor_filme
    from
      convenios
    where
      codigo = :codconvenio
    into
      :codtabamb,
      :valor_ch,
      :valor_filme;

    /* dados vindos do exame */
    select
      qtde_ch,
      qtde_filme,
      material
    from
      ittabamb
    where
      codtabamb = :codtabamb and
      codexame  = :codexame
    into
      :qtde_ch,
      :qtde_filme,
      :material;

    /* atualizo os dados do registro em questão */
    update
      regdiario
    set
      valor_ch    = :valor_ch,
      valor_filme = :valor_filme,
      qtde_ch     = :qtde_ch,
      qtde_filme  = :qtde_filme,
      material    = :material
    where
      codigo = :codigo;

  end

end

^

SET TERM ; ^

ALTER TRIGGER REGDIARIO_BI0 INACTIVE;
ALTER TRIGGER REGDIARIO_BU0 INACTIVE;
ALTER TRIGGER REGDIARIO_BD0 INACTIVE;

ALTER TABLE REGDIARIO ADD QTDE_CO DEC4_VALIDO;
UPDATE REGDIARIO SET QTDE_CO = 0;

ALTER TABLE REGDIARIO ADD QTDE_HONORARIO DEC4_VALIDO;
UPDATE REGDIARIO SET QTDE_HONORARIO = 0;

SET TERM ^ ;

CREATE PROCEDURE PREENCHE_QTDE 
AS
declare variable codigo integer;
declare variable codconvenio integer;
declare variable codexame integer;
declare variable codtabamb integer;
declare variable qtde_co numeric(9, 4);
declare variable qtde_honorario numeric(9, 4);
begin

  for
  select
    codigo,
    codconvenio,
    codexame
  from
    regdiario
  into
    :codigo,
    :codconvenio,
    :codexame
  do
  begin

    /* dados vindos do convenio */
    select
      codtabamb
    from
      convenios
    where
      codigo = :codconvenio
    into
      :codtabamb;

    /* dados vindos do exame */
    select
      qtde_co,
      qtde_honorario
    from
      ittabamb
    where
      codtabamb = :codtabamb and
      codexame  = :codexame
    into
      :qtde_co,
      :qtde_honorario;

    /* atualizo os dados do registro em questão */
    update
      regdiario
    set
      qtde_co        = :qtde_co,
      qtde_honorario = :qtde_honorario
    where
      codigo = :codigo;

  end
end

^

SET TERM ; ^

execute procedure PREENCHE_QTDE;

commit;

drop procedure PREENCHE_QTDE;

ALTER TRIGGER REGDIARIO_BI0 ACTIVE;
ALTER TRIGGER REGDIARIO_BU0 ACTIVE;
ALTER TRIGGER REGDIARIO_BD0 ACTIVE;

SET TERM ^ ;

ALTER TRIGGER REGDIARIO_BI0
ACTIVE BEFORE INSERT POSITION 0
AS
declare variable ANO INTEGER;
declare variable CODTABAMB INTEGER;
begin
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

     NEW.CODDIARIO = F_PADLEFT(NEW.COD_NUMERO, '0', 5) || '/' || F_PADLEFT(NEW.COD_MES, '0', 2);

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

   end

end

^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER REGDIARIO_BU0
ACTIVE BEFORE UPDATE POSITION 0
AS
declare variable ANO INTEGER;
declare variable CODTABAMB INTEGER;
begin
  /* ACHO O CODIGO DIARIO */
  if (new.tipo = 'R') then
   begin

     if (old.tipo = 'A') then
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

       NEW.CODDIARIO = F_PADLEFT(NEW.COD_NUMERO, '0', 5) || '/' || F_PADLEFT(NEW.COD_MES, '0', 2);

      end

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

   end else
   IF ((OLD.TIPO = 'R') and (NEW.TIPO = 'A')) THEN
      exception regdiario_alter;

end

^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE RECALCULO (
    DATAINI DATE,
    DATAFIM DATE,
    CONVENIO INTEGER)
AS
DECLARE VARIABLE CODIGO INTEGER;
DECLARE VARIABLE CODCONVENIO INTEGER;
DECLARE VARIABLE CODEXAME INTEGER;
DECLARE VARIABLE CODTABAMB INTEGER;
DECLARE VARIABLE VALOR_CH NUMERIC(9,4);
DECLARE VARIABLE VALOR_FILME NUMERIC(9,4);
DECLARE VARIABLE QTDE_CO NUMERIC(9,4);
DECLARE VARIABLE QTDE_HONORARIO NUMERIC(9,4);
DECLARE VARIABLE QTDE_CH NUMERIC(9,4);
DECLARE VARIABLE QTDE_FILME NUMERIC(9,4);
DECLARE VARIABLE MATERIAL NUMERIC(9,4);
begin

  for
  select
    codigo,
    codconvenio,
    codexame
  from
    regdiario
  where
    tipo = 'R' and
    codconvenio = :convenio and
    cast(data as date) between :dataini and :datafim
  into
    :codigo,
    :codconvenio,
    :codexame
  do
  begin

    /* dados vindos do convenio */
    select
      codtabamb,
      valor_ch,
      valor_filme
    from
      convenios
    where
      codigo = :codconvenio
    into
      :codtabamb,
      :valor_ch,
      :valor_filme;

    /* dados vindos do exame */
    select
      qtde_co,
      qtde_honorario,
      qtde_ch,
      qtde_filme,
      material
    from
      ittabamb
    where
      codtabamb = :codtabamb and
      codexame  = :codexame
    into
      :qtde_co,
      :qtde_honorario,
      :qtde_ch,
      :qtde_filme,
      :material;

    /* atualizo os dados do registro em questão */
    update
      regdiario
    set
      valor_ch       = :valor_ch,
      valor_filme    = :valor_filme,
      qtde_co        = :qtde_co,
      qtde_honorario = :qtde_honorario,
      qtde_ch        = :qtde_ch,
      qtde_filme     = :qtde_filme,
      material       = :material
    where
      codigo = :codigo;

  end

end

^

SET TERM ; ^

