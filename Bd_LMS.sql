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


create table Disciplina(
Id tinytint identity not null
Nome varchar(20) 
Data date
Status varchar(7) constraint dfStatus default 'Aberta'
Plano de Ensino varchar(50)
Carga Horaria tinyint
Competencias varchar(100)
Habilidades varchar(100)
Ementa varchar(100)
Conteudo Programatico varchar(100)
Bibliografia Básica varchar(100)
Bibliografia Complementar varchar(100)
Percentual Pratico tinyint
Percentual Teórico tinyint
IdCoordenador tinyint not null
constraint pkDisciplina primary key(Id)
constraint fkIdCoordenador foreign key IdCoordenador references Coordenador(IdCoordenador)
constraint uqnome unique(Nome)
)


create table DisciplinaOfertada(
Id tinyint identity not null,
IdCoordenador smallint not null,
DtInicioMatricula smallint null,
DtFimMatricula smallint null,
IdDisciplina tinyint not null,
IdCurso tinyint not null,
Ano smallint not null,
Semestre tinyint not null,
Turma char(1) not null,
IdProfessor tinyint null,
Metodologia varchar(255) null,
Recursos varchar(255) null,
CriterioAvaliacao varchar(255) null,
PlanoDeAulas varchar(255) null,
constraint pkDisciplinaOfertada primary key (Id),
constraint fkIdCoordenadorDisciplicaOfertada foreign key IdCoordenador references Coordenador(Id),
constraint fkIdDisciplina foreign key IdDisciplina references Disciplina(Id),
constraint fkIdCurso foreign key IdCurso references Curso(Id),
constraint ckAno CHECK (Ano between 1900 and 2100),
constraint ckSemestre CHECK (Semestre between 1 and 2),
constraint Turma CHECK (Turma LIKE '[A-Z]' or Turma LIKE '[a-z]'),
constraint fkIdProfessor foreign key IdProfessor references Professor(Id)
)


create table Curso(
Id tinyint not null,
Nome varchar(55) not null,
constraint uqNomeCurso unique(Curso)
)

