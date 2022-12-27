CREATE DATABASE escola;

CREATE TABLE uf(
    iduf SERIAL PRIMARY KEY,
    uf CHAR(2) UNIQUE NOT NULL,
    estado VARCHAR(20)
);

INSERT INTO uf
(uf,estado)
VALUES
('AC','Acre'),
('AP','Amapá'),
('AM','Amazonas'),
('BA','Bahia'),
('CE','Ceará'),
('DF','Distrito Federal'),
('ES','Espírito Santo'),
('GO','Goiás'),
('MA','Maranhão'),
('MT','Mato Grosso'),
('SP','São Paulo');

/*
Usar apenas em alguns casos de erros seguidos
TRUNCATE table uf; 
*/

SELECT * FROM uf;

CREATE TABLE aluno(
    idaluno INT PRIMARY KEY,
)

