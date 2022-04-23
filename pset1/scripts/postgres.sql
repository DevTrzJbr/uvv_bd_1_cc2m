-- Cria Super-usuário com seus privilégios dentro do SGBD

CREATE ROLE joao SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN PASSWORD '1234';


-- Cria Banco de dados UVV com suas propriedades e permissões
create database uvv   -- cria banco de dados
		with owner joao -- adiciona usuário proprietário do banco de dados
		template template0 -- usar template do banco de dados 
		encoding 'UTF8'  
		allow_connections true
;

-- Altera modelo de visualização de data para dia-mês-ano
ALTER DATABASE uvv SET datestyle TO SQL, DMY;


-- Altera conexão com o banco de dados criado
\connect uvv;

-- Cria schema do banco de dados

CREATE schema IF NOT EXISTS elmasri -- cria esquema
AUTHORIZATION joao;

-- altera esquema padrão de uso do usuário

ALTER USER joao 
SET search_path = elmasri, '\$user', public;

-- Drop Table departamento
DROP TABLE IF EXISTS departamento CASCADE;

-- Create Table departamento
CREATE TABLE IF NOT EXISTS departamento (
	numero_departamento INTEGER 	NOT NULL CHECK (numero_departamento > 0),
	nome_departamento 	VARCHAR(15) NOT NULL,
	cpf_gerente 		CHAR(11) 	NOT NULL,
	data_inicio_gerente DATE 		NOT NULL,
	CONSTRAINT pk_departamento
		PRIMARY KEY (numero_departamento)
	
);

-- Table comments
comment on
table departamento is 'Tabela que armazena as informaçoẽs dos departamentos.';
-- Column comments
comment on
column departamento.numero_departamento is 'Número do departamento. É a PK desta tabela.';

comment on
column departamento.nome_departamento is 'Nome do departamento. Deve ser único.';

comment on
column departamento.cpf_gerente is 'CPF do gerente do departamento. É uma FK para a tabela funcionários.';

comment on
column departamento.data_inicio_gerente is 'Data do início do gerente no departamento.';
-- End departamento

-- Drop Table dependente
DROP TABLE IF EXISTS dependente CASCADE;

-- Create Table dependente
CREATE TABLE IF NOT EXISTS dependente (
	cpf_funcionario     CHAR(11)    NOT NULL,
	nome_dependente     VARCHAR(15) NOT NULL,
	sexo                CHAR(1)			CHECK (sexo = 'm' OR sexo = 'f' OR sexo = 'M' OR sexo = 'F'),
	data_nascimento     DATE,
    parentesco          VARCHAR(15),
	CONSTRAINT pk_dependente 
        PRIMARY KEY (cpf_funcionario, nome_dependente)
);

-- Table comments
comment on
table dependente is 'Tabela que armazena as informações dos dependentes dos funcionários.';
-- Column comments
comment on
column dependente.cpf_funcionario is 'CPF do funcionário. Faz parte da PK desta tabela e é uma FK para a tabela funcionário.';

comment on
column dependente.nome_dependente is 'Nome do dependente. Faz parte da PK desta tabela.';

comment on
column dependente.sexo is 'Sexo do dependente.';

comment on
column dependente.data_nascimento is 'Data de nascimento do dependente.';

comment on
column dependente.parentesco is 'Descrição do parentesco do dependente com o funcionário.';
-- End Table dependente

-- Drop Table funcionario
DROP TABLE IF EXISTS funcionario CASCADE;

-- Create Table funcionarios
CREATE TABLE IF NOT EXISTS funcionario (
	cpf 				CHAR(11) 	NOT NULL,
	primeiro_nome 		VARCHAR(15) NOT NULL,
	nome_meio 			CHAR(1),
	ultimo_nome 		VARCHAR(15) NOT NULL,
	data_nascimento 	DATE,
	endereco 			VARCHAR(100),
	sexo 				CHAR(1)			CHECK (sexo = 'm' OR sexo = 'f' OR sexo = 'M' OR sexo = 'F'),
	salario 			DECIMAL(10,2) 	CHECK (salario > 0),
	cpf_supervisor 		CHAR(11) 		CHECK (cpf_supervisor != cpf),
	numero_departamento INTEGER 	NOT NULL,
	CONSTRAINT pk_funcionario 
		PRIMARY KEY (cpf)
);

comment on
table funcionario is 'Tabela que armazena as informações dos funcionários.';
-- Column comments

comment on
column funcionario.cpf is 'CPF do funcionário. Será a PK da tabela.';

comment on
column funcionario.primeiro_nome is 'Primeiro nome do funcionário.';

comment on
column funcionario.nome_meio is 'Inicial do nome do meio.';

comment on
column funcionario.ultimo_nome is 'Sobrenome do funcionário.';

comment on
column funcionario.endereco is 'Endereço do funcionário.';

comment on
column funcionario.sexo is 'Sexo do funcionário';

comment on
column funcionario.salario is 'Salário do funcionário';

comment on
column funcionario.cpf_supervisor is 'CPF do supervisor. Será uma FK para a própria tabela (um auto-relacionamento).';

comment on
column funcionario.numero_departamento is 'Número do departamento do funcionário.';
-- End Table Funcionario

-- Drop Table localizacoes_departamento
DROP TABLE IF EXISTS localizacoes_departamento CASCADE;

-- Create Table localizacoes_departamento
CREATE TABLE IF NOT EXISTS localizacoes_departamento (
	numero_departamento INTEGER     NOT NULL,
	local               VARCHAR(15) NOT NULL,
	CONSTRAINT pk_localizacoes_departamento 
        PRIMARY KEY (numero_departamento,local)
);
-- Table comment
comment on
table localizacoes_departamento is 'Tabela que armazena as possíveis localizações dos departamentos.';
-- Column comments

comment on
column localizacoes_departamento.numero_departamento is 'Número do departamento. Faz parta da PK desta tabela e também é uma FK para a tabela departamento.';

comment on
column localizacoes_departamento.local is 'Localização do departamento. Faz parte da PK desta tabela.';
-- End Table localizacoes_departamento

-- Drop Table projeto
DROP TABLE IF EXISTS projeto CASCADE;

-- Create Table projeto
CREATE TABLE IF NOT EXISTS projeto (
	numero_projeto      INTEGER     NOT NULL CHECK (numero_projeto > 0),
    nome_projeto        VARCHAR(15) NOT NULL,
	local_projeto       VARCHAR(15),
    numero_departamento INTEGER     NOT NULL,
	CONSTRAINT pk_projeto 
        PRIMARY KEY (numero_projeto)
);

-- Table comment
comment on
table projeto is 'Tabela que armazena as informações sobre os projetos dos departamentos.';
-- Column comments

comment on
column projeto.numero_projeto is 'Número do projeto. É a PK desta tabela.';

comment on
column projeto.nome_projeto is 'Nome do projeto. Deve ser único.';

comment on
column projeto.local_projeto is 'Localização do projeto.';

comment on
column projeto.numero_departamento is 'Número do departamento. É uma FK para a tabela departamento.';
-- End Table projeto

-- Drop Table trabalha_em
DROP TABLE IF EXISTS trabalha_em CASCADE;

-- Create Table trabalha_em
CREATE TABLE IF NOT EXISTS trabalha_em (
	cpf_funcionario 	CHAR(11) 		NOT NULL,
	numero_projeto 		INTEGER 		NOT NULL,
	horas				DECIMAL(10,2)	,
	CONSTRAINT pk_trabalha_em 
		PRIMARY KEY (cpf_funcionario, numero_projeto)
);

-- Table comment
comment on
table trabalha_em is 'Tabela para armazenar quais funcionários trabalham em quais projetos.';
-- Column comments

comment on
column trabalha_em.cpf_funcionario is 'CPF do funcionário. Faz parte da PK desta tabela e é uma FK para a tabela funcionário.';

comment on
column trabalha_em.numero_projeto is 'Número do projeto. Faz parte da PK desta tabela e é uma FK para a tabela projeto.';

comment on
column trabalha_em.horas is 'Horas trabalhadas pelo funcionário neste projeto.';
-- End Table trabalha_em


ALTER TABLE elmasri.departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES elmasri.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.funcionario ADD CONSTRAINT funcionario_funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES elmasri.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.localizacoes_departamento ADD CONSTRAINT departamento_localiza__es_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES elmasri.projeto (numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
