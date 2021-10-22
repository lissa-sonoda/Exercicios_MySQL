create database db_rh;

use db_rh;

create table tb_endereco(
    cep bigint (8) not null,
    rua varchar(255) not null,
    bairro varchar(255) not null,
    cidade varchar(255) not null,
    primary key (cep)
);

insert into tb_endereco (cep, rua, bairro, cidade) 
	 values (00000111, "Rua 1", "Jardim Sul", "Campinas"),
		(00000222, "Rua 2", "Jardim Norte", "Campinas"),
		(00000333, "Rua 3", "Jardim Centro", "Campinas"),
		(00000444, "Rua 4", "Jardim Leste", "Campinas"),
		(00000555, "Rua 5", "Jardim Oeste", "Campinas");

create table tb_funcionaries(
    id_funcionarie bigint(5) auto_increment,
    nome varchar(255) not null,
    cpf varchar(11) not null,
    salario decimal (10,2),
    ativo boolean,
    endereco_cep bigint not null,
    primary key (id_funcionarie),
    foreign key (endereco_cep) references tb_endereco(cep)
);

insert into tb_funcionaries (nome, cpf, salario, ativo, endereco_cep) 
	 values ("Alisson", "33300011122", 2050.80, true, 00000111),
		("Jorge", "33300011199", 1890.00, false, 00000111),
		("Liliane", "44400011122", 1200.10, true, 00000222),
		("Francisco", "44400011199", 1560.80, false, 00000222),
		("Mariana", "55500011122", 3040.30, true, 00000333),
		("Paula", "55500011199", 2100.10, false, 00000333),
		("Lucas", "66600011122", 1750.60, true, 00000444),
		("Fernando", "66600011199", 2450.10, false, 00000444),
		("Bento", "77700011122", 1910.70, true, 00000555),
		("Gabriela", "77700011199", 2550.00, false, 00000555);

select * from tb_funcionaries where salario > 2000.00;

select * from tb_funcionaries where salario < 2000.00;

update `db_rh`.`tb_funcionaries` set `salario`= '2341.50' where(`id_funcionarie`='9');