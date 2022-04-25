
-- INICIO DO SCRIPT

/*
* PARTE 1
* Configurações iniciais de criação de usuário e banco de dados.
*/

-- Cria usuário do SGBD
CREATE USER IF NOT EXISTS joao 
    IDENTIFIED BY '1234';

-- Cria Banco de dados UVV com suas propriedades e permissões
CREATE DATABASE IF NOT EXISTS uvv;

-- Concede todos privilégios de administrador ao usuário
GRANT ALL PRIVILEGES ON uvv.* TO joao; 

-- Entra com o usuário criado no SGBD
SYSTEM mysql -u joao -p;

/*
* O terminal irá pedir uma senha para logar como usuário "joao"
* escreva a senha do usuário => "1234", após isso você estará logado
* como usuário "joao" no SGBD.
*/

/*#####################################################################################*/
