-- Group [Group]
create table `group_3` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module_3` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user_4` (
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
create table `exercicio_2` (
   `oid`  integer  not null,
   `designacao`  varchar(255),
   `enunciado`  varchar(255),
   `datacriacao`  date,
  primary key (`oid`)
);


-- Exercicio Individual [ent11]
create table `exercicio_individual_2` (
   `exercicio_2_oid`  integer  not null,
   `oid`  integer  not null,
  primary key (`exercicio_2_oid`)
);


-- Ficha Colectiva [ent12]
create table `ficha_colectiva_2` (
   `exercicio_2_oid`  integer  not null,
   `oid`  integer  not null,
  primary key (`exercicio_2_oid`)
);


-- Turma [ent13]
create table `turma_2` (
   `oid`  integer  not null,
   `designacao`  varchar(255),
  primary key (`oid`)
);


-- Nota [ent14]
create table `nota_2` (
   `oid`  integer  not null,
   `valor`  integer,
  primary key (`oid`)
);


-- Escola [ent15]
create table `escola_2` (
   `oid`  integer  not null,
  primary key (`oid`)
);


-- Materia [ent16]
create table `materia_2` (
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`oid`)
);


-- Disciplina [ent17]
create table `disciplina_2` (
   `materia_2_oid`  integer  not null,
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`materia_2_oid`)
);


-- Aluno [ent4]
create table `aluno_2` (
   `user_4_oid`  integer  not null,
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`user_4_oid`)
);


-- Professor [ent5]
create table `professor_2` (
   `user_4_oid`  integer  not null,
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`user_4_oid`)
);


-- Encarregado [ent6]
create table `encarregado_2` (
   `user_4_oid`  integer  not null,
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`user_4_oid`)
);


-- Direção [ent7]
create table `direcao_2` (
   `user_4_oid`  integer  not null,
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`user_4_oid`)
);


-- Estatistica [ent8]
create table `estatistica_2` (
   `oid`  integer  not null,
   `media`  integer,
   `melhornota`  integer,
   `piornota`  integer,
   `variacao`  integer,
  primary key (`oid`)
);


-- Notificação [ent9]
create table `notificacao_2` (
   `oid`  integer  not null,
   `mensagem`  varchar(255),
   `assunto`  varchar(255),
   `nomeremetente`  varchar(255),
   `dataleitura`  date,
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group_3`  add column  `module_3_oid`  integer;
alter table `group_3`   add index fk_group_3_module_3 (`module_3_oid`), add constraint fk_group_3_module_3 foreign key (`module_3_oid`) references `module_3` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module_3` (
   `group_3_oid`  integer not null,
   `module_3_oid`  integer not null,
  primary key (`group_3_oid`, `module_3_oid`)
);
alter table `group_module_3`   add index fk_group_module_3_group_3 (`group_3_oid`), add constraint fk_group_module_3_group_3 foreign key (`group_3_oid`) references `group_3` (`oid`);
alter table `group_module_3`   add index fk_group_module_3_module_3 (`module_3_oid`), add constraint fk_group_module_3_module_3 foreign key (`module_3_oid`) references `module_3` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user_4`  add column  `group_3_oid`  integer;
alter table `user_4`   add index fk_user_4_group_3 (`group_3_oid`), add constraint fk_user_4_group_3 foreign key (`group_3_oid`) references `group_3` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group_3` (
   `user_4_oid`  integer not null,
   `group_3_oid`  integer not null,
  primary key (`user_4_oid`, `group_3_oid`)
);
alter table `user_group_3`   add index fk_user_group_3_user_4 (`user_4_oid`), add constraint fk_user_group_3_user_4 foreign key (`user_4_oid`) references `user_4` (`oid`);
alter table `user_group_3`   add index fk_user_group_3_group_3 (`group_3_oid`), add constraint fk_user_group_3_group_3 foreign key (`group_3_oid`) references `group_3` (`oid`);


-- Estatistica_Escola [rel10]
alter table `escola_2`  add column  `estatistica_2_oid`  integer;
alter table `escola_2`   add index fk_escola_2_estatistica_2 (`estatistica_2_oid`), add constraint fk_escola_2_estatistica_2 foreign key (`estatistica_2_oid`) references `estatistica_2` (`oid`);


-- Turma_Exercicio [rel12]
create table `turma_exercicio_2` (
   `turma_2_oid`  integer not null,
   `exercicio_2_oid`  integer not null,
  primary key (`turma_2_oid`, `exercicio_2_oid`)
);
alter table `turma_exercicio_2`   add index fk_turma_exercicio_2_turma_2 (`turma_2_oid`), add constraint fk_turma_exercicio_2_turma_2 foreign key (`turma_2_oid`) references `turma_2` (`oid`);
alter table `turma_exercicio_2`   add index fk_turma_exercicio_2_exercicio (`exercicio_2_oid`), add constraint fk_turma_exercicio_2_exercicio foreign key (`exercicio_2_oid`) references `exercicio_2` (`oid`);


-- Aluno_Exercicio [rel13]
create table `aluno_exercicio_2` (
   `aluno_2_oid`  integer not null,
   `exercicio_2_oid`  integer not null,
  primary key (`aluno_2_oid`, `exercicio_2_oid`)
);
alter table `aluno_exercicio_2`   add index fk_aluno_exercicio_2_aluno_2 (`aluno_2_oid`), add constraint fk_aluno_exercicio_2_aluno_2 foreign key (`aluno_2_oid`) references `aluno_2` (`user_4_oid`);
alter table `aluno_exercicio_2`   add index fk_aluno_exercicio_2_exercicio (`exercicio_2_oid`), add constraint fk_aluno_exercicio_2_exercicio foreign key (`exercicio_2_oid`) references `exercicio_2` (`oid`);


-- Estatistica_Aluno [rel14]
alter table `aluno_2`  add column  `estatistica_2_oid`  integer;
alter table `aluno_2`   add index fk_aluno_2_estatistica_2 (`estatistica_2_oid`), add constraint fk_aluno_2_estatistica_2 foreign key (`estatistica_2_oid`) references `estatistica_2` (`oid`);


-- Estatistica_Turma [rel15]
alter table `turma_2`  add column  `estatistica_2_oid`  integer;
alter table `turma_2`   add index fk_turma_2_estatistica_2 (`estatistica_2_oid`), add constraint fk_turma_2_estatistica_2 foreign key (`estatistica_2_oid`) references `estatistica_2` (`oid`);


-- Nota_Estatistica [rel16]
create table `nota_estatistica_2` (
   `nota_2_oid`  integer not null,
   `estatistica_2_oid`  integer not null,
  primary key (`nota_2_oid`, `estatistica_2_oid`)
);
alter table `nota_estatistica_2`   add index fk_nota_estatistica_2_nota_2 (`nota_2_oid`), add constraint fk_nota_estatistica_2_nota_2 foreign key (`nota_2_oid`) references `nota_2` (`oid`);
alter table `nota_estatistica_2`   add index fk_nota_estatistica_2_estatist (`estatistica_2_oid`), add constraint fk_nota_estatistica_2_estatist foreign key (`estatistica_2_oid`) references `estatistica_2` (`oid`);


-- Turma_Ano [rel17]
alter table `turma_2`  add column  `escola_2_oid`  integer;
alter table `turma_2`   add index fk_turma_2_escola_2 (`escola_2_oid`), add constraint fk_turma_2_escola_2 foreign key (`escola_2_oid`) references `escola_2` (`oid`);


-- Exercicio_Nota [rel2]
alter table `nota_2`  add column  `exercicio_2_oid`  integer;
alter table `nota_2`   add index fk_nota_2_exercicio_2 (`exercicio_2_oid`), add constraint fk_nota_2_exercicio_2 foreign key (`exercicio_2_oid`) references `exercicio_2` (`oid`);


-- Materia_Exercicio [rel20]
alter table `exercicio_2`  add column  `materia_2_oid`  integer;
alter table `exercicio_2`   add index fk_exercicio_2_materia_2 (`materia_2_oid`), add constraint fk_exercicio_2_materia_2 foreign key (`materia_2_oid`) references `materia_2` (`oid`);


-- Aluno_Encarregado [rel3]
alter table `aluno_2`  add column  `encarregado_2_oid`  integer;
alter table `aluno_2`   add index fk_aluno_2_encarregado_2 (`encarregado_2_oid`), add constraint fk_aluno_2_encarregado_2 foreign key (`encarregado_2_oid`) references `encarregado_2` (`user_4_oid`);


-- Aluno_Turma [rel4]
alter table `aluno_2`  add column  `turma_2_oid`  integer;
alter table `aluno_2`   add index fk_aluno_2_turma_2 (`turma_2_oid`), add constraint fk_aluno_2_turma_2 foreign key (`turma_2_oid`) references `turma_2` (`oid`);


-- Turma_Professor [rel5]
create table `turma_professor_2` (
   `turma_2_oid`  integer not null,
   `professor_2_oid`  integer not null,
  primary key (`turma_2_oid`, `professor_2_oid`)
);
alter table `turma_professor_2`   add index fk_turma_professor_2_turma_2 (`turma_2_oid`), add constraint fk_turma_professor_2_turma_2 foreign key (`turma_2_oid`) references `turma_2` (`oid`);
alter table `turma_professor_2`   add index fk_turma_professor_2_professor (`professor_2_oid`), add constraint fk_turma_professor_2_professor foreign key (`professor_2_oid`) references `professor_2` (`user_4_oid`);


-- Professor_Notificação [rel6]
alter table `notificacao_2`  add column  `professor_2_oid`  integer;
alter table `notificacao_2`   add index fk_notificacao_2_professor_2 (`professor_2_oid`), add constraint fk_notificacao_2_professor_2 foreign key (`professor_2_oid`) references `professor_2` (`user_4_oid`);


-- Direção_Notificação [rel7]
alter table `notificacao_2`  add column  `direcao_2_oid`  integer;
alter table `notificacao_2`   add index fk_notificacao_2_direcao_2 (`direcao_2_oid`), add constraint fk_notificacao_2_direcao_2 foreign key (`direcao_2_oid`) references `direcao_2` (`user_4_oid`);


-- Encarregado_Notificação [rel8]
alter table `notificacao_2`  add column  `encarregado_2_oid`  integer;
alter table `notificacao_2`   add index fk_notificacao_2_encarregado_2 (`encarregado_2_oid`), add constraint fk_notificacao_2_encarregado_2 foreign key (`encarregado_2_oid`) references `encarregado_2` (`user_4_oid`);


-- Professor_Exercicio [rel9]
alter table `exercicio_2`  add column  `professor_2_oid`  integer;
alter table `exercicio_2`   add index fk_exercicio_2_professor_2 (`professor_2_oid`), add constraint fk_exercicio_2_professor_2 foreign key (`professor_2_oid`) references `professor_2` (`user_4_oid`);


-- GEN FK: Exercicio Individual --> Exercicio
alter table `exercicio_individual_2`   add index fk_exercicio_individual_2_exer (`exercicio_2_oid`), add constraint fk_exercicio_individual_2_exer foreign key (`exercicio_2_oid`) references `exercicio_2` (`oid`);


-- GEN FK: Ficha Colectiva --> Exercicio
alter table `ficha_colectiva_2`   add index fk_ficha_colectiva_2_exercicio (`exercicio_2_oid`), add constraint fk_ficha_colectiva_2_exercicio foreign key (`exercicio_2_oid`) references `exercicio_2` (`oid`);


-- GEN FK: Disciplina --> Materia
alter table `disciplina_2`   add index fk_disciplina_2_materia_2 (`materia_2_oid`), add constraint fk_disciplina_2_materia_2 foreign key (`materia_2_oid`) references `materia_2` (`oid`);


-- GEN FK: Aluno --> User
alter table `aluno_2`   add index fk_aluno_2_user_4 (`user_4_oid`), add constraint fk_aluno_2_user_4 foreign key (`user_4_oid`) references `user_4` (`oid`);


-- GEN FK: Professor --> User
alter table `professor_2`   add index fk_professor_2_user_4 (`user_4_oid`), add constraint fk_professor_2_user_4 foreign key (`user_4_oid`) references `user_4` (`oid`);


-- GEN FK: Encarregado --> User
alter table `encarregado_2`   add index fk_encarregado_2_user_4 (`user_4_oid`), add constraint fk_encarregado_2_user_4 foreign key (`user_4_oid`) references `user_4` (`oid`);


-- GEN FK: Direção --> User
alter table `direcao_2`   add index fk_direcao_2_user_4 (`user_4_oid`), add constraint fk_direcao_2_user_4 foreign key (`user_4_oid`) references `user_4` (`oid`);


