-- PASSO A PASSO

-- Observação inicial: Necessário ter conhecimento prévio em banco de dados SQL

-- PASSO 1 - Criar o banco de dados da academia
CREATE DATABASE academia;

-- PASSO 2 - Selecionar o banco de dados da academia para criação e estruturação das tabelas e colunas
USE academia;

-- 3 - Criar as tabelas, colunas e suas propriedades
CREATE TABLE instrutores (
		id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        primeiro_nome VARCHAR(70),
        sobrenome VARCHAR(70),
        telefone_do_instrutor VARCHAR(15),
        email_do_instrutor VARCHAR(100),
        periodo_de_trabalho DATE,
        salario DECIMAL (7, 2)
);  

CREATE TABLE matriculas (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    data_da_matricula DATE,
    primeiro_nome_aluno VARCHAR(70),
    sobrenome_aluno VARCHAR(70),
    matricula_ativa BOOLEAN,
    combo_id INT,
    modalidade_id INT,
    plano_id INT,
    status_de_pagamento VARCHAR(50),
    proximo_vencimento DATE
);

CREATE TABLE alunos (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    primeiro_nome VARCHAR(70),
	sobrenome VARCHAR(70),
    telefone_do_aluno VARCHAR(15),
    email_do_aluno VARCHAR(50),
    endereco_do_aluno VARCHAR(200),
    plano_id INT,
    matricula_aluno_id INT,
    frequencia_aluno_id INT    
);

CREATE TABLE historicos_presenca (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    aluno_id INT,
    qual_data DATE,
    presenca BOOLEAN
);

CREATE TABLE modalidades (
		id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        nome_da_modalidade VARCHAR(100),
        periodo_das_aulas VARCHAR(100),
        instrutor_id INT,
        plano_id INT
); 

CREATE TABLE combos (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    numero_de_modalidades INT,
    modalidade_id INT
);

CREATE TABLE planos (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_do_plano VARCHAR(255),
    combo_id INT,
    modalidade_id INT,
    valor_do_plano DECIMAL (6, 2)
); 

CREATE TABLE proprietario (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    primeiro_nome VARCHAR(70),
    sobrenome VARCHAR(70),
    plano_id INT,
    combo_id INT,
    modalidade_id INT,
    instrutor_id INT,
    aluno_id INT,
    matricula_aluno_id INT,
    frequencia_aluno_id INT
);

-- PASSO 3 - Referenciar todas as colunas necessarias nas tabelas
ALTER TABLE matriculas
ADD FOREIGN KEY (combo_id) REFERENCES combos(id),
ADD FOREIGN KEY (modalidade_id) REFERENCES modalidades(id),
ADD FOREIGN KEY (plano_id) REFERENCES planos(id);

ALTER TABLE alunos
ADD FOREIGN KEY (plano_id) REFERENCES planos(id),
ADD FOREIGN KEY (matricula_aluno_id) REFERENCES matriculas(id),
ADD FOREIGN KEY (frequencia_aluno_id) REFERENCES historicos_presenca(id);

ALTER TABLE historicos_presenca
ADD FOREIGN KEY (aluno_id) REFERENCES alunos(id);

ALTER TABLE modalidades
ADD FOREIGN KEY (instrutor_id) REFERENCES instrutores(id),
ADD FOREIGN KEY (plano_id) REFERENCES planos(id);

ALTER TABLE combos
ADD FOREIGN KEY (modalidade_id) REFERENCES modalidades(id);

ALTER TABLE planos
ADD FOREIGN KEY (combo_id) REFERENCES combos(id),
ADD FOREIGN KEY (modalidade_id) REFERENCES modalidades(id);

ALTER TABLE proprietario
ADD FOREIGN KEY (plano_id) REFERENCES planos(id),
ADD FOREIGN KEY (combo_id) REFERENCES combos(id),
ADD FOREIGN KEY (instrutor_id) REFERENCES instrutores(id),
ADD FOREIGN KEY (aluno_id) REFERENCES alunos(id),
ADD FOREIGN KEY (matricula_aluno_id) REFERENCES matriculas(id),
ADD FOREIGN KEY (frequencia_aluno_id) REFERENCES historicos_presenca(id),
ADD FOREIGN KEY (modalidade_id) REFERENCES modalidades(id);

-- PASSO 4 - Consultar as tabelas para verificar se foram criadas corretamente
-- Para consultar a tabela desejada, digite o nome da tabela após o FROM
/*
SELECT *
FROM proprietario;
*/

-- PASSO 5 - Adicione os dados desejados às colunas
/*
INSERT INTO nome_da_tabela (coluna1, coluna2, ...)
VALUES (valor1, valor2, ...);
*/

-- Seu banco de dados de academia está pronto!