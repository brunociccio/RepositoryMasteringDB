/*2) CRIAR UM BLOCO QUE RECEBER� UM RM, UM NOME E QUATRO NOTAS CONFORME A SEQUENCIA:
(RM,NOME,A1,A2,A3,A4), M�NIMO DE DADOS: 2 LINHAS PARA APROVADO E UMA PARA REPROVADO
A PARTIR CRIAR UM BLOCO PL/SQL USANDO CURSORES PARA PROCESSAR O C�LCULO DE M�DIA
SOMANDO O MAIOR VALOR ENTRE A1 E A2 �S NOTAS A3 E A4 E DIVIDINDO O VALOR OBTIDO
POR TR�S (ACHANDO A M�DIA)
SE A M�DIA FOR MENOR QUE 6(SEIS) O ALUNO ESTAR� REPROVADO E SE A M�DIA FOR IGUAL 
OU SUPERIOR A 6(SEIS) O ALUNO ESTAR� APROVADO.
O BLOCO DEVER� INSERIR OS VALORES ACIMA NUMA TABELA DENOMINADA ALUNO COM AS SEGUINTES
COLUNAS RM,NOME,A1,A2,A3,A4,MEDIA,RESULTADO.*/

DROP TABLE ALUNO_CURSOR_CP;
CREATE TABLE ALUNO_CURSOR_CP(
    RM NUMBER(10) PRIMARY KEY,
    NOME VARCHAR2(255),
    A1 NUMBER(4,2),
    A2 NUMBER(4,2),
    A3 NUMBER(4,2),
    A4 NUMBER(4,2),
    MEDIA NUMBER(4,2),
    RESULTADO VARCHAR2(255)
);

INSERT INTO ALUNO_CURSOR_CP VALUES(99097,'BRUNO',9.5,8.7,9.9,10,NULL,NULL);
INSERT INTO ALUNO_CURSOR_CP VALUES(99098,'JOS�',9.3,6.6,9.8,9.8,NULL,NULL);
INSERT INTO ALUNO_CURSOR_CP VALUES(99099,'MARINA',9.5,5.7,9.2,10,NULL,NULL);
INSERT INTO ALUNO_CURSOR_CP VALUES(99100,'THALITA',4.5,6.7,3.9,5.1,NULL,NULL);
INSERT INTO ALUNO_CURSOR_CP VALUES(99101,'ISABELLE',6.5,6,4.3,4.1,NULL,NULL);

SELECT * FROM ALUNO_CURSOR_CP;

DECLARE
    -- Declara��o de vari�veis
    v_rm ALUNO_CURSOR_CP.RM%TYPE;
    v_nome ALUNO_CURSOR_CP.NOME%TYPE;
    v_a1 ALUNO_CURSOR_CP.A1%TYPE;
    v_a2 ALUNO_CURSOR_CP.A2%TYPE;
    v_a3 ALUNO_CURSOR_CP.A3%TYPE;
    v_a4 ALUNO_CURSOR_CP.A4%TYPE;
    v_media NUMBER(4,2);
    
    -- Declara��o do cursor expl�cito
    CURSOR c_alunos IS
        SELECT RM, NOME, A1, A2, A3, A4
        FROM ALUNO_CURSOR_CP
        WHERE MEDIA IS NULL; -- Processar apenas os registros ainda n�o processados
BEGIN
    -- Abertura do cursor
    OPEN c_alunos;
    
    -- Loop de processamento dos dados do cursor
    LOOP
        -- Busca de pr�xima linha
        FETCH c_alunos INTO v_rm, v_nome, v_a1, v_a2, v_a3, v_a4;
        
        -- Verifica se n�o h� mais linhas para processar
        EXIT WHEN c_alunos%NOTFOUND;
        
        -- Calcula a m�dia considerando as condi��es especificadas
        v_media := (GREATEST(v_a1, v_a2) + v_a3 + v_a4) / 3;
        
        -- Determina se o aluno foi aprovado ou reprovado e atualiza na tabela
        IF v_media >= 6 THEN
            UPDATE ALUNO_CURSOR_CP
            SET MEDIA = v_media,
                RESULTADO = 'APROVADO'
            WHERE RM = v_rm;
        ELSE
            UPDATE ALUNO_CURSOR_CP
            SET MEDIA = v_media,
                RESULTADO = 'REPROVADO'
            WHERE RM = v_rm;
        END IF;
        
        -- Confirmar a transa��o
        COMMIT;
    END LOOP;
    
    -- Fechar o cursor
    CLOSE c_alunos;
    
END;
/

