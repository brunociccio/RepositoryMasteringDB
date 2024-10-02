/*crie um associative array para armazenar os nomes dos funcionarios indexados
por seus IDs*/

SET SERVEROUTPUT ON;

DECLARE
  -- Defini��o de um associative array para armazenar os nomes dos funcion�rios indexados pelos IDs
  TYPE t_funcionarios IS TABLE OF VARCHAR2(255) INDEX BY PLS_INTEGER;
  
  -- Declara��o de uma vari�vel do tipo t_funcionarios
  v_funcionarios t_funcionarios;
  
BEGIN
  -- Inserindo dados no associative array (exemplos de IDs e nomes)
  v_funcionarios(101) := 'Jo�o Silva';
  v_funcionarios(102) := 'Maria Oliveira';
  v_funcionarios(103) := 'Carlos Santos';

  -- Exibindo os valores armazenados no associative array
  FOR id IN v_funcionarios.FIRST .. v_funcionarios.LAST LOOP
    IF v_funcionarios.EXISTS(id) THEN
      DBMS_OUTPUT.PUT_LINE('ID: ' || id || ', Nome: ' || v_funcionarios(id));
    END IF;
  END LOOP;
  
END;
/



