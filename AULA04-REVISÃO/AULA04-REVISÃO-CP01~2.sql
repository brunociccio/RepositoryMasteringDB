SET SERVEROUTPUT ON;

DECLARE
    V_INICIAL NUMBER(2) := 1;
    V_FINAL NUMBER(2) := &DIGITE_O_LIMITE;
BEGIN
    -- FOR V_CONTADOR IN REVERSE V_INICIAL..V_FINAL LOOP [PARA A LISTA COME�AR AO CONTR�RIO]
    FOR V_CONTADOR IN V_INICIAL..V_FINAL LOOP
        DBMS_OUTPUT.PUT_LINE (V_CONTADOR);
    END LOOP;
END;