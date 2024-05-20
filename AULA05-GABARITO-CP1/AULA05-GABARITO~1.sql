--Programas 02
DROP TABLE Aluno CASCADE CONSTRAINTS;

CREATE TABLE Aluno (
    Rm NUMBER(10),
    Nome VARCHAR2(100),
    Nota NUMBER(3,1),
    Media NUMBER(3,1),
    Situacao VARCHAR2(20)
);

INSERT INTO Aluno (Rm, Nome, Nota) VALUES (1, 'JO?O', 5);
INSERT INTO Aluno (Rm, Nome, Nota) VALUES (1, 'JO?O', 7);
INSERT INTO Aluno (Rm, Nome, Nota) VALUES (1, 'JO?O', 9);
    
DECLARE
    v_Rm NUMBER(10) := &Digite_o_Rm;
    v_Nota NUMBER(3,1) := 0;
    v_Media v_Nota%TYPE := 0;
    v_Situacao VARCHAR2(20);
BEGIN

    -- Bloco de preenchimento da m?dia e situa??o do aluno
    FOR R IN (SELECT * FROM Aluno) LOOP
      v_Nota := v_Nota + R.NOTA;
    END LOOP;
    
    --SELECT AVG(NOTA) INTO V_MEDIA FROM ALUNO WHERE RM = V_RM;
    
    -- C?lculo da m?dia    
    v_Media := v_Nota/3;    
        

    -- Determinar a situa??o do aluno
    IF v_Media > 6 THEN
        v_Situacao := 'Aprovado';
        DBMS_OUTPUT.PUT_LINE(v_Situacao||' Com M?dia: '||v_Media);
    ELSE
        v_Situacao := 'Reprovado';
        DBMS_OUTPUT.PUT_LINE(v_Situacao||' Com M?dia: '||v_Media);
    END IF;

    -- Atualizar a m?dia e a situa??o na tabela Aluno
    UPDATE Aluno 
       SET Media = v_Media, 
           Situacao = v_Situacao 
    WHERE Rm = v_Rm; 
    
    COMMIT;
END;
/   