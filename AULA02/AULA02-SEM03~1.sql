/*
MEU PRIMEIRO PROGRAMA EM PL / SQL
*/

SET SERVEROUTPUT ON;

DECLARE
    V_ALUNOFIAP2024 VARCHAR2(100);

BEGIN -- OBRIGAT�RIO
        SELECT NOME
        INTO V_FIAPALUNO2024
        FROM ALUNOFIAP2024
        WHERE RM = 99097;
    
    dbms_output.put_line ('O NOME DO ALUNO � ' || V_ALUNOFIAP2024);

END; -- OBRIGAT�RIO