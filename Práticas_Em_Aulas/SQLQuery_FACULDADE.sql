    CREATE DATABASE FACULDADE;
	GO
	USE Universidade;
	GO
	CREATE TABLE ALUNOS
	(
		MATRICULA INT NOT NULL IDENTITY
			CONSTRAINT PK_ALUNO PRIMARY KEY,
		NOME VARCHAR(50) NOT NULL
	);
	GO
	CREATE TABLE CURSOS
	(
		CURSO CHAR(3) NOT NULL
			CONSTRAINT PK_CURSO PRIMARY KEY,
		NOME VARCHAR(50) NOT NULL
	);
	GO
	CREATE TABLE PROFESSOR
	(
		PROFESSOR INT IDENTITY NOT NULL
			CONSTRAINT PK_PROFESSOR PRIMARY KEY,
		NOME VARCHAR(50) NOT NULL
	);
	GO
	CREATE TABLE MATERIAS
	(
		SIGLA CHAR(3) NOT NULL,
		NOME VARCHAR(50) NOT NULL,
		CARGAHORARIA INT NOT NULL,
		CURSO CHAR(3) NOT NULL,
		PROFESSOR INT
			CONSTRAINT PK_MATERIA
			PRIMARY KEY (
							SIGLA,
							CURSO,
							PROFESSOR
						)
			CONSTRAINT FK_CURSO
			FOREIGN KEY (CURSO) REFERENCES CURSOS (CURSO),
		CONSTRAINT FK_PROFESSOR
			FOREIGN KEY (PROFESSOR)
			REFERENCES PROFESSOR (PROFESSOR)
	);


	GO
	INSERT ALUNOS
	(
		NOME
	)
	VALUES
	('Pedro');

	INSERT ALUNOS
	(
		NOME
	)
	VALUES
	('Robertha');
	GO
	INSERT CURSOS
	(
		CURSO,
		NOME
	)
	VALUES
	('SIS', 'SISTEMAS'),
	('ENG', 'ENGENHARIA');
	GO
	INSERT PROFESSOR
	(
		NOME
	)
	VALUES
	('DORNEL'),
	('EDUARDO'),
    ('KARLA'),
    ('CHAIENE'),
    ('LEANDERSON'),
    ('ROMÃO');
	GO
--EVITANDO A DUPLICIDADE DE INSERT	
IF NOT EXISTS(SELECT 1 FROM MATERIAS WHERE SIGLA = 'BDA' AND CURSO = 'ENG' AND PROFESSOR = 1)
BEGIN 
	INSERT INTO MATERIAS
	(
	SIGLA,
	NOME,
	CARGAHORARIA,
	CURSO,
	PROFESSOR
	)
	VALUES ('BDA', 'BANCO DE DADOS', 144, 'ENG', 1)
END 

IF NOT EXISTS(SELECT 1 FROM MATERIAS WHERE SIGLA = 'ARC' AND CURSO = 'ENG' AND PROFESSOR = 2)
BEGIN 
	INSERT INTO MATERIAS
	(
	SIGLA,
	NOME,
	CARGAHORARIA,
	CURSO,
	PROFESSOR
	)
	VALUES ('ARC', 'ARQUITETURA DE COMPUTADORES', 144, 'ENG', 2)
END 
		
IF NOT EXISTS(SELECT 1 FROM MATERIAS WHERE SIGLA = 'EIXO' AND CURSO = 'ENG' AND PROFESSOR = 3)
BEGIN 
	INSERT INTO MATERIAS
	(
	SIGLA,
	NOME,
	CARGAHORARIA,
	CURSO,
	PROFESSOR
	)
	VALUES ('EXO', 'EIXO iINSTITUCIONAL', 144, 'ENG', 3)
END 	
	
IF NOT EXISTS(SELECT 1 FROM MATERIAS WHERE SIGLA = 'ERPS' AND CURSO = 'ENG' AND PROFESSOR = 4)
BEGIN 
	INSERT INTO MATERIAS
	(
	SIGLA,
	NOME,
	CARGAHORARIA,
	CURSO,
	PROFESSOR
	)
	VALUES ('ER', 'ENGENHARIA DE REQUISITOS DE SOFTWARE', 144, 'ENG', 4)
END 

IF NOT EXISTS(SELECT 1 FROM MATERIAS WHERE SIGLA = 'POO' AND CURSO = 'ENG' AND PROFESSOR = 5)
BEGIN 
	INSERT INTO MATERIAS
	(
	SIGLA,
	NOME,
	CARGAHORARIA,
	CURSO,
	PROFESSOR
	)
	VALUES ('POO', 'PROGRAMAÇÃO ORIENTADA A OBJETO', 144, 'ENG', 5)
END 

IF NOT EXISTS(SELECT 1 FROM MATERIAS WHERE SIGLA = 'VEI' AND CURSO = 'ENG' AND PROFESSOR = 5)
BEGIN 
	INSERT INTO MATERIAS
	(
	SIGLA,
	NOME,
	CARGAHORARIA,
	CURSO,
	PROFESSOR
	)
	VALUES ('VEI', 'VIVÊNCIA DE EXTENSÃO', 144, 'ENG', 6)
END 
	GO
	CREATE TABLE MATRICULA
	(
		MATRICULA INT,
		CURSO CHAR(3),
		MATERIA CHAR(3),
		PROFESSOR INT,
		PERLETIVO INT,
		N1 FLOAT,
		N2 FLOAT,
		N3 FLOAT,
		N4 FLOAT,
		TOTALPONTOS FLOAT,
		MEDIA FLOAT,
		F1 INT,
		F2 INT,
		F3 INT,
		F4 INT,
		TOTALFALTAS INT,
		PERCFREQ FLOAT,
		RESULTADO VARCHAR(20)
			CONSTRAINT PK_MATRICULA
			PRIMARY KEY (
							MATRICULA,
							CURSO,
							MATERIA,
							PROFESSOR,
							PERLETIVO
						),
		CONSTRAINT FK_ALUNOS_MATRICULA
			FOREIGN KEY (MATRICULA)
			REFERENCES ALUNOS (MATRICULA),
		CONSTRAINT FK_CURSOS_MATRICULA
			FOREIGN KEY (CURSO)
			REFERENCES CURSOS (CURSO),
		--CONSTRAINT FK_MATERIAS FOREIGN KEY (MATERIA) REFERENCES MATERIAS (SIGLA),
		CONSTRAINT FK_PROFESSOR_MATRICULA
			FOREIGN KEY (PROFESSOR)
			REFERENCES PROFESSOR (PROFESSOR)
	);
	GO
	ALTER TABLE MATRICULA ADD MEDIAFINAL FLOAT;
	GO
	ALTER TABLE MATRICULA ADD NOTAEXAME FLOAT;
	GO

	--MOD_1
	ALTER TABLE MATRICULA
	ADD  CONSTRAINT FK_MATERIAS
	FOREIGN KEY (MATERIA, CURSO, PROFESSOR)
	REFERENCES MATERIAS (SIGLA, CURSO, PROFESSOR);
	

--identity para automatizar

SELECT * FROM ALUNOS