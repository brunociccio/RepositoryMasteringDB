/*Triggers:
11. Desenvolva um trigger que atualize automaticamente a data de modificação
da tabela departamento, sempre que um registro na tabela de departamentos*/
CREATE TABLE cp4_departamentos (
  departamento_id NUMBER PRIMARY KEY,
  nome VARCHAR2(100),
  data_modificacao DATE
);
/

CREATE OR REPLACE TRIGGER trg_atualizar_data_modificacao
BEFORE UPDATE ON cp4_departamentos
FOR EACH ROW
BEGIN
  :NEW.data_modificacao := SYSDATE;
END;
/

SET SERVEROUTPUT ON;

-- Atualiza o nome de um departamento para acionar a trigger
BEGIN
  UPDATE cp4_departamentos SET nome = 'Recursos Humanos' WHERE departamento_id = 1;
  DBMS_OUTPUT.PUT_LINE('Nome do departamento atualizado para Recursos Humanos.');

  -- Consulta para exibir todos os registros da tabela cp4_departamentos após a atualização
  FOR rec IN (SELECT * FROM cp4_departamentos) LOOP
    DBMS_OUTPUT.PUT_LINE('Departamento ID: ' || rec.departamento_id || ', Nome: ' || rec.nome || ', Data de Modificação: ' || rec.data_modificacao);
  END LOOP;
END;
/

