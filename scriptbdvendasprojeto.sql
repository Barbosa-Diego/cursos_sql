CREATE SCHEMA bdvendasprojeto
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

/* Usar show databases para conferir se a mesma foi criada corretamente */

USE bdvendasprojeto;

CREATE TABLE tbl_cliente (
pk_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
cliente_nome VARCHAR(60) NOT NULL,
cliente_endereco VARCHAR(60),
cliente_bairro VARCHAR(50),
cliente_numero VARCHAR(10),
cliente_cidade VARCHAR(35),
cliente_uf VARCHAR(2),
cliente_cep VARCHAR(9),
cliente_telefone VARCHAR(15) NOT NULL
);



