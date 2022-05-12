# PSET 2

O Problem Set 2 é uma extensão do [Problem Set 1](https://github.com/DevTrzJbr/uvv_bd_1_cc2m/tree/main/pset1) onde seram feito relatórios de acordo com os pedidos das questões abaixo.


## Como executar o script no postgreSQL

1. Baixar o script [pset2.sql](pset2.sql) em uma pasta da maquina local

> Abra a pasta com o arquivo pelo terminal

2. digite ou cole com `Ctrl + Shift + v` o comando:
      
        psql {banco de dados} -U {usuário} -W -f pset2.sql

e insera a senha.

------------

você verá algo como ...

### questao 1

> Mostra a média salarial dos funcionários de cada departamento.

 numero_departamento |  media   
--|----------
1 | 55000.00
4 | 31000.00
5 | 33250.00

### questao 2

> Mostra a média salarial dos homens e das mulheres.

 sexo |  media   
------|----------
 F    | 31000.00
 M    | 37600.00

### questao 3

> Lista as informações de cada funcionário de acordo com seu departamento.

 nome_funcionario | data_nascimento | idade | salario  | nome_departamento 
------------------|-----------------|-------|----------|-------------------
 Alice J Zelaya   | 19/01/1968      |    54 | 25000.00 | Administração
 Jennifer S Souza | 20/06/1941      |    81 | 43000.00 | Administração
 André V Perreira | 29/03/1969      |    53 | 25000.00 | Administração
 Jorge E Brito    | 10/11/1937      |    85 | 55000.00 | Matriz
 Fernando T Wong  | 08/12/1955      |    67 | 40000.00 | Pesquisa
 João B Silva     | 09/01/1965      |    57 | 30000.00 | Pesquisa
 Ronaldo K Lima   | 15/09/1962      |    60 | 38000.00 | Pesquisa
 Joice A Leite    | 31/07/1972      |    50 | 25000.00 | Pesquisa

### questao 4

> Lista os funcionários e mostra o reajuste salárial de cada.

  nome_completo   | idade | salario_atual | novo_salario 
------------------|-------|---------------|--------------
 Jorge E Brito    |    85 |      55000.00 |   63250.0000
 Fernando T Wong  |    67 |      40000.00 |   46000.0000
 João B Silva     |    57 |      30000.00 |    36000.000
 Jennifer S Souza |    81 |      43000.00 |   49450.0000
 Ronaldo K Lima   |    60 |      38000.00 |   43700.0000
 Joice A Leite    |    50 |      25000.00 |    30000.000
 André V Perreira |    53 |      25000.00 |    30000.000
 Alice J Zelaya   |    54 |      25000.00 |    30000.000

### questao 5

> Lista de acordo com o departamento em ordem alfabética, o funcionário e seu salário e o nome de seu gerente.

 nome_departamento |  nome_completo   | salario  |   nome_gerente   
-------------------|------------------|--------|------------------
 Administração     | Jennifer S Souza | 43000.00 | Jorge   E Brito
 Administração     | Alice J Zelaya   | 25000.00 | Jennifer S Souza
 Administração     | André V Perreira | 25000.00 | Jennifer S Souza
 Matriz            | Jorge E Brito    | 55000.00 | 
 Pesquisa          | Fernando T Wong  | 40000.00 | Jorge   E Brito
 Pesquisa          | Ronaldo K Lima   | 38000.00 | Fernando T Wong
 Pesquisa          | João B Silva     | 30000.00 | Fernando T Wong
 Pesquisa          | Joice A Leite    | 25000.00 | Fernando T Wong


### questao 6

> Lista o nome compĺeto dos funcionários que possuem dependentes, informando idade e sexo do dependente.

 funcionario_com_dependente | trabalha_no_departamento | nome_dependente | idade |   sexo    
----------------------------|--------------------------|-----------------|-------|-----------
 Fernando T Wong            | Pesquisa                 | Alicia          |    36 | Feminino
 Fernando T Wong            | Pesquisa                 | Tiago           |    39 | Masculino
 Fernando T Wong            | Pesquisa                 | Janaína         |    64 | Feminino
 Jennifer S Souza           | Administração            | Antonio         |    80 | Masculino
 João B Silva               | Pesquisa                 | Michael         |    34 | Masculino
 João B Silva               | Pesquisa                 | Alicia          |    34 | Feminino
 João B Silva               | Pesquisa                 | Elizabeth       |    55 | Feminino

### questao 7

> Lista cada funcionário que não possue dependente.

  nome_completo   | salario  | nome_departamento 
------------------|-------|-------------------
 Joice A Leite    | 25000.00 | Pesquisa
 Ronaldo K Lima   | 38000.00 | Pesquisa
 Alice J Zelaya   | 25000.00 | Administração
 André V Perreira | 25000.00 | Administração
 Jorge E Brito    | 55000.00 | Matriz

### questao 8

> Lista os funcionário de cada departamento, em que projeto estão trabalhando e quantas horas trabalhadas.

 funcionario_responsavel | departamento_resposavel | projeto_trabalhado | horas_trabalhadas 
-------------------------|-------------------------|--------------------|-------------------
 João B Silva            | Pesquisa                | ProdutoX           |             32.50
 João B Silva            | Pesquisa                | ProdutoY           |              7.50
 Ronaldo K Lima          | Pesquisa                | ProdutoZ           |             40.00
 Joice A Leite           | Pesquisa                | ProdutoX           |             20.00
 Joice A Leite           | Pesquisa                | ProdutoY           |             20.00
 Fernando T Wong         | Pesquisa                | ProdutoY           |             10.00
 Fernando T Wong         | Pesquisa                | ProdutoZ           |             10.00
 Fernando T Wong         | Pesquisa                | Informatização     |             10.00
 Fernando T Wong         | Pesquisa                | Reorganização      |             10.00
 Alice J Zelaya          | Administração           | Novosbenefícios    |             30.00
 Alice J Zelaya          | Administração           | Informatização     |             10.00
 André V Perreira        | Administração           | Informatização     |             35.00
 André V Perreira        | Administração           | Novosbenefícios    |              5.00
 Jennifer S Souza        | Administração           | Novosbenefícios    |             20.00
 Jennifer S Souza        | Administração           | Reorganização      |             15.00
 Jorge E Brito           | Matriz                  | Reorganização      |                  


### questao 9

> Lista a quantidade total que foi trabalhada por projeto e seus respectivos departamentos.

 nome_departamento |  nome_projeto   | total_de_horas 
-------------------|------------|--------------
 Pesquisa          | ProdutoY        |          37.50
 Administração     | Novosbenefícios |          55.00
 Pesquisa          | ProdutoZ        |          50.00
 Matriz            | Reorganização   |          25.00
 Pesquisa          | ProdutoX        |          52.50
 Administração     | Informatização  |          55.00

### questao 10

> Mostra a média salárial por funcionário de cada departamento.

numero_departamento | nome_departamento | media_salario_departamento 
--|-------------------|--------------------------
5 | Pesquisa          |         33250.00
4 | Administração     |         31000.00
1 | Matriz            |         55000.00

### questao 11

> Mostra o valor a ser pago por hora, sendo a hora trabalhada como R$50,00, de cada funcionário.

  nome_completo   |  nome_projeto   | valor_para_receber 
------------------|-----------------|--------------------
 Alice J Zelaya   | Informatização  |             500.00
 Alice J Zelaya   | Novosbenefícios |            1500.00
 André V Perreira | Novosbenefícios |             250.00
 André V Perreira | Informatização  |            1750.00
 Fernando T Wong  | ProdutoZ        |             500.00
 Fernando T Wong  | ProdutoY        |             500.00
 Fernando T Wong  | Informatização  |             500.00
 Fernando T Wong  | Reorganização   |             500.00
 Jennifer S Souza | Reorganização   |             750.00
 Jennifer S Souza | Novosbenefícios |            1000.00
 João B Silva     | ProdutoX        |            1625.00
 João B Silva     | ProdutoY        |             375.00
 Joice A Leite    | ProdutoY        |            1000.00
 Joice A Leite    | ProdutoX        |            1000.00
 Jorge E Brito    | Reorganização   |                   
 Ronaldo K Lima   | ProdutoZ        |            2000.00

### questao 12

> Mostra em ordem alfabética todos os funcionários, até os que não possuem horas registradas, de acordo com do departamentio e projeto que trabalha.

 funcionario_responsavel | departamento_resposavel | projeto_trabalhado | horas 
-------------------------|------------------------|------------------|------
 Alice J Zelaya          | Administração           | Informatização     | 10.00
 Alice J Zelaya          | Administração           | Novosbenefícios    | 30.00
 André V Perreira        | Administração           | Novosbenefícios    |  5.00
 André V Perreira        | Administração           | Informatização     | 35.00
 Fernando T Wong         | Pesquisa                | ProdutoZ           | 10.00
 Fernando T Wong         | Pesquisa                | ProdutoY           | 10.00
 Fernando T Wong         | Pesquisa                | Informatização     | 10.00
 Fernando T Wong         | Pesquisa                | Reorganização      | 10.00
 Jennifer S Souza        | Administração           | Reorganização      | 15.00
 Jennifer S Souza        | Administração           | Novosbenefícios    | 20.00
 João B Silva            | Pesquisa                | ProdutoX           | 32.50
 João B Silva            | Pesquisa                | ProdutoY           |  7.50
 Joice A Leite           | Pesquisa                | ProdutoY           | 20.00
 Joice A Leite           | Pesquisa                | ProdutoX           | 20.00
 Jorge E Brito           | Matriz                  | Reorganização      |      
 Ronaldo K Lima          | Pesquisa                | ProdutoZ           | 40.00

### questão 13

> Lista os funcionários e dependentes em ordem decrescente de idade e sua idade.

pessoas      | idade |   sexo    
------------------|-------|----------
 Jorge E Brito    |    85 | Masculino
 Jennifer S Souza |    81 | Feminino
 Antonio          |    80 | Masculino
 Fernando T Wong  |    67 | Masculino
 Janaína          |    64 | Feminino
 Ronaldo K Lima   |    60 | Masculino
 João B Silva     |    57 | Masculino
 Elizabeth        |    55 | Feminino
 Alice J Zelaya   |    54 | Feminino
 André V Perreira |    53 | Masculino
 Joice A Leite    |    50 | Feminino
 Tiago            |    39 | Masculino
 Alicia           |    36 | Feminino
 Alicia           |    34 | Feminino
 Michael          |    34 | Masculino

questao 14

> Exibe a quantidade funcionários em que cada departamento tem. 

 nome_departamento | count 
-------------------|-------
 Pesquisa          |     4
 Administração     |     3
 Matriz            |     1

### questao 15

> Lista os funcionário e cada projeto que ele trabalha.

  nome_completo   | nome_departamento |  nome_projeto   
-----------------|-------------------|-----------------
 Alice J Zelaya   | Administração     | Informatização
 Alice J Zelaya   | Administração     | Novosbenefícios
 André V Perreira | Administração     | Novosbenefícios
 André V Perreira | Administração     | Informatização
 Fernando T Wong  | Pesquisa          | ProdutoZ
 Fernando T Wong  | Pesquisa          | ProdutoY
 Fernando T Wong  | Pesquisa          | Informatização
 Fernando T Wong  | Pesquisa          | Reorganização
 Jennifer S Souza | Administração     | Reorganização
 Jennifer S Souza | Administração     | Novosbenefícios
 João B Silva     | Pesquisa          | ProdutoX
 João B Silva     | Pesquisa          | ProdutoY
 Joice A Leite    | Pesquisa          | ProdutoY
 Joice A Leite    | Pesquisa          | ProdutoX
 Jorge E Brito    | Matriz            | Reorganização
 Ronaldo K Lima   | Pesquisa          | ProdutoZ
 
 ## Participações 
 
Feito com ajuda do [Daniel Marculano](https://github.com/danielsmar) e [Lucas Zannon](https://github.com/marsh090).
