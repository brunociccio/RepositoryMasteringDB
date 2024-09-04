/*Encapsulamento de objeto:
14. Desenvolva uma package denominada pkg_funcional que deve ter inclu�do
os seguintes objetos j� desenvolvidos anteriormente nos exerc�cios 7 e 8.*/

-- DEFINI��O DO PACOTE

CREATE OR REPLACE PACKAGE pkg_funcional AS
  -- Procedure para retornar o nome do gerente de um funcion�rio
  PROCEDURE nome_gerente_funcionario(
    p_id_funcionario IN NUMBER,
    p_nome_gerente OUT VARCHAR2
  );

  -- Procedure para excluir um funcion�rio com base no seu ID
  PROCEDURE excluir_funcionario(
    p_id_funcionario IN NUMBER
  );
END pkg_funcional;
/

-- IMPLEMENTA��O DO CORPO

CREATE OR REPLACE PACKAGE BODY pkg_funcional AS

  PROCEDURE nome_gerente_funcionario(
    p_id_funcionario IN NUMBER,
    p_nome_gerente OUT VARCHAR2
  ) AS
  BEGIN
    SELECT gerente_nome INTO p_nome_gerente
    FROM cp4_funcionarios
    WHERE id = p_id_funcionario;
  END nome_gerente_funcionario;

  PROCEDURE excluir_funcionario(
    p_id_funcionario IN NUMBER
  ) AS
  BEGIN
    DELETE FROM cp4_funcionarios
    WHERE id = p_id_funcionario;

    COMMIT;
  END excluir_funcionario;

END pkg_funcional;
/

-- TESTE

SET SERVEROUTPUT ON;

DECLARE
  v_nome_gerente VARCHAR2(100);
BEGIN
  -- Testando a procedure para retornar o nome do gerente de um funcion�rio
  pkg_funcional.nome_gerente_funcionario(1, v_nome_gerente);
  DBMS_OUTPUT.PUT_LINE('Nome do gerente do funcion�rio com ID 1: ' || v_nome_gerente);

  -- Testando a procedure para excluir um funcion�rio
  pkg_funcional.excluir_funcionario(9);  -- Exclui o funcion�rio com ID 9
  DBMS_OUTPUT.PUT_LINE('Funcion�rio com ID 9 exclu�do com sucesso.');

  -- Verificar os registros restantes na tabela de funcion�rios
  FOR rec IN (SELECT * FROM cp4_funcionarios) LOOP
    DBMS_OUTPUT.PUT_LINE('ID: ' || rec.id || ', Nome: ' || rec.nome || ', Sal�rio: ' || rec.salario);
  END LOOP;
END;
/
