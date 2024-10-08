/*criar um record para armazenar informa��es de um funcion�rio (id, nome, 
cargo, salario) da tabela funcionarios. Em seguida, insira valores no record.*/

drop table collections_funcionarios;
CREATE TABLE collections_funcionarios (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY,  -- ID auto increment�vel
    nome VARCHAR2(255),                          -- Nome do funcion�rio
    cargo VARCHAR2(255),                          -- Cargo do funcion�rio
    salario NUMBER(10, 2),                       -- Sal�rio do funcion�rio
    CONSTRAINT pk_funcionario_id PRIMARY KEY (id) -- Chave prim�ria
);

SET SERVEROUTPUT ON;

DECLARE
  -- Defini��o do record para armazenar os dados de um funcion�rio
  TYPE funcionario_record IS RECORD (
    id      collections_funcionarios.id%TYPE,
    nome    collections_funcionarios.nome%TYPE,
    cargo   collections_funcionarios.cargo%TYPE,
    salario collections_funcionarios.salario%TYPE
  );

  -- Declara��o de uma vari�vel do tipo funcionario_record
  v_funcionario funcionario_record;

BEGIN
  -- Inser��o de valores no record
  v_funcionario.id := 101;
  v_funcionario.nome := 'Jo�o Silva';
  v_funcionario.cargo := 'Desenvolvedor';
  v_funcionario.salario := 5000;

  -- Exibindo os valores armazenados no record
  DBMS_OUTPUT.PUT_LINE('ID: ' || v_funcionario.id);
  DBMS_OUTPUT.PUT_LINE('Nome: ' || v_funcionario.nome);
  DBMS_OUTPUT.PUT_LINE('Cargo: ' || v_funcionario.cargo);
  DBMS_OUTPUT.PUT_LINE('Sal�rio: ' || v_funcionario.salario);

END;
/
