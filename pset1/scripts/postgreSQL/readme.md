# Guia Basico para executar o script de criação do BD

1. Baixar o script [postgres.sql](postgres.sql) em uma pasta da maquina local

> Abra a pasta com o arquivo pelo terminal

2. digite ou cole com `Ctrl + Shift + v` o comando:
      
        psql -U postgres -W -f postgres.sql

e inserir a senha.

------------




Com isso seu banco de dados será criado no SGBD PostgreSQL, pronto para ser usádo.
