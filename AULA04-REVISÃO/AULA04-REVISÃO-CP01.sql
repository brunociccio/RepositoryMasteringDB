SET SERVEROUTPUT ON;

DECLARE
    V_INICIO NUMBER(2) := 1;
    V_FIM NUMBER(2) :=10;

BEGIN
    LOOP    
        -- INSTRU��ES
        DBMS_OUTPUT.PUT_LINE(V_INICIO);
        V_INICIO := V_INICIO + 1;
        -- CONDI��ES: P�S-CONDI��O
        EXIT WHEN (V_INICIO > V_FIM);
    END LOOP;
END;