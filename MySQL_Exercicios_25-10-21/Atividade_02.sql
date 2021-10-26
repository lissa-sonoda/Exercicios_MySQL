/*
 *Atividade_02
 *@author Helen Lissa Sonoda
 *Date: 25/10/2021
 */

/*
Enunciado - parte 1

Crie um banco de dados para um serviço de pizzaria de uma empresa, 
o nome do banco deverá ter o seguinte nome db_pizzaria_legal, 
onde o sistema trabalhará com as informações dos produtos desta empresa. 
O sistema trabalhará com 2 tabelas tb_pizza e tb_categoria.
*/

create database db_pizzaria_legal;

use db_pizzaria_legal;

/*
Enunciado - parte 2

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos 
relevantes do tb_categoria para se trabalhar com o serviço dessa pizzaria.

Popule esta tabela categoria com até 5 dados.
*/

create table tb_categoria(
    id_categ bigint(3) auto_increment,
    nome_categ varchar(30) not null,
    tipo_categ varchar(255) not null,
    primary key(id_categ)
);

insert into tb_categoria(nome_categ, tipo_categ) 
	values ("Tradicionais", "Salgada"),
	    ("Especiais", "Salgada"),
            ("Vegetarianas", "Salgada"),
            ("Sensacionais", "Doce"),
            ("Frutas", "Doce");

/*
Enunciado - parte 3

Crie uma tabela de tb_pizza e utilizando a habilidade de abstração e determine 5 atributos 
relevantes dos tb_produto para se trabalhar com o serviço dessa pizzaria
(não esqueça de criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela pizza com até 8 dados.
*/

create table tb_pizza(
    id_pizza bigint(3) auto_increment,
    nome_pizza varchar(30) not null,
    ingrediente varchar(255) not null,
    tamanho varchar(10) not null,
    preco real not null,
    fk_categ bigint(3) not null,
    primary key(id_pizza),
    foreign key(fk_categ) references tb_categoria(id_categ)
);

insert into tb_pizza(nome_pizza, ingrediente, tamanho, preco, fk_categ)
	values ("Americana", "mussarela, presunto, tomate e azeitonas", "grande", 35.40, 1),
	    ("Baiana", "mussarela, calabresa moída, ovos, pimenta, cebola e azeitonas", "família", 48.70, 1),
            ("Noruega", "mussarela, bacalhau, catupiry, parmesão e azeitonas", "grande", 47.50, 2),
            ("Picanha com Rúcula", "mussarela, fatias de picanha defumada, rúcula e azeitonas", "família", 65.80, 2),
            ("Rúcula", "mussarela, rúcula, tomate seco e azeitonas", "grande", 33.10, 3),
            ("Abobrinha", "mussarela, alho frito, abobrinha italiana fatiada grelhada com parmezão, azeitonas e orégano", "família", 40.20, 3),
            ("Ferrero Rocher", "nuttela e pedaços de ferrero rocher", "média", 28.60, 4),
            ("Brigadeiro", "chocolate ao leite e chocolate granulado", "grande", 32.30, 4),
            ("Morango com Chocolate", "morango e chocolate", "média", 25.90, 5),
            ("Banana com Canela", "banana, leite condensado e canela", "grande", 30.40, 5);

/*
Enunciado - parte 4

Faça um select que retorne os Produtos com o valor maior do que 45 reais.
*/

select tb_pizza.nome_pizza as "Nome da Pizza", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_pizza.preco as "Preço"
    from tb_pizza inner join tb_categoria
    on tb_categoria.id_categ = tb_pizza.fk_categ
    where tb_pizza.preco > 45
    order by tb_categoria.nome_categ;
    
/*
Enunciado - parte 5

Faça um select trazendo os Produtos com valor entre 29 e 60 reais.
*/

select tb_pizza.nome_pizza as "Nome da Pizza", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_pizza.preco as "Preço"
    from tb_pizza inner join tb_categoria
    on tb_categoria.id_categ = tb_pizza.fk_categ
    where tb_pizza.preco between 29 and 60
    order by tb_categoria.tipo_categ desc;
    
/*
Enunciado - parte 6

Faça um select utilizando LIKE buscando os Produtos que tem a letra C.
*/

select tb_pizza.nome_pizza as "Nome da Pizza", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_pizza.preco as "Preço"
    from tb_pizza inner join tb_categoria
    on tb_categoria.id_categ = tb_pizza.fk_categ
    where tb_pizza.nome_pizza like "%c%"
    order by tb_categoria.tipo_categ desc;
    
/*
Enunciado - parte 7

Faça um select com Inner join entre tabela categoria e pizza.
*/

select * from tb_pizza inner join tb_categoria
	on tb_categoria.id_categ = tb_pizza.fk_categ;

/* Comando para contar quantas linhas tem na tabela */
select count(*) from tb_pizza;

/*
Enunciado - parte 8

Faça um select onde traga todos os Produtos de uma categoria específica 
(exemplo todos os produtos que são pizza doce).
*/

select tb_pizza.nome_pizza as "Nome da Pizza", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_pizza.preco as "Preço"
    from tb_pizza inner join tb_categoria
    on tb_categoria.id_categ = tb_pizza.fk_categ
    where tb_categoria.tipo_categ like "%Doce%"
    order by tb_pizza.nome_pizza;

select tb_pizza.nome_pizza as "Nome da Pizza", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_pizza.preco as "Preço"
    from tb_pizza inner join tb_categoria
    on tb_categoria.id_categ = tb_pizza.fk_categ
    where tb_categoria.tipo_categ like "%Salgada%"
	order by tb_pizza.nome_pizza;
    
select tb_pizza.nome_pizza as "Nome da Pizza", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_pizza.preco as "Preço"
    from tb_pizza inner join tb_categoria
    on tb_categoria.id_categ = tb_pizza.fk_categ
    where tb_categoria.id_categ like 1
    order by tb_pizza.nome_pizza;
    
select tb_pizza.nome_pizza as "Nome da Pizza", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_pizza.preco as "Preço"
    from tb_pizza inner join tb_categoria
    on tb_categoria.id_categ = tb_pizza.fk_categ
    where tb_categoria.id_categ like 2
    order by tb_pizza.nome_pizza;

select tb_pizza.nome_pizza as "Nome da Pizza", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_pizza.preco as "Preço"
    from tb_pizza inner join tb_categoria
    on tb_categoria.id_categ = tb_pizza.fk_categ
    where tb_categoria.id_categ like 3
    order by tb_pizza.nome_pizza;
    
select tb_pizza.nome_pizza as "Nome da Pizza", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_pizza.preco as "Preço"
    from tb_pizza inner join tb_categoria
    on tb_categoria.id_categ = tb_pizza.fk_categ
    where tb_categoria.id_categ like 4
    order by tb_pizza.nome_pizza;
    
select tb_pizza.nome_pizza as "Nome da Pizza", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_pizza.preco as "Preço"
    from tb_pizza inner join tb_categoria
    on tb_categoria.id_categ = tb_pizza.fk_categ
    where tb_categoria.id_categ like 5
    order by tb_pizza.nome_pizza;