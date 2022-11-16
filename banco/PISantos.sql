CREATE DATABASE SANTOSPI;

USE SANTOSPI;

CREATE TABLE USUARIO (idUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
dtnasci date,
genero varchar(45),
email varchar(75),
estado varchar(45),
favorito varchar(45),
cidade varchar(45),
ngosta varchar(45),
senha varchar(45)
);

CREATE TABLE QUIZ (idQUIZ INT PRIMARY KEY AUTO_INCREMENT,
TOTAL int,
fkUSUARIO int,
foreign key(fkUSUARIO) REFERENCES USUARIO(idUSUARIO)
);

select * from usuario;