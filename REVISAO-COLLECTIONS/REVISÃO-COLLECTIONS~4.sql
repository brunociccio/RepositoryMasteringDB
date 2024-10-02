/* Utilize uma plsql table para armazenar os IDs de funcioarios, em seguida
aumente o salario em 10% para cada funcionario cujo ID esta na plsql table*/

SET SERVEROUTPUT ON;

DECLARE
  -- Defini��o de uma PL/SQL table para armazenar os IDs dos funcion�rios
  TYPE t_funcionarios_ids IS TABLE OF collections_funcionarios.id%TYPE INDEX BY PLS_INTEGER;
  
  -- Declara��o de uma vari�vel do tipo t_funcionarios_ids
  v_funcionarios_ids t_funcionarios_ids;
  
  -- Vari�vel auxiliar para o �ndice
  v_index PLS_INTEGER := 1;
  
BEGIN
  -- Inserindo IDs de funcion�rios na PL/SQL table
  v_funcionarios_ids(1) := 101;  -- Exemplo de ID
  v_funcionarios_ids(2) := 102;  -- Exemplo de ID
  v_funcionarios_ids(3) := 103;  -- Exemplo de ID

  -- Loop para aumentar o sal�rio em 10% para os funcion�rios cujo ID est� na PL/SQL table
  FOR i IN 1..v_funcionarios_ids.COUNT LOOP
    UPDATE collections_funcionarios
    SET salario = salario * 1.10
    WHERE id = v_funcionarios_ids(i);
    
    -- Exibe a confirma��o do aumento de sal�rio
    DBMS_OUTPUT.PUT_LINE('Sal�rio do funcion�rio com ID ' || v_funcionarios_ids(i) || ' foi aumentado em 10%.');
  END LOOP;

  -- Commit para garantir que as altera��es sejam salvas
  COMMIT;
  
END;
/
