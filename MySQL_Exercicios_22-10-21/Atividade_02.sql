create database db_ecommerce;

use db_ecommerce;

create table tb_produto(
    id_prod bigint auto_increment,
    nome varchar(100) not null,
    categoria varchar(100) not null,
    preco decimal(10,2) not null,
    quantidade bigint not null,
    primary key (id_prod)
);

insert into tb_produto (nome, categoria, preco, quantidade)
	 values ("Televisão", "Eletrônicos", 5060.00, 50),
		("Geladeira", "Eletrodomésticos", 2100.00, 80),
		("Microondas", "Eletrodomésticos", 300.00, 65),
		("Armário", "Móveis", 405.00, 30),
		("Sofá", "Móveis", 380.00, 15),
		("Vaso de Flor", "Decoração", 58.00, 240),
		("Computador", "Eletrônicos", 3560.70, 98),
		("Mesa de cozinha", "Móveis", 480.00, 48);
    
select * from tb_produto where preco > 500.00;

select * from tb_produto where preco < 500.00;

update `db_ecommerce`.`tb_produto` set `quantidade`='420' where(`id_prod`='6');