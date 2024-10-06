/* Objetivo: Criando um Trigger no Oracle
Voc� foi designado para desenvolver um sistema de controle de estoque de 
uma loja. A tabela de estoque cont�m informa��es sobre os produtos, incluindo 
a quantidade em estoque. Para garantir que a quantidade em estoque nunca seja 
negativa, voc� deve criar um trigger que impe�a a inser��o ou atualiza��o de 
registros que resultariam em um estoque negativo

1. Crie um trigger chamado "TRG_QTD_ESTOQUE_NEGATIVO" que seja acionado antes 
de uma inser��o ou atualiza��o na tabela "estoque". 
2. O trigger deve impedir a opera��o se o resultado da inser��o ou atualiza��o 
resultar em uma quantidade em estoque negativa. 
3. Se a opera��o for impedida, o trigger deve gerar uma mensagem de erro 
personalizada que informa que a quantidade em estoque n�o pode ser negativa. 
4. O trigger deve ser capaz de lidar com inser��es e atualiza��es individuais.
Solu��o:
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
    -- VERIFICANDO SE A QUANTIDADE EM ESTOQUE � NEGATIVA
    IF :NEW.QUANTIDADE_EM_ESTOQUE < 0 THEN
        -- ENVIANDO UMA MENSAGEM DE ERRO SE A QUANTIDADE FOR NEGATIVA
        RAISE_APPLICATION_ERROR(-20001, 'A QUANTIDADE EM ESTOQUE N�O PODE SER NEGATIVA');
    END IF;
END;
/
