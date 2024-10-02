/*insira 3 novos funcionarios na tabela collections_funcionarios usando
uma plsql table e o comando FOR tradicional*/

SET SERVEROUTPUT ON;

DECLARE
  -- Defini��o de uma PL/SQL table para armazenar os novos funcion�rios
  TYPE t_funcionarios IS TABLE OF collections_funcionarios%ROWTYPE;

  -- Declara��o de uma vari�vel do tipo t_funcionarios
  v_novos_funcionarios t_funcionarios;

BEGIN
  -- Preenchendo a PL/SQL table com os novos funcion�rios
  v_novos_funcionarios := t_funcionarios();

  -- Adicionando dados dos novos funcion�rios na PL/SQL table
  v_novos_funcionarios.EXTEND(3);  -- Ajusta o tamanho do array para 3 funcion�rios

  v_novos_funcionarios(1).id := NULL;  -- O ID ser� gerado automaticamente
  v_novos_funcionarios(1).nome := 'Lucas Alves';
  v_novos_funcionarios(1).cargo := 'Desenvolvedor';
  v_novos_funcionarios(1).salario := 4000;

  v_novos_funcionarios(2).id := NULL;  -- O ID ser� gerado automaticamente
  v_novos_funcionarios(2).nome := 'Juliana Costa';
  v_novos_funcionarios(2).cargo := 'Analista';
  v_novos_funcionarios(2).salario := 5000;

  v_novos_funcionarios(3).id := NULL;  -- O ID ser� gerado automaticamente
  v_novos_funcionarios(3).nome := 'Rafael Lima';
  v_novos_funcionarios(3).cargo := 'Gerente';
  v_novos_funcionarios(3).salario := 7000;

  -- Inser��o dos novos funcion�rios na tabela usando o FOR tradicional
  FOR i IN 1..v_novos_funcionarios.COUNT LOOP
    INSERT INTO collections_funcionarios (nome, cargo, salario)
    VALUES (v_novos_funcionarios(i).nome, v_novos_funcionarios(i).cargo, v_novos_funcionarios(i).salario);
  END LOOP;

  -- Commit para salvar as mudan�as
  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Tr�s novos funcion�rios foram inseridos com sucesso.');

END;
/
