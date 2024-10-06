/* Objetivo: Criando um Trigger no Oracle
Você foi designado para desenvolver um sistema de controle de estoque de 
uma loja. A tabela de estoque contém informações sobre os produtos, incluindo 
a quantidade em estoque. Para garantir que a quantidade em estoque nunca seja 
negativa, você deve criar um trigger que impeça a inserção ou atualização de 
registros que resultariam em um estoque negativo

1. Crie um trigger chamado "TRG_QTD_ESTOQUE_NEGATIVO" que seja acionado antes 
de uma inserção ou atualização na tabela "estoque". 
2. O trigger deve impedir a operação se o resultado da inserção ou atualização 
resultar em uma quantidade em estoque negativa. 
3. Se a operação for impedida, o trigger deve gerar uma mensagem de erro 
personalizada que informa que a quantidade em estoque não pode ser negativa. 
4. O trigger deve ser capaz de lidar com inserções e atualizações individuais.
Solução:
Utilize :NEW.quantidade_em_estoque 
*/
DROP TABLE CP2_ESTOQUE;

CREATE TABLE CP2_ESTOQUE (
    PRODUTO_ID NUMBER PRIMARY KEY,
    NOME_PRODUTO VARCHAR2(100),
    QUANTIDADE_EM_ESTOQUE NUMBER
);

-- TRIGGER "TRG_QTD_ESTOQUE_NEGATIVO"
CREATE OR REPLACE TRIGGER TRG_QTD_ESTOQUE_NEGATIVO
BEFORE INSERT OR UPDATE ON CP2_ESTOQUE
FOR EACH ROW
BEGIN
    -- VERIFICANDO SE A QUANTIDADE EM ESTOQUE É NEGATIVA
    IF :NEW.QUANTIDADE_EM_ESTOQUE < 0 THEN
        -- ENVIANDO UMA MENSAGEM DE ERRO SE A QUANTIDADE FOR NEGATIVA
        RAISE_APPLICATION_ERROR(-20001, 'A QUANTIDADE EM ESTOQUE NÃO PODE SER NEGATIVA');
    END IF;
END;
/
