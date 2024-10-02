/* Crie uma plsql table para armazenar os nomes dos funcionarios da tabela
collections_funcionarios e em seguida insira tres nomes e exiba-os*/

SET SERVEROUTPUT ON;

DECLARE
  -- Definição de uma PL/SQL table para armazenar os nomes dos funcionários
  TYPE t_funcionarios_nomes IS TABLE OF collections_funcionarios.nome%TYPE INDEX BY PLS_INTEGER;
  
  -- Declaração de uma variável do tipo t_funcionarios_nomes
  v_funcionarios_nomes t_funcionarios_nomes;
  
BEGIN
  -- Inserção de três nomes na PL/SQL table
  v_funcionarios_nomes(1) := 'João Silva';
  v_funcionarios_nomes(2) := 'Maria Oliveira';
  v_funcionarios_nomes(3) := 'Carlos Santos';
  
  -- Exibindo os nomes armazenados na PL/SQL table
  FOR i IN 1..v_funcionarios_nomes.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('Nome do Funcionário ' || i || ': ' || v_funcionarios_nomes(i));
  END LOOP;
  
END;
/
