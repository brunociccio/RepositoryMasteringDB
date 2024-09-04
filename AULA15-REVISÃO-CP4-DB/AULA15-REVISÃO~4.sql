/*6. Crie uma procedure que insira um novo registro na tabela de funcionários.*/

CREATE OR REPLACE PROCEDURE inserir_funcionario(
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
/

SET SERVEROUTPUT ON;

-- Executa a procedure para inserir um novo funcionário
BEGIN
  inserir_funcionario(6, 'João Santos', 4800, 'Marketing', TO_DATE('2023-08-01', 'YYYY-MM-DD'), 'Maria Silva');
  DBMS_OUTPUT.PUT_LINE('Funcionário inserido com sucesso.');
END;
/

-- Consulta para exibir todos os registros da tabela cp4_funcionarios
SELECT * FROM cp4_funcionarios;
/
