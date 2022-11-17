CREATE DATABASE cadastro
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

SHOW DATABASES;
USE cadastro;

CREATE TABLE pessoas (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(30) NOT NULL,
nascimento DATE,
sexo ENUM('M','F'),
peso DECIMAL(5,2),
altura DECIMAL(3,2),
nacionalidade VARCHAR(20),
PRIMARY KEY (id)
)DEFAULT CHARSET = utf8;

INSERT INTO pessoas
(nome,nascimento,sexo,peso,altura,nacionalidade)
VALUES
('Diego','1999-02-12','M','79','1.70','Brasil'),
('Rafael','1997-02-19','M','90','1.82','Portugal'),
('Jorge','1990-03-15','M','83','1.77','Brasil'),
('Maria','2000-07-12','F','60','1.60','Brasil'),
('Jose','2002-09-11','M','70','1.64','Portugal'),
('Cleiton','1994-12-23','M','80','1.70','Brasil'),
('Juliana','2005-08-04','F','62','1.70','Brasil'),
('Bruna','1993-03-08','F','55','1.58','Brasil'),
('Roberto','1996-04-05','M','65','1.70','Brasil'),
('Sara','1999-05-29','F','58','1.65','Brasil'),
('Ricardo','2004-07-01','M','98','1.77','Angola');
