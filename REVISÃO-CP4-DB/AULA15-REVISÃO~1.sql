/*3. Crie um pacote chamado "pkg_matematica" que inclua uma função para
calcular o fatorial de um número.*/
SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE pkg_matematica AS
  FUNCTION calcular_fatorial(p_numero NUMBER) RETURN NUMBER;
END pkg_matematica;
/

CREATE OR REPLACE PACKAGE BODY pkg_matematica AS

  FUNCTION calcular_fatorial(p_numero NUMBER) RETURN NUMBER IS
    v_resultado NUMBER := 1;
  BEGIN
    FOR i IN 1..p_numero LOOP
      v_resultado := v_resultado * i;
    END LOOP;
    RETURN v_resultado;
  END calcular_fatorial;

END pkg_matematica;
/

DECLARE
  v_fatorial NUMBER;
BEGIN
  v_fatorial := pkg_matematica.calcular_fatorial(5); -- Calcula o fatorial de 5
  DBMS_OUTPUT.PUT_LINE('Fatorial de 5: ' || v_fatorial);
END;
/
