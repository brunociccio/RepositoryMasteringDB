SET SERVEROUTPUT ON;

DECLARE
    V_RESULTADO NUMBER;
BEGIN
    -- Chama o procedimento para calcular o reajuste do salário mínimo
    PKG_CALCULADORA.CALCULA_NOVO_SAL_MIN;
    
    -- Chama a função para calcular o valor em reais de 45 dólares
    V_RESULTADO := PKG_CALCULADORA.CONVERTE_DOLAR_PARA_REAL;
    DBMS_OUTPUT.PUT_LINE('45 dólares em reais: R$' || V_RESULTADO);
END;
/
