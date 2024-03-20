CREATE TABLE livros (
	isbn varchar(15) PRIMARY KEY,
	titulo varchar(60),
	editora varchar(50),
	ano DATE
)

INSERT INTO livros (isbn, titulo, editora, ano) 
VALUES
    ('9788576082675', 'Dom Quixote', 'Companhia das Letras', '1605-01-01'),
    ('9788535902779', 'Crime e Castigo', 'Editora 34', '1866-01-01'),
    ('9788535910453', '1984', 'Companhia das Letras', '1949-01-01'),
    ('9788535908061', 'O Pequeno Príncipe', 'Agir', '1943-01-01'),
    ('9788535909556', 'Orgulho e Preconceito', 'Martin Claret', '1813-01-01'),
    ('9788535913904', 'Memórias Póstumas de Brás Cubas', 'Companhia das Letras', '1881-01-01'),
    ('9788577995779', 'A Arte da Guerra', 'Cultrix', '500-01-01'),
    ('9788573264248', 'O Hobbit', 'WMF Martins Fontes', '1937-01-01'),
    ('9788537801854', 'O Senhor dos Anéis: A Sociedade do Anel', 'Martins Fontes', '1954-01-01'),
    ('9788537815929', 'Harry Potter e a Pedra Filosofal', 'Rocco', '1997-01-01');

SELECT * FROM LIVROS

CREATE TABLE autores (
	id_autor SERIAL PRIMARY KEY,
	nome_autor varchar(100)
)

INSERT INTO autores (nome_autor) 
VALUES
    ('Machado de Assis'),
    ('George Orwell'),
    ('Fyodor Dostoevsky'),
    ('Antoine de Saint-Exupéry'),
    ('Jane Austen'),
    ('Lima Barreto'),
    ('Sun Tzu'),
    ('J.R.R. Tolkien'),
    ('J.K. Rowling'),
    ('William Shakespeare');

SELECT * FROM autores

CREATE TABLE livros_autores (
	isbn varchar(15),
	FOREIGN KEY (isbn) REFERENCES livros (isbn),
	id_autor int,
	FOREIGN KEY (id_autor) REFERENCES autores (id_autor)
)

SELECT * FROM livros_autores
