/*Objetivo: criar uma tabela para armazenar o log
Voc� est� trabalhando em um sistema de auditoria de dados em um banco de dados 
Oracle. Sua tarefa � criar uma procedure PL/SQL que utilize uma "autonomous 
transaction" para registrar informa��es de auditoria em uma tabela de log 
sempre que um registro for inserido em uma tabela de dados. Aqui est�o as 
etapas que voc� deve seguir: 
1. Crie uma tabela chamada `log_auditoria` com as seguintes colunas:
CREATE TABLE log_auditoria (
   id_log NUMBER,
   data_hora DATE,
   descricao VARCHAR2(100)
);
2. Crie uma sequence chamada `seq_log_auditoria` para gerar valores para a 
coluna `id_log`.
CREATE SEQUENCE seq_log_auditoria START WITH 1;
3. Crie uma procedure chamada `registrar_auditoria` que recebe como par�metros 
a `descricao` (VARCHAR2) que descreve a opera��o de auditoria a ser registrada.
4. Dentro da procedure, crie uma transa��o aut�noma que insere um novo registro 
na tabela `log_auditoria` com um ID gerado pela sequence `seq_log_auditoria`, 
a data e hora atual e a descri��o fornecida como par�metro.
5. Crie uma trigger que chama a procedure `registrar_auditoria` sempre que um 
novo registro for inserido em uma tabela de dados fict�cia chamada 
`tabela_dados`. A descri��o na auditoria deve incluir o nome da tabela onde 
a inser��o ocorreu.
CREATE TABLE tabela_dados (
   id NUMBER,
   nome VARCHAR2(50)
);
6. Invoque a trigger para simular a inser��o de um registro na `tabela_dados`.
INSERT INTO tabela_dados (id, nome) VALUES (1, 'Exemplo');
7. Exiba os registros da tabela `log_auditoria` na tela para verificar se a 
opera��o de auditoria foi registrada corretamente. 
SELECT * FROM log_auditoria;*/
CREATE TABLE LOG_AUDITORIA (
    ID_LOG NUMBER,
    DATA_HORA DATE,
    DESCRICAO VARCHAR2(100)
);

CREATE SEQUENCE SEQ_LOG_AUDITORIA START WITH 1;

CREATE OR REPLACE PROCEDURE REGISTRAR_AUDITORIA (DESCRICAO IN VARCHAR2) AS
    PRAGMA AUTONOMOUS_TRANSACTION; -- INICIO
BEGIN
    INSERT INTO LOG_AUDITORIA (ID_LOG, DATA_HORA, DESCRICAO)
    VALUES (SEQ_LOG_AUDITORIA.NEXTVAL, SYSDATE, DESCRICAO);
    
    COMMIT; -- CONFIRMA��O
END;
/

CREATE TABLE TABELA_DADOS (
    ID NUMBER,
    NOME VARCHAR2(50)
);

CREATE OR REPLACE TRIGGER TRG_LOG_AUDITORIA
AFTER INSERT ON TABELA_DADOS
FOR EACH ROW
BEGIN
    REGISTRAR_AUDITORIA('INSER��O NA TABELA DADOS');
END;
/

INSERT INTO TABELA_DADOS (ID, NOME) VALUES (1, 'EXEMPLO');

SET SERVEROUTPUT ON;
SELECT * FROM LOG_AUDITORIA;


