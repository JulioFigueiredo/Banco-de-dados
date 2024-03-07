DROP TABLE produto;

DROP TABLE cliente CASCADE;

CREATE TABLE clients (
	idclient SERIAL PRIMARY KEY,
	cpf varchar(14),
	firstname text,
	lastname text,
	address text
);

CREATE TABLE products (
	idproduct SERIAL PRIMARY KEY,
	idclient int,
	CONSTRAINT fk_client FOREIGN KEY (idclient) REFERENCES clients (idclient),
	productname varchar(50),
	brand varchar(20),
	category varchar(20),
	discount numeric,
	price numeric
);

INSERT INTO clients (cpf,firstname,lastname,address) VALUES
('000.000.000-00','Rodrigo','Junior','Rua 00, 000, Bairro 0'),
('111.111.111-11','Joao','Silva','Rua 01, 100, Bairro 1'),
('222.222.222-22','Maria','Gomez','Rua 02, 200, Bairro 2'),
('333.333.333-33','José','Andrade','Rua 03, 300, Bairro 3'),
('444.444.444-44','Bruno','Silveira','Rua 04, 400, Bairro 4'),
('555.555.555-55','Ana','Cabral','Rua 05, 500, Bairro 5'),
('666.666.666-66','Lucia','Silva','Rua 06, 600, Bairro 6'),
('777.777.777-77','Antonio','Mange','Rua 07, 700, Bairro 7'),
('888.888.888-88','Nicolas','Silva','Rua 08, 800, Bairro 8'),
('999.999.999-99','Sandra','Fourlan','Rua 09, 900, Bairro 9');

INSERT INTO products (idclient,productname,brand,category,discount,price) VALUES
(2,'Headset','jbl','eletronicos',0.1,195.89),
(1,'notebook','dell','eletronicos',0.12,3500.00),
(10,'cadeira gammer','dragon','imobiliario',0.0,1630.9),
(2,'mesa para computador','dragon','imobiliario',0.0,695.89),
(1,'mouse','dell','eletronicos',0.12,124.79),
(3,'prateleira',null,'imobiliario',0.0,80.9),
(5,'postit','faber castel','papelaria',0.02,5.29),
(8,'lapiseira','pentel','papelaria',0.02,18.9);

-- Comandos DQL --

-- Visualizando a tabela de clientes
SELECT * FROM clients

-- Selecionando colunas específicas
SELECT idclient, firstname, lastname FROM clients

-- Visualizando a tabela produtos
SELECT * FROM products

-- Visualizando nome do produto, preço e desconto
SELECT productname, price, discount, price*discount AS "desconto em reais" FROM products

-- Desafio: exibir o nome do produto, preço e preço com desconto
SELECT productname, price, discount, price - price*discount AS "desconto em reais" FROM products


-- Exibe as marcas sem repetir
SELECT DISTINCT brand FROM products

-- Calculadora
SELECT 3*4

-- funções (gera numero aleatorio)
SELECT random()

-- SELECT com clausula WHERE

-- operadores de comparacao >, <, >=; <=, =, <> ou !=

-- Exibir produtos com valor acima de 100 reais
SELECT productname, price FROM products
WHERE price>= 100

-- Operadores lógicos: AND, OR e NOT

-- produtos entre 100 e 800 reais
SELECT productname, price FROM products
WHERE price >= 100 AND price <= 800

-- alternativa
SELECT productname, price FROM products
WHERE price BETWEEN 100 AND 800

-- Produtos cujo preço esteja abaixo de 100 e acima de 800
SELECT productname, price FROM products
WHERE price <=100 OR price >= 800 -- where refere-se as linhas

-- DESAFIO: listar todos os produtos da marca Dell
SELECT productname, brand FROM products
WHERE brand = 'dell'

-- DESAFIO: listar todos os produtos comprados por João
SELECT productname, idclient FROM products
WHERE idclient = 2

-- DESAFIO: listar todos os clientes com id par
SELECT firstname, lastname, idclient FROM clients
WHERE idclient % 2= 0

-- COUNT 
-- quantos produtos foram vendidos no total | ideal utilizar PK
SELECT COUNT (idproduct) FROM products

-- Função avg (media)
-- Qual o preço médio dos produtos vendidos
SELECT AVG (price) FROM products

-- Função max (máximo)
-- preço mais alto negociado
SELECT MAX (price) FROM products

-- Função min (minimo)
SELECT MIN (price) FROM products

-- Função sum (soma)
SELECT SUM (price) FROM products

-- ORDER BY / DESC
SELECT * FROM clients
ORDER BY firstname 
ORDER BY lastname DESC

-- EXERCÍCIOS
-- 1. 
SELECT productname, brand FROM products
WHERE brand = 'dell'
-- 2.
SELECT productname, idclient FROM products
WHERE idclient = 2
-- 3.
(SELECT AVG (price) FROM products
WHERE brand = 'dell')
-- 4.
SELECT productname, price FROM products WHERE price = (
SELECT MAX (price) FROM products)
-- 5.
SELECT productname, price FROM products WHERE price = (
SELECT MIN (price) FROM products)
-- 6. 
SELECT SUM (price) FROM products
WHERE brand = 'dell'
-- 7.
SELECT SUM (price) FROM products
WHERE idclient = 1
-- 8.
SELECT productname, price FROM products
WHERE category = 'eletronicos'
ORDER BY (price)
-- 9.
SELECT idclient, productname, price FROM products
WHERE idclient = 1
ORDER BY (price) DESC
