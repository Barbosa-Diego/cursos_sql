CREATE DATABASE livraria;
USE livraria;

CREATE TABLE livros(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_livro VARCHAR(50) NOT NULL,
    nome_autor VARCHAR(50) NOT NULL,
    sexo_autor ENUM('F','M'),
    numero_paginas INT,
    nome_editora VARCHAR(30) NOT NULL,
    valor_livro DECIMAL(5,2),
    uf_editora CHAR(2),
    ano_publicacao YEAR
);

INSERT INTO livros
(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao)
VALUES
('Cavaleiro Real','Ana Claudia','F','465','Atlas','49.9','RJ','2009'),
('SQL para leigos','João Nunes','M','450','Addison','98','SP','2018'),
('Receitas Caseiras','Celia Tavares','F','210','Atlas','45','RJ','2008'),
('Pessoas Efetivas','Eduardo Santos','M','390','Beta','78.99','RJ','2018'),
('Habitos Saudáveis','Eduardo Santos','M','630','Beta','150.98','RJ','2019'),
('A Casa Marrom Hermes','Macedo','M','250','Bubba','60','MG','2016'),
('Estacio Querido','Geraldo Francisco','M','310','Insignia','100','ES','2015'),
('Pra sempre amigas','Leda Silva','F','510','Insignia','78.98','ES','2011'),
('Copas Inesqueciveis','Marco Alcantara','M','200','Larson','130.98','RS','2018'),
('O poder da mente','Clara Mafra','F','120','Continental','56','SP','2017');

SELECT nome_livro AS 'Livro', nome_autor AS 'Autor', sexo_autor AS 'Sexo do Autor', numero_paginas AS 'Numero de Páginas',
nome_editora AS 'Editora', valor_livro AS 'Valor do Livro', uf_editora AS 'UF', ano_publicacao AS 'Publicado'
FROM livros
ORDER BY ano_publicacao;

/* Trazer todos os dados. */
SELECT * FROM livros;

/* Trazer o nome do livro e o nome da editora */
SELECT nome_livro AS 'Livro', nome_editora AS 'Editora' FROM livros;

/* Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino. */
SELECT nome_livro AS 'Livro', uf_editora AS 'Editora'
FROM livros
WHERE sexo_autor = 'M';

/* Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino. */
SELECT nome_livro AS 'Livro', numero_paginas AS 'Paginas'
FROM livros
WHERE sexo_autor = 'F';

/* Trazer os valores dos livros das editoras de São Paulo. */
SELECT nome_livro AS 'Livro', valor_livro AS 'Valor'
FROM livros
WHERE uf_editora = 'SP';

/* Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio). */
SELECT * FROM livros
WHERE sexo_autor = 'M' AND
uf_editora IN ('SP','RJ');

/* Também poderia ser feito da seguinte forma */
SELECT * FROM livros
WHERE sexo_autor = 'M'
AND (
uf_editora = 'SP' OR
uf_editora = 'RJ');
