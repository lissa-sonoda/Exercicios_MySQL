CREATE TABLE `tb_postagens` (
	`id_post` bigint NOT NULL AUTO_INCREMENT,
	`titulo` varchar(255) NOT NULL,
	`texto` varchar(1000) NOT NULL,
	`data` TIMESTAMP NOT NULL,
	`fk_tema_id` bigint NOT NULL,
	`fk_usuario_id` bigint NOT NULL,
	PRIMARY KEY (`id_post`)
);

CREATE TABLE `tb_temas` (
	`id_tema` bigint NOT NULL AUTO_INCREMENT,
	`descricao` varchar(255) NOT NULL,
	PRIMARY KEY (`id_tema`)
);

CREATE TABLE `tb_usuarios` (
	`id_user` bigint NOT NULL AUTO_INCREMENT,
	`nome` varchar(255) NOT NULL,
	`usuario` varchar(255) NOT NULL,
	`senha` varchar(255) NOT NULL,
	PRIMARY KEY (`id_user`)
);

ALTER TABLE `tb_postagens` ADD CONSTRAINT `tb_postagens_fk0` FOREIGN KEY (`fk_tema_id`) REFERENCES `tb_temas`(`id_tema`);

ALTER TABLE `tb_postagens` ADD CONSTRAINT `tb_postagens_fk1` FOREIGN KEY (`fk_usuario_id`) REFERENCES `tb_usuarios`(`id_user`);




