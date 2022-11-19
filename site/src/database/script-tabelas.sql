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
nome varchar(45),
fkhistoria int,
foreign key (fkhistoria) references historia(idhistoria)
);

create table historia(
idhistoria int primary key auto_increment,
historiaagente varchar(45)
);

CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
