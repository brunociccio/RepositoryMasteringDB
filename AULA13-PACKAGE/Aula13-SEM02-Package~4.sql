SET SERVEROUTPUT ON;

DECLARE
    V_RESULTADO NUMBER;
BEGIN
    -- Chama o procedimento para calcular o reajuste do sal�rio m�nimo
    PKG_CALCULADORA.CALCULA_NOVO_SAL_MIN;
    
    -- Chama a fun��o para calcular o valor em reais de 45 d�lares
    V_RESULTADO := PKG_CALCULADORA.CONVERTE_DOLAR_PARA_REAL;
    DBMS_OUTPUT.PUT_LINE('45 d�lares em reais: R$' || V_RESULTADO);
END;
/
