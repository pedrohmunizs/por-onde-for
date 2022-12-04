create database tech_world;

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
foreign key (fkDistrito) references distrito(idDistrito),
foreign key (fkFronteira) references fronteira(idFronteira)
);

create table veiculo(
idVeiculo int primary key auto_increment,
tipo varchar(45),
velocidade varchar(45),
fkProgramador int,
foreign key (fkProgramador) references programador(idProgramador)
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
(null,'Alan Turing',10, 4 ,2),
(null,'Steve Jobs',10, 4, 2),
(null,'Bill Gates',10, 3, 2),
(null, 'Grace Hooper',10, 3, 2),
(null, 'Linus Torvalds', 10, 2, 1),
(null, 'Kevin Mitnick', 8, 2, 1),
(null, 'Jonathan James', 6, 2,1),
(null,'ASTRA',7, 2, 1);

insert into veiculo values
(null,'fibra óptica','40 Gbits/s',1),
(null,'Satelite','22 mbp/s',3),
(null,'Modem','150 mpb/s',4),
(null,'Wireless','200 mpb/s',8);

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

select*from software;

select*from fronteira join distrito on fronteira.idFronteira = distrito.fkFronteira;
