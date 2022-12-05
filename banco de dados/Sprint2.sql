create database bright_tec;
use bright_tec;

-- ---------------------------------------------------------------------------------------------------

create table empresa(
idEmpresa int primary key auto_increment,
nome varchar(45),
cnpj varchar(45),
telefone varchar(14),
qtdFuncionario int, 
metrosUteis decimal(10,2),
statusContrato varchar(45) default 'Ativo',
constraint chktipo check (statusContrato in('Ativo', 'Inativo')),
dtContrato date
)auto_increment= 10;

insert into empresa (nome, cnpj, telefone, qtdFuncionario, metrosUteis, dtContrato) values 
('tivit','24.824.874/0001-21','11958414286', 120, 200,'2022-11-15'),
('safra','41.847.943/9485-32','11938468364', 120, 200,'2022-11-15'),
('cobool','60.912.843/0001-96','13948563847',  120, 200,'2022-11-15');

-- ---------------------------------------------------------------------------------------------------

create table usuario(
idUsuario int primary key auto_increment,
nome varchar(100),
email varchar(50),
telefone varchar(14),
senha varchar(50),
fkEmpresa int,
foreign key (fkEmpresa) references empresa (idEmpresa)
)auto_increment= 1;

insert into usuario (nome, email, telefone, senha, fkEmpresa) values
('teste6','teste6@gmail.com', 1127514301, 123, 10);

-- ---------------------------------------------------------------------------------------------------

create table endereco(
idEndereco int primary key auto_increment,
bairro varchar(45),
cep char(9),
logradouro varchar(45));

insert into endereco (cep, bairro, logradouro) values 
('08466-003','guaianases', 'Rua Haddok Lobo'),
('29384-098','serra do mar', 'Rua Arnaldo Estrella'),
('28376-092','vila madalena', 'Rua Café');

-- ---------------------------------------------------------------------------------------------------

create table EndCompleto(
fkEmpresa int,
foreign key (fkEmpresa) references empresa(idEmpresa),
fkEndereco int,
foreign key (fkEndereco) references Endereco(idEndereco),
numero int,
complemento varchar(45),
primary key (fkEmpresa, fkEndereco)
);

insert into EndCompleto (fkEmpresa, fkEndereco, numero, complemento)values 
(10, 1, 45, 'Apartamento Bloco 3D'),
(11, 2, 34, 'Casa 2'),
(12, 3, 14, 'Apartamento Bloco 4C');

-- ---------------------------------------------------------------------------------------------------

create table setor(
idSetor int primary key auto_increment,
nome varchar(45),
andar int,
metrosQuadrados decimal(7,2),
fkEmpresa int,
foreign key (fkEmpresa) references empresa(idEmpresa)
);

insert into setor (nome, andar, metrosQuadrados, fkEmpresa) values 
('administrativo',3,38573.64,10),
('financeiro',4,94856.84,11),
('recursos humanos',2,25142.96,10),
('comercial',4,94856.84,11),
('tecnologia da informação',1,94857.12,12);

-- ---------------------------------------------------------------------------------------------------

create table sensor(
idSensor int primary key auto_increment,
numSerie varchar(45),
fkSetor int,
foreign key (fkSetor) references setor(idSetor)
);

insert into sensor (numSerie,fkSetor) values 
('182736',1),
('182736',2),
('182736',3),
('182736',1),
('182736',3),
('182736',2);

-- ---------------------------------------------------------------------------------------------------

create table captura(
idCaptura int primary key auto_increment,
dht11_umidade decimal,
dht11_temperatura decimal,
luminosidade decimal,
lm35_temperatura decimal,
chave decimal,
momento datetime,
fkSensor int,
foreign key (fkSensor) references sensor(idSensor)
);

insert into captura values (null, null, null, null, null, null, '2022-10-04 08:35:43',1);

-- -----------------------------------------------------------------------------------------------------    

create table avisos(
idAvisos int auto_increment,
data date,
titulo varchar(45),
descricao varchar(250),
fkUsuario int,
foreign key (fkUsuario) references usuario (idUsuario),
fkEmpresa int,
foreign key (fkEmpresa) references empresa (idEmpresa),
primary key (idAvisos, fkUsuario, fkEmpresa)
);

insert into avisos values
(1, null, 'teste', 'teste', 1, 13);

						   
select * from empresa;
select * from usuario;	
select * from endereco;
select * from setor;
select * from sensor;
select * from captura;
select * from End_Completo; 
select*from avisos;

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


insert into captura (chave, momento, fkSensor) values
(1,'2022-10-10 10:30:00',1),
(1,'2022-10-10 10:30:00',1),
(1,'2022-10-10 10:30:00',1),
(1,'2022-10-10 10:30:00',1),
(0,'2022-10-11 10:30:21',2),
(1,'2022-10-10 10:30:00',1),
(1,'2022-10-10 10:30:00',1),
(0,'2022-10-12 10:11:21',1),
(0,'2022-10-10 10:30:00',1),
(0,'2022-10-11 10:30:21',2),
(1,'2022-10-11 14:22:12',3),
(0,'2022-10-13 14:22:12',3),
(1,'2022-10-14 14:22:12',3);

-- ---------------------------------------------------------------------------------------------------



-- ---------------------------------------------------------------------------------------------------   

select * from empresa;
select * from usuario;	
select * from endereco;
select * from EndCompleto; 
select * from setor;
select * from sensor;
select * from captura;
select * from avisos;

-- ---------------------------------------------------------------------------------------------------   

-- EXIBINDO TODOS OS DADOS E SUAS RESPECTIVAS TABELAS
select * from empresa as e join usuario as u on e.idEmpresa = u.fkEmpresa
						   join setor as s on e.idEmpresa = s.fkEmpresa
						   join sensor as sen on sen.fkSetor = s.idSetor
                           join captura as c on c.fkSensor = sen.idSensor;

-- EXIBINDO AS EMPRESAS E SEUS USUÁRIOS
select * from empresa as e join usuario as u on e.idEmpresa = u.fkEmpresa;

-- EXIBINDO OS DADOS CAPTURADOS PELOS SENSORES E SEUS RESPECTIVOS SETORES
select * from sensor as s join setor as se on s.fkSetor = se.idSetor;

-- EXIBINDO A CAPTURA E O MOMENTO DE UM DETERMINADO SETOR. ORDENADO PELA CAPTURA EM ORDEM DECRESCENTE, LIMITADO PELOS 5 DIAS DA SEMANA
select count(captura.chave) as captura, captura.momento as dtRegistro from setor join sensor on setor.idsetor = sensor.fkSetor
<<<<<<< HEAD
														left join captura on sensor.idsensor = captura.fkSensor
                                                        where setor.nome = 'administrativo'
                                                        group by day(captura.momento) order by captura.momento desc limit 5;
										
=======
														 join captura on sensor.idsensor = captura.fkSensor
                                                        group by day(captura.momento) order by captura.momento desc limit 1;

insert into captura (chave, momento, fkSensor) values
(1,'2022-10-10 10:30:00',1),
(1,'2022-10-10 10:30:00',1),
(1,'2022-10-10 10:30:00',1),
(1,'2022-10-10 10:30:00',1),
(0,'2022-10-11 10:30:21',2),
(1,'2022-10-10 10:30:00',1),
(1,'2022-10-10 10:30:00',1),
(0,'2022-10-12 10:11:21',1),
(0,'2022-10-10 10:30:00',1),
(0,'2022-10-11 10:30:21',2),
(1,'2022-10-11 14:22:12',1),
(0,'2022-10-13 14:22:12',1),
(1,'2022-10-14 14:22:12',1);
>>>>>>> 034e87b0549d19d5721a101cae9add30639d9907
