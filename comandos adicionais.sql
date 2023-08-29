select * from pedido

select 
	data_pedido, 
	extract(day from data_pedido) as dia, 
	extract(month from data_pedido) as mes,
	extract(year from data_pedido) as ano
from 
	pedido
---------------------------------------------------------
select nome, substring(nome from 1 for 5), substring(nome, 2) from cliente --Seleciona o nome das letras x até a y
---------------------------------------------------------
select nome, upper(nome) from cliente --Transforma tudo em maiúscula
---------------------------------------------------------
select nome, cpf, coalesce(cpf, 'Não informado') from cliente --Substitui o valor nulo por outra coisa
---------------------------------------------------------
select
	case sigla
		when 'PR' then 'Paraná'
		when 'SC' then 'Santa Catarina'
	else 'Outros'
	end as uf
from
	uf
---------------------------------------------------------
-- 1. O nome do cliente e somente o mês de nascimento. Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não informado”.
select * from cliente

select
	nome,
	coalesce(extract(month from data_nascimento), 0) as mes
from 
	cliente

-- 2. O nome do cliente e somente o nome do mês de nascimento (Janeiro, Fevereiro etc). Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não informado”.
select
	nome,
	case extract(month from data_nascimento)
	when '1' then 'Janeiro'
	when '2' then 'Fevereiro'
	when '3' then 'Março'
	when '4' then 'Abril'
	when '5' then 'Maio'
	when '6' then 'Junho'
	when '7' then 'Julho'
	when '8' then 'Agosto'
	when '9' then 'Setembro'
	when '10' then 'Outubro'
	when '11' then 'Novembro'
	when '12' then 'Dezembro'
else 'Não informado'
	end as mes
from cliente

-- 3. O nome do cliente e somente o ano de nascimento. Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não informado”.
select
	nome,
	coalesce(extract(year from data_nascimento), 0)
from
	cliente

-- 4. O caractere 5 até o caractere 10 de todos os municípios.
select nome, substring(nome from 5 for 10) from municipio

-- 5. O nome de todos os municípios em letras maiúsculas.
select nome, upper(nome) from municipio

-- 6. O nome do cliente e o gênero. Caso seja M mostrar “Masculino”, senão mostrar “Feminino”.
select
	nome,
	case genero
	when 'M' then 'Masculino'
	when 'F' then 'Feminino'
	end as genero
from cliente
-- 7. O nome do produto e o valor. Caso o valor seja maior do que R$ 500,00 mostrar a mensagem “Acima de 500”, caso contrário, mostrar a mensagem “Abaixo de 500”.
select
	nome,
	valor,
	case 
	when valor >= 500 then 'Acima de 500'
	else 'Abaixo de 500'
	end as faixa
from produto