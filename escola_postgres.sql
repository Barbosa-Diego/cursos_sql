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
('MS','Mato Grosso do Sul'),
('MG','Minas Gerais'),
('PA','Pará'),
('PB','Paraíba'),
('PR','Paraná'),
('PE','Pernambuco'),
('PI','Piauí'),
('RJ','Rio de Janeiro'),
('RN','Rio Grande do Norte'),
('RS','Rio Grande do Sul'),
('RO','Rondônia'),
('RR','Roraima'),
('SC','Santa Catarina'),
('SP','São Paulo'),
('SE','Sergipe'),
('TO','Tocantins');

/*
Usar apenas em alguns casos de erros seguidos
TRUNCATE table uf; 
*/

SELECT * FROM uf;

CREATE TABLE aluno(
    idaluno INT PRIMARY KEY,
)

