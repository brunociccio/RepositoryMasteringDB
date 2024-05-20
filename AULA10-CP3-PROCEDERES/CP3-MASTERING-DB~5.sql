/*5) Criar uma PROCEDURE PARA CONSULTAR UM FORNECEDOR
NA TABELA FORNECEDOR_PROCEDURE, INFORMANDO O C�DIGO DO
FORNECEDOR. */
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE CONSULTAR_FORNECEDOR (
    P_ID IN NUMBER
) AS
    v_nome FORNECEDOR_PROCEDURE.NOME%TYPE;
    v_endereco FORNECEDOR_PROCEDURE.ENDERECO%TYPE;
BEGIN
    -- CONSULTAR FORNECEDOR COM BASE NO ID
    SELECT NOME, ENDERECO INTO v_nome, v_endereco
    FROM FORNECEDOR_PROCEDURE
    WHERE ID = P_ID;
    
    -- EXIBE DADOS DO FORNECEDOR
    DBMS_OUTPUT.PUT_LINE('Nome do fornecedor: ' || v_nome);
    DBMS_OUTPUT.PUT_LINE('Endere�o do fornecedor: ' || v_endereco);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum fornecedor encontrado com o ID ' || P_ID);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao consultar fornecedor: ' || SQLERRM);
END;
/

BEGIN
    CONSULTAR_FORNECEDOR(1); 
END;
/

