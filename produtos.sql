CREATE DATABASE atividade1
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE atividade1;

CREATE TABLE categoria (
id INT NOT NULL AUTO_INCREMENT,
descricao VARCHAR(40),
PRIMARY KEY (id)
)DEFAULT CHARSET = utf8;

INSERT INTO categoria
(id,descricao)
VALUES
('1','Material Escolar'),
('2','Material de Limpeza'),
('3','Materigal de Higiene Pessoal');

CREATE TABLE produtos (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR(60) NOT NULL,
precovenda NUMERIC(10,2),
precocusto NUMERIC(10,2),
id_categoria INT
) DEFAULT CHARSET = utf8;

INSERT INTO produtos
(descricao,precovenda,precocusto,id_categoria)
VALUES
('Caderno 10 Matérias','19.90','10','1'),
('Caderno 20 Matérias','29.90','19.90','1'),
('Lapiseira 0.7mm','18.80','9.40','1'),
('Sabão em pó 2kg','20','11','2'),
('Esponja de Aço 3 unidades','3.50','1','2'),
('Água Sanitária 2 Lt','6','2.50','2'),
('Pasta de Dente 90g','2.93','1.36','3'),
('Sabonete em Barra 85g','3.86','1.50','3'),
('Desodorante Aerosol Antitranspirante','16.89','7.80','3');

SELECT P.id, P.descricao, P.precovenda, C.descricao FROM PRODUTOS P
INNER JOIN CATEGORIA C ON C.id = P.id_categoria
WHERE P.id_categoria = 1;
