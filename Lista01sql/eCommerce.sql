--****************************--
--         Preparação         --
--****************************--

-- Adicionar produtos que não foram comprados
INSERT INTO products (productname,brand,category,discount,price) VALUES
('impressora','hp','eletronicos',0.12,489.9),
('luminaria','ge','eletronicos',0.5,46.80),
('drone','dji','eletronico',0.12,9856.0)

SELECT * FROM PRODUCTS
SELECT * FROM CLIENTS

-- cross join
SELECT * FROM clients, products
SELECT * FROM products, clients
SELECT * FROM clients CROSS JOIN products

-- Inner join (relaciona por PK/FK)
SELECT firstname,productname FROM clients INNER JOIN products 
ON clients.idclient = products.idclient 
WHERE firstname = 'Rodrigo' OR firstname = 'rodrigo'


SELECT * FROM clients INNER JOIN products USING (id_client)

SELECT * FROM clients NATURAL INNER JOIN products -- natural entende que é pk

SELECT clients.firstname, products.productname FROM clients INNER JOIN products
USING (idclient)

-- SELECT clients.firstname, products.productname FROM clients NATURAL INNER JOIN products

-- LEFT JOIN preenche mesmo os que nao compraram nada
SELECT clients.firstname, products.productname FROM clients LEFT JOIN products
USING (idclient)

-- RIGHT JOIN
SELECT clients.firstname, products.productname FROM clients RIGHT JOIN products
USING (idclient)

-- FULL JOIN
SELECT clients.firstname, products.productname FROM clients FULL JOIN products
USING (idclient)


-- 1.
SELECT firstname,productname FROM clients INNER JOIN products 
ON clients.idclient = products.idclient 
WHERE category = 'eletronicos'

-- 2.
SELECT firstname,productname FROM clients FULL JOIN products -- clients.firstname
ON clients.idclient = products.idclient 
WHERE productname IS NULL

-- 3.
SELECT firstname,productname FROM clients FULL JOIN products 
ON clients.idclient = products.idclient 
WHERE firstname IS NULL

-- 4.
SELECT firstname,productname FROM clients INNER JOIN products 
ON clients.idclient = products.idclient 
WHERE firstname = 'Rodrigo' OR firstname = 'rodrigo'

-- 5. 
SELECT firstname,productname FROM clients INNER JOIN products 
ON clients.idclient = products.idclient 
WHERE brand = 'dell' OR firstname = 'DELL'