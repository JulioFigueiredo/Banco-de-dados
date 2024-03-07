-- Criando a tabela de clientes
CREATE TABLE cliente (
	id_client int primary key, 
	cpf varchar(14) unique,
	first_name text not null,
	last_name text,
	address text
	
);

-- Criando uma tabela extra apenas para deleta-la
CREATE TABLE clienteB (
	id_client int primary key, 
	cpf varchar(14) unique,
	first_name text not null,
	last_name text,
	address text
	
);

DROP TABLE clienteB;


-- Criando a tabela de clientes
CREATE TABLE produto (
	id_product int primary key, 
	product_name text,
	branch text,
	category text,
);

-- Fazer alterações na tabela
ALTER TABLE produto RENAME COLUMN branch TO brand

-- alterando um tipo de dado
ALTER TABLE produto ALTER COLUMN brand TYPE varchar(20);
ALTER TABLE produto ALTER COLUMN category TYPE varchar(20);

-- adicionando coluna
ALTER TABLE produto ADD COLUMN aaaa text

-- apagando coluna
ALTER TABLE produto DROP COLUMN aaaa

-- adicionando foreign key
ALTER TABLE produto ADD COLUMN id_client int;

ALTER TABLE produto ADD FOREIGN KEY (id_client) REFERENCES cliente;

-- adicionando restrições
ALTER TABLE produto ALTER COLUMN product_name
SET NOT NULL

-- comandos DML data manipulation language

-- inserindo dados na tabela
INSERT INTO cliente VALUES(
	1,
	'111.222.333-44',
	'Jubileu',
	'Catatau',
	'Praça Roberto Mange, 30'
)

INSERT INTO cliente VALUES(
	3,
	'111.222.333-46',
	'Cain', '',
	'Praça Roberto Mange, 30'
)

INSERT INTO cliente VALUES(
	4,
	'111.222.333-47',
	'Cain', '',
	'Praça Roberto Mange, 30'
)

INSERT INTO cliente VALUES(
	5,
	'111.222.333-49',
	'Cain', '',
	'Praça Roberto Mange, 30'
)

-- Atualizando valores
UPDATE cliente SET address=' rua 1'
WHERE id_client= 1

-- DQL (Data Query Language)
-- (* significa selecionar todas as tabelas)
SELECT * FROM produto
SELECT * FROM cliente

INSERT INTO produto VALUES(
	7,
	'chuteira',
	'joma',
	'calçado',
	300,
	2
)

INSERT INTO produto VALUES(
	8,
	'chuteira',
	'nike',
	'calçado',
	200,
	3
)

INSERT INTO produto VALUES(
	9,
	'chuteira',
	'adidas',
	'calçado',
	220,
	1
)

INSERT INTO produto VALUES(
	10,
	'chuteira',
	'umbro',
	'calçado',
	320,
	4
)

INSERT INTO produto VALUES(
	11,
	'chuteira',
	'penalty',
	'calçado',
	220,
	5
)
-- desconto de 10 reais para produtos acima de 50 reais
UPDATE produto SET price = price-10
WHERE price>50

