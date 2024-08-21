-- EXERC 2

CREATE OR REPLACE TRIGGER TRG_AUDIT_ALUNO
BEFORE INSERT OR UPDATE OR DELETE ON TAB_ALUNO
FOR EACH ROW

BEGIN
    IF INSERTING THEN
        INSERT INTO TAB_AUDIT_DML (NOM_TABELA, NOM_USUARIO, DAT_EVENTO, TIP_EVENTO, NEW_TEXTO)
        VALUES ('ALUNO', USER, SYSDATE, 'INSERT', :NEW.NOME);
        
    ELSIF UPDATING THEN
        INSERT INTO TAB_AUDIT_DML (NOM_TABELA, NOM_USUARIO, DAT_EVENTO, TIP_EVENTO, NEW_TEXTO, OLD_TEXTO)
        VALUES ('ALUNO', USER, SYSDATE, 'UPDATE', :NEW.NOME, :OLD.NOME);
        
    ELSIF DELETING THEN
        INSERT INTO TAB_AUDIT_DML (NOM_TABELA, NOM_USUARIO, DAT_EVENTO, TIP_EVENTO, OLD_TEXTO)
        VALUES ('ALUNO', USER, SYSDATE, 'DELETE', :OLD.NOME);
    END IF;
END;
/

-- INSERT

INSERT INTO TAB_ALUNO (RM, NOME) VALUES (99097, 'BRUNO CICCIO');
UPDATE TAB_ALUNO SET NOME = 'BRUNO' WHERE RM = 99097;
DELETE FROM TAB_ALUNO WHERE RM = 99097;

SELECT * FROM TAB_AUDIT_DML;