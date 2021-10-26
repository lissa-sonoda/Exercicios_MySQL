/*
 *Atividade_01
 *@author Helen Lissa Sonoda
 *Date: 25/10/2021
 */

/*
Enunciado - parte 1

Crie um banco de dados para um serviço de um game Online, 
o nome do banco deverá ter o seguinte nome db_generation_game_online, 
onde, o sistema trabalhará com as informações dos personagens desse game. 
O sistema trabalhará com 2 tabelas tb_personagem e tb_classe.
*/

create database db_generation_game_online;

use db_generation_game_online;

/*
Enunciado - parte 2

Crie uma tabela tb_classe utilizando a habilidade de abstração e determine 3 atributos 
relevantes da classe para se trabalhar com o serviço desse game Online.

Popule esta tabela classe com até 5 dados.
*/

create table tb_classe(
	id_classe bigint(3) auto_increment,
	nome_classe varchar(30) not null,
    habilidade varchar(30) not null,
    fraqueza varchar(30) not null,
    primary key(id_classe)
);

insert into tb_classe(nome_classe, habilidade, fraqueza) 
	values ("Archer", "Precisão", "Magia"),
			("Mage", "Conhecimento/Magias", "Força Física"),
            ("Warrior", "Força", "Destreza"),
            ("Swordsman", "Destreza", "Divindade"),
            ("Paladin", "Força/Magia de cura", "Ataques a longa distância");

/*
Enunciado - parte 3

Crie uma tabela tb_personagem e utilizando a habilidade de abstração e determine 5 atributos 
relevantes dos funcionários para se trabalhar com o serviço desse game Online 
(não esqueça de criar a foreign key de tb_classe nesta tabela).

Popule esta tabela personagem com até 8 dados.
*/

create table tb_personagem(
	id_pers bigint(3) auto_increment,
    nome_pers varchar(30) not null,
    fk_classe bigint(3),
    poder_atq bigint not null,
    poder_def bigint not null,
    primary key(id_pers),
    foreign key(fk_classe) references tb_classe(id_classe)
);

insert into tb_personagem(nome_pers, fk_classe, poder_atq, poder_def)
	values ("dezena_123", 5, 4500, 3000),
			("goodslayer_123", 3, 3800, 1400),
			("mabi_123", 1, 1900, 1880),
			("nath_123", 5, 4300, 2800),
            ("oraffa_123", 4, 2800, 800),
            ("lissa_123", 2, 1500, 1100),
            ("camis_123", 1, 1700, 1900),
            ("leo_123", 4, 2700, 800);

/*
Enunciado - parte 4

Faça um select que retorne os personagens com o poder de ataque maior do que 2000.
*/

select tb_personagem.nome_pers as "Nome do Personagem", 
    tb_classe.nome_classe as "Classe",
	tb_personagem.poder_atq as "Poder de Ataque"
	from tb_personagem inner join tb_classe
	on tb_classe.id_classe = tb_personagem.fk_classe
	where tb_personagem.poder_atq > 2000
	order by tb_personagem.poder_atq desc;
    
/*
Enunciado - parte 5

Faça um select trazendo os personagens com poder de defesa entre 1000 e 2000.
*/
    
select tb_personagem.nome_pers as "Nome do Personagem", 
    tb_classe.nome_classe as "Classe",
	tb_personagem.poder_def as "Poder de Defesa"
	from tb_personagem inner join tb_classe
	on tb_classe.id_classe = tb_personagem.fk_classe
	where tb_personagem.poder_def between 1000 and 2000
	order by tb_personagem.poder_def desc;
    
/*
Enunciado - parte 6

Faça um select utilizando LIKE buscando os personagens com a letra C.
*/

select tb_personagem.nome_pers as "Nome do Personagem", 
    tb_classe.nome_classe as "Classe"
	from tb_personagem inner join tb_classe
	on tb_classe.id_classe = tb_personagem.fk_classe
	where tb_personagem.nome_pers like "C%";
    
/*
Enunciado - parte 7

Faça um select com Inner join entre tabela classe e personagem.
*/

select * from tb_personagem inner join tb_classe
	on tb_classe.id_classe = tb_personagem.fk_classe;

/* Comando para contar quantas linhas tem na tabela */
select count(*) from tb_personagem;

/*
Enunciado - parte 8

Faça um select onde traga todos os personagem de uma classe específica 
(exemplo todos os personagens que são arqueiros).
*/

select tb_personagem.nome_pers as "Nome do Personagem", 
    tb_classe.nome_classe as "Classe"
	from tb_personagem inner join tb_classe
	on tb_classe.id_classe = tb_personagem.fk_classe
	where tb_personagem.fk_classe like 1
    order by tb_personagem.nome_pers;
    
select tb_personagem.nome_pers as "Nome do Personagem", 
    tb_classe.nome_classe as "Classe"
	from tb_personagem inner join tb_classe
	on tb_classe.id_classe = tb_personagem.fk_classe
	where tb_personagem.fk_classe like 2
    order by tb_personagem.nome_pers;
    
select tb_personagem.nome_pers as "Nome do Personagem", 
    tb_classe.nome_classe as "Classe"
	from tb_personagem inner join tb_classe
	on tb_classe.id_classe = tb_personagem.fk_classe
	where tb_personagem.fk_classe like 3
    order by tb_personagem.nome_pers;
    
select tb_personagem.nome_pers as "Nome do Personagem", 
    tb_classe.nome_classe as "Classe"
	from tb_personagem inner join tb_classe
	on tb_classe.id_classe = tb_personagem.fk_classe
	where tb_personagem.fk_classe like 4
    order by tb_personagem.nome_pers;
    
select tb_personagem.nome_pers as "Nome do Personagem", 
    tb_classe.nome_classe as "Classe"
	from tb_personagem inner join tb_classe
	on tb_classe.id_classe = tb_personagem.fk_classe
	where tb_personagem.fk_classe like 5
    order by tb_personagem.nome_pers;

/***** Outros comandos aprendidos na aula *****/

/*  drop database [nome_da_database] --para derrubar um db
	desc [nome_da_tabela] --para descrição da tabela
    count([nome_da_coluna]) --para contar quantas linhas tem na coluna
    select sum([nome_da_coluna]) from [nome_da_tabela] --para somar
    select avg([nome_da_coluna]) from [nome_da_tabela] --para tirar a média
    select max([nome_da_coluna]) from [nome_da_tabela] --para selecionar o max
    select min([nome_da_coluna]) from [nome_da_tabela] --para selecionar o min
    limit [quantidade] --para limitar até a quantidade desejada
    truncate table [nome_da_tabela] --para limpar a tabela, apenas os valores são excluídos
*/