/*Triggers:
12. Implemente um trigger que notifique em uma tabela de recursos humanos
sempre que um novo funcion�rio for contratado.*/

CREATE TABLE cp4_rh_notificacoes (
  notificacao_id NUMBER PRIMARY KEY,
  id_funcionario NUMBER,
  nome_funcionario VARCHAR2(100),
  data_contratacao DATE,
  data_notificacao DATE
);
/

-- Cria��o da sequ�ncia para a tabela de notifica��es
CREATE SEQUENCE cp4_rh_notificacoes_seq START WITH 1 INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER trg_notificar_nova_contratacao
AFTER INSERT ON cp4_funcionarios
FOR EACH ROW
BEGIN
  INSERT INTO cp4_rh_notificacoes (notificacao_id, id_funcionario, nome_funcionario, data_contratacao, data_notificacao)
  VALUES (cp4_rh_notificacoes_seq.NEXTVAL, :NEW.id, :NEW.nome, :NEW.data_contratacao, SYSDATE);
END;
/

SET SERVEROUTPUT ON;

BEGIN
  -- Insere um novo funcion�rio para acionar a notifica��o
  inserir_funcionario(8, 'Marcelo Oliveira', 4500, 'Financeiro', TO_DATE('2024-02-01', 'YYYY-MM-DD'), 'Lucas Pereira');
  DBMS_OUTPUT.PUT_LINE('Novo funcion�rio Marcelo Oliveira inserido.');

  -- Consulta para exibir todos os registros da tabela cp4_rh_notificacoes ap�s a inser��o
  FOR rec IN (SELECT * FROM cp4_rh_notificacoes) LOOP
    DBMS_OUTPUT.PUT_LINE('Notifica��o ID: ' || rec.notificacao_id || ', ID Funcion�rio: ' || rec.id_funcionario || ', Nome: ' || rec.nome_funcionario || ', Data de Notifica��o: ' || rec.data_notificacao);
  END LOOP;
END;
/


