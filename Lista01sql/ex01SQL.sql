CREATE TABLE livros (
	isbn SERIAL PRIMARY KEY,
	titulo varchar(60),
	editora varchar(50),
	ano DATE
)


INSERT INTO livros (titulo, editora, ano) 
VALUES
    ('Dom Quixote', 'Companhia das Letras', '1605-01-01'),
    ('Crime e Castigo', 'Editora 34', '1866-01-01'),
    ('1984', 'Companhia das Letras', '1949-01-01'),
    ('O Pequeno Príncipe', 'Agir', '1943-01-01'),
    ('Orgulho e Preconceito', 'Martin Claret', '1813-01-01'),
    ('Memórias Póstumas de Brás Cubas', 'Companhia das Letras', '1881-01-01'),
    ('A Arte da Guerra', 'Cultrix', '500-01-01'),
    ('O Hobbit', 'WMF Martins Fontes', '1937-01-01'),
    ('O Senhor dos Anéis: A Sociedade do Anel', 'Martins Fontes', '1954-01-01'),
    ('Harry Potter e a Pedra Filosofal', 'Rocco', '1997-01-01');

SELECT * FROM LIVROS

CREATE TABLE autores (
	id_autor SERIAL PRIMARY KEY,
	nome_autor varchar(100)
)

INSERT INTO autores (nome_autor) 
VALUES
    ('Machado de Assis'),
    ('Fyodor Dostoevsky'),
    ('George Orwell'),
    ('Antoine de Saint-Exupéry'),
    ('Jane Austen'),
    ('Lima Barreto'),
    ('Sun Tzu'),
    ('J.R.R. Tolkien'),
    ('J.K. Rowling'),
    ('William Shakespeare');

SELECT * FROM autores

CREATE TABLE livros_autores (
	isbn SERIAL,
	FOREIGN KEY (isbn) REFERENCES livros (isbn),
	id_autor SERIAL,
	FOREIGN KEY (id_autor) REFERENCES autores (id_autor)
)



SELECT * FROM livros_autores

-- 1a: Listar todos os livros e seus autores

SELECT titulo, nome_autor FROM livros INNER JOIN autores
ON livros.isbn = autores.id_autor

--1b: encontrar todos os livros de um autor específico

SELECT nome_autor, titulo FROM autores INNER JOIN livros
ON autores.id_autor = livros.isbn
WHERE nome_autor = 'Sun Tzu' OR nome_autor = 'sun tzu'

-- 1c: Encontrar todos os autores que escreveram um livro específico

SELECT titulo, nome_autor FROM livros INNER JOIN autores
ON livros.isbn = autores.id_autor
WHERE titulo = '1984'
