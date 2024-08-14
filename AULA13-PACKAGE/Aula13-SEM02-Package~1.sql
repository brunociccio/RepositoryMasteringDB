/* exercício 1:
criar um pacote pl-sql com nome "calculadora" que contenha um procedimento
para calcular o valor do novo salário mínimo que deverá ser de 25% em cima do 
atual, que é de r$1320,00*/

-- Especificação (Specification)
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
        DBMS_OUTPUT.PUT_LINE('SALÁRIO MÍNIMO ATUAL - R$: ' || V_SAL_ATUAL);
        DBMS_OUTPUT.PUT_LINE('SALÁRIO MÍNIMO REAJUSTADO - R$: ' || V_SAL_REAJ);
    END CALCULA_NOVO_SAL_MIN;
END PKG_CALCULADORA;
/
