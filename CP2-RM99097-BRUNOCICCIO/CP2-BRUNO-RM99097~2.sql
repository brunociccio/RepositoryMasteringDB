/*Objetivo: Criando uma Collection table
Voc� est� trabalhando em um projeto de gerenciamento de tarefas em um banco 
de dados Oracle. Sua tarefa � criar um bloco an�nimo PL/SQL que lida com o 
uso de um "TYPE TABLE" para gerenciar uma lista de tarefas. Aqui est�o as 
etapas que voc� deve seguir: 
1. Crie um tipo de tabela chamado `tipo_tabela_tarefas` que tenha uma coluna 
para o nome da tarefa (VARCHAR2) e uma coluna para a data de vencimento (DATE).
2. Declare uma vari�vel do tipo `tipo_tabela_tarefas`.
3. Preencha a vari�vel `tipo_tabela_tarefas` com tr�s tarefas, cada uma 
contendo um nome de tarefa e uma data de vencimento.
4. Utilize um loop para percorrer a vari�vel `tipo_tabela_tarefas` e exiba 
o nome de cada tarefa e sua data de vencimento na tela.
5. Adicione uma nova tarefa � vari�vel `tipo_tabela_tarefas`.
6. Exiba a contagem total de tarefas na vari�vel ap�s a adi��o da nova tarefa. 
Utilize o pacote DBMS_OUTPUT.PUT_LINE para exibir o conte�do*/

SET SERVEROUTPUT ON;

-- CRIANDO O BLOCO AN�NIMO
DECLARE
    -- CRIANDO O TIPO DE REGISTRO PARA AS TAREFAS
    TYPE TAREFA_RECORD IS RECORD (
        NOME_TAREFA VARCHAR2(100),
        DATA_VENCIMENTO DATE
    );

    TYPE TIPO_TABELA_TAREFAS IS TABLE OF TAREFA_RECORD;

    LISTA_TAREFAS TIPO_TABELA_TAREFAS;
    
BEGIN
    -- PREENCHENDO A VARI�VEL
    LISTA_TAREFAS := TIPO_TABELA_TAREFAS();
    LISTA_TAREFAS.EXTEND(3);
    
    LISTA_TAREFAS(1).NOME_TAREFA := 'COMPRAR SUPRIMENTOS';
    LISTA_TAREFAS(1).DATA_VENCIMENTO := TO_DATE('10-OUT-2024', 'DD-MON-YYYY');
    
    LISTA_TAREFAS(2).NOME_TAREFA := 'ENVIAR RELAT�RIO';
    LISTA_TAREFAS(2).DATA_VENCIMENTO := TO_DATE('15-OUT-2024', 'DD-MON-YYYY');
    
    LISTA_TAREFAS(3).NOME_TAREFA := 'REUNI�O COM A EQUIPE';
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
    DBMS_OUTPUT.PUT_LINE('TOTAL DE TAREFAS AP�S ADI��O: ' || 
    LISTA_TAREFAS.COUNT);
    
    -- EXIBINDO TODAS AS TAREFAS AP�S ADI��O
    DBMS_OUTPUT.PUT_LINE('TAREFAS AP�S ADI��O:');
    FOR I IN 1..LISTA_TAREFAS.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('TAREFA: ' || LISTA_TAREFAS(I).NOME_TAREFA || 
        ' - DATA DE VENCIMENTO: ' || LISTA_TAREFAS(I).DATA_VENCIMENTO);
    END LOOP;
END;
/
