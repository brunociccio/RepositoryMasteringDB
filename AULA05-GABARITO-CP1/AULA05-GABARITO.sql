--Programas 01
SET SERVEROUT ON
DECLARE
    v_Salario NUMBER(7,2) := &DIGITE_O_SALARIO; -- Defina o valor do sal?rio aqui
    v_SalarioLiquido NUMBER(7,2);
BEGIN
    IF v_Salario <= 1513.69 THEN
        v_SalarioLiquido := v_Salario; -- N?o h? desconto
    ELSIF v_Salario <= 2725.12 THEN
        v_SalarioLiquido := v_Salario - (v_Salario * 0.16); -- Desconto de 16%
    ELSE
        v_SalarioLiquido := v_Salario - (v_Salario * 0.285); -- Desconto de 28.5%
    END IF;

    DBMS_OUTPUT.PUT_LINE('O sal?rio l?quido ?: ' || v_SalarioLiquido);
END;
/
    