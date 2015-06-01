
   
  -- NO LUGAR DO TESTE
   ALTER PROCEDURE SP_VACINA_DIAMESQTDE
     @ID int,
     @DT_INI  nvarchar(50),
     @DT_FIM  nvarchar(50),
     @PaginaComando nvarchar(50),
     @PrimeiroProdutoID  nvarchar(50),
     @UltimoProdutoID nvarchar(50),
     @PaginaConta nvarchar(50), 
     @PaginaAtual nvarchar(50),
     @QuantidadePorPagina int
  AS
  -- END LUGAR DO TESTE

   --TESTE
   DECLARE  @DT_INI nvarchar(50)
   DECLARE @DT_FIM nvarchar(50)
   DECLARE @PaginaComando nvarchar(10)
   DECLARE @PrimeiroProdutoID int = null
   DECLARE @UltimoProdutoID int = null
   DECLARE @PaginaConta int  --output
   DECLARE @PaginaAtual int 
   DECLARE @QuantidadePorPagina int

    SET @DT_INI = '30/01/2015'
    SET @DT_FIM = '30/05/2015'
    SET @PaginaComando = 'PROXIMO'
    SET @PrimeiroProdutoID = '1052'
    SET @UltimoProdutoID = '1062'
    SET @PaginaConta = '0' --null
    SET @PaginaAtual = '5'
    SET @QuantidadePorPagina = null
    --END TESTE

BEGIN 
     SET NOCOUNT ON 

   IF (@QuantidadePorPagina IS NULL)
       SET @QuantidadePorPagina = 10
     

    DECLARE @Temp_Table TABLE 
    (
         id int,
         DATA_ATENDIMENTO nvarchar(255),
         ID_ATENDIMENTO nvarchar(255),
         APLICADO nvarchar(255),
         VALOR nvarchar(255),
         ID_ATENDVACINA nvarchar(255),
         NOME nvarchar(255),
         ID_VACINA nvarchar(255),
         PaginaConta nvarchar(255),
         PaginaAtual nvarchar(255)
   )

   -- Para tabelas temporarias
   --DROP TABLE #temp_User
   --CREATE UNIQUE CLUSTERED INDEX Idx_TableName ON #Temp_Table(id) --fill in table structure
    
     ---- Conta linhas
    SELECT @PaginaConta = CEILING(COUNT(*)/10)
          FROM TB_ATENDIMENTO AS ate
              INNER JOIN dbo.TB_VACINAS_ATENDIMENTO AS vAte
                ON vAte.ATENDIMENTO_ID_FK = ate.ID_PK
                   INNER JOIN dbo.TB_VACINAS AS vac
                      ON vac.ID_PK = vAte.VVACINA_ID_FK 
          WHERE convert(date,ate.DATA_ATENDIMENTO,104) >= convert(date,@DT_INI,104) 
                        and convert(date,ate.DATA_ATENDIMENTO,104) <= convert(date,@DT_FIM,104)

    -- primeira pagina é requerida OU pagina anterior quando a página atual já a primeirao
    IF @PaginaComando = 'PRIMEIRO' OR (@PaginaComando = 'ANTERIOR' AND
        @PaginaAtual <= 1)
    BEGIN
        INSERT INTO @Temp_Table
        SELECT TOP (@QuantidadePorPagina)
         vAte.ID_PK as id,
         ate.DATA_ATENDIMENTO,
         ate.ID_PK as ID_ATENDIMENTO,
         vAte.APLICADO,
         vAte.VALOR,
         vAte.ID_PK as ID_ATENDVACINA,
         vac.NOME,
         vac.ID_PK as ID_VACINA,
         vAte.VALOR as PaginaConta,  
         vAte.VALOR as PaginaAtual
        FROM TB_ATENDIMENTO AS ate
          INNER JOIN dbo.TB_VACINAS_ATENDIMENTO AS vAte
            ON vAte.ATENDIMENTO_ID_FK = ate.ID_PK
               INNER JOIN dbo.TB_VACINAS AS vac
                  ON vac.ID_PK = vAte.VVACINA_ID_FK
        WHERE  convert(date,ate.DATA_ATENDIMENTO,104) >= convert(date,@DT_INI,104) 
                and convert(date,ate.DATA_ATENDIMENTO,104) <= convert(date,@DT_FIM,104)  and vAte.APLICADO = 'true'

        SET @PaginaAtual = 1

        --RETURN 0
    END

    -- a ultima pagina é requisita ou a proxima pagina quando a pagina atual for a ultima pagina
    IF @PaginaComando = 'ULTIMO' OR (@PaginaComando = 'PROXIMO' AND
        @PaginaAtual >= @PaginaConta)
    BEGIN
        INSERT INTO @Temp_Table
        SELECT a.*
        FROM
            (SELECT TOP (@QuantidadePorPagina)
             vAte.ID_PK as id,
             ate.DATA_ATENDIMENTO,
             ate.ID_PK as ID_ATENDIMENTO,
             vAte.APLICADO,
             vAte.VALOR,
             vAte.ID_PK as ID_ATENDVACINA,
             vac.NOME,
             vac.ID_PK as ID_VACINA,
             vAte.VALOR as PaginaConta,  
             vAte.VALOR as PaginaAtual 
            FROM TB_ATENDIMENTO AS ate
                INNER JOIN dbo.TB_VACINAS_ATENDIMENTO AS vAte
                  ON vAte.ATENDIMENTO_ID_FK = ate.ID_PK
                     INNER JOIN dbo.TB_VACINAS AS vac
                        ON vac.ID_PK = vAte.VVACINA_ID_FK
            WHERE  convert(date,ate.DATA_ATENDIMENTO,104) >= convert(date,@DT_INI,104) 
                and convert(date,ate.DATA_ATENDIMENTO,104) <= convert(date,@DT_FIM,104) and vAte.APLICADO = 'true'
            ORDER BY vAte.ID_PK DESC) a
        ORDER BY ID_ATENDVACINA --vAte.ID_PK

        SET @PaginaAtual = @PaginaConta

       -- RETURN 0
    END

    IF @PaginaComando = 'PROXIMO'
    BEGIN
        INSERT INTO @Temp_Table
        SELECT TOP (@QuantidadePorPagina)
          vAte.ID_PK as id,
          ate.DATA_ATENDIMENTO,
          ate.ID_PK as ID_ATENDIMENTO,
          vAte.APLICADO,
          vAte.VALOR,
          vAte.ID_PK as ID_ATENDVACINA,
          vac.NOME,
          vac.ID_PK as ID_VACINA,
          vAte.VALOR as PaginaConta,  
          vAte.VALOR as PaginaAtual 
        FROM TB_ATENDIMENTO AS ate
                INNER JOIN dbo.TB_VACINAS_ATENDIMENTO AS vAte
                  ON vAte.ATENDIMENTO_ID_FK = ate.ID_PK
                     INNER JOIN dbo.TB_VACINAS AS vac
                        ON vac.ID_PK = vAte.VVACINA_ID_FK
        WHERE vAte.ID_PK > @UltimoProdutoID and convert(date,ate.DATA_ATENDIMENTO,104) >= convert(date,@DT_INI,104) 
                and convert(date,ate.DATA_ATENDIMENTO,104) <= convert(date,@DT_FIM,104) and vAte.APLICADO = 'true'
        ORDER BY vAte.ID_PK

        SET @PaginaAtual = @PaginaAtual+1

       -- RETURN 0
    END

    IF @PaginaComando = 'ANTERIOR'
    BEGIN
        INSERT INTO @Temp_Table
        SELECT a.*
        FROM (
            SELECT TOP (@QuantidadePorPagina)
             vAte.ID_PK as id,
             ate.DATA_ATENDIMENTO,
             ate.ID_PK as ID_ATENDIMENTO,
             vAte.APLICADO,
             vAte.VALOR,
             vAte.ID_PK as ID_ATENDVACINA,
             vac.NOME,
             vac.ID_PK as ID_VACINA,
             vAte.VALOR as PaginaConta,  
             vAte.VALOR as PaginaAtual 
            FROM  TB_ATENDIMENTO AS ate
                INNER JOIN dbo.TB_VACINAS_ATENDIMENTO AS vAte
                    ON vAte.ATENDIMENTO_ID_FK = ate.ID_PK
                       INNER JOIN dbo.TB_VACINAS AS vac
                          ON vac.ID_PK = vAte.VVACINA_ID_FK
            WHERE vAte.ID_PK < @PrimeiroProdutoID and convert(date,ate.DATA_ATENDIMENTO,104) >= convert(date,@DT_INI,104) 
                and convert(date,ate.DATA_ATENDIMENTO,104) <= convert(date,@DT_FIM,104) and vAte.APLICADO = 'true'
            ORDER BY vAte.ID_PK DESC) a
        ORDER BY ID_ATENDVACINA --vAte.ID_PK

        SET @PaginaAtual = @PaginaAtual-1

       -- RETURN 0
    END
  

  UPDATE @Temp_Table SET PaginaConta = @PaginaConta , PaginaAtual = @PaginaAtual
 
  SELECT  DATA_ATENDIMENTO,
         ID_ATENDIMENTO,
         APLICADO,
         VALOR,
         ID_ATENDVACINA,
         NOME,
         ID_VACINA,
         PaginaConta,  
         PaginaAtual FROM @Temp_Table  order by ID_ATENDVACINA

END

GO