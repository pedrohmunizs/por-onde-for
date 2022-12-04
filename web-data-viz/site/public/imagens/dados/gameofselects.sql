create database tech_world;
drop database tech_world;
use tech_world;

create table fronteira(
idFronteira int primary key auto_increment,
nome varchar(45)
);

create table distrito(
idDistrito int auto_increment,
nome varchar(45),
fkFronteira int,
primary key(idDistrito,fkFronteira),
foreign key(fkFronteira) references fronteira(idFronteira)
);

create table programador(
idProgramador int primary key auto_increment,
nome varchar(45),
nivel int,
fkDistrito int,
fkFronteira int,
fkLider int,
foreign key (fkDistrito) references distrito(idDistrito),
foreign key (fkFronteira) references fronteira(idFronteira),
foreign key (fkLider) references programador(idProgramador)
);

create table veiculo(
idVeiculo int primary key auto_increment,
tipo varchar(45),
velocidade varchar(45)
);

create table veiculo_do_programador(
fkProgramador int,
fkVeiculo int,
foreign key (fkProgramador) references programador(idProgramador),
foreign key (fkVeiculo) references veiculo(idveiculo),
primary key(fkProgramador, fkVeiculo)
);

create table linguagem(
idLinguagem int primary key auto_increment,
nome varchar(45),
nivel varchar(45)
);

create table linguagem_do_programador(
fkProgramador int,
fkLinguagem int,
primary key (fkProgramador, fkLinguagem),
foreign key (fkProgramador) references programador(idProgramador),
foreign key (fkLinguagem) references linguagem(idLinguagem)
);

create table malware(
idMalware int primary key auto_increment,
nome varchar(45),
tipo varchar(45),
nivel varchar(45),
fkProgramador int,
foreign key (fkProgramador) references programador(idProgramador)
);

create table software(
idSoftware int primary key auto_increment,
nome varchar(45),
tipo varchar(45),
nivel varchar(45),
fkProgramador int,
foreign key (fkProgramador) references programador(idProgramador)
);

insert into fronteira values
(null,'Dark Web'),
(null,'Surface Web');

insert into distrito values
(null,'Android',1),
(null,'Linux',1),
(null, 'Windows',2),
(null, 'IOS',2);

select*from distrito;
insert into programador values
(null,'Alan Turing',10, 4 ,2,null),
(null,'Steve Jobs',10, 4, 2,null),
(null,'Bill Gates',10, 3, 2,null),
(null, 'Grace Hooper',10, 3, 2,null),
(null, 'Linus Torvalds', 10, 2, 1,null),
(null, 'Kevin Mitnick', 8, 2, 1,null),
(null, 'Jonathan James', 6, 2,1,null),
(null,'ASTRA',7, 2, 1,null);

insert into programador values
(null,'Adriana Marca',7,1,1,1),
(null,'Daniel Fajan',8,2,2,2),
(null,'Gabriel Ferraz',6,3,1,3),
(null,'Vitor Xavier',5,4,2,4),
(null,'Rogério Chola',8,1,1,5),
(null,'José Yoshi',9,2,2,6),
(null,'João de Paula',9,3,1,7),
(null,'Lethicia Ferraz',5,4,2,8),
(null,'Pedro Muniz',5,1,1,1),
(null,'Lívia Leal',5,2,2,2),
(null,'Viviana Marca',5,3,1,3),
(null,'Pedro Gonçalves',5,4,2,4),
(null,'Igor Mendes',5,1,1,5),
(null,'Luiz Nison',6,2,2,6);

insert into veiculo values
(null,'fibra óptica','40 Gbits/s'),
(null,'Satelite','22 mbp/s'),
(null,'Modem','150 mpb/s'),
(null,'Wireless','200 mpb/s');

insert into linguagem values
(null,'Cobol',6),
(null,'Ada',2),
(null,'PYTHON',10),
(null,'Ruby',1),
(null,'JAVA',8),
(null,'PHP',6),
(null,'JavaScript',9),
(null,'C#',7);

insert into linguagem_do_programador values
(1,5),
(2,6),
(3,7),
(4,8),
(5,1),
(6,2),
(7,3),
(22,5),
(9,3),
(10,6),
(11,7),
(12,8),
(13,1),
(14,3),
(15,3),
(16,3),
(17,5),
(18,6),
(19,7),
(20,8),
(21,3),
(8,4);

insert into veiculo_do_programador values
(1,1),
(2,1),
(3,3),
(4,2),
(5,1),
(6,4),
(7,2),
(9,4),
(12,2),
(13,1),
(14,3),
(15,3),
(16,3),
(18,1),
(19,1),
(20,2),
(21,3),
(8,4);

insert into malware values
(null,'Melissa','Vírus de macro',7,5),
(null,'CIH','Vírus de macro',6,6),
(null,'I love you', 'Vírus de email',9,7),
(null,'Flame','Malware modular',10,8);

insert into software values
(null,'Cybel Angel','Segurança digital', 8, 1),
(null, 'BigML','Ciência de dados', 9, 2),
(null,'Delphi','Segurança digital', 7, 3),
(null,'Data Science','Ciência de dados', 8,4);

select*from programador;

select*from fronteira join distrito on fronteira.idFronteira = distrito.fkFronteira;

-- FACIL, EXIBIR O NOME E NIVEL DOS PROGRAMADORES ORDENADOS PELO NIVEL DO MAOIR PARA O MENOR
select nome,nivel from programador order by nivel desc;

-- FACIL, EXIBIR VEICULO QUE TEM A VELOCIDADE MAIOR QUE 100
select * from veiculo where velocidade >100;

-- MEDIO, EXIBIR TIPO DO VEICULO DO BILL GATES
select p.nome,v.tipo from programador as p join veiculo_do_programador as vp on vp.fkprogramador=p.idprogramador join veiculo as v on vp.fkveiculo=v.idveiculo where p.nome='Bill Gates';

-- DIFICIL, EXIBIR NOME DOS PROGRAMADORES QUE PERTENCEM A FRONTEIRA DARK WEB
select p.nome from programador as p join distrito as d on p.fkdistrito=d.iddistrito join fronteira as f on d.fkfronteira=f.idfronteira where f.nome='Dark Web' ;

-- DIFICIL, EXIBIR NOME DO PROGRAMADOR E NOME DA SUA LINGUAGEM
select p.nome,l.nome from programador as p join linguagem_do_programador as lp on lp.fkprogramador=p.idprogramador join linguagem as l on lp.fklinguagem=l.idlinguagem;

-- FACIL, EXIBIR NOME DE SOFTWARE QUE COMECE COM A LETRA D
select nome from software where nome like 'D%';

-- MEDIO, EXIBIR SOMA DA VELOCIDADE
select sum(velocidade) from veiculo;

-- MEDIO, EXIBIR VELOCIDADE MAXIMA E MINIMA
select max(velocidade)'Maior velocidade', min(velocidade)'Menor velocidade' from veiculo;

select * from veiculo;

-- exibir nome de todos os programadores o nome das sua linguagens e veiculos ordenado pelo velocidade do veiculo, do mais rapido para o mais devagar
select p.nome,l.nome,v.tipo from programador as p join linguagem_do_programador as lp on lp.fkprogramador=p.idprogramador join linguagem as l on l.idlinguagem=lp.fklinguagem join veiculo_do_programador as vp on vp.fkprogramador=p.idprogramador join veiculo as v on vp.fkveiculo=v.idveiculo order by velocidade desc;

select p.nome, m.nome from programador as p join malware  as m on p.idProgramador =m.fkprogramador join distrito as d on d.iddistrito= p.fkdistrito where iddistrito=2;