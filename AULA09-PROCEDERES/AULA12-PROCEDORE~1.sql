CREATE TABLE AULA12_ALUNO (
    NOME VARCHAR2(80),
    RM NUMBER
);

CREATE OR REPLACE PACKAGE PKG_ALUNO AS
  -- GET NOME DO ALUNO
  FUNCTION GET_NOME(P_RM NUMBER) RETURN VARCHAR2;
  -- GET RM DO ALUNO
  FUNCTION GET_RM(P_NOME VARCHAR2) RETURN NUMBER;
END PKG_ALUNO;
/

CREATE OR REPLACE PACKAGE BODY PKG_ALUNO AS
  -- GET NOME DO ALUNO
  FUNCTION GET_NOME(P_RM NUMBER) RETURN VARCHAR2 IS
    V_NOME VARCHAR2(80);
  BEGIN
    SELECT NOME INTO V_NOME FROM AULA12_ALUNO WHERE RM = P_RM;
    RETURN V_NOME;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN NULL;
    WHEN TOO_MANY_ROWS THEN
      RETURN NULL;
  END GET_NOME;

  -- GET RM DO ALUNO
  FUNCTION GET_RM(P_NOME VARCHAR2) RETURN NUMBER IS
    V_RM NUMBER;
  BEGIN
    SELECT RM INTO V_RM FROM AULA12_ALUNO WHERE NOME = P_NOME;
    RETURN V_RM;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN NULL;
    WHEN TOO_MANY_ROWS THEN
      RETURN NULL;
  END GET_RM;
END PKG_ALUNO;
/

SET SERVEROUTPUT ON;

DECLARE
    v_nome_aluno VARCHAR2(80);
    v_rm_aluno NUMBER;
BEGIN
    -- Chama a fun��o GET_NOME para obter o nome do aluno com RM espec�fico
    v_nome_aluno := PKG_ALUNO.GET_NOME(12345); 

    -- Chama a fun��o GET_RM para obter o RM do aluno com nome espec�fico
    v_rm_aluno := PKG_ALUNO.GET_RM('Jo�o'); 

    -- EXIBE RESULTADOS
    DBMS_OUTPUT.PUT_LINE('Nome do aluno com RM 12345: ' || v_nome_aluno);
    DBMS_OUTPUT.PUT_LINE('RM do aluno com nome Jo�o: ' || v_rm_aluno);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ocorreu um erro: ' || SQLERRM);
END;
/


