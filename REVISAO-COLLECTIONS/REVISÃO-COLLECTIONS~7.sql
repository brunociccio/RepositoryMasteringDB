/*continuação do exercicio 7*/

SET SERVEROUTPUT ON;

DECLARE
  v_cliente collections_cliente%ROWTYPE;
BEGIN
  -- Chamada da função passando o ID do cliente
  v_cliente := get_cliente_info(1);
  
  -- Verifica se o ID é nulo para determinar se o record foi preenchido
  IF v_cliente.id IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_cliente.id);
    DBMS_OUTPUT.PUT_LINE('Nome: ' || v_cliente.nome);
    DBMS_OUTPUT.PUT_LINE('Telefone: ' || v_cliente.telefone);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Cliente não encontrado.');
  END IF;
END;
/

