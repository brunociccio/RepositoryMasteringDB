/*Encapsulamento de objeto:
14. Desenvolva uma package denominada pkg_funcional que deve ter incluído
os seguintes objetos já desenvolvidos anteriormente nos exercícios 7 e 8.*/

-- DEFINIÇÃO DO PACOTE

CREATE OR REPLACE PACKAGE pkg_funcional AS
  -- Procedure para retornar o nome do gerente de um funcionário
  PROCEDURE nome_gerente_funcionario(
    p_id_funcionario IN NUMBER,
    p_nome_gerente OUT VARCHAR2
  );

  -- Procedure para excluir um funcionário com base no seu ID
  PROCEDURE excluir_funcionario(
    p_id_funcionario IN NUMBER
  );
END pkg_funcional;
/

-- IMPLEMENTAÇÃO DO CORPO

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
  -- Testando a procedure para retornar o nome do gerente de um funcionário
  pkg_funcional.nome_gerente_funcionario(1, v_nome_gerente);
  DBMS_OUTPUT.PUT_LINE('Nome do gerente do funcionário com ID 1: ' || v_nome_gerente);

  -- Testando a procedure para excluir um funcionário
  pkg_funcional.excluir_funcionario(9);  -- Exclui o funcionário com ID 9
  DBMS_OUTPUT.PUT_LINE('Funcionário com ID 9 excluído com sucesso.');

  -- Verificar os registros restantes na tabela de funcionários
  FOR rec IN (SELECT * FROM cp4_funcionarios) LOOP
    DBMS_OUTPUT.PUT_LINE('ID: ' || rec.id || ', Nome: ' || rec.nome || ', Salário: ' || rec.salario);
  END LOOP;
END;
/
