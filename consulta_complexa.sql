-- Selecionar a data do pedido e o valor onde o valor seja maior que a média dos valores de todos os pedidos
select * from pedido
select avg(valor) from pedido 

select
	data_pedido,
	valor
from pedido 
where 
	valor > (select avg(valor) from pedido)
	
-- Exemplo com count, seleção da data do pedido do valor e da quantidade de produtos em cada um dos pedidos
-- FORMA COM JOIN
select
	pdd.data_pedido,
	pdd.valor,
	sum(pdp.quantidade)
from
	pedido as pdd
left outer join
	pedido_produto as pdp on pdd.idpedido = pdp.idpedido
group by
	pdd.idpedido, pdd.data_pedido, pdd.valor

-- EXEMPLO COM SUBCONSULTA
select 
	pdd.data_pedido,
	pdd.valor,
	(select sum(quantidade) from pedido_produto as pdp where pdp.idpedido = pdd.idpedido) as total
from
	pedido as pdd

-- Exemplo com update, aumentar o preço em 5% somente dos produtos que o valor for maior que a média do valor de todos os pedidos
select * from produto
select * from pedido
select avg(valor) from produto

update produto set valor = valor + ((valor * 5) / 100)
where valor > (select avg(valor) from produto)

-- EXERCICIOS

-- 1. O nome dos clientes que moram na mesma cidade do Manoel. Não deve ser mostrado o Manoel. 
select * from cliente where nome = 'Manoel'
select idmunicipio from cliente where nome = 'Manoel'

select
	nome,
	idmunicipio
from cliente
where 
	idmunicipio = (select idmunicipio from cliente where nome = 'Manoel')
and
	idcliente <> 1
	

-- 2. A data e o valor dos pedidos que o valor do pedido seja menor que a média de todos os pedidos.
select data_pedido from pedido
select valor from pedido
select avg(valor) from pedido

select
	data_pedido,
	valor
from
	pedido
where
	valor < (select avg(valor) from pedido)



-- 3. A data,o valor, o cliente e o vendedor dos pedidos que possuem 2 ou mais produtos.
select idpedido, sum(quantidade) from pedido_produto  group by idpedido

select
	pdd.data_pedido,
	pdd.valor,
	cln.nome,
	vnd.nome
from 
	pedido as pdd
left outer join
	cliente as cln on pdd.idcliente = cln.idcliente
left outer join
	vendedor as vnd on pdd.idvendedor = vnd.idvendedor
where
	(select sum(quantidade) from pedido_produto pdp where pdp.idpedido = pdd.idpedido) > 2

-- 4. O nome dos clientes que moram na mesma cidade da transportadora BSTransportes.
select * from transportadora
select * from municipio
select * from cliente

select 
	nome,
	idmunicipio
from
	cliente
where
	idmunicipio = (select idmunicipio from transportadora where idtransportadora = 2)

-- 5. O nome do cliente e o município dos clientes que estão localizados no mesmo município de qualquer uma das transportadoras.

select 
	nome,
	idmunicipio
from
	cliente
where
	idmunicipio in (select(idmunicipio) from transportadora)
				   
-- 6. Atualizar o valor do pedido em 5% para os pedidos que o somatório do 
-- valor total dos produtos daquele pedido seja maior que a média do valor total de todos os produtos de todos os pedidos.

update 
	pedido 
set 
	valor = valor + ((valor * 5 ) / 100)
where 
	(select sum(valor_unitario) from pedido_produto pdp where pdp.idpedido = pedido.idpedido) > (select avg(valor_unitario) from pedido_produto)

-- 7. O nome do cliente e a quantidade de pedidos feitos pelo cliente.
select
	cln.nome,
	(select count(idpedido) from pedido pdd where pdd.idcliente = cln.idcliente)
from 
 	cliente as cln



-- 8. Para revisar, refaça o exercício anterior (número 07) utilizando group by e mostrando somente os clientes que fizeram pelo menos um pedido.

select
	cln.nome,
	count(idpedido)
from
	pedido as pdd
left outer join
	cliente as cln on pdd.idcliente = cln.idcliente
group by
	cln.nome