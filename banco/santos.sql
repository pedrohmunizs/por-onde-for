CREATE DATABASE SANTOSPI;
DROP database SANTOSPI;
USE SANTOSPI;

CREATE TABLE usuario (id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email varchar(75),
genero varchar(45),
ngosta varchar(45),
favorito varchar(45),
local_ varchar(45),
senha varchar(45)
);

CREATE TABLE quiz (idquiz INT AUTO_INCREMENT,
total int,
fkusuario int,
foreign key(fkusuario) REFERENCES usuario(id),
primary key(idquiz,fkusuario)
);

CREATE TABLE avaliacao (idavaliacao INT PRIMARY KEY AUTO_INCREMENT,
nota INT,
fkusuario INT,
FOREIGN KEY(fkusuario) REFERENCES usuario(id),
descricao varchar(250)
);


create table aviso (idAviso int primary key auto_increment,
fkusuario int,
foreign key(fkusuario) references usuario(id),
titulo varchar(45),
descricao varchar(200)
);

select * from usuario;
select * from quiz;
select * from avaliacao;
select * from aviso;