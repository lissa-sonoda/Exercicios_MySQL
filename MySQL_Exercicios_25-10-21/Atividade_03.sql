/*
 *Atividade_03
 *@author Helen Lissa Sonoda
 *Date: 25/10/2021
 */
 
/*
Enunciado - parte 1

Crie um banco de dados para um serviço de farmácia de uma empresa, 
o nome do banco deverá ter o seguinte nome db_farmacia_do_bem, 
onde o sistema trabalhará com as informações dos produtos desta empresa. 
O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.
*/

create database db_farmacia_do_bem;

use db_farmacia_do_bem;

/*
Enunciado - parte 2

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos 
relevantes do tb_categoria para se trabalhar com o serviço desta farmacia.

Popule esta tabela categoria com até 5 dados.
*/

create table tb_categoria(
	id_categ bigint(3) auto_increment,
	nome_categ varchar(30) not null,
    tipo_categ varchar(255) not null,
    primary key(id_categ)
);

insert into tb_categoria(nome_categ, tipo_categ) 
	values ("Shampoo", "Cuidados Diários"),
			("Sabonete", "Cuidados Diários"),
			("Comprimido", "Medicamentos"),
            ("Xarope", "Medicamentos"),
            ("Cápsula", "Vitaminas"),
            ("Fralda", "Mamãe e Bebê"),
            ("Meia de Compressão", "Ortopedia");

/*
Enunciado - parte 3

Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5 atributos 
relevantes dos tb_produto para se trabalhar com o serviço deste farmacia
(não esqueça de criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela produto com até 8 dados.
*/

create table tb_produto(
	id_prod bigint(3) auto_increment,
    nome_prod varchar(255) not null,
    quantidade real not null,
    unidade varchar(10) not null,
    preco real not null,
	fk_categ bigint(3),
    primary key(id_prod),
    foreign key(fk_categ) references tb_categoria(id_categ)
);

insert into tb_produto(nome_prod, quantidade, unidade, preco, fk_categ)
	values ("Shampoo Seda Recarga Natural Pureza Detox", 325, "ml", 10.69, 1),
			("Shampoo Pantene Bambu Nutre e Cresce", 200, "ml", 13.50, 1),
			("Sabonete em Barra Lux Botanicals Lavanda", 85, "g", 2.29, 2),
            ("Sabonete Antibacteriano Cremoso Needs", 250, "ml", 7.99, 2),
            ("Novalgina com 10 comprimidos", 1, "g", 18.90, 3),
            ("Loratadina Neo Química com 12 comprimidos", 10, "mg", 11.90, 3),
            ("Vick 44E Xarope Expectorante", 120, "ml", 17.79, 4),
            ("Hytós Plus Xarope", 100, "ml", 16.29, 4),
            ("Sundown Omega Fish Oil EPA com 120 cápsulas", 1000, "mg", 129.49, 5),
            ("Elixir Vitamina E 60 cápsulas", 400, "mg", 25.90, 5),
            ("Fralda Huggies Tripla Proteção P", 46 , "un", 34.90, 6),
            ("Fralda Pampers Recém-Nascido Premium Care RN", 36, "un", 34.59, 6),
            ("Meia F Kendall Média Compressão 3/4 sem Ponteira Tam M", 1, "par", 66.19, 7),
            ("Meia M Kendall Média Compressão 3/4 Tam M", 1 , "par", 110.99, 7);

/*
Enunciado - parte 4

Faça um select que retorne os Produtos com o valor maior do que 50 reais.
*/

select tb_produto.nome_prod as "Nome do Produto", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
	tb_produto.preco as "Preço"
	from tb_produto inner join tb_categoria
	on tb_categoria.id_categ = tb_produto.fk_categ
	where tb_produto.preco > 45
	order by tb_categoria.nome_categ;
    
/*
Enunciado - parte 5

Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
*/
    
select tb_produto.nome_prod as "Nome do Produto", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
	tb_produto.preco as "Preço"
	from tb_produto inner join tb_categoria
	on tb_categoria.id_categ = tb_produto.fk_categ
	where tb_produto.preco between 3 and 60
	order by tb_categoria.tipo_categ desc;
    
/*
Enunciado - parte 6

Faça um select utilizando LIKE buscando os Produtos com a letra B.
*/

select tb_produto.nome_prod as "Nome do Produto", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
	tb_produto.preco as "Preço"
	from tb_produto inner join tb_categoria
	on tb_categoria.id_categ = tb_produto.fk_categ
	where tb_produto.nome_prod like "%b%"
	order by tb_categoria.tipo_categ desc;
    
/*
Enunciado - parte 7

Faça um select com Inner join entre tabela categoria e produto.
*/

select * from tb_produto inner join tb_categoria
	on tb_categoria.id_categ = tb_produto.fk_categ;

/* Comando para contar quantas linhas tem na tabela */
select count(*) from tb_produto;

/*
Enunciado - parte 8

Faça um select onde traga todos os Produtos de uma categoria específica 
(exemplo todos os produtos que são cosméticos).
*/

select tb_produto.nome_prod as "Nome do Produto", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
	tb_produto.preco as "Preço"
	from tb_produto inner join tb_categoria
	on tb_categoria.id_categ = tb_produto.fk_categ
	where tb_categoria.tipo_categ like "%Medicamentos%"
	order by tb_produto.nome_prod;

select tb_produto.nome_prod as "Nome do Produto", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
	tb_produto.preco as "Preço"
	from tb_produto inner join tb_categoria
	on tb_categoria.id_categ = tb_produto.fk_categ
	where tb_categoria.id_categ like 1
	order by tb_produto.nome_prod;