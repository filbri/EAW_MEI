-- Group [Group]
create table `group_2` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module_2` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user_3` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
   `bi`  varchar(255),
   `codigopostal`  varchar(255),
   `localidade`  varchar(255),
  primary key (`oid`)
);


-- Exercicio [ent10]
create table `exercicio` (
   `oid`  integer  not null,
   `designacao`  varchar(255),
   `enunciado`  varchar(255),
   `datacriacao`  date,
  primary key (`oid`)
);


-- Exercicio Individual [ent11]
create table `exercicio_individual` (
   `exercicio_oid`  integer  not null,
   `oid`  integer  not null,
  primary key (`exercicio_oid`)
);


-- Ficha Colectiva [ent12]
create table `ficha_colectiva` (
   `exercicio_oid`  integer  not null,
   `oid`  integer  not null,
  primary key (`exercicio_oid`)
);


-- Turma [ent13]
create table `turma` (
   `oid`  integer  not null,
   `designacao`  varchar(255),
  primary key (`oid`)
);


-- Nota [ent14]
create table `nota` (
   `oid`  integer  not null,
   `valor`  integer,
  primary key (`oid`)
);


-- Escola [ent15]
create table `escola` (
   `oid`  integer  not null,
  primary key (`oid`)
);


-- Materia [ent16]
create table `materia` (
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`oid`)
);


-- Disciplina [ent17]
create table `disciplina` (
   `materia_oid`  integer  not null,
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`materia_oid`)
);


-- Aluno [ent4]
create table `aluno` (
   `user_3_oid`  integer  not null,
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`user_3_oid`)
);


-- Professor [ent5]
create table `professor` (
   `user_3_oid`  integer  not null,
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`user_3_oid`)
);


-- Encarregado [ent6]
create table `encarregado` (
   `user_3_oid`  integer  not null,
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`user_3_oid`)
);


-- Direção [ent7]
create table `direcao` (
   `user_3_oid`  integer  not null,
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`user_3_oid`)
);


-- Estatistica [ent8]
create table `estatistica` (
   `oid`  integer  not null,
   `media`  integer,
   `melhornota`  integer,
   `piornota`  integer,
   `variacao`  integer,
  primary key (`oid`)
);


-- Notificação [ent9]
create table `notificacao` (
   `oid`  integer  not null,
   `mensagem`  varchar(255),
   `assunto`  varchar(255),
   `nomeremetente`  varchar(255),
   `dataleitura`  date,
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group_2`  add column  `module_2_oid`  integer;
alter table `group_2`   add index fk_group_2_module_2 (`module_2_oid`), add constraint fk_group_2_module_2 foreign key (`module_2_oid`) references `module_2` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module_2` (
   `group_2_oid`  integer not null,
   `module_2_oid`  integer not null,
  primary key (`group_2_oid`, `module_2_oid`)
);
alter table `group_module_2`   add index fk_group_module_2_group_2 (`group_2_oid`), add constraint fk_group_module_2_group_2 foreign key (`group_2_oid`) references `group_2` (`oid`);
alter table `group_module_2`   add index fk_group_module_2_module_2 (`module_2_oid`), add constraint fk_group_module_2_module_2 foreign key (`module_2_oid`) references `module_2` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user_3`  add column  `group_2_oid`  integer;
alter table `user_3`   add index fk_user_3_group_2 (`group_2_oid`), add constraint fk_user_3_group_2 foreign key (`group_2_oid`) references `group_2` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group_2` (
   `user_3_oid`  integer not null,
   `group_2_oid`  integer not null,
  primary key (`user_3_oid`, `group_2_oid`)
);
alter table `user_group_2`   add index fk_user_group_2_user_3 (`user_3_oid`), add constraint fk_user_group_2_user_3 foreign key (`user_3_oid`) references `user_3` (`oid`);
alter table `user_group_2`   add index fk_user_group_2_group_2 (`group_2_oid`), add constraint fk_user_group_2_group_2 foreign key (`group_2_oid`) references `group_2` (`oid`);


-- Estatistica_Escola [rel10]
alter table `escola`  add column  `estatistica_oid`  integer;
alter table `escola`   add index fk_escola_estatistica (`estatistica_oid`), add constraint fk_escola_estatistica foreign key (`estatistica_oid`) references `estatistica` (`oid`);


-- Turma_Exercicio [rel12]
create table `turma_exercicio` (
   `turma_oid`  integer not null,
   `exercicio_oid`  integer not null,
  primary key (`turma_oid`, `exercicio_oid`)
);
alter table `turma_exercicio`   add index fk_turma_exercicio_turma (`turma_oid`), add constraint fk_turma_exercicio_turma foreign key (`turma_oid`) references `turma` (`oid`);
alter table `turma_exercicio`   add index fk_turma_exercicio_exercicio (`exercicio_oid`), add constraint fk_turma_exercicio_exercicio foreign key (`exercicio_oid`) references `exercicio` (`oid`);


-- Aluno_Exercicio [rel13]
create table `aluno_exercicio` (
   `aluno_oid`  integer not null,
   `exercicio_oid`  integer not null,
  primary key (`aluno_oid`, `exercicio_oid`)
);
alter table `aluno_exercicio`   add index fk_aluno_exercicio_aluno (`aluno_oid`), add constraint fk_aluno_exercicio_aluno foreign key (`aluno_oid`) references `aluno` (`user_3_oid`);
alter table `aluno_exercicio`   add index fk_aluno_exercicio_exercicio (`exercicio_oid`), add constraint fk_aluno_exercicio_exercicio foreign key (`exercicio_oid`) references `exercicio` (`oid`);


-- Estatistica_Aluno [rel14]
alter table `aluno`  add column  `estatistica_oid`  integer;
alter table `aluno`   add index fk_aluno_estatistica (`estatistica_oid`), add constraint fk_aluno_estatistica foreign key (`estatistica_oid`) references `estatistica` (`oid`);


-- Estatistica_Turma [rel15]
alter table `turma`  add column  `estatistica_oid`  integer;
alter table `turma`   add index fk_turma_estatistica (`estatistica_oid`), add constraint fk_turma_estatistica foreign key (`estatistica_oid`) references `estatistica` (`oid`);


-- Nota_Estatistica [rel16]
create table `nota_estatistica` (
   `nota_oid`  integer not null,
   `estatistica_oid`  integer not null,
  primary key (`nota_oid`, `estatistica_oid`)
);
alter table `nota_estatistica`   add index fk_nota_estatistica_nota (`nota_oid`), add constraint fk_nota_estatistica_nota foreign key (`nota_oid`) references `nota` (`oid`);
alter table `nota_estatistica`   add index fk_nota_estatistica_estatistic (`estatistica_oid`), add constraint fk_nota_estatistica_estatistic foreign key (`estatistica_oid`) references `estatistica` (`oid`);


-- Turma_Ano [rel17]
alter table `turma`  add column  `escola_oid`  integer;
alter table `turma`   add index fk_turma_escola (`escola_oid`), add constraint fk_turma_escola foreign key (`escola_oid`) references `escola` (`oid`);


-- Exercicio_Nota [rel2]
alter table `nota`  add column  `exercicio_oid`  integer;
alter table `nota`   add index fk_nota_exercicio (`exercicio_oid`), add constraint fk_nota_exercicio foreign key (`exercicio_oid`) references `exercicio` (`oid`);


-- Materia_Exercicio [rel20]
alter table `exercicio`  add column  `materia_oid`  integer;
alter table `exercicio`   add index fk_exercicio_materia (`materia_oid`), add constraint fk_exercicio_materia foreign key (`materia_oid`) references `materia` (`oid`);


-- Aluno_Encarregado [rel3]
alter table `aluno`  add column  `encarregado_oid`  integer;
alter table `aluno`   add index fk_aluno_encarregado (`encarregado_oid`), add constraint fk_aluno_encarregado foreign key (`encarregado_oid`) references `encarregado` (`user_3_oid`);


-- Aluno_Turma [rel4]
alter table `aluno`  add column  `turma_oid`  integer;
alter table `aluno`   add index fk_aluno_turma (`turma_oid`), add constraint fk_aluno_turma foreign key (`turma_oid`) references `turma` (`oid`);


-- Turma_Professor [rel5]
create table `turma_professor` (
   `turma_oid`  integer not null,
   `professor_oid`  integer not null,
  primary key (`turma_oid`, `professor_oid`)
);
alter table `turma_professor`   add index fk_turma_professor_turma (`turma_oid`), add constraint fk_turma_professor_turma foreign key (`turma_oid`) references `turma` (`oid`);
alter table `turma_professor`   add index fk_turma_professor_professor (`professor_oid`), add constraint fk_turma_professor_professor foreign key (`professor_oid`) references `professor` (`user_3_oid`);


-- Professor_Notificação [rel6]
alter table `notificacao`  add column  `professor_oid`  integer;
alter table `notificacao`   add index fk_notificacao_professor (`professor_oid`), add constraint fk_notificacao_professor foreign key (`professor_oid`) references `professor` (`user_3_oid`);


-- Direção_Notificação [rel7]
alter table `notificacao`  add column  `direcao_oid`  integer;
alter table `notificacao`   add index fk_notificacao_direcao (`direcao_oid`), add constraint fk_notificacao_direcao foreign key (`direcao_oid`) references `direcao` (`user_3_oid`);


-- Encarregado_Notificação [rel8]
alter table `notificacao`  add column  `encarregado_oid`  integer;
alter table `notificacao`   add index fk_notificacao_encarregado (`encarregado_oid`), add constraint fk_notificacao_encarregado foreign key (`encarregado_oid`) references `encarregado` (`user_3_oid`);


-- Professor_Exercicio [rel9]
alter table `exercicio`  add column  `professor_oid`  integer;
alter table `exercicio`   add index fk_exercicio_professor (`professor_oid`), add constraint fk_exercicio_professor foreign key (`professor_oid`) references `professor` (`user_3_oid`);


-- GEN FK: Exercicio Individual --> Exercicio
alter table `exercicio_individual`   add index fk_exercicio_individual_exerci (`exercicio_oid`), add constraint fk_exercicio_individual_exerci foreign key (`exercicio_oid`) references `exercicio` (`oid`);


-- GEN FK: Ficha Colectiva --> Exercicio
alter table `ficha_colectiva`   add index fk_ficha_colectiva_exercicio (`exercicio_oid`), add constraint fk_ficha_colectiva_exercicio foreign key (`exercicio_oid`) references `exercicio` (`oid`);


-- GEN FK: Disciplina --> Materia
alter table `disciplina`   add index fk_disciplina_materia (`materia_oid`), add constraint fk_disciplina_materia foreign key (`materia_oid`) references `materia` (`oid`);


-- GEN FK: Aluno --> User
alter table `aluno`   add index fk_aluno_user_3 (`user_3_oid`), add constraint fk_aluno_user_3 foreign key (`user_3_oid`) references `user_3` (`oid`);


-- GEN FK: Professor --> User
alter table `professor`   add index fk_professor_user_3 (`user_3_oid`), add constraint fk_professor_user_3 foreign key (`user_3_oid`) references `user_3` (`oid`);


-- GEN FK: Encarregado --> User
alter table `encarregado`   add index fk_encarregado_user_3 (`user_3_oid`), add constraint fk_encarregado_user_3 foreign key (`user_3_oid`) references `user_3` (`oid`);


-- GEN FK: Direção --> User
alter table `direcao`   add index fk_direcao_user_3 (`user_3_oid`), add constraint fk_direcao_user_3 foreign key (`user_3_oid`) references `user_3` (`oid`);


