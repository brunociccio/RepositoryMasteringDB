/*Objetivo: Criando uma Collection record
Voc� est� trabalhando em um projeto de gerenciamento de funcion�rios em um 
banco de dados Oracle. Sua tarefa � criar procedimento PL/SQL que lida com 
um "TYPE RECORD" para representar informa��es de funcion�rios. Aqui est�o as 
etapas que voc� deve seguir. 
1. Crie um tipo de registro chamado `tipo_registro_funcionario` que tenha 
os seguintes campos:
   - `id` (NUMBER)
   - `nome` (VARCHAR2)
   - `cargo` (VARCHAR2)
   - `salario` (NUMBER) 
2. Declare uma vari�vel do tipo `tipo_registro_funcionario`. 
3. Preencha a vari�vel `tipo_registro_funcionario` com os dados de um 
funcion�rio fict�cio, incluindo um ID, nome, cargo e sal�rio. 
4. Utilize a vari�vel para exibir as informa��es do funcion�rio na tela. 
5. Aumente o sal�rio do funcion�rio em 10% e exiba o novo sal�rio na tela.
Utilize o pacote DBMS_OUTPUT.PUT_LINE para exibir o conte�do*/
SET SERVEROUTPUT ON;
DECLARE
    -- CRIA��O DO TIPO DE REGISTRO PARA FUNCION�RIO
    TYPE TIPO_REGISTRO_FUNCIONARIO IS RECORD (
        ID      NUMBER,
        NOME    VARCHAR2(100),
        CARGO   VARCHAR2(100),
        SALARIO NUMBER
    );
    -- DECLARA��O DA VARI�VEL 
    FUNCIONARIO TIPO_REGISTRO_FUNCIONARIO;

BEGIN
    -- PREENCHENDO A VARI�VEL
    FUNCIONARIO.ID := 101;
    FUNCIONARIO.NOME := 'CARLOS SOUZA';
    FUNCIONARIO.CARGO := 'ANALISTA DE SISTEMAS';
    FUNCIONARIO.SALARIO := 5000;

    -- EXIBINDO AS INFORMA��ES
    DBMS_OUTPUT.PUT_LINE('INFORMA��ES DO FUNCION�RIO:');
    DBMS_OUTPUT.PUT_LINE('ID: ' || FUNCIONARIO.ID);
    DBMS_OUTPUT.PUT_LINE('NOME: ' || FUNCIONARIO.NOME);
    DBMS_OUTPUT.PUT_LINE('CARGO: ' || FUNCIONARIO.CARGO);
    DBMS_OUTPUT.PUT_LINE('SAL�RIO: R$ ' || FUNCIONARIO.SALARIO);

    -- AUMENTANDO O SAL�RIO EM 10%
    FUNCIONARIO.SALARIO := FUNCIONARIO.SALARIO * 1.10;

    -- EXIBINDO O NOVO SAL�RIO
    DBMS_OUTPUT.PUT_LINE('NOVO SAL�RIO COM 10% DE AUMENTO: R$ ' || FUNCIONARIO.SALARIO);
END;
