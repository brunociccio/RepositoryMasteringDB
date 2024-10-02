/*crie um associative array para calcular a media dos salarios dos
funcionarios agrupados por cargo*/

SET SERVEROUTPUT ON;

DECLARE
  -- Defini��o de um associative array para armazenar o total dos sal�rios por cargo
  TYPE t_salarios IS TABLE OF NUMBER INDEX BY VARCHAR2(100);

  -- Defini��o de um associative array para armazenar a contagem de funcion�rios por cargo
  TYPE t_contagem IS TABLE OF NUMBER INDEX BY VARCHAR2(100);

  -- Declara��o de vari�veis para armazenar sal�rios e contagem de funcion�rios por cargo
  v_salarios t_salarios;
  v_contagem t_contagem;
  v_cargo VARCHAR2(100);

BEGIN
  -- Inicializando os arrays
  v_salarios := t_salarios();
  v_contagem := t_contagem();

  -- Preencher os arrays com os dados da tabela collections_funcionarios
  FOR r IN (SELECT cargo, salario FROM collections_funcionarios) LOOP
    -- Se o cargo j� existir no array, somar o sal�rio e aumentar a contagem
    IF v_salarios.EXISTS(r.cargo) THEN
      v_salarios(r.cargo) := v_salarios(r.cargo) + r.salario;
      v_contagem(r.cargo) := v_contagem(r.cargo) + 1;
    ELSE
      -- Se o cargo ainda n�o existir no array, inicializ�-lo
      v_salarios(r.cargo) := r.salario;
      v_contagem(r.cargo) := 1;
    END IF;
  END LOOP;

  -- Calcular e exibir a m�dia dos sal�rios por cargo
  DBMS_OUTPUT.PUT_LINE('M�dia de sal�rios por cargo:');
  
  -- Usando um loop para iterar sobre as chaves do array (neste caso, os cargos)
  v_cargo := v_salarios.FIRST;
  WHILE v_cargo IS NOT NULL LOOP
    DBMS_OUTPUT.PUT_LINE('Cargo: ' || v_cargo || ', M�dia de Sal�rio: ' ||
                         (v_salarios(v_cargo) / v_contagem(v_cargo)));
    v_cargo := v_salarios.NEXT(v_cargo);  -- Move para o pr�ximo cargo
  END LOOP;

END;
/


