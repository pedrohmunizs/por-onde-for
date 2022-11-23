CREATE DATABASE SANTOSPI;
DROP database SANTOSPI;
USE SANTOSPI;

CREATE TABLE USUARIO (idUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
dtnasci date,
email varchar(75),
genero varchar(45),
estado varchar(45),
favorito varchar(45),
cidade varchar(45),
ngosta varchar(45),
senha varchar(45)
);

CREATE TABLE QUIZ (idQUIZ INT AUTO_INCREMENT,
TOTAL int,
fkUSUARIO int,
foreign key(fkUSUARIO) REFERENCES USUARIO(idUSUARIO),
primary key(idQuiz,fkUSUARIO)
);

CREATE TABLE AVALIACAO (idAVALIACAO INT PRIMARY KEY AUTO_INCREMENT,
NOTA INT,
fkUSUARIO INT,
FOREIGN KEY(fkUSUARIO) REFERENCES USUARIO(idUSUARIO)
);


select * from usuario;

select TOTAL, count(TOTAL) from QUIZ group by TOTAL ORDER BY TOTAL;
   
select * from quiz;

select ngosta,count(ngosta) from usuario group by ngosta;