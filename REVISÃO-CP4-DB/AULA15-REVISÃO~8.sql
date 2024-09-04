/*Triggers:
10. Escreva um trigger que impe�a a inser��o de um novo funcion�rio com
sal�rio menor que o sal�rio m�nimo atual da nossa legisla��o.*/

CREATE OR REPLACE TRIGGER trg_salario_minimo
BEFORE INSERT OR UPDATE ON cp4_funcionarios
FOR EACH ROW
DECLARE
  salario_minimo NUMBER := 1212;  -- Substitua pelo sal�rio m�nimo atual
BEGIN
  IF :NEW.salario < salario_minimo THEN
    RAISE_APPLICATION_ERROR(-20001, 'O sal�rio do funcion�rio n�o pode ser menor que o sal�rio m�nimo.');
  END IF;
END;
/

SET SERVEROUTPUT ON;

BEGIN
  -- Tenta inserir um funcion�rio com sal�rio abaixo do m�nimo
  BEGIN
    inserir_funcionario(7, 'Lucas Pereira', 1000, 'TI', TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'Ana Souza');
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
  END;
END;
/
