create database db_LMS

use db_LMS

create table Usuario(
Id tinyint identity not null,
Login varchar(20),
Senha varchar(10),
DtExpiracao varchar(10) constraint dfdtexpiracao default '01/01/1900',
constraint pkid primary key (id),
constraint uqlogin UNIQUE (Login)
)

create table Coordenador(
Id tinyint identity  not null,
Id_usuario tinyint,
Nome varchar(20),
Email varchar(20),
Celular varchar(12),
constraint pkid_coord primary key(Id),
constraint fkusuario foreign key (Id_usuario) references Usuario(Id),
constraint uqemail UNIQUE(Email)
)

create table Aluno(
Id tinyint identity not null,
Id_usuario tinyint,
Nome varchar(20),
Email varchar(20),
Celular varchar(12),
Ra smallint,
Foto varchar(30),
constraint pkid_aluno primary key (id),
constraint fkusuario2 foreign key (Id_usuario) references Usuario(Id),
constraint uqemail2 UNIQUE(Email),
constraint uqcelular2 UNIQUE(Celular)
)


create table Professor (
Id tinyint identity not null,
Id_usuario tinyint,
Email varchar(20),
Celular varchar(12),
Apelido varchar(10),
constraint pkid_prof primary key(id),
constraint fkusuario3 foreign key (Id_usuario) references Usuario(Id),
constraint uqemail3 UNIQUE(Email),
constraint uqcelular3 UNIQUE(Celular)
)


