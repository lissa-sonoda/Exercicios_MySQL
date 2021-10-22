create database db_escola;

use db_escola;

create table tb_estudante(
    id_estudante bigint auto_increment,
    nome varchar(100) not null,
    data_nasc date not null,
    turma varchar(100) not null,
    nota decimal(10,2) not null,
    primary key (id_estudante)
);

insert into tb_estudante (nome, data_nasc, turma, nota)
	 values ("Lucas", '1990-05-06', "4ª série A", 8.2),
		("Luana", '1992-04-14', "2ª série B", 9.8),
		("Matheus", '1991-03-28', "3ª série C", 5.4),
		("Davi", '1991-04-24', "3ª série A", 3.8),
		("Miguel", '1991-06-08', "3ª série B", 7.5),
		("Paula", '1992-07-04', "2ª série C", 5.2),
		("Pedro", '1992-01-14', "2ª série A", 6.7),
		("Fernanda", '1990-02-20', "4ª série B", 9.7);
    
select * from tb_estudante where nota > 7.00;

select * from tb_estudante where nota < 7.00;

update `db_escola`.`tb_estudante` set `nota`='6.8' where(`id_estudante`='4');