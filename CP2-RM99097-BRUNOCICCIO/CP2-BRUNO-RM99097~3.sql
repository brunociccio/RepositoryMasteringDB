/*Objetivo: Criando uma Collection record
Você está trabalhando em um projeto de gerenciamento de funcionários em um 
banco de dados Oracle. Sua tarefa é criar procedimento PL/SQL que lida com 
um "TYPE RECORD" para representar informações de funcionários. Aqui estão as 
etapas que você deve seguir. 
1. Crie um tipo de registro chamado `tipo_registro_funcionario` que tenha 
os seguintes campos:
   - `id` (NUMBER)
   - `nome` (VARCHAR2)
   - `cargo` (VARCHAR2)
   - `salario` (NUMBER) 
2. Declare uma variável do tipo `tipo_registro_funcionario`. 
3. Preencha a variável `tipo_registro_funcionario` com os dados de um 
funcionário fictício, incluindo um ID, nome, cargo e salário. 
4. Utilize a variável para exibir as informações do funcionário na tela. 
5. Aumente o salário do funcionário em 10% e exiba o novo salário na tela.
Utilize o pacote DBMS_OUTPUT.PUT_LINE para exibir o conteúdo*/
SET SERVEROUTPUT ON;
DECLARE
    -- CRIAÇÃO DO TIPO DE REGISTRO PARA FUNCIONÁRIO
    TYPE TIPO_REGISTRO_FUNCIONARIO IS RECORD (
        ID      NUMBER,
        NOME    VARCHAR2(100),
        CARGO   VARCHAR2(100),
        SALARIO NUMBER
    );
    -- DECLARAÇÃO DA VARIÁVEL 
    FUNCIONARIO TIPO_REGISTRO_FUNCIONARIO;

BEGIN
    -- PREENCHENDO A VARIÁVEL
    FUNCIONARIO.ID := 101;
    FUNCIONARIO.NOME := 'CARLOS SOUZA';
    FUNCIONARIO.CARGO := 'ANALISTA DE SISTEMAS';
    FUNCIONARIO.SALARIO := 5000;

    -- EXIBINDO AS INFORMAÇÕES
    DBMS_OUTPUT.PUT_LINE('INFORMAÇÕES DO FUNCIONÁRIO:');
    DBMS_OUTPUT.PUT_LINE('ID: ' || FUNCIONARIO.ID);
    DBMS_OUTPUT.PUT_LINE('NOME: ' || FUNCIONARIO.NOME);
    DBMS_OUTPUT.PUT_LINE('CARGO: ' || FUNCIONARIO.CARGO);
    DBMS_OUTPUT.PUT_LINE('SALÁRIO: R$ ' || FUNCIONARIO.SALARIO);

    -- AUMENTANDO O SALÁRIO EM 10%
    FUNCIONARIO.SALARIO := FUNCIONARIO.SALARIO * 1.10;

    -- EXIBINDO O NOVO SALÁRIO
    DBMS_OUTPUT.PUT_LINE('NOVO SALÁRIO COM 10% DE AUMENTO: R$ ' || FUNCIONARIO.SALARIO);
END;
