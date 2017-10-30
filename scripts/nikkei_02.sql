/*
** ALTERACOES DO SISTEMA EM 08/05/2003
*/

ALTER PROCEDURE AGENDA (
    DATA DATE,
    CODSETOR INTEGER)
RETURNS (
    CODIGO INTEGER,
    HORA TIME,
    HORAEXAME TIME,
    REGISTRO VARCHAR(10) CHARACTER SET NONE,
    NOME VARCHAR(40) CHARACTER SET NONE,
    SETOR VARCHAR(40) CHARACTER SET NONE,
    REALIZADO CHAR(1) CHARACTER SET NONE,
    EXAME VARCHAR(40) CHARACTER SET NONE,
    INDICE INTEGER,
    CONVENIO VARCHAR(40) CHARACTER SET NONE,
    MEDICOREQ VARCHAR(40) CHARACTER SET NONE,
    MEDICOEXE VARCHAR(40),
    NOMELAUDO VARCHAR(40))
AS
DECLARE VARIABLE CODEXAME INTEGER;
DECLARE VARIABLE HORAINI TIME;
DECLARE VARIABLE HORAFIM TIME;
DECLARE VARIABLE DATAHORA TIMESTAMP;
DECLARE VARIABLE INI INTEGER;
DECLARE VARIABLE FIM INTEGER;
DECLARE VARIABLE N INTEGER;
DECLARE VARIABLE DATAMAX TIMESTAMP;
DECLARE VARIABLE DATAMIN TIMESTAMP;
DECLARE VARIABLE PACIENTE VARCHAR(40);
DECLARE VARIABLE TIPO CHAR(1);
DECLARE VARIABLE REGISTRO_TEMP VARCHAR(10);
DECLARE VARIABLE NOMELAUDO_TEMP VARCHAR(40);
begin

  /* defino automaticamente a hora inicial e final de cada dia */
  select
    min(rg.data),
    max(rg.data)
  from
    regdiario rg
    join exames ex on
      (ex.codigo = rg.codexame)
  where
    cast(data as date) = :data and
    ex.setor = :codsetor
  into
    :datamin,
    :datamax;

  /* se nao tiver nada, termino */
  if (datamin is null) then exit;

  /* defino o inicio e o fim */
  INI = extract(hour from datamin);
  FIM = extract(hour from datamax);

  /* começo a varrer a base de dados */
  for
  select
    horaini,
    horafim
  from
    horarios(:INI, :FIM)
  into
    :horaini,
    :horafim
  do
  begin

    N = 0;

    /* seleciono os exames de cada horario */
    for
    select
      rg.codigo,
      rg.data,
      f_lrtrim(rg.coddiario),
      f_lrtrim(cl.nome),
      rg.codexame,
      rg.tipo,
      rg.nome_laudo
    from
      regdiario rg
      join clientes cl on
        (cl.codigo = rg.codpaciente)
      join exames ex on
        (ex.codigo = rg.codexame)
    where
      (cast(rg.data as date) = :data) and
      (cast(rg.data as time) between :horaini and :horafim) and
      (ex.setor = :codsetor)
    order by
      rg.data
    into
      :codigo,
      :datahora,
      :registro_temp,
      :paciente,
      :codexame,
      :tipo,
      :nomelaudo_temp
    do
    begin

      N = N + 1;

      if (N = 1) then
       begin
        /* cabeçalho */
        hora      = horaini;
        horaexame = NULL;
        registro  = NULL;
        nome      = NULL;
        setor     = NULL;
        exame     = NULL;
        realizado = NULL;
        indice    = extract(hour from horaini);
        convenio  = NULL;
        medicoreq = NULL;
        medicoexe = NULL;
        nomelaudo = NULL;
        suspend;
       end

      hora      = NULL;
      horaexame = cast(datahora as time);
      nome      = paciente;
      realizado = tipo;
      indice    = extract(hour from horaini);
      registro  = registro_temp;
      nomelaudo = nomelaudo_temp;

      /* leio o exame, setor */
      select
        ex.nome,
        se.nome
      from
        exames ex
        join setores se on
          (se.codigo = ex.setor)
      where
        ex.codigo = :codexame
      into
        :exame,
        :setor;

      select
        co.nome,
        md.nome,
        me.nome
      from
        regdiario rg
        join convenios co on
          (co.codigo = rg.codconvenio)
        join medicos md on
          (md.codigo = rg.codmedico_req)
        join medicos me on
          (me.codigo = rg.codmedico_exe)
      where
        rg.codigo = :codigo
      into
        :convenio,
        :medicoreq,
        :medicoexe;

      suspend;

    end

    if (n = 0) then
     begin
        /* cabeçalho */
        hora      = horaini;
        horaexame = NULL;
        registro  = NULL;
        nome      = 'não há exames nesse horário';
        setor     = NULL;
        exame     = NULL;
        realizado = NULL;
        indice    = extract(hour from horaini);
        convenio  = NULL;
        medicoreq = NULL;
        medicoexe = NULL;
        nomelaudo = NULL;
        suspend;
     end

  end

end!
