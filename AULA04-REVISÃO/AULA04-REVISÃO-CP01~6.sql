/* EM UM INTERVALO NUM�RICO INTEIRO, INFORMAR QUANTOS N�MEROS S�O PARES
E QUANTOS S�O �MPARES EM BLOCO PL SQL. */

SET SERVEROUTPUT ON;

DECLARE
    V_INICIO NUMBER(3) := 1; 
    V_FIM NUMBER(3) := &INFORME_UM_NUMERO;
    V_CONT_PARES NUMBER(3) := 0;
    V_CONT_IMPARES NUMBER(3) := 0;
    
BEGIN
    FOR CONTADOR IN V_INICIO..V_FIM LOOP
        IF MOD(CONTADOR, 2)  = 0 THEN
            V_CONT_PARES := V_CONT_PARES + 1;
        ELSE
            V_CONT_IMPARES := V_CONT_IMPARES + 1;
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Quantidade de n�meros pares: ' || V_CONT_PARES);
    DBMS_OUTPUT.PUT_LINE('Quantidade de n�meros �mpares: ' || V_CONT_IMPARES);
END;
