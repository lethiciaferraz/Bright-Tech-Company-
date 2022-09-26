create database bright_tec;
use bright_tec;

create table empresa(
id_empresa int primary key auto_increment,
nome varchar(45),
cnpj varchar(45),
telefone_contato varchar(45),
email varchar(45),
endereco varchar(45),
status_contrato varchar(45),
dt_contrato date,
metros_totais decimal(10,2)
)auto_increment= 10;

insert into empresa (nome,cnpj,telefone_contato,email,endereco,status_contrato,dt_contrato,metros_totais) values ('tivit','24.824.874/0001-21','11958414286','tivit@hotmail.com','avenida paulista-SP','ativo','2025-03-12','94857364.75'),
																												('safra','41.847.943/9485-32','11938468364','safra@hotmail.com','serra do mar 512','ativo','2027-10-27',94837465.23),
                                                                                                                ('cobool','60.912.843/0001-96','13948563847','cobool@hotmail.com','vila madalena','inativo','2022-09-20',93847364.57);

create table usuario(
id_usuario int primary key auto_increment,
login varchar(45),
senha varchar(45),
email varchar(45),
fk_empresa int,
foreign key (fk_empresa) references empresa(id_empresa)
)auto_increment= 27;

insert into usuario (login,senha,email,fk_empresa) values ('@/logintivit','tivittoken21','usuario1@hotmail.com',10),
														  ('@/safralogin','77safratoken','usuario2@hotmail.com',11),
                                                          ('@/coboltivit','cobolsafra/2000','usuario3@hyahoo.com',12);

create table heatmap(
id_map int primary key auto_increment,
andar int,
setor varchar(45),
metros_quadrados decimal(7,2)
);

insert into heatmap (andar,setor,metros_quadrados) values (7,'administrativo',38573.64),
														  (2,'executivo',94856.84),
                                                          (4,'recursos humanos',25142.96),
                                                          (1,'recepção',94857.12);

create table arduino(
id_arduino int primary key auto_increment,
num_serie varchar(45),
dado_captura int,
dt_registro datetime,
fk_empresa int,
foreign key (fk_empresa) references empresa (id_empresa),
fk_heatmap int,
foreign key (fk_heatmap) references heatmap (id_map)
)auto_increment = 327;

insert into arduino (num_serie,dado_captura,dt_registro,fk_empresa,fk_heatmap) values ('182736','0','2022-09-12 08:00:00',11,2),
																					  ('948574','1','2022-09-07 08:00:00',12,4),
                                                                                      ('948576','1','2022-01-10 08:00:00',10,2),
                                                                                      ('281726','0','2021-09-02 08:00:00',10,2),
                                                                                      ('948574','1','2022-02-01 08:00:00',12,4),
                                                                                      ('948474','0','2022-12-03 08:00:00',11,3);
                                                                                      
select * from empresa;
select * from usuario;
select * from heatmap;
select * from arduino;

-- selecionando todos os dados de todas as tabelas --
select * from empresa as e join usuario as u on e.id_empresa = u.fk_empresa
						   join arduino as a on e.id_empresa = a.fk_empresa
						   join heatmap as h on a.fk_heatmap = h.id_map;

-- selecionando as empresas e seus usuários --
select * from empresa as e join usuario as u on e.id_empresa = u.fk_empresa;

-- selecionando os dados dos arduinos e seus respectivos mapas --
select * from arduino as a join heatmap as h on a.fk_heatmap = h.id_map;
						   