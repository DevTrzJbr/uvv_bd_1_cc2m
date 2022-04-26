# Guia Basico para executar o script de criação do BD

1. Baixar o script [mariaDB.sql](mariaDB.sql) em uma pasta da maquina local

> Abra a pasta com o arquivo pelo terminal

2. Entre no SGBD com o comando:

        mysql -p
        
e insira a senha padrão do SGBD.

> Você deve estar dentro agora.

3. Para executar o script escreva:

        source mariaDB.sql

------------

Com isso seu banco de dados será criado no SGBD PostgreSQL, pronto para ser usádo.
