-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

create database valorantomega;

use valorantomega;

create table usuario(
idusuario int primary key auto_increment,
nome varchar(45),
sobrenome varchar(45),
email varchar(45), constraint chkemail check (email like '%@%'),
senha varchar(45),
fkagente int,
foreign key (fkagente) references agente(idagente)
);

create table agente (
idagente int primary key auto_increment,
nomeAgente varchar(45),
fkfuncao int,
foreign key (fkfuncao) references funcao(idfuncao)
);

insert into agente values
	(1, 'Brimstone', 20),
    (2, 'Phoenix', 21),
    (3, 'Sage', 22),
    (4, 'Sova', 23),
    (5, 'Viper', 24),
    (6, 'Cypher', 25),
    (7, 'Reyna', 26),
    (8, 'Killjoy', 27),
    (9, 'Breach', 28),
    (10, 'Omen', 29),
    (11, 'Jett', 30),
    (12, 'Raze', 31),
    (13, 'Skye', 32),
    (14, 'Yoru', 33),
    (15, 'Astra', 34),
    (16, 'Kay/o', 35),
    (17, 'Chamber', 36),
    (18, 'Neon', 37),
    (19, 'Fade', 38),
    (20, 'Harbor', 39);
    
    
create table funcao(
idfuncao int primary key auto_increment,
funcao varchar(45)
);

insert into funcao values
	(20, 'Controlador'),
    (21, 'Duelista'),
    (22, 'Sentinela'),
    (23, 'Iniciador'),
    (24, 'Controladora'),
    (25, 'Sentinela'),
    (26, 'Duelista'),
    (27, 'Sentinela'),
    (28, 'Iniciador'),
    (29, 'Controlador'),
    (30, 'Duelista'),
    (31, 'Duelista'),
    (32, 'Iniciadora'),
    (33, 'Duelista'),
    (34, 'Controladora'),
    (35, 'Iniciador'),
    (36, 'Sentila'),
    (37, 'Duelista'),
    (38, 'Iniciadora'),
    (39, 'Controlador');
    
select * from usuario;
select * from agente;
select * from funcao;

select agente.nomeAgente as agente, COUNT(fkagente) as qtd from usuario join agente on fkagente = idagente group by fkagente order by fkagente desc limit 3;
    

CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
