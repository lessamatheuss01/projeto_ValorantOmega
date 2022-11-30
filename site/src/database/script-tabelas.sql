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
nomeAgente varchar(45)
);
insert into agente values
	(1, 'Brimstone'),
    (2, 'Phoenix'),
    (3, 'Sage'),
    (4, 'Sova'),
    (5, 'Viper'),
    (6, 'Cypher'),
    (7, 'Reyna'),
    (8, 'Killjoy'),
    (9, 'Breach'),
    (10, 'Omen'),
    (11, 'Jett'),
    (12, 'Raze'),
    (13, 'Skye'),
    (14, 'Yoru'),
    (15, 'Astra'),
    (16, 'Kay/o'),
    (17, 'Chamber'),
    (18, 'Neon'),
    (19, 'Fade'),
    (20, 'Harbor');
    
    
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

create table agente_funcao(
idagente_funcao int primary key auto_increment,
fkagente int,
foreign key (fkagente) references agente(idagente),
fkfuncao int,
foreign key (fkfuncao) references funcao(idfuncao)
);

insert into agente_funcao values
	(40, 1, 20),
    (41, 2, 21),
    (42, 3, 22),
    (43, 4, 23),
    (44, 5, 24),
    (45, 6, 25),
    (46, 7, 26),
    (47, 8, 27),
    (48, 9, 28),
    (49, 10, 29),
    (51, 11, 30),
    (52, 12, 31),
    (53, 13, 32),
    (54, 14, 33),
    (55, 15, 34),
    (56, 16, 35),
    (57, 17, 36),
    (58, 18, 37),
    (59, 19, 38),
    (60, 20, 39);
    
    
create table aviso (
idaviso int primary key auto_increment,
titulo varchar(100),
descricao varchar(150),
fkusuario int,
foreign key (fkusuario) references usuario(idusuario)
);
   
select * from usuario;
select * from agente;
select * from funcao;
select * from agente_funcao;
select * from aviso;

select agente.nomeAgente as Nome_Agente,
funcao.funcao as Funcao
from agente_funcao 
join agente on idagente = fkagente
    join funcao on idfuncao = fkfuncao;

select agente.nomeAgente as agente, COUNT(fkagente) as qtd from usuario join agente on fkagente = idagente group by fkagente 
rder by fkagente desc limit 10;
    

CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
