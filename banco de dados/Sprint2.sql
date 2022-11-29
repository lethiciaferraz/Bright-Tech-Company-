create database bright_tec;
use bright_tec;

create table empresa(
idEmpresa int primary key auto_increment,
nome varchar(45),
cnpj varchar(45),
telefone varchar(14),
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
primary key (fkEmpresa, fkEndereco)
);

select*from empresa;
insert into empresa (nome, cnpj, telefone, qtd_Funcionario, metros_uteis, dt_contrato) values 
  ('tivit','24.824.874/0001-21','11958414286', 120, 200,'2022-11-15'),
  ('safra','41.847.943/9485-32','11938468364', 120, 200,'2022-11-15'),
  ('cobool','60.912.843/0001-96','13948563847',  120, 200,'2022-11-15');
  
  insert into endereco (cep, bairro, logradouro) values 
  ('08466-003','guaianases', 'Rua Haddok Lobo'),
  ('29384-098','serra do mar', 'Rua Arnaldo Estrella'),
  ('28376-092','vila madalena', 'Rua Café');
  
  insert into End_Completo (fkEmpresa, fkEndereco, numero, complemento)values 
  (10, 1, 45, 'Apartamento Bloco 3D'),
  (11, 2, 34, 'Casa 2'),
  (12, 3, 14, 'Apartamento Bloco 4C');

create table usuario(
idUsuario int primary key auto_increment,
nome varchar(100),
email varchar(50),
telefone varchar(14),
senha varchar(50),
fkEmpresa int,
foreign key (fkEmpresa) references empresa (idEmpresa)
)auto_increment= 1;

alter table empresa add constraint chktipo check (status_contrato in('Ativo', 'Inativo'));

alter table empresa modify column status_contrato varchar(45) default 'Ativo';

 desc usuario;
insert into usuario (nome, email, telefone, senha) values
 ('teste6','teste6@gmail.com', 1127514301, 123);
 
 select*from usuario;
  
 
create table setor(
idSetor int primary key auto_increment,
nome varchar(45),
andar int,
metros_quadrados decimal(7,2),
fkEmpresa int,
foreign key (fkEmpresa) references empresa(idEmpresa)
);

insert into setor (nome, andar, metros_quadrados, fkEmpresa) values ('administrativo',3,38573.64,10),
																  ('executivo',4,94856.84,11),
																  ('recursos humanos',2,25142.96,10),
																  ('recepção',1,94857.12,12);

create table sensor(
idSensor int primary key auto_increment,
num_serie varchar(45),
fkSetor int,
foreign key (fkSetor) references setor(idSetor)
);

insert into sensor (num_serie,fkSetor) values ('182736',1),
												('182736',2),
                                                ('182736',3),
                                                ('182736',1),
                                                ('182736',3),
                                                ('182736',2);
                                                

create table captura(
idCaptura int primary key auto_increment,
dht11_umidade decimal,
dht11_temperatura decimal,
dt_registro datetime,
luminosidade decimal,
lm35_temperatura decimal,
chave decimal,
momento datetime,
fkSensor int,
foreign key (fkSensor) references sensor(idSensor)
);

insert into captura values (null, null, null, null, null, null, null, '2022-10-04 08:35:43',1);
						   
						
select * from empresa;
select * from usuario;
select * from endereco;
select * from setor;
select * from sensor;
select * from captura;
select * from End_Completo; 

-- selecionando todos os dados de todas as tabelas --
select * from empresa as e join usuario as u on e.idEmpresa = u.fkEmpresa
						   join setor as s on e.idEmpresa = s.fkEmpresa
						   join sensor as sen on sen.fkSetor = s.idSetor
                           join captura as c on c.fkSensor = sen.idSensor;

-- selecionando as empresas e seus usuários --
select * from empresa as e join usuario as u on e.idEmpresa = u.fkEmpresa;

-- selecionando os dados dos arduinos e seus respectivos setores --
select * from sensor as s join setor as se on s.fkSetor = se.idSetor;

-- Selecionando empresa, endereço e Endereço
-- truncate table usuario;
-- truncate table captura;
-- truncate table sensor;
-- truncate table setor;
-- truncate table empresa; 



delete from usuario where idUsuario > 5;
alter table captura drop column dt_registro;

select * from usuario;




