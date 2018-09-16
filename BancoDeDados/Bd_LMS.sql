create database db_LMS

use db_LMS

create table Usuario(
Id tinyint identity not null,
Login varchar(20) not null,
Senha varchar(10)  not null,
DtExpiracao varchar(10)  not null constraint dfdtexpiracao default '01/01/1900' ,
constraint pkid primary key (id),
constraint uqlogin UNIQUE (Login)
)



create table Coordenador(
Id tinyint identity  not null,
Id_usuario tinyint  not null,
Nome varchar(20)  not null,
Email varchar(20)  not null,
Celular varchar(12)  not null,
constraint pkid_coord primary key(Id),
constraint fkusuario foreign key (Id_usuario) references Usuario(Id),
constraint uqemail UNIQUE(Email)
)

create table Aluno(
Id tinyint identity not null,
Id_usuario tinyint  not null,
Nome varchar(20)  not null,
Email varchar(20)  not null,
Celular varchar(12)  not null,
Ra smallint  not null,
Foto varchar(30),
constraint pkid_aluno primary key (id),
constraint fkusuario2 foreign key (Id_usuario) references Usuario(Id),
constraint uqemail2 UNIQUE(Email),
constraint uqcelular2 UNIQUE(Celular)
)


create table Professor (
Id tinyint identity not null,
Id_usuario tinyint  not null,
Email varchar(20)  not null,
Celular varchar(12)  not null,
Apelido varchar(10)  not null,
constraint pkid_prof primary key(id),
constraint fkusuario3 foreign key (Id_usuario) references Usuario(Id),
constraint uqemail3 UNIQUE(Email),
constraint uqcelular3 UNIQUE(Celular)
)


create table Disciplina(
Id tinyint identity not null,
Nome varchar(20) not null, 
Data date not null constraint dfdata DEFAULT getdate(),
Status varchar(7) not null constraint dfStatus default 'Aberta',
PlanodeEnsino varchar(50) not null,
CargaHoraria tinyint not null,
Competencias varchar(100) not null,
Habilidades varchar(100) not null,
Ementa varchar(100) not null,
ConteudoProgramatico varchar(100) not null,
BibliografiaBasica varchar(100) not null,
BibliografiaComplementar varchar(100) not null,
PercentualPratico tinyint not null,
PercentualTeorico tinyint not null,
IdCoordenador tinyint not null,
constraint pkDisciplina primary key(Id),
constraint fkIdCoordenador foreign key (IdCoordenador) references Coordenador(Id),
constraint uqnome unique(Nome),
constraint ckstatus CHECK(Status='Aberta' or Status='Fechada'),
constraint ckcargahoraria CHECK(CargaHoraria=40 or CargaHoraria=80),
constraint ckpercentualpratico CHECK(PercentualPratico between 0 and 100),
constraint ckpercentualteorico CHECK(PercentualTeorico between 0 and 100)

)


create table DisciplinaOfertada(
Id tinyint identity not null,
IdCoordenador tinyint not null,
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
constraint fkIdCoordenadorDisciplicaOfertada foreign key (IdCoordenador) references Coordenador(Id),
constraint fkIdDisciplina foreign key (IdDisciplina) references Disciplina(Id),
constraint fkIdCurso foreign key (IdCurso) references Curso(Id),
constraint ckAno CHECK (Ano between 1900 and 2100),
constraint ckSemestre CHECK (Semestre between 1 and 2),
constraint Turma CHECK (Turma LIKE '[A-Z]' or Turma LIKE '[a-z]'),
constraint fkIdProfessor foreign key (IdProfessor) references Professor(Id)
)


create table Curso(
Id tinyint not null,
Nome varchar(20) not null,
constraint pkCurso primary key (Id),
constraint uqNomeCurso unique(Nome)
)

create table SolicitacaoMatricula(
ID tinyint not null,
IdAluno tinyint not null,
IdDisciplinaOfertada tinyint not null,
DtSolicitacao datetime not null constraint dfdtsolicitacao DEFAULT getdatetime()
IdCoordenador tinyint not null,
Status varchar(15) not null constraint dfStatus DEFAULT 'Solicitada',
constraint pkSolicitacaoMat primary key(ID),
constraint fkIdAluno foreign key (IdAluno) references Aluno(Id),
constraint fkIdDisciplinaOfer foreign key (IdDisciplinaOfertada) references DisciplinaOfertada(Id),
constraint fkIdCoord foreign key (IdCoordenador) references Coordenador(Id),
constraint ckstatus CHECK(Status='Solicitada' or Status='Aprovada' or Status='Rejeitada' or Status='Cancelada')
)

create table Atividade(
ID tinyint not null,
Titulo varchar(30) not null,
Descricao varchar(100) null,
Conteudo varchar(100) not null,
Tipo varchar(20) not null,
Extras varchar(100) null,
IdProfessor tinyint not null,
constraint pkAtividade primary key(ID),
constraint uqTituloAtividade unique(Titulo)
constraint ckTipo CHECK(Tipo='Resposta Aberta' or Tipo='Teste'),
constraint fkIdProf foreign key (IdProfessor) references Professor(Id)
)
create table AtividadeVinculada

(
 ID tinyint identity not null
 ,IdAtividade¹ tinyint not null
 ,IdProfessor tinyint not null
 ,IdDisciplinaOfertada tinyint not null
 ,Rotulo¹ varchar (4) not null
 ,[Status] varchar (16) not null
 ,DtInicioRespostas date not null
 .DtFimRespostas date not null
 ,constraint pkAtividadeVinculada primary key (ID)
 ,constraint fkAtividadeVinculadaIdAtividade¹ FOREIGN KEY (IdAtividade) REFERENCES Atividade (Id)
 ,constraint fkAtividadeVinculadaIdProfessor Foreign key (IdProfessor) References Professor (Id)   
 ,constraint fkAtividadeVinculadaIdDisciplinaOfertada foreign key (IdDisciplinaOfertada) references Disciplina (Id)  
 ,constraint ckstatus check (status = 'Disponibilizada' or Status = 'Aberta' or Status ='Fechada' or Status= 'Encerrada' or Status ='Prorrogada' 
    );
    
 Create Table Entrega
 (
  ID tinyint Identity not null
  ,IdAluno¹ tinyint not null 
  ,IdAtividadeVinculada¹ tinyint not null
  ,Titulo varchar(30) not null 
  ,Resposta varchar (40) not null
  ,DtEntrega date not null constraint dfDtEntrega default (getdate())    
  ,[Status] varchar (10) not null constraint dfEntregaStatus default 'Entregue'    
  ,IdProfessor tinyint not null
  ,Nota decimal not null
  ,DtAvaliacao date not null
  ,Obs varchar (50) not null
  ,constraint pkEntrega primary key (ID)   
  ,constraint fkEntregaIdAluno foreign key (IdAluno¹) References Aluno (Id)    
  ,constraint fkEntregaAtividadeVinculada foreign key (IdAtividadeVinculada¹) references AtividadeVinculada (Id)   
  ,constraint fkEntregaIdProfessor foreign key (IdProfessor) references Professor (Id)   
  ,constraint cknota Check(nota between 0.00 and 10.00)
    );

