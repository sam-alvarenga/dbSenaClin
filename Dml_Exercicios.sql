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

/* Exercicio 9. Selecionar o nome dos dentistas, a datas da consulta, o nome do paciente e seu telefone, APENAS dos dentistas que possuem consultas*/

SELECT nomeDentista, dataConsulta, paciente.nome, paciente.telefone FROM consulta
INNER JOIN Dentista 
ON dentista.idDentista = consulta.idDentista
INNER JOIN Paciente
ON paciente.idPaciente = consulta.idPaciente WHERE consulta.idDentista > 0; 

/*Exercicio 10. Selecionar o nome do dentista, a data da consulta e o tipo da consulta, MESMO quando os dentistas não possuam consultas*/

SELECT dentista.nomeDentista, consulta.dataConsulta, consulta.tipoConsulta
FROM dentista
LEFT JOIN consulta
ON consulta.idConsulta = dentista.idDentista WHERE dentista.idDentista > 0;
		
/*Exercicio 11. Criar uma query que exiba a quantidade de dentistas que a clínica possui, agrupando-os por especialidade, ordenando pelo nome da especialidade de A-Z. Para isto, você utilizará o comando group by do SQL.*/
		
SELECT dentista.especialidade, COUNT(dentista.nomeDentista) AS 'qtd Dentistas' FROM dentista 
GROUP BY dentista.especialidade
ORDER BY dentista.especialidade;

/*Exercicio 12. Criar uma query que mostre a quantidade de consultas que a clínica possui em determinado período do ano. Escolher um mês que retorne ao menos uma consulta, e incluir o mês como filtro.*/

SELECT COUNT(consulta.idConsulta) AS 'Consultas Maio' FROM consulta
WHERE consulta.dataConsulta >= '2024-05-01'
AND consulta.dataConsulta <='2024-05-31';

/*13.	Criar uma query que traga todos os tipos de consulta, agrupadas pela quantidade.*/
 
SELECT COUNT(consulta.tipoConsulta) AS 'Consultas', consulta.tipoConsulta FROM consulta
GROUP BY consulta.tipoConsulta
ORDER BY COUNT(consulta.idConsulta);

/*14.	Criar uma query que traga o número de pacientes que a clínica possui.*/
 
SELECT COUNT(paciente.idPaciente) AS 'Pacientes Cadastrados' FROM paciente;

/*15.	Criar uma query que traga todas as consultas da especialidade implantodontia. 
Deve vir na query o nome do dentista, o cro, a data da consulta e o nome do paciente, 
ordenados da data mais atual para a mais antiga.*/
 
SELECT dentista.nomeDentista, dentista.cro, consulta.dataConsulta, paciente.nome  FROM consulta
INNER JOIN dentista 
ON consulta.idDentista = dentista.idDentista 
INNER JOIN paciente 
ON paciente.idPaciente = consulta.idPaciente
WHERE dentista.especialidade = 'implantodontia'
ORDER BY consulta.dataConsulta DESC;
 
/*Exercicio 16. Crie uma procedure similar ao exercício 15, porém a especialidade deve ser passada como parâmetro. 
Execute a procedure para testar.*/


CREATE PROCEDURE ps_Consultas_Especialidade
(IN especialidadeDesejada VARCHAR(100))
SELECT dentista.nomeDentista, cro, dataConsulta, paciente.nome FROM consulta 
INNER JOIN dentista 
ON consulta.idDentista = dentista.idDentista
INNER JOIN paciente 
ON consulta.idPaciente = paciente.idPaciente
WHERE dentista.especialidade = especialidadeDesejada 
ORDER BY dataConsulta DESC;

CALL ps_Consultas_Especialidade('Geral')

/*17.	Crie uma view similar ao exercício 13. Execute a view para testar.*/

CREATE VIEW vw_consultas AS 
SELECT COUNT(consulta.tipoConsulta) AS 'Consultas', consulta.tipoConsulta FROM consulta
GROUP BY consulta.tipoConsulta 
ORDER BY COUNT(consulta.idConsulta);

SELECT * FROM vw_consultas;

/*Desafio - Criar uma query que traga quantas consultas cada um dos dentistas realizou ao longo de todo o período, 
 ordenando as do que atendeu mais pacientes para o que atendeu menos. */
 
SELECT COUNT(idConsulta) AS 'Consultas realizadas', dentista.nomeDentista AS 'Dentista' FROM consulta 
RIGHT JOIN dentista 
ON consulta.idDentista = dentista.idDentista 
GROUP BY dentista.idDentista 
ORDER BY COUNT(idConsulta) DESC;



