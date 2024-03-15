/*Criando Schema*/
Create Schema escola_estadual;

/*Criando Tabela*/
CREATE TABLE `escola_estrutura`.`alunos` (
  `id_aluno` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_alunos`));
/*Adicionando Colunas */
ALTER TABLE `escola_estrutura`.`alunos` 
ADD COLUMN `data_nascimento` DATE NOT NULL AFTER `nome`,
ADD COLUMN `endereco` VARCHAR(255) NOT NULL AFTER `data_nascimento`,
ADD COLUMN `cidade` VARCHAR(100) NOT NULL AFTER `endereco`,
ADD COLUMN `estado` CHAR(2) NOT NULL AFTER `cidade`,
ADD COLUMN `cpf` VARCHAR(11) NOT NULL AFTER `estado`,
ADD COLUMN `rg` VARCHAR(9) NOT NULL AFTER `cpf`,
CHANGE COLUMN `alunoscol` `nome` VARCHAR(100) NOT NULL ;

/*Criando Tabela com as colunas adicionadas*/
CREATE TABLE `escola_estrutura`.`cursos` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `carga_horario` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_curso`));

  /*Criando Tabela*/
CREATE TABLE `escola_estrutura`.`notas` (
  `id_nota` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_nota`));

ALTER TABLE `escola_estrutura`.`notas` 
ADD COLUMN `descricao_atividade` VARCHAR(100) NOT NULL AFTER `id_nota`,
ADD COLUMN `vlr_nota` DECIMAL(5,2) NOT NULL AFTER `descricao_atividade`,

/*ADICIONADNO ALUNOS NA TABELA*/
INSERT INTO alunos
VALUES(DEFAULT,'Luan Antunes','1999-05-26','Av. Paulo Faccini, 101', 'Guarulhos', 'SP', '12345678910','471593116');

SELECT*FROM alunos;

/*ALTERANDO TABELA*/
UPDATE alunos
SET nome = 'Luan Antunes Machado Ribeiro'
WHERE nome = 'Luan Antunes'

/* DELETANDO DADOS TABELA*/
Delete from alunos
where id_aluno > 1

Create table `escola_estrutura`.`alunos_cursos`(
     `id_aluno_curso` INT NOT NULL AUTO_INCREMENT,
      `id_aluno` INT NOT NULL,
       `id_curso` INT NOT NULL ,
  PRIMARY KEY (`id_aluno_curso`))

/* Adicionando Foreing Keys (chave estrangeira) */
ALTER TABLE `escola_estrutura`.`alunos_cursos` 
ADD INDEX `fk_id_aluno_idx_idx` (`id_aluno` ASC) VISIBLE,
ADD INDEX `fk_id_curso_idx_idx` (`id_curso` ASC) VISIBLE;
;
ALTER TABLE `escola_estrutura`.`alunos_cursos` 
ADD CONSTRAINT `fk_id_aluno_idx`
  FOREIGN KEY (`id_aluno`)
  REFERENCES `escola_estrutura`.`alunos` (`id_aluno`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_id_curso_idx`
  FOREIGN KEY (`id_curso`)
  REFERENCES `escola_estrutura`.`cursos` (`id_curso`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
ALTER TABLE `escola_estrutura`.`notas` 
ADD COLUMN `id_aluno_curso` INT NULL AFTER `id_nota`,
ADD INDEX `fk_aluno_curso_idx` (`id_aluno_curso` ASC) VISIBLE;
;

ALTER TABLE `escola_estrutura`.`notas` 
ADD CONSTRAINT `fk_aluno_curso`
  FOREIGN KEY (`id_aluno_curso`)
  REFERENCES `escola_estrutura`.`alunos_cursos` (`id_aluno_curso`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

  SELECT `cursos`.`id_curso`,
    `cursos`.`nome`,
    `cursos`.`descricao_curso`,
    `cursos`.`carga_horaria`
FROM `escola_estrutura`.`cursos`;
