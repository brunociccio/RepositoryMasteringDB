/*7. Desenvolva uma procedure que aceite o ID de um funcionário e retorne em
um parâmetro de saída o nome do gerente desse funcionário.*/
CREATE OR REPLACE PROCEDURE nome_gerente_funcionario(
  p_id_funcionario IN NUMBER,
  p_nome_gerente OUT VARCHAR2
) AS
BEGIN
  SELECT gerente_nome INTO p_nome_gerente
  FROM cp4_funcionarios
  WHERE id = p_id_funcionario;
END nome_gerente_funcionario;
/

SET SERVEROUTPUT ON;

DECLARE
  v_nome_gerente VARCHAR2(100);
BEGIN
  nome_gerente_funcionario(1, v_nome_gerente);
  DBMS_OUTPUT.PUT_LINE('Nome do gerente do funcionário com ID 1: ' || v_nome_gerente);
END;
/
