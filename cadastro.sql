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

CREATE TABLE endereco (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
bairro VARCHAR(40),
rua VARCHAR(50),
numero INT,
cep INT
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

CREATE TABLE IF NOT EXISTS cursos(
nome VARCHAR(30) NOT NULL UNIQUE,
descricao TEXT,
carga INT UNSIGNED,
totaulas INT,
ano YEAR DEFAULT '2016'
) DEFAULT CHARSET = utf8;

ALTER TABLE cursos
ADD COLUMN idcurso int FIRST;

ALTER TABLE cursos
ADD PRIMARY KEY (idcurso);

INSERT INTO cursos VALUES
('1','HTML5','CursodeHTML5','40','37','2014'),
('2','Algoritmos','LógicadeProgamação','20','15','2014'),
('3','Photoshop','DicasdePhotoshopCC','10','8','2014'),
('4','PHP','CursodePHPparainiciantes','40','20','2010'),
('5','Java','IntroduçãoàLinguagemJava','10','29','2000'),
('6','MySQL','BancodeDadosMySQL','30','15','2016'),
('7','Word','CursocompletodeWord','40','30','2016'),
('8','Sapateado','DançasRítmicas','40','37','2018'),
('9','CozinhaÁrabe','AprenderafazerKibe','40','30','2018'),
('10','YouTuber','Mas é cada coisa que eu tenho que escrever aqui','5','2','2018');

UPDATE cursos
SET descricao = 'Curso de HTML5'
WHERE idcurso = '1'
LIMIT 1;

UPDATE cursos
SET descricao = 'Lógica de Programação'
WHERE idcurso = '2'
LIMIT 1;

UPDATE cursos
SET descricao = 'Dicas de Photoshop CC'
WHERE idcurso = '3'
LIMIT 1;

UPDATE cursos
SET descricao = 'Curso de PHP para Iniciantes', ano = '2015'
WHERE idcurso = '4'
LIMIT 1;

UPDATE cursos
SET descricao = 'Introdução à Linguagem Java', carga = '40', ano = '2015'
WHERE idcurso = '5'
LIMIT 1;

UPDATE cursos
SET descricao = 'Banco de Dados MySQL'
WHERE idcurso = '6'
LIMIT 1;

UPDATE cursos
SET descricao = 'Curso Completo de Word'
WHERE idcurso = '7'
LIMIT 1;

DELETE FROM cursos
WHERE idcurso IN(8,9,10);

DROP TABLE cursos;
DROP TABLE pessoas;

/* Após dropar as duas tabelas, baixar no diretório dumps o arquivo Dump-CeV01.sql, em seguida abrir o terminal linux e digitar o comando a seguir */
/* À partir disto o banco cadastro ira receber duas novas tabelas com mais informações para ser feito exercícios de consulta */
sudo mysql -u root -p cadastro < Dump-CeV01.sql

/* Deste ponto será feito testes de consultas para a prática do uso do comando select */

SELECT * FROM cursos
WHERE carga BETWEEN '20' AND '30'
ORDER BY nome;

SELECT * FROM cursos
WHERE carga IN (20,30,40)
ORDER BY ano;

SELECT * FROM cursos
WHERE carga > 10 AND ano < 2014;

SELECT * FROM cursos
WHERE descricao
LIKE '%to%';

SELECT DISTINCT nacionalidade
FROM gafanhotos
ORDER BY nacionalidade DESC;

SELECT * FROM cursos
WHERE (
SELECT COUNT(*)
WHERE ano <'2015');

