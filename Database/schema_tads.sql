-- Microsserviço Acadêmico do Portal TADS

CREATE TABLE cursos (
	id 						BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nome					VARCHAR(100) NOT NULL,
	sigla					VARCHAR(10) NOT NULL UNIQUE,
	grau					VARCHAR(50) NOT NULL,
	duracao					VARCHAR(50) NOT NULL,
	turno					VARCHAR(50) NOT NULL,
	modalidade				VARCHAR(50) NOT NULL,
	quantidade_obrigatorias	INTEGER NOT NULL,
	quantidade_optativas	INTEGER NOT NULL,
	carga_horaria_total		INTEGER NOT NULL,
	descricao				VARCHAR(500) NOT NULL,
	criado_em				TIMESTAMP NOT NULL DEFAULT now(),
	atualizado_em			TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE disciplinas (
	id 						BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	curso_id				BIGINT NOT NULL REFERENCES cursos(id),
	codigo					VARCHAR(10) NOT NULL,
	nome					VARCHAR(100) NOT NULL,
	carga_horaria			INTEGER NOT NULL,
	descricao				VARCHAR(500),
	semestre				VARCHAR(20) NOT NULL,
	obrigatoria				BOOLEAN NOT NULL,
	criado_em				TIMESTAMP NOT NULL DEFAULT now(),
	atualizado_em			TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE professores (
	id 					BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nome				VARCHAR(100) NOT NULL,
	matricula 			VARCHAR(50) NOT NULL,
	titulacao			VARCHAR(20) NOT NULL,
	descricao			VARCHAR(500),
	inicio_docencia		DATE,
	criado_em			TIMESTAMP NOT NULL DEFAULT now(),
	atualizado_em		TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE professores_disciplinas_interesse (
	professor_id		BIGINT NOT NULL REFERENCES professores(id),
	disciplina_id		BIGINT NOT NULL REFERENCES disciplinas(id),
	PRIMARY KEY (professor_id, disciplina_id)
);