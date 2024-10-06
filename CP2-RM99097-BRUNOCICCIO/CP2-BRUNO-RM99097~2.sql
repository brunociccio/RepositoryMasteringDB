/*Objetivo: Criando uma Collection table
Você está trabalhando em um projeto de gerenciamento de tarefas em um banco 
de dados Oracle. Sua tarefa é criar um bloco anônimo PL/SQL que lida com o 
uso de um "TYPE TABLE" para gerenciar uma lista de tarefas. Aqui estão as 
etapas que você deve seguir: 
1. Crie um tipo de tabela chamado `tipo_tabela_tarefas` que tenha uma coluna 
para o nome da tarefa (VARCHAR2) e uma coluna para a data de vencimento (DATE).
2. Declare uma variável do tipo `tipo_tabela_tarefas`.
3. Preencha a variável `tipo_tabela_tarefas` com três tarefas, cada uma 
contendo um nome de tarefa e uma data de vencimento.
4. Utilize um loop para percorrer a variável `tipo_tabela_tarefas` e exiba 
o nome de cada tarefa e sua data de vencimento na tela.
5. Adicione uma nova tarefa à variável `tipo_tabela_tarefas`.
6. Exiba a contagem total de tarefas na variável após a adição da nova tarefa. 
Utilize o pacote DBMS_OUTPUT.PUT_LINE para exibir o conteúdo*/

SET SERVEROUTPUT ON;

-- CRIANDO O BLOCO ANÔNIMO
DECLARE
    -- CRIANDO O TIPO DE REGISTRO PARA AS TAREFAS
    TYPE TAREFA_RECORD IS RECORD (
        NOME_TAREFA VARCHAR2(100),
        DATA_VENCIMENTO DATE
    );

    TYPE TIPO_TABELA_TAREFAS IS TABLE OF TAREFA_RECORD;

    LISTA_TAREFAS TIPO_TABELA_TAREFAS;
    
BEGIN
    -- PREENCHENDO A VARIÁVEL
    LISTA_TAREFAS := TIPO_TABELA_TAREFAS();
    LISTA_TAREFAS.EXTEND(3);
    
    LISTA_TAREFAS(1).NOME_TAREFA := 'COMPRAR SUPRIMENTOS';
    LISTA_TAREFAS(1).DATA_VENCIMENTO := TO_DATE('10-OUT-2024', 'DD-MON-YYYY');
    
    LISTA_TAREFAS(2).NOME_TAREFA := 'ENVIAR RELATÓRIO';
    LISTA_TAREFAS(2).DATA_VENCIMENTO := TO_DATE('15-OUT-2024', 'DD-MON-YYYY');
    
    LISTA_TAREFAS(3).NOME_TAREFA := 'REUNIÃO COM A EQUIPE';
    LISTA_TAREFAS(3).DATA_VENCIMENTO := TO_DATE('20-OUT-2024', 'DD-MON-YYYY');
    
    -- EXIBINDO AS TAREFAS INICIAIS
    DBMS_OUTPUT.PUT_LINE('TAREFAS INICIAIS:');
    FOR I IN 1..LISTA_TAREFAS.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('TAREFA: ' || LISTA_TAREFAS(I).NOME_TAREFA || 
        ' - DATA DE VENCIMENTO: ' || LISTA_TAREFAS(I).DATA_VENCIMENTO);
    END LOOP;
    
    -- ADICIONANDO UMA NOVA TAREFA
    LISTA_TAREFAS.EXTEND(1);
    LISTA_TAREFAS(4).NOME_TAREFA := 'APRESENTAR PROJETO';
    LISTA_TAREFAS(4).DATA_VENCIMENTO := TO_DATE('25-OUT-2024', 'DD-MON-YYYY');
    
    -- EXIBINDO A QUANTIDADE TOTAL DE TAREFAS
    DBMS_OUTPUT.PUT_LINE('TOTAL DE TAREFAS APÓS ADIÇÃO: ' || 
    LISTA_TAREFAS.COUNT);
    
    -- EXIBINDO TODAS AS TAREFAS APÓS ADIÇÃO
    DBMS_OUTPUT.PUT_LINE('TAREFAS APÓS ADIÇÃO:');
    FOR I IN 1..LISTA_TAREFAS.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('TAREFA: ' || LISTA_TAREFAS(I).NOME_TAREFA || 
        ' - DATA DE VENCIMENTO: ' || LISTA_TAREFAS(I).DATA_VENCIMENTO);
    END LOOP;
END;
/
