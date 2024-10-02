/*insira 3 novos funcionarios na tabela collections_funcionarios usando
uma plsql table e o comando FOR tradicional*/

SET SERVEROUTPUT ON;

DECLARE
  -- Definição de uma PL/SQL table para armazenar os novos funcionários
  TYPE t_funcionarios IS TABLE OF collections_funcionarios%ROWTYPE;

  -- Declaração de uma variável do tipo t_funcionarios
  v_novos_funcionarios t_funcionarios;

BEGIN
  -- Preenchendo a PL/SQL table com os novos funcionários
  v_novos_funcionarios := t_funcionarios();

  -- Adicionando dados dos novos funcionários na PL/SQL table
  v_novos_funcionarios.EXTEND(3);  -- Ajusta o tamanho do array para 3 funcionários

  v_novos_funcionarios(1).id := NULL;  -- O ID será gerado automaticamente
  v_novos_funcionarios(1).nome := 'Lucas Alves';
  v_novos_funcionarios(1).cargo := 'Desenvolvedor';
  v_novos_funcionarios(1).salario := 4000;

  v_novos_funcionarios(2).id := NULL;  -- O ID será gerado automaticamente
  v_novos_funcionarios(2).nome := 'Juliana Costa';
  v_novos_funcionarios(2).cargo := 'Analista';
  v_novos_funcionarios(2).salario := 5000;

  v_novos_funcionarios(3).id := NULL;  -- O ID será gerado automaticamente
  v_novos_funcionarios(3).nome := 'Rafael Lima';
  v_novos_funcionarios(3).cargo := 'Gerente';
  v_novos_funcionarios(3).salario := 7000;

  -- Inserção dos novos funcionários na tabela usando o FOR tradicional
  FOR i IN 1..v_novos_funcionarios.COUNT LOOP
    INSERT INTO collections_funcionarios (nome, cargo, salario)
    VALUES (v_novos_funcionarios(i).nome, v_novos_funcionarios(i).cargo, v_novos_funcionarios(i).salario);
  END LOOP;

  -- Commit para salvar as mudanças
  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Três novos funcionários foram inseridos com sucesso.');

END;
/
