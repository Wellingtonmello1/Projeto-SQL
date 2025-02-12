CREATE TABLE CLIENTES
    (NOME VARCHAR2(30),
     CPF_CNPJ NUMBER(14) PRIMARY KEY,
     ENDERE�O VARCHAR2(50),
     CIDADE VARCHAR2(50),
     ESTADO VARCHAR2(2),
     CEP VARCHAR2(9),
     TELEFONE_CEL NUMBER(11)
);

ALTER TABLE CLIENTES MODIFY CPF_CNPJ NOT NULL;


CREATE TABLE PRODUTOS 
   (PRODUTO_ID NUMBER(6) PRIMARY KEY NOT NULL,
    NOME_PRODUTO VARCHAR2(25)NULL,
    MARCA VARCHAR2(15)NULL,
    DESCRICAO VARCHAR2(120) NULL,
    CATEGORIA VARCHAR2(15)NOT NULL,
    PRECO NUMBER(10,2)NOT NULL
);
ALTER TABLE PRODUTOS ADD NOME_FORNECEDOR VARCHAR2(30)NOT NULL;

CREATE TABLE VENDAS
    (ID_VENDA NUMBER(11) PRIMARY KEY,
     NOME_PRODUTO VARCHAR2(25) NOT NULL,
     PRODUTO_ID NUMBER(6) NOT NULL,
     NOME_CLIENTE VARCHAR2(30)NOT NULL,
     CPF_CNPJ NUMBER (14) NOT NULL,
     INSCRICAO_ESTADUAL NUMBER (9) NULL,
     NUMERO_NOTA_FISCAL NUMBER(6),
     DATA_VENDA DATE NOT NULL);
     
CREATE TABLE FORNECEDORES
    (NOME_FORNECEDOR VARCHAR2(30) PRIMARY KEY,
     CNPJ NUMBER(14)NOT NULL,
     INSCRICAO_ESTADUAL NUMBER (9) NOT NULL,
     ENDERECO VARCHAR2(30) NOT NULL,
     CIDADE VARCHAR2(30) NOT NULL,
     ESTADO VARCHAR2(2) NOT NULL,
     CEP NUMBER(9) NOT NULL)
;
    
    alter table clientes rename column nome to NOME_CLIENTE;


alter table vendas add constraint CPF_CNPJ FOREIGN KEY (CPF_CNPJ) REFERENCES CLIENTES (CPF_CNPJ);   
     
alter table vendas add constraint NOME_CLIENTE FOREIGN KEY (NOME_CLIENTE) REFERENCES CLIENTES (NOME_CLIENTE);    

alter table vendas add constraint PRODUTO_ID FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTOS (PRODUTO_ID);
     
SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'CLIENTES' AND constraint_type IN ('P', 'U');


ALTER TABLE CLIENTES
ADD CONSTRAINT unique_nome_cliente UNIQUE (NOME_CLIENTE);

ALTER TABLE VENDAS
ADD CONSTRAINT fk_nome_cliente FOREIGN KEY (NOME_CLIENTE) REFERENCES CLIENTES (NOME_CLIENTE);


ALTER TABLE PRODUTOS
ADD CONSTRAINT NOME_FORNECEDOR FOREIGN KEY (NOME_FORNECEDOR) REFERENCES FORNECEDORES (NOME_FORNECEDOR);

ALTER TABLE CLIENTES
DROP CONSTRAINT unique_nome_cliente;


ALTER TABLE CLIENTES
DROP CONSTRAINT unique_nome_cliente;




    









