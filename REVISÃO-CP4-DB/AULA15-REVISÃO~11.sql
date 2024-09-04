/*Encapsulamento de objeto:
13. Desenvolva uma package denominada pkg_util que deve ter incluído os
seguintes objetos já desenvolvidos anteriormente nos exercícios 5 e 6.*/

-- DEFINIÇÃO DO PACOTE
CREATE OR REPLACE PACKAGE pkg_util AS
  -- Procedure para retornar o número total de funcionários em um departamento
  PROCEDURE total_funcionarios_departamento(
    p_nome_departamento IN VARCHAR2,
    p_total_funcionarios OUT NUMBER
  );

  -- Procedure para inserir um novo registro na tabela de funcionários
  PROCEDURE inserir_funcionario(
    p_id IN NUMBER,
    p_nome IN VARCHAR2,
    p_salario IN NUMBER,
    p_departamento IN VARCHAR2,
    p_data_contratacao IN DATE,
    p_gerente_nome IN VARCHAR2
  );
END pkg_util;
/

-- IMPLEMENTAÇÃO DO CORPO

CREATE OR REPLACE PACKAGE BODY pkg_util AS

  PROCEDURE total_funcionarios_departamento(
    p_nome_departamento IN VARCHAR2,
    p_total_funcionarios OUT NUMBER
  ) AS
  BEGIN
    SELECT COUNT(*) INTO p_total_funcionarios
    FROM cp4_funcionarios
    WHERE departamento = p_nome_departamento;
  END total_funcionarios_departamento;

  PROCEDURE inserir_funcionario(
    p_id IN NUMBER,
    p_nome IN VARCHAR2,
    p_salario IN NUMBER,
    p_departamento IN VARCHAR2,
    p_data_contratacao IN DATE,
    p_gerente_nome IN VARCHAR2
  ) AS
  BEGIN
    INSERT INTO cp4_funcionarios (id, nome, salario, departamento, data_contratacao, gerente_nome)
    VALUES (p_id, p_nome, p_salario, p_departamento, p_data_contratacao, p_gerente_nome);
    
    COMMIT;
  END inserir_funcionario;

END pkg_util;
/

-- TESTE

SET SERVEROUTPUT ON;

DECLARE
  v_total_funcionarios NUMBER;
BEGIN
  -- Testando a procedure para contar o total de funcionários em um departamento
  pkg_util.total_funcionarios_departamento('TI', v_total_funcionarios);
  DBMS_OUTPUT.PUT_LINE('Total de funcionários no departamento de TI: ' || v_total_funcionarios);

  -- Testando a procedure para inserir um novo funcionário
  pkg_util.inserir_funcionario(9, 'Fernando Silva', 4700, 'Marketing', TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'Maria Souza');
  DBMS_OUTPUT.PUT_LINE('Novo funcionário Fernando Silva inserido com sucesso.');

  -- Verificar a inserção de funcionário
  FOR rec IN (SELECT * FROM cp4_funcionarios) LOOP
    DBMS_OUTPUT.PUT_LINE('ID: ' || rec.id || ', Nome: ' || rec.nome || ', Salário: ' || rec.salario);
  END LOOP;
END;
/
