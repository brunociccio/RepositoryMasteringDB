/*4. Desenvolva um pacote "pkg_string" que ofereça uma função para inverter
uma string passado por parâmetro.*/
SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE pkg_string AS
  FUNCTION inverter_string(p_texto VARCHAR2) RETURN VARCHAR2;
END pkg_string;
/

CREATE OR REPLACE PACKAGE BODY pkg_string AS

  FUNCTION inverter_string(p_texto VARCHAR2) RETURN VARCHAR2 IS
    v_resultado VARCHAR2(4000) := '';
  BEGIN
    FOR i IN REVERSE 1..LENGTH(p_texto) LOOP
      v_resultado := v_resultado || SUBSTR(p_texto, i, 1);
    END LOOP;
    RETURN v_resultado;
  END inverter_string;

END pkg_string;
/

DECLARE
  v_resultado VARCHAR2(100);
BEGIN
  v_resultado := pkg_string.inverter_string('Exemplo');
  DBMS_OUTPUT.PUT_LINE('String invertida: ' || v_resultado);
END;
/


