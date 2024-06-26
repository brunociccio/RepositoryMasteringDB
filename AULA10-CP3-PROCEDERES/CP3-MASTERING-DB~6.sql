/*6) Criar uma FUNCTION PARA CONVERTER OS VALORES DE
D�LARES EM REAIS, OU SEJA, ALIMENTAMOS OS VALORES EM
D�LAR E OBTEMOS OS MESMOS EM REAIS.*/
SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION CONVERTE_DOLAR_PARA_REAL (
    VALOR_DOLAR IN NUMBER
) RETURN NUMBER
IS
    TAXA_CAMBIO NUMBER := 5.30; --TAXA DE CAMBIO ATUAL
    VALOR_EM_REAIS NUMBER;
BEGIN
    VALOR_EM_REAIS := VALOR_DOLAR * TAXA_CAMBIO;
    -- LIMITEI A QUANTIDADE DE CARACTERS ANTES E DEPOIS DA VIRGULA DOS VALORES EM REAIS E DOLARES PROPOSITALMENTE
    DBMS_OUTPUT.PUT_LINE('O VALOR DA TAXA DE CAMBIO ATUAL � DE' || TO_CHAR(TAXA_CAMBIO, '9.99') || ' REAIS POR DOLAR.');
    DBMS_OUTPUT.PUT_LINE('O VALOR QUE VOC� DESEJA CONVERTER DE' || TO_CHAR(VALOR_DOLAR, '999.99') || ' D�LARES FICA EM REAIS:' || TO_CHAR(VALOR_EM_REAIS, '999.99'));
    
    RETURN VALOR_EM_REAIS;
END;
/

SELECT CONVERTE_DOLAR_PARA_REAL(100) AS VALOR_EM_REAIS FROM DUAL;
