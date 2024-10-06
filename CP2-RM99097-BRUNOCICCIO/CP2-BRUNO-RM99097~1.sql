/*Objetivo: Criando uma Collection varray
Suponha que voc� esteja trabalhando em um sistema de gerenciamento de produtos 
em um banco de dados Oracle. Voc� foi designado para criar um procedimento 
PL/SQL que lida com a gest�o de categorias de produtos usando uma varray. 
Sua tarefa � criar o procedimento PL/SQL �PRC_CATEGORIA� que realize as 
seguintes a��es:
1. Declare uma varray chamada `categorias_produtos` que pode armazenar at� 5 
categorias de produtos. 
2. Preencha a varray com as seguintes categorias de produtos: "Eletr�nicos", 
"Roupas", "Alimentos", "M�veis" e "Livros".
3. Exiba o n�mero total de categorias de produtos armazenadas na varray.
4. Utilize um loop para percorrer a varray e exiba cada categoria de produto 
na tela.
5. Permita que o usu�rio insira como par�metro de entrada uma nova categoria 
de produto no final da varray.
6. Exiba o n�mero total de categorias de produtos ap�s a inser��o da nova 
categoria. 
Utilize o pacote DBMS_OUTPUT.PUT_LINE para exibir o conte�do*/

SET SERVEROUTPUT ON;
EXEC PRC_CATEGORIA('BRINQUEDOS');

-- CRIANDO O PROCEDIMENTO PRC_CATEGORIA
CREATE OR REPLACE PROCEDURE PRC_CATEGORIA (NOVA_CATEGORIA IN VARCHAR2) IS
    -- DECLARANDO A VARRAY 
    TYPE VARRAY_CATEGORIAS IS VARRAY(5) OF VARCHAR2(50);
    CATEGORIAS_PRODUTOS VARRAY_CATEGORIAS := VARRAY_CATEGORIAS('ELETR�NICOS', 
    'ROUPAS', 'ALIMENTOS', 'M�VEIS', 'LIVROS');
BEGIN
    -- EXIBINDO O N�MERO TOTAL DE CATEGORIAS INICIALMENTE
    DBMS_OUTPUT.PUT_LINE('N�MERO TOTAL DE CATEGORIAS INICIALMENTE: ' || 
    CATEGORIAS_PRODUTOS.COUNT);
    
    FOR I IN 1..CATEGORIAS_PRODUTOS.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('CATEGORIA ' || I || ': ' || 
        CATEGORIAS_PRODUTOS(I));
    END LOOP;
    
    -- ADICIONANDO A NOVA CATEGORIA 
    IF CATEGORIAS_PRODUTOS.COUNT < 5 THEN
        CATEGORIAS_PRODUTOS.EXTEND;
        CATEGORIAS_PRODUTOS(CATEGORIAS_PRODUTOS.COUNT) := NOVA_CATEGORIA;
        DBMS_OUTPUT.PUT_LINE('NOVA CATEGORIA ADICIONADA: ' || NOVA_CATEGORIA);
    ELSE
        DBMS_OUTPUT.PUT_LINE('ERRO: N�O � POSS�VEL ADICIONAR MAIS 
        CATEGORIAS. VARRAY EST� CHEIA.');
    END IF;
    
    -- EXIBINDO O N�MERO TOTAL DE CATEGORIAS AP�S A INSER��O
    DBMS_OUTPUT.PUT_LINE('N�MERO TOTAL DE CATEGORIAS AP�S A INSER��O: ' || 
    CATEGORIAS_PRODUTOS.COUNT);
    
    -- PERCORRENDO A VARRAY
    FOR I IN 1..CATEGORIAS_PRODUTOS.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('CATEGORIA ' || I || ': ' || 
        CATEGORIAS_PRODUTOS(I));
    END LOOP;
END;
/
