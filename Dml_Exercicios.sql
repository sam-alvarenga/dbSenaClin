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






		

		

