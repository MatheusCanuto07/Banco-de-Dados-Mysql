use universidade2;

create table aluno 
(
MAT int not null,
nome varchar(45) not null,
endereco varchar(45) not null,
cidade varchar(45) not null,
primary key (MAT)
);

create table disciplinas
(
COD_DISC int not null,
nome_disc varchar(45) not null,
carga_hot int not null,
primary key (COD_DISC)
);

create table professores 
(
COD_PROF int not null,
nome varchar(45) not null,
endereco varchar(100) not null,
cidade varchar(50) not null,
primary key (COD_PROF)
);

create table turma 
(
COD_TURMA int not null,
COD_DISC int not null,
COD_PROF int not null,
ANO int not null,
horario int not null,
primary key (COD_TURMA)
);

alter table turma add foreign key (COD_DISC) references disciplina (COD_DISC);
alter table turma add foreign key (COD_PROF) references professores (COD_PROF);

create table historico
(
MAT int not null,
COD_DISC int not null,
COD_TURMA int not null, 
COD_PROF int not null,
ANO_ID int not null,
frequencia int not null,
nota int not null, 
primary key (ANO_id)
);

alter table historico add foreign key (MAT) references aluno (MAT);

insert into aluno (MAT,nome,endereco,cidade)
values
('0005', 'Mauricio', 'Ouro Preto', 'BH');

insert into disciplinas (COD_DISC,nome_disc,carga_hot)
values 
('0005', 'Fisica', '6');

insert into professores values 
('0006', 'Guilherme', 'Padre Eustaquio', 'Contagem');

insert into turma values
('0001', '0001', '0001', '2002', '0010'),
('0002', '0002', '0003', '2020', '0050'),
('0003', '0003', '0004', '2006', '1730'),
('0004', '0004', '0005', '2002', '1859'),
('0005', '0005', '0006', '2002', '2359');

insert into historico values 
('1','1','1','0','1','80','100'),
('2','2','2','1','2','65','80'),
('3','3','3','2','3','10','25'),
('4','4','4','3','4','20','65'),
('5','5','5','4','5','100','90');

select nome
from aluno
inner join historico
on aluno.MAT = historico.MAT where COD_DISC = '0002';
#Transforma uma chave estrangeira em outro atributo 

select * from disciplinas;
select MAT,COD_DISC from historico where COD_DISC = '3';
select MAT,ANO_ID from historico where ANO_ID = '1';
select * from turma where COD_PROF = '02' and COD_DISC = '02';
select * from aluno where cidade = 'Contagem';
select * from historico;
select * from historico where COD_TURMA = '5';