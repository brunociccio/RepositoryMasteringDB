/*Triggers:
10. Escreva um trigger que impeça a inserção de um novo funcionário com
salário menor que o salário mínimo atual da nossa legislação.*/

CREATE OR REPLACE TRIGGER trg_salario_minimo
BEFORE INSERT OR UPDATE ON cp4_funcionarios
FOR EACH ROW
DECLARE
  salario_minimo NUMBER := 1212;  -- Substitua pelo salário mínimo atual
BEGIN
  IF :NEW.salario < salario_minimo THEN
    RAISE_APPLICATION_ERROR(-20001, 'O salário do funcionário não pode ser menor que o salário mínimo.');
  END IF;
END;
/

SET SERVEROUTPUT ON;

BEGIN
  -- Tenta inserir um funcionário com salário abaixo do mínimo
  BEGIN
    inserir_funcionario(7, 'Lucas Pereira', 1000, 'TI', TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'Ana Souza');
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
  END;
END;
/
