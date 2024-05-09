-- COMANDOS DDL
CREATE TABLE alunos (
	cpf bigint PRIMARY KEY,
	nome_aluno varchar(80),
	idade int,
	rua varchar(80),
	numero int,
	bairro varchar(50),
	cidade varchar(40),
	estado varchar(40),
	cep int,
	país varchar(30)
);

CREATE TABLE telefones (
	cpf bigint,
	CONSTRAINT fk_cpf FOREIGN KEY (cpf) REFERENCES alunos (cpf),
	ddd int,
	numero varchar(15)
);

CREATE TABLE emails (
	cpf bigint,
	CONSTRAINT fk_cpf FOREIGN KEY (cpf) REFERENCES alunos (cpf),
	email varchar(20),
	dominio varchar(15)
);

CREATE TABLE departamentos (
	id_depto SERIAL PRIMARY KEY,
	sigla_depto varchar(5),
	nome_depto varchar(20)
);

CREATE TABLE cursos (
	id_curso SERIAL PRIMARY KEY,
	id_depto int,
	CONSTRAINT fk_id_depto FOREIGN KEY (id_depto) REFERENCES departamentos (id_depto),
	nome_curso varchar(30)
);

CREATE TABLE matriculas (
	ra int PRIMARY KEY,
	cpf bigint,
	CONSTRAINT fk_cpf FOREIGN KEY (cpf) REFERENCES alunos (cpf),
	status varchar(20),
	id_curso int,
	CONSTRAINT fk_id_curso FOREIGN KEY (id_curso) REFERENCES cursos (id_curso)
);

CREATE TABLE disciplinas (
	id_disciplina SERIAL PRIMARY KEY,
	nome_disciplina varchar(30),
	optativa boolean
);

CREATE TABLE curso_disciplina(
	id_curso int,
	CONSTRAINT fk_id_curso FOREIGN KEY (id_curso) REFERENCES cursos (id_curso),
	id_disciplina int,
	CONSTRAINT fk_id_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplinas (id_disciplina)
);

CREATE TABLE matricula_disciplina (
	id_disciplina int,
	CONSTRAINT fk_id_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplinas (id_disciplina),
	ra int,
	CONSTRAINT fk_ra FOREIGN KEY (ra) REFERENCES matriculas (ra)
);

--COMANDOS DML

INSERT INTO alunos (cpf, nome_aluno, idade, rua, numero, bairro, cidade, estado, cep, país) VALUES
(11122233344, 'João Silva', 25, 'Rua das Flores', 100, 'Centro', 'São Paulo', 'SP', 12345678, 'Brasil'),
(22233344455, 'Maria Souza', 30, 'Avenida dos Sonhos', 200, 'Vila Esperança', 'Rio de Janeiro', 'RJ', 87654321, 'Brasil'),
(33344455566, 'Pedro Santos', 28, 'Rua das Palmeiras', 50, 'Jardim América', 'Belo Horizonte', 'MG', 54321678, 'Brasil'),
(44455566677, 'Ana Oliveira', 22, 'Avenida das Águias', 300, 'Liberdade', 'Salvador', 'BA', 98765432, 'Brasil'),
(55566677788, 'Carlos Pereira', 35, 'Rua dos Girassóis', 150, 'Centro', 'Brasília', 'DF', 13579246, 'Brasil'),
(66677788899, 'Mariana Costa', 26, 'Avenida dos Pinheiros', 80, 'Campo Grande', 'Curitiba', 'PR', 24681357, 'Brasil'),
(77788899900, 'Lucas Rodrigues', 24, 'Rua das Acácias', 250, 'Vila Nova', 'Fortaleza', 'CE', 75395128, 'Brasil'),
(88899900011, 'Juliana Fernandes', 29, 'Avenida dos Lírios', 180, 'Jardim Botânico', 'Goiânia', 'GO', 36925814, 'Brasil'),
(99900011122, 'Rafaela Lima', 31, 'Rua das Violetas', 120, 'Centro', 'Recife', 'PE', 15948726, 'Brasil'),
(12345678900, 'Gabriel Almeida', 27, 'Rua das Orquídeas', 220, 'Jardim São Paulo', 'Porto Alegre', 'RS', 95175368, 'Brasil'),
(23456789011, 'Patrícia Santos', 23, 'Avenida das Tulipas', 70, 'Vila das Flores', 'Manaus', 'AM', 45612378, 'Brasil'),
(34567890122, 'Fernando Silva', 33, 'Rua das Magnólias', 190, 'Centro', 'Belém', 'PA', 78451236, 'Brasil'),
(45678901233, 'Aline Oliveira', 32, 'Avenida dos Cravos', 130, 'Jardim Primavera', 'Florianópolis', 'SC', 32147895, 'Brasil'),
(56789012344, 'Daniel Pereira', 20, 'Rua das Hortênsias', 40, 'Vila Verde', 'Vitória', 'ES', 98765412, 'Brasil'),
(67890123455, 'Carolina Costa', 34, 'Avenida das Rosas', 270, 'Jardim das Flores', 'Natal', 'RN', 65478912, 'Brasil');

-- Telefones
INSERT INTO telefones (cpf, ddd, numero) VALUES
(11122233344, 11, '123456789'),
(22233344455, 21, '987654321'),
(33344455566, 31, '456789012'),
(44455566677, 41, '654321987'),
(55566677788, 51, '789012345'),
(66677788899, 61, '210987654'),
(77788899900, 71, '543219876'),
(88899900011, 81, '876543210'),
(99900011122, 91, '321098765'),
(12345678900, 12, '234567890'),
(23456789011, 22, '543210987'),
(34567890122, 32, '678901234'),
(45678901233, 42, '890123456'),
(56789012344, 52, '109876543'),
(67890123455, 62, '543210987');

-- Emails
INSERT INTO emails (cpf, email, dominio) VALUES
(11122233344, 'joao.silva', 'email.com'),
(22233344455, 'maria.souza', 'email.com'),
(33344455566, 'pedro.santos', 'email.com'),
(44455566677, 'ana.oliveira', 'email.com'),
(55566677788, 'carlos.pereira', 'email.com'),
(66677788899, 'mariana.costa', 'email.com'),
(77788899900, 'lucas.rodrigues', 'email.com'),
(88899900011, 'juliana.fernandes', 'email.com'),
(99900011122, 'rafaela.lima', 'email.com'),
(12345678900, 'gabriel.almeida', 'email.com'),
(23456789011, 'patricia.santos', 'email.com'),
(34567890122, 'fernando.silva', 'email.com'),
(45678901233, 'aline.oliveira', 'email.com'),
(56789012344, 'daniel.pereira', 'email.com'),
(67890123455, 'carolina.costa', 'email.com');

INSERT INTO departamentos (sigla_depto, nome_depto) VALUES
('S', 'Saúde'),
('T', 'Tecnologia'),
('E', 'Engenharia'),
('H', 'Humanas');

INSERT INTO cursos (id_depto, nome_curso) VALUES
(1, 'Medicina'),
(1, 'Enfermagem'),
(2, 'Ciência da Computação'),
(2, 'Engenharia da Computação'),
(3, 'Engenharia Civil'),
(3, 'Engenharia Elétrica'),
(4, 'Letras'),
(4, 'História');

INSERT INTO matriculas (ra, cpf, status, id_curso) VALUES
(101, 11122233344, 'Ativa', 1),
(102, 22233344455, 'Ativa', 2),
(103, 33344455566, 'Ativa', 3),
(104, 44455566677, 'Trancada', 4),
(105, 55566677788, 'Ativa', 5),
(106, 66677788899, 'Ativa', 6),
(107, 77788899900, 'Ativa', 7),
(108, 88899900011, 'Trancada', 8),
(109, 99900011122, 'Ativa', 3),
(110, 12345678900, 'Ativa', 8),
(111, 23456789011, 'Ativa', 1),
(112, 34567890122, 'Trancada', 7),
(113, 45678901233, 'Ativa', 4),
(114, 56789012344, 'Ativa', 6),
(115, 67890123455, 'Ativa', 2);

UPDATE matriculas
SET status = 'Formado'
WHERE ra IN (102, 104, 107, 110, 115);

INSERT INTO disciplinas (nome_disciplina, optativa) VALUES
('Cálculo I', false),
('Literatura Brasileira I', false),
('Idade Antiga', false),
('Geopolítica', false),
('Genética', false),
('Inglês Instrumental', false),
('Educação Física Infantil', false),
('Pintura', false),
('Mecânica Quântica', false),
('Química Inorgânica', false),
('Ecossistemas', false),
('Ética', false),
('Sociologia Geral', false),
('Introdução à Programação', true),
('Conversação em Espanhol', true);

INSERT INTO curso_disciplina (id_curso, id_disciplina) VALUES
(1, 1),
(1, 13),
(2, 2),
(2, 14),
(3, 3),
(3, 15),
(4, 4),
(4, 12),
(5, 5),
(5, 9),
(6, 6),
(6, 10),
(7, 7),
(7, 11),
(8, 8),
(8, 13),
(5, 1),
(2, 2);

-- Povoando a tabela matricula_disciplina
INSERT INTO matricula_disciplina (id_disciplina, ra) VALUES
(1, 101),  -- Matrícula 101 associada à disciplina 1 (Cálculo I)
(2, 101),  -- Matrícula 101 associada à disciplina 2 (Literatura Brasileira I)
(1, 102),  -- Matrícula 102 associada à disciplina 1 (Cálculo I)
(3, 102),  -- Matrícula 102 associada à disciplina 3 (Idade Antiga)
(4, 103),  -- Matrícula 103 associada à disciplina 4 (Geopolítica)
(5, 103),  -- Matrícula 103 associada à disciplina 5 (Genética)
(5, 104),  -- Matrícula 104 associada à disciplina 5 (Genética)
(6, 105),  -- Matrícula 105 associada à disciplina 6 (Inglês Avançado)
(7, 106),  -- Matrícula 106 associada à disciplina 7 (Educação Física Infantil)
(8, 107),  -- Matrícula 107 associada à disciplina 8 (Pintura)
(8, 108),  -- Matrícula 108 associada à disciplina 8 (Pintura)
(9, 109),  -- Matrícula 109 associada à disciplina 9 (Mecânica Quântica)
(9, 110),  -- Matrícula 110 associada à disciplina 9 (Mecânica Quântica)
(10, 111), -- Matrícula 111 associada à disciplina 10 (Química Inorgânica)
(10, 112), -- Matrícula 112 associada à disciplina 10 (Química Inorgânica)
(11, 113), -- Matrícula 113 associada à disciplina 11 (Ecossistemas)
(11, 114), -- Matrícula 114 associada à disciplina 11 (Ecossistemas)
(12, 115), -- Matrícula 115 associada à disciplina 12 (Ética)
(13, 101), -- Matrícula 101 associada à disciplina 13 (Arte Contemporânea)
(14, 101), -- Matrícula 101 associada à disciplina 14 (Sociologia Geral)
(15, 102), -- Matrícula 102 associada à disciplina 13 (Arte Contemporânea)
(15, 103); -- Matrícula 102 associada à disciplina 14 (Sociologia Geral)


-- COMANDOS DQL

-- Dado o RA ou o Nome do Aluno, buscar no BD todos os demais dados do aluno.
SELECT * FROM alunos WHERE nome_aluno = 'Pedro Santos'

-- Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.
SELECT * FROM cursos WHERE id_depto = '3'

--Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.
SELECT * FROM curso_disciplina INNER JOIN disciplinas ON nome_disciplina= 'Ética'

-- Dado o CPF de um aluno, exibir quais disciplinas ele está cursando.
SELECT cpf, id_disciplina, nome_disciplina FROM alunos INNER JOIN disciplinas ON cpf = '22233344455'

-- Filtrar todos os alunos matriculados em um determinado curso
SELECT nome_aluno, cpf, nome_curso FROM alunos INNER JOIN cursos ON nome_curso = 'Medicina'

-- Filtrar todos os alunos matriculados em determinada disciplina
SELECT nome_aluno, cpf, nome_disciplina, id_disciplina FROM alunos INNER JOIN disciplinas ON nome_disciplina = 'Geopolítica'

-- Filtrar alunos formados.
SELECT * FROM matriculas
SELECT nome_aluno FROM alunos INNER JOIN matriculas ON status = 'Formado'

-- Filtrar alunos ativos
SELECT nome_aluno FROM alunos INNER JOIN matriculas ON status = 'Ativa'

-- Apresentar a quantidade de alunos ativos por curso.
SELECT c.nome_curso,
       (SELECT COUNT(*)
        FROM matriculas m
        WHERE m.id_curso = c.id_curso
          AND m.status = 'Ativa') AS quantidade_alunos_ativos
FROM cursos c;

-- Apresentar a quantidade de alunos ativos por disciplina.

SELECT d.nome_disciplina,
       (SELECT COUNT(*)
        FROM matricula_disciplina md
        JOIN matriculas m ON md.ra = m.ra
        WHERE md.id_disciplina = d.id_disciplina
          AND m.status = 'Ativa') AS quantidade_alunos_ativos
FROM disciplinas d;
