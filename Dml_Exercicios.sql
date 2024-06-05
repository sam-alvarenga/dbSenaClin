/* Exercicios - Dml*/

/*Exercicio 1.Adicionar à tabela Paciente um novo atributo, chamado Cidade; */
ALTER TABLE paciente ADD COLUMN cidade VARCHAR(50) NOT NULL;

SELECT * FROM paciente


/*Exercicio 2. Inserir 6 pacientes de forma implícita, sendo 3 de Santos, 1 de Guarujá e 2 de São Vicente;*/
INSERT INTO paciente(nome, cpf, tipoLogradouro, nomeLogradouro, numero, complemento, telefone, cidade)
VALUES ('Samantha Alvarenga', '32165498701', 'Rua', 'Nove de Julho', '80', 'Apt 15', '13994833943', 'Santos'),
		('Pedro Alves', '24356776805','Avenida', 'Puglisi', '530', 'Casa 2', '1335465457', 'Guarujá'),
		('Carla Nunes', '65796743202', 'Rua', 'Frei Gaspar','678', 'Apt 45', '13998219090', 'São Vicente'),
		('Allef Costa', '67957631203', 'Rua', 'Alfredo Albertini', '13', 'Casa', '13993289670', 'Santos'),
		('Fabiana Freitas', '68909857904', 'Avenida', 'Conseleiro Nébias', '1720', 'Apt 102', '13998424893', 'Santos'),
		('Luciano Melo', '76584928306', 'Avenida', 'Presidente Wilson', '45', 'Apt 303', '1334209826','São Vicente');

SELECT * FROM paciente

/* Exercicio 3.Inserir 4 dentistas de forma explícita, sendo 1 de cada especialidade;*/

INSERT INTO Dentista(nomeDentista, CRO, especialidade, telefone, celular) 
VALUES('Magda Rodrigues', 'SP897823', 'Ortodontia', '1334573234', '13999877859');
INSERT INTO Dentista(nomeDentista, CRO, especialidade, telefone, celular) 
VALUES('Paulo Herinque', 'SP906714', 'Geral', '1335675648','13991324568');
INSERT INTO Dentista(nomeDentista, CRO, especialidade, telefone, celular)
VALUES('Fernanda Álvares', 'SP567609', 'Periodontia', '1332780908', '13994614518');
INSERT INTO Dentista(nomeDentista, CRO, especialidade, telefone, celular) 
VALUES('Bruna Izzo', 'SP873278', 'Implantodontia', '1336647832', '13995420278');

SELECT * FROM dentista

/*Exercicio 4. Inserir 3 consultas, sendo 1 para o dentista que cuida de Ortodontia e 2 para o dentista cuja especialidade é Geral. O tipo de todas elas será Avaliação.*/

INSERT INTO consulta (dataConsulta, horaConsulta,tipoConsulta, idPaciente, idDentista)
VALUES ('2024-05-23', '15:35:12', 'Avaliacao', 4, 1),
		 ('2024-03-15', '10:00:00', 'Avaliacao', 1, 2),
	    ('2024-09-08', '17:43:24', 'Avaliacao', 5, 2);

select * from consulta 

/*Exercicio 5. Atualizar todos os dados, exceto nome e cro, do dentista que cuida de implantodontia, mudando sua especialidade para Geral; */

UPDATE dentista SET telefone = '1337895234', celular = '13994370034', especialidade = 'geral' WHERE idDentista = 4;
	
SELECT * FROM dentista

/*Exercicio 6. Atualizar a data e hora de uma consulta marcada com um dentista cuja especialidade é Geral*/
UPDATE consulta SET dataConsulta = '2024-08-10', horaConsulta = '16:50:00' WHERE idPaciente = 5;


/* Exercicio 7. Atualizar a consulta do dentista de especialidade ortodontia, mudando o tipo de consulta para Tratamento e inserindo uma observação do dentista com o seguinte texto: “Tratamento será realizado em 10 consultas. Prioridade: Moderada. Remédio aplicado: Ponstan, caso sinta dores” */

UPDATE consulta SET observacao = 'Tratamento será realizado em 10 consultas. Prioridade: Moderada. Remédio aplicado: Ponstan, caso sinta dores', consulta.tipoConsulta = 'tratamento' WHERE idDentista = 1;

/*Exercicio 8. Selecionar nome e telefone de todo os pacientes que residem em Santos, em ordem alfabética*/

SELECT paciente.nome, paciente.telefone, paciente.cidade  from paciente
WHERE paciente.cidade='Santos'
ORDER BY paciente.nome;

		

		

