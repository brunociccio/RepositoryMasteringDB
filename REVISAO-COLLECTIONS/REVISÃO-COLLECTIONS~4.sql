/* Utilize uma plsql table para armazenar os IDs de funcioarios, em seguida
aumente o salario em 10% para cada funcionario cujo ID esta na plsql table*/

SET SERVEROUTPUT ON;

DECLARE
  -- Definição de uma PL/SQL table para armazenar os IDs dos funcionários
  TYPE t_funcionarios_ids IS TABLE OF collections_funcionarios.id%TYPE INDEX BY PLS_INTEGER;
  
  -- Declaração de uma variável do tipo t_funcionarios_ids
  v_funcionarios_ids t_funcionarios_ids;
  
  -- Variável auxiliar para o índice
  v_index PLS_INTEGER := 1;
  
BEGIN
  -- Inserindo IDs de funcionários na PL/SQL table
  v_funcionarios_ids(1) := 101;  -- Exemplo de ID
  v_funcionarios_ids(2) := 102;  -- Exemplo de ID
  v_funcionarios_ids(3) := 103;  -- Exemplo de ID

  -- Loop para aumentar o salário em 10% para os funcionários cujo ID está na PL/SQL table
  FOR i IN 1..v_funcionarios_ids.COUNT LOOP
    UPDATE collections_funcionarios
    SET salario = salario * 1.10
    WHERE id = v_funcionarios_ids(i);
    
    -- Exibe a confirmação do aumento de salário
    DBMS_OUTPUT.PUT_LINE('Salário do funcionário com ID ' || v_funcionarios_ids(i) || ' foi aumentado em 10%.');
  END LOOP;

  -- Commit para garantir que as alterações sejam salvas
  COMMIT;
  
END;
/
