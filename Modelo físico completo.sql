create database SA;
use SA;
#drop database SA;
#lista tabelas

#Todos as entidades estão com chave estrageira (Não)
#endereco_agente ok chaves estrangeiras ok
#comissao ok chaves estrangeiras ok
#agente ok chaves estrangeiras ok
#emprestimo ok chaves estrangeiras ok
#parcela ok chaves estrangeiras ok
#cliente (completar chaves estrangeiras) chaves estrangeiras ok
#informacao_comercial ok chaves estrangeiras ok
#conta_cliente ok chaves estrangeiras ok
#informacoes_complementares ok chaves estrangeiras ok
#taxa_administrativa ok  chaves estrangeiras ok
#remessa ok chaves estrangeiras ok
#item_remessa ok chaves estrangeiras ok 
#lista_banco_permitidos ok chaves estrangeiras ok
#empresa ok
#conta_empresa ok 

create table endereco_agente
(
id_endereco int auto_increment,
cep_agente int,
rua_agente varchar(45),
cidade_agente varchar(45),
bairro_agente varchar(45),
numero_agente varchar(45),
primary key (id_endereco)
);

insert into endereco_agente
values (null, '30840010', 'Contadores', 'Belo Horizonte', 'Alipío de Melo', '420'),
	   (null, '30561781', 'Alameda das Acacias', 'Belo Horizonte', 'São Joaquim', '65'),
       (null, '35489734', 'Coronel José Dias Bicalho', 'Belo Horizonte', 'São Joaquim', '250');


create table parcela(
id_parcela int auto_increment,
situacao bit,
#0 para inativo e 1 para inativo 
data_vencimento date,
valor float,
valor_apos_vencimento float,
primary key (id_parcela),
data_pagamento date);

insert into parcela
values ('1', 1, '2021-10-05', '510','1000','2021-10-03'),
	   ('2', 1, '2021-10-05', '300','1000','2021-10-03'),
       ('3', 1, '2021-10-05', '486','1000','2021-10-03');       

CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT,
    parcela_id_parcela INT,
    numero_contrato FLOAT,
    situacao_contrato BIT,
    status_contrato BIT,
    data_emprestimo DATE,
    valor_desconto FLOAT,
    quantidade_parcelas INT,
    vencimento_emprestimo DATE,
    tipo_vencimento_emprestimo VARCHAR(45),
    data_primeira_parcela DATE,
    valor_bruto_emprestimo FLOAT,
    categoria_emprestimo VARCHAR(45),
    data_contrato_emprestimo DATE,
    usuario_cadastro_emprestimo VARCHAR(45),
    atendente_emprestimo INT,
    valor_liquido_emprestimo INT,
    PRIMARY KEY (id_emprestimo),
    FOREIGN KEY (parcela_id_parcela) REFERENCES parcela (id_parcela)
);

insert into emprestimo
value (null, '1', '36987', 1, 1, '2021-08-07', '230', '3', '2021-05-11', 'juros', '2021-09-07', '1530', 'negativado', '2021-08-07', 'marcos ferreira','1', '1530'),
	  (null, '2', '98987', 1, 1, '2021-08-07', '123', '4', '2021-05-11', 'juros', '2021-09-07', '1200', 'negativado', '2021-08-07', 'luiz carlos', '1', '1200'),
	  (null, '3', '97898', 1, 1, '2021-08-07', '216', '15', '2021-05-11', 'juros', '2021-09-07', '7290', 'negativado', '2021-08-07', 'lucas claro', '1', '7290');


create table comissao(
id_comissao int auto_increment,
id_emprestimo int ,
nome_titular varchar(45),
banco varchar(45),
agencia int,
tipo_conta varchar(45),
documento_titular int,
percentual_comissao float,
numero_conta int,
primary key (id_comissao),
foreign key (id_emprestimo) references emprestimo (id_emprestimo)
);

insert into comissao
values (null, '1','Guilherme de Sena','nubank','0001','corrente', '967532578', '10','983576218'),
       (null, '2','Thiago Gomes','inter','0001','corrente', '787421547', '8','897544648'),
       (null, '3','Pedro Silva','nubank','0001','corrente', '748976181', '7','897486424');
     
create table agente(
id_agente int auto_increment,
tipo_agente varchar(2),
nome_agente varchar(45),
celular int(13),
telefone_fixo int(13),
email varchar(575),
status_agente bit not null,
id_endereco int ,
comissao_status bit,
id_comissao int ,
primary key (id_agente),
foreign key (id_endereco) references endereco_agente (id_endereco),
foreign key (id_comissao) references comissao (id_comissao)
);

insert into agente
values (null, 'pf', 'Guilherme de Sena','319956578', '31387524', 'guilherme.sena@gmail.com', 1, '1', 1, '1'),
       (null, 'pj', 'Thiago Gomes','319879324', '31375963', 'Thiago.gomes@gmail.com', 1, '2', 1, '2'),
       (null, 'pf', 'Pedro Silva','319936587', '31398956', 'Pedro.silva@gmail.com', 1, '3', 1, '3');

create table informacao_complementar
(
id_informacao_complementar int auto_increment,
nome_mae varchar(45),
nome_pai varchar(45),
cartorio varchar(45),
primary key (id_informacao_complementar)
);

insert into informacao_complementar
values (null, 'Maria ventura', 'Marcos Ventura', 'Venda Nova'),
	   (null, 'Luana Padilha', 'Lucas Padilha', 'Centro'),
       (null, 'Marina Lins', 'Luiz Lins', 'Venda Nova');

create table conta_cliente(
id_conta_cliente int auto_increment,
tipo_conta varchar(45),
conta_cliente int,
agencia_cliente int,
digito_conta_cliente int,
operacao_cliente varchar(45),
banco_cliente varchar(45),
digito_agencia int,
primary key (id_conta_cliente)
);

insert into conta_cliente
values (null, 'corrente', '983567241', '0001', '9', 'corrente', 'Nubank', '1'),
       (null, 'poupança', '653817620', '0005', '8', 'poupança', 'inter', '9'),
       (null, 'poupança', '848972375', '0009', '5', 'poupança', 'inter', '5');

create table taxa_administrativa(
#TA = taxa administrativa
id_TA int auto_increment,
situacao bit, 
tipo_vencimento varchar(45),
valor float,
vencimento date,
data_inicio_tax date,
primary key (id_TA)
);

insert into taxa_administrativa
values (null, 1, 'mensal', '51', '2021-10-05', '21-08-07'),
       (null, 1, 'mensal', '30', '2021-10-05', '21-08-07'),
       (null, 1, 'mensal', '48', '2021-10-05', '21-08-07');

create table lista_bancos_permitidos(
codigo_banco int auto_increment,
nome_banco varchar(45),
primary key (codigo_banco)
);

insert into lista_bancos_permitidos
values (null, 'nubank'),
       (null, 'inter'),
       (null, 'Banco do Brasil'),
       (null, 'Bradesco');

create table informacao_comercial(
id_info_comer int auto_increment,
local_de_trabalho varchar(45),
tel_comercial int,
beneficio varchar(45),
primary key (id_info_comer)
);

insert into informacao_comercial
values (null,'INSS', '319885213', 'MASP'),
	   (null,'Bombeiro', '319744645', 'SIAPE'),
       (null,'Prefeitura', '319537478', 'MASP');

create table cliente 
(
#chave primaria
id_cliente int auto_increment,
#chave estrangeira
id_emprestimo int,
id_conta_cliente int,
id_informacao_complementar int,
id_taxa_adimistrativa int,
id_informacao_comercial int,
id_agente int,
#atributos
nome varchar (45),
sexo varchar(10),
telefone_fixo int,
data_nascimento date,
id_documento int,
celular_cliente int,
email_cliente varchar (575),
data_cadastro date,
cpf int,
primary key (id_cliente),
foreign key (id_emprestimo) references emprestimo (id_emprestimo),
foreign key (id_conta_cliente) references conta_cliente (id_conta_cliente),
foreign key (id_informacao_complementar) references informacao_complementar (id_informacao_complementar),
foreign key (id_taxa_adimistrativa) references taxa_administrativa (id_TA),
foreign key (id_informacao_comercial) references informacao_comercial (id_info_comer),
foreign key (id_agente) references agente (id_agente)
);

insert into cliente
values (null,'1','1','1','1','1','1','Thiago Ventura', 'Masculino', '3596','1989-10-21','97895882','985224156','thiago.ventura@gmail.com', '2021-05-10', '669861276'),
       (null,'2','2','2','2','2','2','Afonso Padilha', 'Masculino', '8214','1995-05-13','87185445','978996553','afonso.padilha@gmail.com', '2020-07-22', '789781415'),
       (null,'3','3','3','3','3','3','Christina Lins', 'Femenino', '4763','1997-01-02','95214578','977454145','thiago.ventura@gmail.com', '2021-06-08', '789804156');

create table item_remessa(
id_item_remessa int auto_increment,
valor int,
data_retorno date,
codigo_retorno int,
data_vencimento_item date,
numero_agendamento int,
primary key (id_item_remessa)
);

insert into item_remessa
values (null, '1530', '2021-10-05','1', '2021-10-05', '1'),
	   (null, '1200', '2021-10-05','2', '2021-10-05', '2'),
       (null, '7290', '2021-10-05','3', '2021-10-05', '3');

create table remessa(
id_remessa int auto_increment,
#Chave estrangeira
taxa_administrativa_id int,
id_item_remessa int,
id_emprestimo int, 
#Atributos
usuario_registro varchar(45),
nsa int,
registro_envio int,
data_envio date,
primary key (id_remessa),
foreign key (taxa_administrativa_id) references taxa_administrativa (id_TA),
foreign key (id_item_remessa) references item_remessa (id_item_remessa),
foreign key (id_emprestimo) references emprestimo (id_emprestimo)
);

insert into remessa
values (null, '1', '1','1', 'Guilherme de Sena', '06896', '5645' ,'2021-10-03'),
       (null, '2', '2','2', 'Thiago Gomes', '06852', '6888' ,'2021-10-03'),
       (null, '3', '3','3', 'Pedro Silva', '06863', '5278' ,'2021-10-03');

create table conta_empresa(
id_CE int auto_increment,
#CE = Conta empresa
apelido_conta varchar(45),
agencia int,
digito_agencia int, 
digito_conta int,
nsa_empresa int,
codigo_agencia int,
conta_empresa int,
operacao_empresa varchar(45),
banco_empresa varchar(45),
primary key (id_CE)
);

insert into conta_empresa
values (null, 'principal', '0001', '1', '2', '046876', '121' ,'569878676', 'Corrente', 'Nubank'),
	   (null, 'principal', '0003', '4', '8', '846847', '545' ,'787487495', 'Poupança', 'Banco do Brasil'),
       (null, 'principal', '0008', '9', '5', '987769', '544' ,'457489754', 'Poupança', 'inter');
       
create table empresa(
id_empresa int auto_increment,
id_conta_empresa int,
nome varchar(45),
celular varchar(45),
email varchar(575),
bairro varchar(100),
cidade varchar(400),
cep int,
numero int,
rua varchar(45),
cnpj int,
primary key (id_empresa),
foreign key (id_conta_empresa) references conta_empresa (id_CE)
);

insert into empresa
values (null, '1', 'infopampulha', '31987563275', 'infopampulha@gmail.com', 'São Joaquim', 'Belo Horizonte', '324895660', '578', 'jose dias bicalho', '5646857'),
	   (null, '2', 'Uai de Minas', '31986489454', 'uaideminas@gmail.com', 'alipio de melo', 'Belo Horizonte', '648545421', '320', 'avenida dos engenheiros', '6545445'),
       (null, '3', 'Araujo', '31979820212', 'araujo@gmail.com', 'Paquetá', 'Belo Horizonte', '55686565', '2500', 'avenida tancredo neves', '6856868');

#Parte 2
#Questão 1 
select 
    *
from
    agente;

#Questão 2
select c.nome, e.numero_contrato, e.situacao_contrato, e.status_contrato, e.data_contrato_emprestimo, e.valor_liquido_emprestimo  from emprestimo as e
join cliente c 
on e.id_emprestimo = c.id_cliente
where c.id_cliente = '1'
order by nome;

#Questão 3
select e.numero_contrato, e.data_contrato_emprestimo, e.valor_bruto_emprestimo, e.valor_liquido_emprestimo, e.quantidade_parcelas, c.id_agente, e.situacao_contrato, p.id_parcela, p.data_vencimento, p.valor,p.situacao
from emprestimo e
join cliente c 
on e.id_emprestimo = c.id_cliente
join parcela p 
on p.id_parcela = e.parcela_id_parcela
order by nome;

#Questão 4
create view lista_taxa_adm
as select taxa_administrativa.id_TA, cliente.id_cliente, cliente.nome, 
		  agente.id_agente, agente.nome_agente, taxa_administrativa.situacao,
	      taxa_administrativa.data_inicio_tax, taxa_administrativa.tipo_vencimento, taxa_administrativa.valor,
		  conta_cliente.id_conta_cliente
from taxa_administrativa
inner join cliente on taxa_administrativa.id_TA = cliente.id_taxa_adimistrativa
inner join agente on cliente.id_agente = agente.id_agente
inner join conta_cliente on cliente.id_conta_cliente = conta_cliente.id_conta_cliente;
#Questão 5
select * from lista_taxa_adm 
where id_cliente = 1;
#Questão 6
SET GLOBAL log_bin_trust_function_creators = 1;
delimiter $
create function retorn_quantidade_parcela(numero_contrato int)
returns int
begin
	declare resultado int;
	select emprestimo.numero_contrato, parcela.quantidade_parcelas into resultado
	from emprestimo 
	inner join parcela on emprestimo.parcela_id_parcela = parcela.id_parcela;
	return resultado;
end
$
#Questão 7
delimiter $
create procedure listagem (in num_nsa int)
begin
select remessa.nsa, cliente.id_cliente, cliente.nome, 
parcela.data_vencimento, parcela.valor, parcela.valor_apos_vencimento, 
conta_cliente.agencia_cliente, conta_cliente.conta_cliente
from remessa
inner join cliente on cliente.id_cliente = remessa.id_remessa 
inner join parcela on parcela.id_parcela = remessa.id_remessa
inner join conta_cliente on conta_cliente.id_conta_cliente = remessa.id_remessa
where remessa.nsa=num_nsa;
end
$
call listagem(6896);
#Questão 8
DELIMITER $$ 
create trigger atualizaNSA
before insert on remessa
for each row 
begin 
   set NEW.nsa = (select nsa from remessa order by nsa desc limit 1) + 1;
end 
$$ 
DELIMITER ;
