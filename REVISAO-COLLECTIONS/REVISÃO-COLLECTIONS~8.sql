/* Insira 2 novos clientes na tabela collections_clientes usando uma plsql 
table e o comando FOR tradicional*/

SET SERVEROUTPUT ON;

DECLARE
  -- Definição de uma PL/SQL table para armazenar os novos clientes
  TYPE t_clientes IS TABLE OF collections_cliente%ROWTYPE;

  -- Declaração de uma variável do tipo t_clientes
  v_novos_clientes t_clientes;

BEGIN
  -- Preenchendo a PL/SQL table com os novos clientes
  v_novos_clientes := t_clientes();

  -- Adicionando dados dos novos clientes na PL/SQL table
  v_novos_clientes.EXTEND(2);  -- Ajusta o tamanho do array para 2 clientes

  v_novos_clientes(1).id := NULL;  -- O ID será gerado automaticamente
  v_novos_clientes(1).nome := 'Ana Souza';
  v_novos_clientes(1).telefone := '1111-2222';

  v_novos_clientes(2).id := NULL;  -- O ID será gerado automaticamente
  v_novos_clientes(2).nome := 'Pedro Lima';
  v_novos_clientes(2).telefone := '3333-4444';

  -- Inserção dos novos clientes na tabela usando o FOR tradicional
  FOR i IN 1..v_novos_clientes.COUNT LOOP
    INSERT INTO collections_cliente (nome, telefone)
    VALUES (v_novos_clientes(i).nome, v_novos_clientes(i).telefone);
  END LOOP;

  -- Commit para salvar as mudanças
  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Dois novos clientes foram inseridos com sucesso.');

END;
/
