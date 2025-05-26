--insert e select feito para duas matéria bda e prg
--criando procedure
CREATE OR ALTER PROCEDURE sp_CadastraNotas
	(
		@MATRICULA INT,
		@CURSO CHAR(3),
		@MATERIA CHAR(3),
		@PERLETIVO CHAR(4),
		@NOTA FLOAT,
		@FALTA INT,
		@BIMESTRE INT
	)
	AS

BEGIN
DECLARE @RESULTADO VARCHAR(50),------- Declara variáveis auxiliares para fazer os cálculos----------------------
        @FREQUENCIA FLOAT,
        @MEDIAFINAL FLOAT,
        @CARGAHORA INT,
        @MEDIA_ANTES_EXAME FLOAT,
        @MEDIA_FINAL_EXAME FLOAT;

		IF @BIMESTRE = 1
		    BEGIN
                UPDATE MATRICULA
                SET N1 = @NOTA,
                    F1 = @FALTA,
                    TOTALPONTOS = @NOTA,
                    TOTALFALTAS = @FALTA,
                    MEDIA = @NOTA
                WHERE MATRICULA = @MATRICULA
                    AND CURSO = @CURSO
                    AND MATERIA = @MATERIA
                    AND PERLETIVO = @PERLETIVO;
END
        ELSE 
        
        IF @BIMESTRE = 2
            BEGIN
                UPDATE MATRICULA
                SET N2 = @NOTA,
                    F2 = @FALTA,
                    TOTALPONTOS = @NOTA + N1,
                    TOTALFALTAS = @FALTA + F1,
                    MEDIA = (@NOTA + N1) / 2
                WHERE MATRICULA = @MATRICULA
                    AND CURSO = @CURSO
                    AND MATERIA = @MATERIA
                    AND PERLETIVO = @PERLETIVO;
            END

        ELSE 
        
        IF @BIMESTRE = 3
            BEGIN
                UPDATE MATRICULA
                SET N3 = @NOTA,
                    F3 = @FALTA,
                    TOTALPONTOS = @NOTA + N1 + N2,
                    TOTALFALTAS = @FALTA + F1 + F2,
                    MEDIA = (@NOTA + N1 + N2) / 3
                WHERE MATRICULA = @MATRICULA
                    AND CURSO = @CURSO
                    AND MATERIA = @MATERIA
                    AND PERLETIVO = @PERLETIVO;
            END

        ELSE 
        
        IF @BIMESTRE = 4
            BEGIN  
                SET @CARGAHORA = (
                    SELECT CARGAHORARIA 
                    FROM MATERIAS 
                    WHERE SIGLA = @MATERIA
                    AND CURSO = @CURSO);

                UPDATE MATRICULA
                SET N4 = @NOTA,
                    F4 = @FALTA,
                    TOTALPONTOS = @NOTA + N1 + N2 + N3,
                    TOTALFALTAS = @FALTA + F1 + F2 + F3,
                    MEDIA = (@NOTA + N1 + N2 + N3) / 4
                WHERE MATRICULA = @MATRICULA
                    AND CURSO = @CURSO
                    AND MATERIA = @MATERIA
                    AND PERLETIVO = @PERLETIVO
                    
-----------calculando frenquência-----------------------------------------------------------------------------------
                SET @FREQUENCIA =100 - ((SELECT TOTALFALTAS
                                            FROM MATRICULA
                                            WHERE MATRICULA = @MATRICULA 
                                            AND CURSO = @CURSO 
                                            AND MATERIA = @MATERIA 
                                            AND PERLETIVO= @PERLETIVO) * 100.0 / @CARGAHORA)
---verificação das notas e faltas para saber se estar aprovado ou reprovado-----------------------------------------------
                UPDATE MATRICULA
                SET RESULTADO = 
                CASE   
                    WHEN @FREQUENCIA < 75 THEN 'REPROVADO POR FALTA'
                    WHEN (@NOTA + N1 + N2 + N3) / 4  < 3 THEN 'REPROVADO POR NOTA'
                    WHEN (@NOTA + N1 + N2 + N3) / 4 >= 7 THEN 'ALUNO APROVADO'
                    ELSE 'ALUNO DE EXAME'
                END
                WHERE 
                    MATRICULA = @MATRICULA
                    AND CURSO = @CURSO
                    AND MATERIA = @MATERIA
                    AND PERLETIVO = @PERLETIVO;
END
    ELSE
----------------------------------------------------------------------------------------------------------------
----NOTA DO EXAME
        IF @BIMESTRE = 5
            BEGIN
             
            UPDATE MATRICULA
                SET N5 = @NOTA,
                NOTAEXAME = @NOTA,
                MEDIAFINAL = (@NOTA + MEDIA) / 2,
                RESULTADO = CASE WHEN (@NOTA + MEDIA) / 2 >=5 THEN 'APROVADO' ELSE 'REPROVADO' END
                WHERE MATRICULA = @MATRICULA
                    AND CURSO = @CURSO
                    AND MATERIA = @MATERIA
                    AND PERLETIVO = @PERLETIVO
------------------- Obtém a média antes do exame---------------------------------------------------------------
                    SELECT @MEDIA_ANTES_EXAME = MEDIA 
                    FROM MATRICULA
                    WHERE MATRICULA = @MATRICULA
                    AND CURSO = @CURSO
                    AND MATERIA = @MATERIA
                    AND PERLETIVO = @PERLETIVO;
-------------------- Calcula a média final com o exame----------------------------------------------------------
                SET @MEDIA_FINAL_EXAME = (@NOTA + @MEDIA_ANTES_EXAME) / 2
------------------- -- Atualiza com a nota do exame, média final e resultado final-----------------------------                
                UPDATE MATRICULA
                SET 
                    N5 = @NOTA,
                    NOTAEXAME = @NOTA,
                    MEDIAFINAL = @MEDIA_FINAL_EXAME,
                    RESULTADO = CASE 
                        WHEN @MEDIA_FINAL_EXAME >= 5 THEN 'APROVADO EM EXAME'
                        ELSE 'REPROVADO EM EXAME'
                    END
                WHERE 
                    MATRICULA = @MATRICULA AND
                    CURSO = @CURSO AND
                    MATERIA = @MATERIA AND
                    PERLETIVO = @PERLETIVO
    
        END
---------------Retorna a média antes e depois do exame------------------------------------------------------
        SELECT 
        @MEDIA_ANTES_EXAME AS MEDIA_ANTES_DO_EXAME,
        @MEDIA_FINAL_EXAME AS MEDIA_FINAL_COM_EXAME;
---------------- Exibe o registro atualizado da matrícula----------------------------------------------------
        SELECT * FROM MATRICULA
   END 

