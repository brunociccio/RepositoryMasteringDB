/* exerc�cio 1:
criar um pacote pl-sql com nome "calculadora" que contenha um procedimento
para calcular o valor do novo sal�rio m�nimo que dever� ser de 25% em cima do 
atual, que � de r$1320,00*/

-- Especifica��o (Specification)
CREATE OR REPLACE PACKAGE PKG_CALCULADORA IS
    PROCEDURE CALCULA_NOVO_SAL_MIN;
END PKG_CALCULADORA;
/

-- Corpo (Body)
CREATE OR REPLACE PACKAGE BODY PKG_CALCULADORA IS
    PROCEDURE CALCULA_NOVO_SAL_MIN IS
        V_SAL_ATUAL NUMBER := 1320.00;
        V_SAL_REAJ NUMBER(7,2);
    BEGIN
        V_SAL_REAJ := V_SAL_ATUAL * 1.25;
        DBMS_OUTPUT.PUT_LINE('SAL�RIO M�NIMO ATUAL - R$: ' || V_SAL_ATUAL);
        DBMS_OUTPUT.PUT_LINE('SAL�RIO M�NIMO REAJUSTADO - R$: ' || V_SAL_REAJ);
    END CALCULA_NOVO_SAL_MIN;
END PKG_CALCULADORA;
/
