/* É necessário que você elabore todas as instruções DDL (Data Definition
Language) essenciais para a resolução dos exercícios.
Packages:
1. Crie um pacote PL/SQL chamado "pkg_funcionario" que contenha uma função
para retornar o salário de um funcionário com base no ID.
2. Adicione um procedimento ao pacote "pkg_funcionario" para atualizar o
salário de um funcionário.
3. Crie um pacote chamado "pkg_matematica" que inclua uma função para
calcular o fatorial de um número.
4. Desenvolva um pacote "pkg_string" que ofereça uma função para inverter
uma string passado por parâmetro.*/


-- PACKAGES

CREATE TABLE cp4_funcionarios (
  id NUMBER PRIMARY KEY,
  nome VARCHAR2(100),
  salario NUMBER,
  departamento VARCHAR2(100),
  data_contratacao DATE,
  gerente_nome VARCHAR2(100)
);
/

INSERT INTO cp4_funcionarios (id, nome, salario, departamento, data_contratacao, gerente_nome) VALUES (1, 'Carlos Silva', 5000, 'TI', TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'Ana Souza');
INSERT INTO cp4_funcionarios (id, nome, salario, departamento, data_contratacao, gerente_nome) VALUES (2, 'Mariana Costa', 6000, 'TI', TO_DATE('2022-06-15', 'YYYY-MM-DD'), 'Ana Souza');
INSERT INTO cp4_funcionarios (id, nome, salario, departamento, data_contratacao, gerente_nome) VALUES (3, 'Pedro Martins', 4500, 'Financeiro', TO_DATE('2021-03-20', 'YYYY-MM-DD'), 'Lucas Pereira');
INSERT INTO cp4_funcionarios (id, nome, salario, departamento, data_contratacao, gerente_nome) VALUES (4, 'Fernanda Almeida', 7000, 'Recursos Humanos', TO_DATE('2020-10-05', 'YYYY-MM-DD'), 'Juliana Nunes');
INSERT INTO cp4_funcionarios (id, nome, salario, departamento, data_contratacao, gerente_nome) VALUES (5, 'Ricardo Mendes', 5200, 'TI', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'Ana Souza');
COMMIT;
/

SET SERVEROUTPUT ON;
-- 1 
CREATE OR REPLACE PACKAGE pkg_funcionario AS
  FUNCTION get_salario_funcionario(p_id_funcionario NUMBER) RETURN NUMBER;
  PROCEDURE atualizar_salario(p_id_funcionario NUMBER, p_novo_salario NUMBER);
END pkg_funcionario;
/

CREATE OR REPLACE PACKAGE BODY pkg_funcionario AS

  FUNCTION get_salario_funcionario(p_id_funcionario NUMBER) RETURN NUMBER IS
    v_salario NUMBER;
  BEGIN
    SELECT salario INTO v_salario 
    FROM cp4_funcionarios 
    WHERE id = p_id_funcionario;
    RETURN v_salario;
  END get_salario_funcionario;

  PROCEDURE atualizar_salario(p_id_funcionario NUMBER, p_novo_salario NUMBER) IS
  BEGIN
    UPDATE cp4_funcionarios 
    SET salario = p_novo_salario 
    WHERE id = p_id_funcionario;
    COMMIT;
  END atualizar_salario;

END pkg_funcionario;
/

DECLARE
  v_salario NUMBER;
BEGIN
  v_salario := pkg_funcionario.get_salario_funcionario(1);
  pkg_funcionario.atualizar_salario(1, 5500);
  DBMS_OUTPUT.PUT_LINE('Salário do funcionário com ID 1: ' || v_salario);
END;
/


