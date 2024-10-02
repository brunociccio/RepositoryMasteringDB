/* Crie uma plsql table para armazenar os nomes dos funcionarios da tabela
collections_funcionarios. Preencha essa tabela com dados reais da tabela.*/

SET SERVEROUTPUT ON;

DECLARE
  -- Defini��o de uma PL/SQL table para armazenar os nomes dos funcion�rios
  TYPE t_funcionarios_nomes IS TABLE OF collections_funcionarios.nome%TYPE INDEX BY PLS_INTEGER;
  
  -- Declara��o de uma vari�vel do tipo t_funcionarios_nomes
  v_funcionarios_nomes t_funcionarios_nomes;
  
  -- Vari�vel auxiliar para contar os registros
  v_index PLS_INTEGER := 1;
  
BEGIN
  -- Selecionar os nomes dos funcion�rios e preencher a PL/SQL table
  FOR r IN (SELECT nome FROM collections_funcionarios) LOOP
    v_funcionarios_nomes(v_index) := r.nome;
    v_index := v_index + 1;
  END LOOP;

  -- Exibir os nomes armazenados na PL/SQL table
  FOR i IN 1..v_funcionarios_nomes.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('Nome do Funcion�rio ' || i || ': ' || v_funcionarios_nomes(i));
  END LOOP;
  
END;
/
