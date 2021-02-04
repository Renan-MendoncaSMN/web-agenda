CREATE TABLE Agendamento (
	IdAgendamento INT IDENTITY (1, 1) PRIMARY KEY,
	Assunto VARCHAR(200) NOT NULL,
	Descricao VARCHAR (300) NOT NULL,
	DataAgendamento DATE  NOT NULL,
	DataCadastro DATETIME,
	DataAlteracao DATETIME,
	EmailNotificacao BIT,
	UrlRedirecionamento VARCHAR (200),
	IdUsuario INT NOT NULL
	FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario),
	IdStatus TINYINT NOT NULL
	FOREIGN KEY (IdStatus) REFERENCES StatusTarefa (IdStatus)
);

CREATE TABLE StatusTarefa (
	IdStatus TINYINT PRIMARY KEY NOT NULL,
	Descricao VARCHAR (30) NOT NULL
);

CREATE TABLE Usuario (
	IdUsuario INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Senha VARCHAR(50) NOT NULL
);
