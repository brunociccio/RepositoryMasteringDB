/* 2. Crie um programa PL/SQL que use um cursor explícito para calcular o salário
médio dos funcionários de um determinado departamento, caso não tenha
funcionários no departamento gerar a mensagem “'Nenhum funcionário
encontrado para o departamento”.*/

SET SERVEROUTPUT ON;
DROP TABLE FUNCIONARIO_CURSOR_REV;
CREATE TABLE FUNCIONARIO_CURSOR_REV (
    NOME VARCHAR2(55),
    SALARIO NUMBER(10,2)
);

INSERT INTO FUNCIONARIO_CURSOR_REV VALUES ('BRUNO', 5999.99);
INSERT INTO FUNCIONARIO_CURSOR_REV VALUES ('JOSÉ', 4999.99);
INSERT INTO FUNCIONARIO_CURSOR_REV VALUES ('MARI', 3999.99);

SELECT * FROM FUNCIONARIO_CURSOR_REV;

DECLARE
    CURSOR C_FUNCIONARIO_REV IS
    SELECT SALARIO FROM FUNCIONARIO_CURSOR_REV;
    V_SALARIO FUNCIONARIO_CURSOR_REV.SALARIO%TYPE;
    V_TOTAL_SALARIO NUMBER := 0;
    V_CONTADOR NUMBER := 0;
    V_MEDIA_SALARIO NUMBER := 0;
    
BEGIN 
    OPEN C_FUNCIONARIO_REV;
    LOOP
        FETCH C_FUNCIONARIO_REV INTO V_SALARIO;
        EXIT WHEN C_FUNCIONARIO_REV%NOTFOUND;
        V_TOTAL_SALARIO := V_TOTAL_SALARIO + V_SALARIO;
        V_CONTADOR := V_CONTADOR +1;
    END LOOP;
    CLOSE C_FUNCIONARIO_REV;
    
    IF V_CONTADOR = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum funcionário encontrado para o departamento.');
    ELSE
        V_MEDIA_SALARIO := V_TOTAL_SALARIO / V_CONTADOR;
        DBMS_OUTPUT.PUT_LINE('A média de salário dos funcionários é igual a: ' || V_MEDIA_SALARIO);
    END IF;
END;
/
