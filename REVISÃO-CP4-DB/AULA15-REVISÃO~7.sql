/*Triggers:
9. Crie um trigger que registre todas as alterações na tabela de funcionários em
uma tabela de log.
*/

CREATE TABLE cp4_funcionarios_log (
  log_id NUMBER PRIMARY KEY,
  operacao VARCHAR2(10),
  id_funcionario NUMBER,
  nome VARCHAR2(100),
  salario NUMBER,
  departamento VARCHAR2(100),
  data_contratacao DATE,
  gerente_nome VARCHAR2(100),
  data_alteracao DATE
);
/

CREATE SEQUENCE cp4_funcionarios_log_seq START WITH 1 INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER trg_cp4_funcionarios_log
AFTER INSERT OR UPDATE OR DELETE ON cp4_funcionarios
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO cp4_funcionarios_log (log_id, operacao, id_funcionario, nome, salario, departamento, data_contratacao, gerente_nome, data_alteracao)
    VALUES (cp4_funcionarios_log_seq.NEXTVAL, 'INSERT', :NEW.id, :NEW.nome, :NEW.salario, :NEW.departamento, :NEW.data_contratacao, :NEW.gerente_nome, SYSDATE);
    
  ELSIF UPDATING THEN
    INSERT INTO cp4_funcionarios_log (log_id, operacao, id_funcionario, nome, salario, departamento, data_contratacao, gerente_nome, data_alteracao)
    VALUES (cp4_funcionarios_log_seq.NEXTVAL, 'UPDATE', :NEW.id, :NEW.nome, :NEW.salario, :NEW.departamento, :NEW.data_contratacao, :NEW.gerente_nome, SYSDATE);
    
  ELSIF DELETING THEN
    INSERT INTO cp4_funcionarios_log (log_id, operacao, id_funcionario, nome, salario, departamento, data_contratacao, gerente_nome, data_alteracao)
    VALUES (cp4_funcionarios_log_seq.NEXTVAL, 'DELETE', :OLD.id, :OLD.nome, :OLD.salario, :OLD.departamento, :OLD.data_contratacao, :OLD.gerente_nome, SYSDATE);
  END IF;
END;
/

SET SERVEROUTPUT ON;

BEGIN
  -- Atualiza o salário de um funcionário para gerar um log
  pkg_funcionario.atualizar_salario(1, 6000);
  DBMS_OUTPUT.PUT_LINE('Salário do funcionário com ID 1 atualizado para 6000.');

  -- Consulta o log de alterações
  FOR rec IN (SELECT * FROM cp4_funcionarios_log) LOOP
    DBMS_OUTPUT.PUT_LINE('Log ID: ' || rec.log_id || ', Operação: ' || rec.operacao || ', ID Funcionário: ' || rec.id_funcionario || ', Data de Alteração: ' || rec.data_alteracao);
  END LOOP;
END;
/


