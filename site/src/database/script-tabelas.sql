-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

create database bright_tec;
use bright_tec;

create table empresa(
idEmpresa int primary key auto_increment,
nome varchar(45),
cnpj varchar(45),
tel_contato varchar(45),
email varchar(45),
qtd_Funcionario int, 
metros_uteis decimal(10,2),
status_contrato varchar(45),
dt_contrato date
)auto_increment= 10;

create table endereco(
idEndereco int primary key auto_increment,
bairro varchar(45),
cep char(9),
logradouro varchar(45));

create table End_Completo(
fkEmpresa int,
foreign key (fkEmpresa) references empresa(idEmpresa),
fkEndereco int,
foreign key (fkEndereco) references Endereco(idEndereco),
numero int,
complemento varchar(45),
primary key (fkEmpresa, fkEndereco));

create table usuario(
idUsuario int auto_increment,
nome varchar(45),
email varchar(45),
telefone varchar(45),
cnpj varchar(45),
senha varchar(45),
login varchar(45),
fkEmpresa int,
primary key (idUsuario,fkEmpresa),
foreign key (fkEmpresa) references empresa(idEmpresa)
)auto_increment= 27;

create table setor(
idSetor int primary key auto_increment,
nome varchar(45),
andar int,
metros_quadrados decimal(7,2),
fkEmpresa int,
foreign key (fkEmpresa) references empresa(idEmpresa)
);

create table sensor(
idSensor int auto_increment,
num_serie varchar(45),
fkSetor int,
primary key (idSensor,fkSetor),
foreign key (fkSetor) references setor(idSetor)
)auto_increment = 327;

create table captura(
idCaptura int,
dado_captura int,
dt_registro datetime,
fkSensor int,
primary key (idCaptura,fkSensor),
foreign key (fkSensor) references sensor(idSensor)
);

CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
