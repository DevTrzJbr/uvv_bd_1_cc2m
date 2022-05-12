--PSET 2
\echo 'PSET 2'

--questao 1

\echo 'questao 1'
SELECT numero_departamento, 
       cast(AVG(salario) AS DECIMAL(10,2)) AS media
FROM funcionario 
GROUP BY numero_departamento
order BY numero_departamento ;

--questao 2

\echo 'questao 2'
SELECT sexo, 
       cast(AVG(salario) AS DECIMAL(10,2)) AS media
FROM funcionario 
GROUP BY sexo
ORDER BY sexo ;

--questao 3

\echo 'questao 3'
select
	(f.primeiro_nome||' '||f.nome_meio ||' '||f.ultimo_nome) as nome_funcionario,
	f.data_nascimento,
	DATE_PART('year', current_date) - DATE_PART('year', f.data_nascimento) as idade,
	f.salario,
	d.nome_departamento
from
	funcionario f

join departamento d on f.numero_departamento = d.numero_departamento 
order by nome_departamento ;

--questão 4

\echo 'questao 4'
select
	f.primeiro_nome||' '||f.nome_meio ||' '||f.ultimo_nome as nome_completo,
	DATE_PART('year', current_date) - DATE_PART('year', f.data_nascimento) as idade,
	f.salario as salario_atual,
	(case when (f.salario < '35000') then f.salario*1.2
		  when (f.salario >= '35000') then f.salario*1.15 end ) as novo_salario
from funcionario f;


--questao 05

\echo 'questao 5'
select
	d.nome_departamento,
	f.primeiro_nome || ' ' || f.nome_meio || ' ' || f.ultimo_nome as nome_completo,
	f.salario,
	(case when(f.cpf_supervisor = '98765432168')then 'Jennifer S Souza' 
		  when(f.cpf_supervisor = '33344555587')then 'Fernando T Wong' 
		  when(f.cpf_supervisor = '88866555576')then 'Jorge	E Brito'end) as nome_gerente
	
from
	funcionario f

join departamento d on f.numero_departamento = d.numero_departamento 
order by nome_departamento  asc,salario desc ;

--questao 06

\echo 'questao 6'
select 
	(case when(f.cpf = d.cpf_funcionario)then f.primeiro_nome || ' ' || f.nome_meio || ' ' || f.ultimo_nome end) as funcionario_com_dependente,
    d2.nome_departamento as trabalha_no_departamento,
    d.nome_dependente,
    DATE_PART('year', current_date) - DATE_PART('year', d.data_nascimento) as idade,
    (case when(d.sexo = 'M')then 'Masculino'
    	  when(d.sexo = 'F')then 'Feminino'end) as sexo
from 
	funcionario f 
join dependente d on f.cpf =d.cpf_funcionario 
join departamento d2 on f.numero_departamento = d2.numero_departamento ;
	
--questao 07

\echo 'questao 7'
select 
	 f.primeiro_nome||' '||f.nome_meio ||' '||f.ultimo_nome as nome_completo,
	 f.salario,
	 d.nome_departamento 
from 
	funcionario f 
	
join departamento d on f.numero_departamento =d.numero_departamento 
where f.cpf not in (select d.cpf_funcionario from dependente d) ;


--questao 08

\echo 'questao 8'
select 
	f.primeiro_nome||' '||f.nome_meio ||' '||f.ultimo_nome as funcionario_responsavel,
	d.nome_departamento as departamento_resposavel,
	p.nome_projeto as projeto_trabalhado,
	te.horas as horas_trabalhadas
	
from 
	trabalha_em te 
join projeto p on p.numero_projeto = te.numero_projeto 
join funcionario f ON f.cpf =te.cpf_funcionario 
join departamento d on f.numero_departamento =d.numero_departamento ;

--questao 09

\echo 'questao 9'
select 
	d.nome_departamento,
	p.nome_projeto,
	sum(te.horas) as total_de_horas
	
from 
	departamento d 
join projeto p  on p.numero_departamento = d.numero_departamento 
join trabalha_em te  on p.numero_projeto = te.numero_projeto 
group by nome_projeto , nome_departamento ;

--questao 10

\echo 'questao 10'
select 
	d.numero_departamento,
	d.nome_departamento,
	avg(f.salario)	as media_salario_departamento
	
from 
	departamento d 
join funcionario f on f.numero_departamento =d.numero_departamento 
group by d.numero_departamento ;

--questao 11

\echo 'questao 11'
select 
	f.primeiro_nome||' '||f.nome_meio ||' '||f.ultimo_nome as nome_completo,
	p.nome_projeto,
	(te.horas * 50) as valor_para_receber
from 
	funcionario f

join trabalha_em te on te.cpf_funcionario = f.cpf
join projeto p on p.numero_projeto = te.numero_projeto  
order by nome_completo ;

--questao 12

\echo 'questao 12'
select 
	f.primeiro_nome||' '||f.nome_meio ||' '||f.ultimo_nome as funcionario_responsavel,
	d.nome_departamento as departamento_resposavel,
	p.nome_projeto as projeto_trabalhado,	
	te.horas
from 
	trabalha_em te 
	
full join funcionario f on f.cpf =te.cpf_funcionario 
full join departamento d on f.numero_departamento =d.numero_departamento 
full join projeto p on p.numero_projeto = te.numero_projeto 
order by f.primeiro_nome ;


--questao 13

\echo 'questao 13'
select 
f.primeiro_nome||' '||f.nome_meio ||' '||f.ultimo_nome as Pessoas,
DATE_PART('year', current_date) - DATE_PART('year', f.data_nascimento) as idade,
(case when(f.sexo = 'M')then 'Masculino'
    	  when(f.sexo = 'F')then 'Feminino'end) as sexo
from 
funcionario f 

union

select 
d.nome_dependente,
DATE_PART('year', current_date) - DATE_PART('year', d.data_nascimento) as idade,
(case when(d.sexo = 'M')then 'Masculino'
    	  when(d.sexo = 'F')then 'Feminino'end) as sexo
from 
dependente d 
order by idade desc ; 

--questao 14

\echo 'questao 14'
select 
	d.nome_departamento,
	count(f.numero_departamento)
from 
	departamento d 
	
join funcionario f on d.numero_departamento =f.numero_departamento 
group by d.nome_departamento ; 

--questao 15

\echo 'questao 15'
select
	f.primeiro_nome||' '||f.nome_meio ||' '||f.ultimo_nome as nome_completo,
	d.nome_departamento,
	proj.nome_projeto
	
from
	funcionario f
full join trabalha_em te on	te.cpf_funcionario = f.cpf
full join projeto proj on	proj.numero_projeto = te.numero_projeto
join departamento d on	f.numero_departamento = d.numero_departamento
order by f.primeiro_nome ;
