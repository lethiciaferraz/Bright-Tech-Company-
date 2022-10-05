create database bright_tec;
use bright_tec;

create table empresa(
id_empresa int primary key auto_increment,
nome varchar(45),
cnpj varchar(45),
tel_contato varchar(45),
email varchar(45),
cep char(9),
bairro varchar(45),
status_contrato varchar(45),
dt_contrato date,
metros_totais decimal(10,2)
)auto_increment= 10;

insert into empresa (nome,cnpj,tel_contato,email,cep,bairro,status_contrato,dt_contrato,metros_totais) values   ('tivit','24.824.874/0001-21','11958414286','tivit@hotmail.com','08466-003','guaianases','ativo','2025-03-12','94857364.75'),
																												('safra','41.847.943/9485-32','11938468364','safra@hotmail.com','29384-098','serra do mar','ativo','2027-10-27',94837465.23),
                                                                                                                ('cobool','60.912.843/0001-96','13948563847','cobool@hotmail.com','28376-092','vila madalena','inativo','2022-09-20',93847364.57);

create table usuario(
id_usuario int auto_increment,
login varchar(45),
senha varchar(45),
email varchar(45),
fk_empresa int,
primary key (id_usuario,fk_empresa),
foreign key (fk_empresa) references empresa(id_empresa)
)auto_increment= 27;

insert into usuario (login,senha,email,fk_empresa) values ('@/logintivit','tivittoken21','usuario1@hotmail.com',10),
														  ('@/safralogin','77safratoken','usuario2@hotmail.com',11),
                                                          ('@/coboltivit','cobolsafra/2000','usuario3@hyahoo.com',12);

create table setor(
id_setor int primary key auto_increment,
nome varchar(45),
andar int,
metros_quadrados decimal(7,2),
fk_empresa int,
foreign key (fk_empresa) references empresa(id_empresa)
);

insert into setor (nome,andar,metros_quadrados,fk_empresa) values ('administrativo',3,38573.64,10),
																  ('executivo',4,94856.84,11),
																  ('recursos humanos',2,25142.96,10),
																  ('recepção',1,94857.12,12);

create table sensor(
id_sensor int auto_increment,
num_serie varchar(45),
fk_setor int,
primary key (id_sensor,fk_setor),
foreign key (fk_setor) references setor(id_setor)
)auto_increment = 327;

insert into sensor (num_serie,fk_setor) values ('182736',1),
												('182736',2),
                                                ('182736',3),
                                                ('182736',1),
                                                ('182736',3),
                                                ('182736',2);

create table captura(
id_captura int,
dado_captura int,
dt_registro datetime,
fk_sensor int,
primary key (id_captura,fk_sensor),
foreign key (fk_sensor) references sensor(id_sensor)
);

insert into captura values (1,0,'2022-10-04 08:35:43',327),
						   (2,1,'2022-10-05 12:35:43',328),
                           (3,0,'2022-10-04 10:34:03',327);
						
select * from empresa;
select * from usuario;
select * from setor;
select * from sensor;
select * from captura;

-- selecionando todos os dados de todas as tabelas --
select * from empresa as e join usuario as u on e.id_empresa = u.fk_empresa
						   join setor as s on e.id_empresa = s.fk_empresa
						   join sensor as sen on sen.fk_setor = s.id_setor
                           join captura as c on c.fk_sensor = sen.id_sensor;

-- selecionando as empresas e seus usuários --
select * from empresa as e join usuario as u on e.id_empresa = u.fk_empresa;

-- selecionando os dados dos arduinos e seus respectivos setores --
select * from sensor as s join Setor as se on s.fk_setor = se.id_setor;

-- truncate table usuario;
-- truncate table captura;
-- truncate table sensor;
-- truncate table setor;
-- truncate table empresa; 




