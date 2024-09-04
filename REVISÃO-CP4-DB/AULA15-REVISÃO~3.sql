/*Procedures:
5. Escreva uma procedure que aceite o nome de um departamento e retorne o
número total de funcionários nesse departamento.*/
CREATE OR REPLACE PROCEDURE total_funcionarios_departamento(
  p_nome_departamento IN VARCHAR2,
  p_total_funcionarios OUT NUMBER
) AS
BEGIN
  SELECT COUNT(*) INTO p_total_funcionarios
  FROM cp4_funcionarios
  WHERE departamento = p_nome_departamento;
END total_funcionarios_departamento;
/

SET SERVEROUTPUT ON;

DECLARE
  v_total_funcionarios NUMBER;
BEGIN
  total_funcionarios_departamento('TI', v_total_funcionarios);
  DBMS_OUTPUT.PUT_LINE('Total de funcionários no departamento de TI: ' || v_total_funcionarios);
END;
/
