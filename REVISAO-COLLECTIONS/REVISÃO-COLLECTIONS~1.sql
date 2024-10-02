/*Crie uma collection (VARRAY) para armazenar os IDs de 5 funcionarios
da tabela collections_funcionarios*/

SET SERVEROUTPUT ON;

DECLARE
  -- Criação de um VARRAY para armazenar os IDs de até 5 funcionários
  TYPE varray_funcionarios IS VARRAY(5) OF NUMBER;
  
  -- Declaração de uma variável do tipo varray_funcionarios
  v_funcionarios varray_funcionarios := varray_funcionarios();
  
BEGIN
  -- Inserção de IDs no VARRAY (valores de exemplo)
  v_funcionarios.EXTEND(5); -- Extende o VARRAY para 5 posições
  
  v_funcionarios(1) := 101;
  v_funcionarios(2) := 102;
  v_funcionarios(3) := 103;
  v_funcionarios(4) := 104;
  v_funcionarios(5) := 105;
  
  -- Exibindo os valores da VARRAY
  FOR i IN 1..v_funcionarios.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('ID do Funcionário ' || i || ': ' || v_funcionarios(i));
  END LOOP;
  
END;
/
