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



insert into empresa (nome, cnpj, tel_contato, email, qtd_Funcionario, metros_uteis, status_contrato, dt_contrato) values 
  ('tivit','24.824.874/0001-21','11958414286','tivit@hotmail.com', 1200, 94857364.75,'ativo','2025-03-12'),
  ('safra','41.847.943/9485-32','11938468364','safra@hotmail.com', 2000, 94837465.23,'ativo','2027-10-27'),
  ('cobool','60.912.843/0001-96','13948563847','cobool@hotmail.com', 5000, 93847364.57, 'inativo','2022-09-20');
  
  insert into endereco (cep, bairro, logradouro) values 
  ('08466-003','guaianases', 'Rua Haddok Lobo'),
  ('29384-098','serra do mar', 'Rua Arnaldo Estrella'),
  ('28376-092','vila madalena', 'Rua Café');
  
  insert into End_Completo (fkEmpresa, fkEndereco, numero, complemento)values 
  (10, 1, 45, 'Apartamento Bloco 3D'),
  (11, 2, 34, 'Casa 2'),
  (12, 3, 14, 'Apartamento Bloco 4C');

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

insert into usuario (login,senha,email,fkEmpresa) values ('@/logintivit','tivittoken21','usuario1@hotmail.com',10),
														  ('@/safralogin','77safratoken','usuario2@hotmail.com',11),
                                                          ('@/coboltivit','cobolsafra/2000','usuario3@hyahoo.com',12);

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
idSensor int auto_increment,
num_serie varchar(45),
fkSetor int,
primary key (idSensor,fkSetor),
foreign key (fkSetor) references setor(idSetor)
)auto_increment = 327;

insert into sensor (num_serie,fkSetor) values ('182736',1),
												('182736',2),
                                                ('182736',3),
                                                ('182736',1),
                                                ('182736',3),
                                                ('182736',2);

create table captura(
idCaptura int,
dado_captura int,
dt_registro datetime,
fkSensor int,
primary key (idCaptura,fkSensor),
foreign key (fkSensor) references sensor(idSensor)
);

insert into captura values (1,0,'2022-10-04 08:35:43',327),
						   (2,1,'2022-10-05 12:35:43',328),
                           (3,0,'2022-10-04 10:34:03',327);
						
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

select * from usuario;