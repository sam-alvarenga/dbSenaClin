/*Criação de tabelas - DDL*/
CREATE database db_senaClin;

USE db_senaClin;

CREATE TABLE Paciente( 
idPaciente INT AUTO_INCREMENT NOT NULL, 
nome VARCHAR(45) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
tipoLogradouro VARCHAR(15) NOT NULL,
nomeLogradouro VARCHAR(50) NOT NULL, 
numero VARCHAR(4) NOT NULL,
complemento VARCHAR (10) NOT NULL,
telefone VARCHAR(11) NOT NULL,
CONSTRAINT PRIMARY KEY (idPaciente)
);

SELECT * FROM paciente

CREATE TABLE Dentista(
idDentista INT AUTO_INCREMENT NOT NULL,
nomeDentista VARCHAR(50) NOT NULL,
CRO VARCHAR(8) NOT NULL UNIQUE,
especialidade VARCHAR(20) DEFAULT 'geral' NOT NULL,  
telefone VARCHAR(11) NOT NULL,
celular VARCHAR(11) NOT NULL,
CONSTRAINT PRIMARY KEY(idDentista),
CONSTRAINT chk_especialidade CHECK (especialidade = 'Ortodontia' OR especialidade = 'Periodontia' OR especialidade = 'Implantodontia' OR especialidade = 'Geral')
);

SELECT * FROM Dentista

CREATE TABLE Consulta(
idConsulta INT AUTO_INCREMENT NOT NULL, 
dataConsulta DATE NOT NULL,
horaConsulta TIME NOT NULL,
observacao TEXT NOT NULL,
idPaciente INT NOT NULL,
idDentista INT NOT NULL,
CONSTRAINT PRIMARY KEY(idConsulta),
CONSTRAINT fk_consulta_paciente FOREIGN KEY (idPaciente) REFERENCES paciente (idPaciente),
CONSTRAINT fk_consulta_dentista FOREIGN KEY (idDentista) REFERENCES dentista (idDentista)
);

SELECT * FROM consulta

ALTER TABLE consulta ADD COLUMN tipoConsulta VARCHAR(50) NOT NULL;
