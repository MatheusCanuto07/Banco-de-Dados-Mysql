Create database departamento_correcao;
use departamento_correcao;

create table funcionario(
id_funcionario int,
primeironome varchar(40),
segundonome varchar(40),
ultimoonome varchar(40),
datanasci date,
cpf int,
rg varchar(40),
rua varchar(40),
bairro varchar(40),
cidade varchar(40),
estado varchar(40),
cep int,
fone int,
id_departamento_F int,
funcao varchar(40),
salario float,
primary key (id_funcionario)
);

alter table funcionario add foreign key (id_departamento_F) references departamento (id_departamento);
drop table funcionario;

create table departamento (
id_departamento int,
nome varchar(40),
localizacao varchar(40),
id_funcionario_gerente varchar(40),
primary key (id_departamento)
);

insert into funcionario
values ('101', 'Matheus','Henrique','Canuto','2003-11-26','162','464','Pascoal da silva', 'Nacional', 'Contagem', 'Minas Gerais', '32185120', '31999784358', '101', 'programador', '600'),
	   ('102', 'Sandra','Menezes','Canuto','2008-11-26','162','464','Pascoal da silva', 'Nacional', 'Contagem', 'Minas Gerais', '32185120', '31999784358', '102', 'frentista', '3300'),
       ('103', 'Mauricio','Lacerda','Canuto','1980-11-26','162','464','Pascoal da silva', 'Nacional', 'Contagem', 'Minas Gerais', '32185120', '31999784358', '103', 'Uber', '4000'),
       ('104', 'Rebeca','Marques','Canuto','2015-11-26','162','464','Pascoal da silva', 'Nacional', 'Contagem', 'Minas Gerais', '32185120', '31999784358', '104', 'Pedagoga', '6000'),
       ('105', 'Marcio','Cesar','Canuto','2006-11-26','162','464','Pascoal da silva', 'Nacional', 'Contagem', 'Minas Gerais', '32185120', '31999784358', '105', 'Professora', '1000');

insert into departamento
values ('101', 'Financeiro', 'Centro', '101'),
       ('102', 'RH', 'Centro', '102'),
       ('103', 'Educacao', 'Centro', '103'),
       ('104', 'Pedagogia', 'Centro', '104'),
       ('105', 'Financeiro', 'Centro', '105');

#1
select primeironome, segundonome
from funcionario
order by segundonome;

#2
select * 
from funcionario
order by cidade;

#3
select primeironome, salario
from funcionario
where salario > 1000
order by primeironome;

#4
select primeironome, datanasci
from funcionario
order by datanasci desc;

#5
select primeironome, segundonome, ultimoonome, fone
from funcionario
order by ultimoonome asc, primeironome, segundonome, fone;

#6
select sum(salario) as Total
from funcionario;

#7
select funcionario.primeironome, departamento.nome as Setor, funcionario.funcao
from funcionario inner join departamento
on funcionario.id_departamento_F = departamento.id_departamento
order by funcionario.primeironome;

#8
select departamento.nome, departamento.id_funcionario_gerente, funcionario.id_funcionario
from departamento
inner join funcionario
on departamento.id_funcionario_gerente = funcionario.id_funcionario;

#9 
select departamento.nome, sum(funcionario.salario) as Total_Salario
from funcionario
inner join departamento
on funcionario.id_departamento_F = departamento.id_departamento
group by departamento.nome;

#10
select departamento.nome, funcionario.primeironome
from departamento
inner join funcionario
on departamento.id_departamento = funcionario.id_departamento_F
where funcionario.funcao = 'uber';

#11
select count(funcionario.id_funcionario) as Quant_Fun
from funcionario;

#12
select avg(funcionario.salario) as Média_salarial
from funcionario;

#13
select min(funcionario.salario) as Min_salario, departamento.nome
from departamento
inner join funcionario
on departamento.id_departamento = funcionario.id_departamento_F
group by departamento.nome;

#14
select primeironome, segundonome, ultimoonome
from funcionario
where segundonome is null
order by primeironome, ultimoonome;

#15
select funcionario.primeironome, departamento.nome
from funcionario
inner join departamento 
on departamento.id_departamento = funcionario.id_departamento_F
order by departamento.nome, funcionario.primeironome;

#16
select primeironome
from funcionario
where cidade = 'contagem' and funcao = 'analista';

#17
select primeironome
from funcionario
where id_departamento_F = (select id_departamento
from departamento 
where nome = 'RH');

#18
select primeironome, nomedepartamento
from funcionario F
inner join departamento D inner on F.codigo_departamento = D.codigo_departamento
where F.salario_funcionario > 
some (select salario_funcionario from funcionarios
where codigo_funcionario in (select codigo_funcionario from departamento) );