/* UM PACOTE � UM OBJETO DE ESQUEMA QUE AGRUPA TIPOS PL/SQL LOGICAMENTE
RELACIONADOS, VARIAVEIS E SUBPROGRAMAS. OS PACOTES GERALMENTE POSSUEM DUAS
PARTES, UMA ESPECIFICA��O E UM CORPO

- CREATE [OR REPLACE] PACKAGE - PERMITE CRIAR A ESPECIFICA��O DO PACOTE QUE 
S�O ARMAZENADAS EM UM BANCO
- CREATE [OR REPLACE] PACKAGE BODY - PERMITE CRIAR UM BLOCO DE �DIGO ARMAZENANDO
NO BANCO QUE CONTEM A IMPLEMENTA��O DAS ESPECIFICA��ES DO PACOTE.

ESPECIFICA��O DO PACOTE CONTEM DECLARA��ES PUBLICAS. OS ITENS DECLARADOS S�O
ACESSIVEL DE QUALQUER LUGAR NO CORPO DO PACOTE E PARA QUAISQUER OUTROS SUBPROGRMAS
NO MESMO ESQUEMA.*/

CREATE OR REPLACE PACKAGE PKG_ALUNO AS
-- GET NOME COMPLETO DO ALUNO
FUNCTION GET_NOME(P_RM NUMBER)
RETURN VARCHAR2;
-- GET RM DO ALUNO
FUNCTION GET_RM(P_NOME VARCHAR2)
RETURN NUMBER;
END PKG_ALUNO;
/

