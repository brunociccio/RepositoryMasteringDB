--Programas 03
DROP TABLE Aluno CASCADE CONSTRAINTS;

-- Criar tabela Aluno se não existir
CREATE TABLE Aluno (
        Rm NUMBER(10),
        Nome VARCHAR2(100),
        Num_Falta NUMBER(3),
        Situacao VARCHAR2(20)
    );

INSERT INTO Aluno (Rm, Nome, Num_Falta) VALUES (1, 'JO?O', 10);    
INSERT INTO Aluno (Rm, Nome, Num_Falta) VALUES (2, 'MARIA', 50);    
INSERT INTO Aluno (Rm, Nome, Num_Falta) VALUES (3, 'JOS?', 24);    

DECLARE
    v_Rm NUMBER(10) := &Digite_o_Rm;
    v_NumFaltas NUMBER(3);
    v_Situacao VARCHAR2(20);
BEGIN

    -- Bloco de preenchimento da situa??o do aluno
    FOR R IN (SELECT * FROM Aluno WHERE rm = v_Rm) LOOP
        v_Rm := R.Rm;
        v_NumFaltas := R.Num_Falta;
        
        -- Determinar a situa??o do aluno
        IF v_NumFaltas < (0.25 * 130) THEN
            v_Situacao := 'Aprovado';
            DBMS_OUTPUT.PUT_LINE(v_Situacao||' Com '||v_NumFaltas||' Faltas.');
        ELSE
            v_Situacao := 'Reprovado';
            DBMS_OUTPUT.PUT_LINE(v_Situacao||' Com '||v_NumFaltas||' Faltas.');
        END IF;

        -- Atualizar a situa??o na tabela Aluno
        UPDATE Aluno SET Situacao = v_Situacao WHERE Rm = v_Rm;
    END LOOP;
    
    COMMIT;
END;
/
