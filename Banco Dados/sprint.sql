create database cocoaTechnology;
use cocoaTechnology;
-- drop database cocoaTechnology;

create table endereco (
idendereco int primary key auto_increment,
cep char(8),
estado char(2) not null,
cidade varchar(30) not null,
bairro varchar (50) not null,
numero varchar(10) not null,
complemento varchar (45)
);

create table tipo_cliente (
idtipo_cliente int primary key auto_increment,
tipo varchar(45) not null
);

create table cliente (
idcliente int primary key auto_increment,
nome  varchar(40) not null,
email varchar(100) unique not null,
senha varchar(40) not null,
cpf char(11),
cnpj varchar(14) not null,
fkEndereco_cliente int, constraint fkEndereco_cliente foreign key (fkEndereco_cliente) references endereco(idendereco),
fkTipo_cliente int, constraint fkTipo_cliente foreign key (fkTipo_cliente) references tipo_cliente(idtipo_cliente)
);

create table usuario (
idusuario int primary key auto_increment,
nome varchar(45) not null,
email varchar(100) unique not null,
senha varchar(40) not null,
fkUsuario_cliente int, constraint fkUsuario_cliente foreign key (fkUsuario_cliente) references cliente(idcliente) 
);
SELECT * FROM cliente;
create table telefone(
idtelefone int primary key auto_increment,
numero CHAR(11),
tipo VARCHAR(45), constraint chkTel_tipo check (tipo IN('Fixo', 'Móvel')),
fkTel_cliente INT, constraint fkTel_cliente foreign key (fkTel_cliente) references cliente(idcliente)
);

create table plantacao_param (
idplantacao_param int primary key auto_increment,
temp_min decimal(5,2),
temp_max decimal(5,2),
umid_min decimal(5,2),
umid_max decimal(5,2)
);

create table plantacao (
idplantacao int primary key auto_increment,
nome varchar(45) not null,
tamanho decimal(15,2) not null,
fkPlantacao_cliente INT, constraint fkPlantacao_cliente foreign key (fkPlantacao_cliente) references cliente(idcliente),
fkPlantacao_endereco int, constraint fkPlantacao_endereco foreign key (fkPlantacao_endereco) references endereco(idendereco),
fkPlantacao_param int, constraint fkPlantacao_param foreign key (fkPlantacao_param) references plantacao_param(idplantacao_param)
);

create table tipo_sensor (
idtipo_sensor int primary key auto_increment,
tipo varchar(45) not null,
medida varchar(45) not null
);

create table sensor(
idsensor int primary key auto_increment,
nome varchar (80) not null,
status_sensor char(10) not null, constraint chkSensor_status check (status_sensor in('Ativo' , 'Desativado' , 'Manutenção')),
fkSensor_plantacao INT, constraint fkSensor_plantacao foreign key (fkSensor_plantacao) references plantacao(idplantacao),
fkSensor_tipo INT, constraint fkSensor_tipo foreign key (fkSensor_tipo) references tipo_sensor(idtipo_sensor)
);

create table leitura(
idleitura int auto_increment,
dataLeitura_hora datetime default current_timestamp,
retorno_temp decimal(5,2),
retorno_umidd decimal(5,2), 
fkLeitura_sensor int, constraint fkLeitura_sensor foreign key (fkLeitura_sensor) references sensor(idsensor),
constraint pkLeitura primary key (idleitura, fkLeitura_sensor)
);

select * from endereco;
select * from tipo_cliente;
select * from cliente;
select * from usuario;
select * from telefone;
select * from plantacao_param;
select * from plantacao;
select * from tipo_sensor;
select * from sensor;
select * from leitura;


-- inserts
insert into endereco values
(null , '08460345' , 'SP' , 'São Paulo' , 'Guainases' , 860 , 'Mercado Extra'),
(null , '07957020' , 'SP' , 'Francisco Morato' , 'Recanto Regina' , 465 , 'Mercado dia'),
(null , '08032340' , 'SP' , 'São Paulo' , 'São Miguel Paulista',  765 , 'Shopping de são miguel'),
(null , '06215463', 'RJ' , 'Rio de Janeiro' , 'Rocinha' , 782 , 'Salão de artes belas de são paulo');

insert into tipo_cliente values
(null , 'Empresa'),
(null , 'MicroEmprendedor');

insert into cliente values
(null , 'Cacau Bom' , 'cacau.bom@gmail.com' , '12345678' , '61934918059' , 45632187456951 , 1 , 1),
(null , 'Show de cacau' , 'showcacau@gmail.com' , '65789621' ,'42722006073' , 48562136874562 , 2 , 1),
(null , 'Luiz dos santos' , 'luiz.ofc@gmail.com' , '965412387' , '11414713029' , 84563974125863 , 3 , 2),
(null , 'Mariana Luiza da silva' , 'mariana.ofc@gmail.com' , '658756321' , '70236969030' , 89865412354879 , 4 , 2); 

insert into usuario values 
(null , 'Luiz eduardo' , 'luizedu@yahoo.com' , '5466584632' , 1),
(null , 'Geovanna layanne' , 'geovanna@mail.com' , '55985446689' , 2),
(null , 'Luiz dos santos' ,  'luiz@gmail.com' , '56654123875' ,  3),
(null , 'Mariana Luiza da silva' , 'mariana@gmail.com' ,'56565856658999' ,  4);

insert into telefone values
(null , '11989062680' , 'Móvel' , 1),
(null , '40028922' , 'Fixo' , 2),
(null , '19994052961' , 'Móvel' , 3),
(null , '46098930' , 'Fixo' , 4);

insert into plantacao_param values
(null , 18.20 , 26.70 , 60.80 , 98.40),
(null , 15.20 , 28.40 , 41.30 , 87.20),
(null , 16.70 , 29.40 , 70.10 , 90.20),
(null , 12.10 , 27.70 , 80.10 , 96.30),
(null , 10.10 , 30.30 , 23.30 , 99.90),
(null , 9.90 , 24.20 , 45.20 , 89.20);

insert into plantacao values
(null,'Cocoa',400,2,1,3),
(null,'Fazenda do chocolate',500,1,2,1),
(null,'Show de cacau',700,3,3,2),
(null,'Bahianos do cacau',900,4,4,4);

insert into plantacao values
(null,'Cacauzinha',100,2,2,5),
(null,'Chocolatinha INC',300,2,2,5),
(null,'Doce Amor',300,2,2,5),
(null,'Fabrica de chocolate Benta',1000,2,2,5);

insert into tipo_sensor values
(null,'Temperatura','ºC'),
(null , 'Umidade' , '%');


insert into sensor values
(null , 'Higrômetro' , 'Ativo' , 2 , 1),
(null , 'LM35' , 'Manutenção' , 3 , 2),
(null , 'DHT11' , 'Ativo' , 1 , 1),
(null , 'DHT11' , 'Desativado' , 4 , 1);

insert into sensor values
(null , 'DHT11' , 'Ativo' , 5 , 1),
(null , 'DHT11' , 'Ativo' , 6 , 1),
(null , 'DHT11' , 'Ativo' , 7 , 1),
(null , 'DHT11' , 'Ativo' , 8 , 1);

insert into leitura values
(null,'2018-12-03 12:20:25',27.30,83.40,2),
(null,'2020-11-27 13:45:10',25.10,93.20,3),
(null,'2022-01-28 16:15:45',39.40,95.20,4);

insert into leitura values
(null,'2020-11-27 13:45:10',21.70,85.20,3),
(null,'2020-11-27 13:46:10',21.10,80.20,3),
(null,'2023-05-05 12:20:25',30.30,90.40,5),
(null,'2023-05-05 12:20:25',27.30,80.40,6),
(null,'2023-05-05 12:20:25',23.30,83.40,7),
(null,'2020-11-27 13:47:10',29.90,93.20,3);

insert into leitura values
(null,'2023-05-05 12:20:25',17.30,80.40,8);

insert into leitura values
(null,'2023-05-05 12:10:25',23.30,77.40,5),
(null,'2023-05-05 12:11:25',28.30,80.90,5),
(null,'2023-05-05 12:12:25',24.30,83.00,5),
(null,'2023-05-05 12:13:25',25.30,40.40,5);

-- Cliente + tipo_cliente + endereço
SELECT * FROM cliente JOIN tipo_cliente ON idTipo_cliente = fkTipo_cliente JOIN
endereco ON fkEndereco_cliente = idendereco;

-- Cliente + endereço 
SELECT * FROM cliente JOIN endereco ON fkEndereco_cliente = idendereco; 

-- Plantação + platacao_param 
SELECT * FROM plantacao JOIN plantacao_param ON fkPlantacao_param = idplantacao_param;

-- Sensor + tipo_sensor
SELECT * FROM sensor JOIN tipo_sensor ON fkSensor_tipo = idtipo_sensor;
select * from leitura;

-- Sensor + tipo_sensor + leitura
SELECT * FROM sensor JOIN tipo_sensor ON fkSensor_tipo = idtipo_sensor
JOIN leitura ON fkLeitura_sensor = idtipo_sensor;

-- Cliente + telefone
 SELECT * FROM cliente JOIN telefone ON fkTel_cliente=idcliente;
 
-- Cliente + usuario 
SELECT * FROM cliente JOIN usuario ON fkTipo_cliente = idusuario;

-- Retornando plantações de um determinado cliente
select plantacao.* from plantacao join cliente on fkPlantacao_cliente = idcliente
	where idcliente = 2;
    
-- Retornando a quantidade de plantações em alerta, cuidado, atenção e tranquilo
select * from leitura order by dataLeitura_hora DESC;
select * from sensor;
select * from plantacao;

-- select da contagem de plantacões em perigo
select count(distinct idleitura) as alertaPerigo from plantacao join sensor on fkSensor_plantacao = idsensor
	join leitura on fkLeitura_sensor = idsensor join cliente on fkPlantacao_cliente = idcliente
		where (retorno_temp > 27 OR retorno_umidd > 85) AND idcliente = 2;
        
-- select qtd de usuario por cliente
SELECT COUNT(idusuario) AS qtdUsu FROM usuario where fkUsuario_cliente = 1;

-- select qtd de plantações od cliente
SELECT COUNT(idplantacao) AS qtdPlantacao FROM plantacao join cliente on fkPlantacao_cliente = idcliente
	where idcliente = 1;

-- ultima temperatura
select plantacao.nome, retorno_temp as temperatura , retorno_umidd as umidade from leitura
        join sensor on idsensor = fkLeitura_sensor
        join plantacao on idplantacao = fkSensor_plantacao 
        join cliente on fkPlantacao_cliente = idcliente
			where idcliente = 1 group by plantacao.nome, retorno_temp, retorno_umidd;
            
-- Select dados constantes dash
select plantacao.nome, retorno_temp as temperatura, retorno_umidd as umidade, dataLeitura_hora, fkLeitura_sensor from leitura 
join sensor on fkLeitura_sensor = idsensor
join plantacao on fkSensor_plantacao = idplantacao
join cliente on fkPlantacao_cliente = idcliente
	where idcliente = 2 GROUP BY plantacao.nome, retorno_temp, retorno_umidd, dataLeitura_hora, fkLeitura_sensor ORDER BY dataLeitura_hora DESC;
    
-- tabela da dashboard
SELECT p.idplantacao, p.nome, l.retorno_temp AS temperatura, l.retorno_umidd AS umidade, l.dataLeitura_hora, l.fkLeitura_sensor
FROM plantacao p
JOIN cliente c ON p.fkPlantacao_cliente = c.idcliente
JOIN (
  SELECT l2.*
  FROM leitura l2
  JOIN (
    SELECT MAX(dataLeitura_hora) AS ultima_data, fkLeitura_sensor
    FROM leitura
    GROUP BY fkLeitura_sensor
  ) l3 ON l2.dataLeitura_hora = l3.ultima_data AND l2.fkLeitura_sensor = l3.fkLeitura_sensor
) l ON p.idplantacao = l.fkLeitura_sensor
WHERE c.idcliente = 2 order by temperatura desc;
    
-- retornando as leituras de uma plantação específica
-- usar para pegar e atualizar os dados na plotagem
select leitura.* from leitura join sensor on fkLeitura_sensor = idsensor
	join plantacao on fkSensor_plantacao = idplantacao
		where idplantacao = 1 ORDER BY dataLeitura_hora DESC;

select  plantacao.idplantacao, plantacao.nome,
        retorno_temp as temperatura ,
        retorno_umidd as umidade,
        dataLeitura_hora, 
        DATE_FORMAT(dataLeitura_hora,'%H:%i:%s') as momento_grafico, 
        fkLeitura_sensor, leitura.*
        from leitura join sensor on idsensor = fkLeitura_sensor
        join plantacao on idplantacao = fkSensor_plantacao 
        join cliente on fkPlantacao_cliente = idcliente
			where idcliente = 2 and idplantacao = 5 and idLeitura IN (select MAX(idleitura) from leitura group by fkLeitura_sensor);
        
-- retornando ultimos dados dos sensores (sem especificar a plantacao)
--usar na plotagem da criação de graficos
select  plantacao.idplantacao, plantacao.nome,
        retorno_temp as temperatura ,
        retorno_umidd as umidade,
        dataLeitura_hora, 
        DATE_FORMAT(dataLeitura_hora,'%H:%i:%s') as momento_grafico, 
        fkLeitura_sensor 
        from leitura join sensor on idsensor = fkLeitura_sensor
        join plantacao on idplantacao = fkSensor_plantacao 
        join cliente on fkPlantacao_cliente = idcliente
			where idcliente = 2 and idLeitura IN (select MAX(idleitura) from leitura group by fkLeitura_sensor);
            
            
insert into leitura values 
(null,'2020-11-27 20:45:10',25.10,93.20,3);