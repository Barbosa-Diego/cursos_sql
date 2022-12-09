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
/* Enfim, agora sim uma lista com exercícios básicos de consultas */
/* 1) Uma lista com o nome de todos os gafanhotos Mulheres. */
SELECT nome FROM gafanhotos
WHERE sexo = 'F';

/* 2) Uma lista com os dados de todos aqueles que nasceram entre 1/Jan/2000 e 31/Dez/2015. */
SELECT * FROM gafanhotos
WHERE nascimento BETWEEN '2000-01-01'
AND '2015-12-31';

/* 3) Uma lista com o nome de todos os homens que trabalham como programadores.*/
SELECT nome FROM gafanhotos
WHERE profissao = 'programador'
AND sexo = 'M';

/* 4) Uma lista com os dados de todas as mulheres que nasceram no Brasil e que têm seu nome iniciando com a letra J. */
SELECT * FROM gafanhotos
WHERE nome like 'J%'
AND sexo = 'F'
AND nacionalidade = 'Brasil';

/* 5) Uma lista com o nome e nacionalidade de todos os homens que têm Silva no nome, não nasceram no Brasil e pesam menos de 100 Kg. */
SELECT * FROM gafanhotos
WHERE nome like '%Silva%'
AND sexo = 'M'
AND NOT nacionalidade = 'Brasil'
AND peso < '100.00';

/* 6) Qual é a maior altura entre gafanhotos Homens que moram no Brasil? */
SELECT * FROM gafanhotos
WHERE sexo = 'M'
AND nacionalidade = 'Brasil'
ORDER BY altura;

SELECT MAX(altura)
FROM gafanhotos
WHERE sexo = 'M'
AND nacionalidade = 'Brasil';

/* 7) Qual é a média de peso dos gafanhotos cadastrados? */
SELECT * FROM gafanhotos
WHERE sexo = 'M'
AND nacionalidade = 'Brasil'
ORDER BY peso;

SELECT AVG(peso)
FROM gafanhotos
WHERE sexo = 'M'
AND nacionalidade = 'Brasil';

/* 8) Qual é o menor peso entre os gafanhotos Mulheres que nasceram fora do Brasil e entre 01/Jan/1990 e 31/Dez/2000? */
SELECT * FROM gafanhotos
WHERE sexo = 'F' 
AND nascimento BETWEEN '1990-01-01' AND '2000-12-31'
AND nacionalidade <> 'Brasil';

SELECT MIN(peso)
FROM gafanhotos
WHERE sexo = 'F'
AND nascimento BETWEEN '1990-01-01' AND '2000-12-31'
AND nacionalidade <> 'Brasil';

/* 9) Quantas gafanhotos Mulheres tem mais de 1.90cm de altura? */
SELECT * FROM gafanhotos
WHERE (
SELECT COUNT(*)
WHERE sexo = 'F'
AND altura > '1.90');

/* Retornando a mais alguma consultas de testes */
SELECT MAX(carga)
FROM cursos;

SELECT MIN(carga)
FROM cursos;

FROM cursos
WHERE ano = '2016';

SELECT AVG(totaulas)
FROM cursos
WHERE ano = '2016';

SELECT totaulas, COUNT(*)
FROM cursos
GROUP BY totaulas
ORDER BY totaulas;

SELECT ano, COUNT(*) FROM cursos
GROUP BY ano
HAVING COUNT(ano) >= 5
ORDER BY COUNT(*);

/* Mais Execícios  */

/* 10) Uma lista de com as profissões dos gafanhotos e seus respectivos quantitativos. */
SELECT profissao, COUNT(*)
FROM gafanhotos
GROUP BY profissao
ORDER BY count(*);

/* 11) Quantos gafanhotos homens e quantas mulheres nasceram após 01/Jan/2005? */
SELECT sexo, COUNT(*)
FROM gafanhotos
WHERE nascimento > '2005-01-01'
GROUP by sexo
ORDER BY COUNT(*);

SELECT * FROM gafanhotos WHERE nascimento > '2005-01-01';

/* 12) Uma lista com os gafanhotos que nasceram fora do Brasil, mostrando o país de origem e o total de pessoas nascidas lá,
Porém nos intessam os países que tiverem mais de 3 gafanhotos com essa nacionalidade. */
SELECT nacionalidade, COUNT(*)
FROM gafanhotos
WHERE nacionalidade <> 'Brasil'
GROUP BY nacionalidade
HAVING COUNT(nacionalidade) > 3
ORDER BY COUNT(*);

/* 13) Uma lista agrupada pela altura dos gafanhotos, mostrando quantas pessoas pesam mais de 100Kg e que estão acima da média de altura 
de todos os cadastrados. */
SELECT id, altura, COUNT(*)
FROM gafanhotos
WHERE peso > '100.00'
AND altura > (SELECT AVG(altura) from gafanhotos)
GROUP BY altura, id
ORDER BY altura;

/* Criando uma coluna e referenciando a mesma com uma chave estrangeira */

ALTER TABLE gafanhotos
ADD COLUMN cursopreferido INT;

ALTER TABLE gafanhotos
ADD FOREIGN KEY (cursopreferido)
REFERENCES cursos(idcurso);

/* Referenciando chave estrangeira */

UPDATE gafanhotos
SET cursopreferido = '6'
WHERE id = '1'

UPDATE gafanhotos
SET cursopreferido = '22'
WHERE id IN (2,11);

UPDATE cadastro.gafanhotos
SET cursopreferido = '12'
WHERE id = '3';

UPDATE cadastro.gafanhotos
SET cursopreferido = '7'
WHERE id = '4';

UPDATE cadastro.gafanhotos
SET cursopreferido = '1'
WHERE id = '5';

UPDATE cadastro.gafanhotos
SET cursopreferido = '8'
WHERE id = '6';

UPDATE cadastro.gafanhotos
SET cursopreferido = '4'
WHERE id = '7';

UPDATE cadastro.gafanhotos
SET cursopreferido = '5'
WHERE id = '8';

UPDATE cadastro.gafanhotos
SET cursopreferido = '3'
WHERE id = '9';

UPDATE cadastro.gafanhotos
SET cursopreferido = '30'
WHERE id = '10';

/* INNER JOIN */
SELECT g.nome, g.cursopreferido, c.nome, c.ano
FROM gafanhotos AS g
INNER JOIN cursos AS c
ON c.idcurso = g.cursopreferido
ORDER BY g.nome;

/* LEFT JOIN */
SELECT gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano
FROM gafanhotos
LEFT OUTER JOIN cursos
ON cursos.idcurso = gafanhotos.cursopreferido;

/* RIGHT JOIN */
SELECT gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano
FROM gafanhotos
RIGHT OUTER JOIN cursos
ON cursos.idcurso = gafanhotos.cursopreferido;

CREATE TABLE assiste_curso (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
data DATE,
idgafanhoto INT,
idcurso INT,
FOREIGN KEY (idgafanhoto) REFERENCES gafanhotos (id),
FOREIGN KEY (idcurso) REFERENCES cursos (idcurso)
) DEFAULT CHARSET = utf8;

INSERT INTO assiste_curso 
(data, idgafanhoto, idcurso)
VALUES
('2014-03-01','1','2'),
('2015-12-22','3','6'),
('2014-01-01','22','12'),
('2016-05-12','1','19');

SELECT g.id AS 'Cadastro Gafanhoto' ,g.nome AS 'Nome', c.descricao AS 'Descrição'
FROM gafanhotos g
INNER JOIN assiste_curso a
ON g.id = a.idgafanhoto
INNER JOIN cursos c
ON c.idcurso = a.idcurso
ORDER BY nome;
