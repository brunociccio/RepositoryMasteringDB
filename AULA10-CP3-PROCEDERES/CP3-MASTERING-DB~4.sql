/*4) Criar uma PROCEDURE PARA INSERIR UM FORNECEDOR NA
TABELA FORNECEDOR, COM PASSAGEM DOS DADOS DO
FORNECEDOR.*/
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE INSERIR_FORNECEDOR (
    P_ID IN NUMBER,
    P_NOME IN VARCHAR2,
    P_ENDERECO IN VARCHAR2
) AS
BEGIN
    INSERT INTO FORNECEDOR_PROCEDURE (ID, NOME, ENDERECO)
    VALUES (P_ID, P_NOME, P_ENDERECO);
    
    DBMS_OUTPUT.PUT_LINE('Fornecedor inserido com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir fornecedor: ' || SQLERRM);
END;
/

BEGIN
    INSERIR_FORNECEDOR(5, 'Fornecedor D', 'Endere�o D');
END;
/