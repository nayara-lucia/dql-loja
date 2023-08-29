select avg(valor) from pedido
------------------------------
select count(idmunicipio) from municipio
------------------------------
select count(logradouro) from transportadora -- Conta apenas os preenchido
select count(idtransportadora) from transportadora -- Conta tudo pois a PK é obrigatória
------------------------------
select * from municipio
select count(idmunicipio) from municipio where iduf = 2 -- Contagem de municipios de SC
------------------------------
select max(valor) from pedido
------------------------------
select min(valor) from pedido
------------------------------
select min(valor), max(valor) from pedido
------------------------------
select sum(valor) from pedido
------------------------------
select idcliente, sum(valor) from pedido group by idcliente
------------------------------
select idcliente, sum(valor) from pedido group by idcliente having sum(valor) > 500 -- Having é sempre seguida de uma função de coluna (como SUM, AVG, MAX, MIN ou COUNT) sendo a última função a ser executada
------------------------------
-- 1. A média dos valores de vendas dos vendedores que venderam mais que R$ 200,00. 
select * from pedido
select idvendedor, avg(valor) from pedido group by idvendedor having avg(valor) > 200 

-- 2. Os vendedores que venderam mais que R$ 1500,00
select idvendedor, sum(valor) from pedido group by idvendedor having sum(valor) > 1500 

-- 3. O somatório das vendas de cada vendedor.
select idvendedor, sum(valor) from pedido group by idvendedor

-- 4. A quantidade de municípios.
select * from municipio
select count(idmunicipio) from municipio
 
-- 5. A quantidade de municípios que são do Paraná ou de Santa Catarina.
select * from uf -- Parana 2, SC 1
select * from municipio

select count(idmunicipio) as idmunicipio, iduf from municipio where iduf = 2 or iduf = 1 group by idmunicipio 

-- 6. A quantidade de municípios por estado.
select * from municipio

select iduf, count(idmunicipio) from municipio group by iduf
-- 7. A quantidade de clientes que informaram o logradouro.
select * from cliente

select count(idcliente) from cliente where logradouro is not null

-- 8. A quantidade de clientes por município.
select idmunicipio, count(idcliente) from cliente group by idmunicipio

-- 9. A quantidade de fornecedores.
select count(idfornecedor) from fornecedor

-- 10. A quantidade de produtos por fornecedor.
select idfornecedor, count(idproduto) from produto group by idfornecedor

-- 11. A média de preços dos produtos do fornecedor Cap. Computadores.
select * from fornecedor -- Cap = 1
select * from produto

select idfornecedor, avg(valor) from produto group by idfornecedor having idfornecedor = 1 -- Jeito 1
select avg(valor) from produto where idfornecedor = 1 -- Jeito 2

-- 12. O somatório dos preços de todos os produtos.
select * from produto

select sum(valor) from produto
-- 13. O nome do produto e o preço somente do produto mais caro.
select * from produto

select nome, valor from produto order by valor desc limit 1
-- 14. O nome do produto e o preço somente do produto mais barato.
select nome, valor from produto order by valor asc limit 1
-- 15. A média de preço de todos os produtos.
select avg(valor) from produto

-- 16. A quantidade de transportadoras.
select count(idtransportadora) from transportadora

-- 17. A média do valor de todos os pedidos.
select avg(valor) from pedido

-- 18. O somatório do valor do pedido agrupado por cliente.
select idcliente, sum(valor) from pedido group by idcliente order by idcliente desc

-- 19. O somatório do valor do pedido agrupado por vendedor.
select idvendedor, sum(valor) from pedido group by idvendedor order by idvendedor desc

-- 20. O somatório do valor do pedido agrupado por transportadora.
select * from pedido
select * from transportadora

select idtransportadora, sum(valor) from pedido group by idtransportadora order by idtransportadora desc

-----------------------
select * from pedido

insert into transportadora (idtransportadora, idmunicipio, nome) values (3, 5, 'Trans Atlantica');

update pedido set idtransportadora = 3  where idpedido in (8,9,15)

-- 21. O somatório do valor do pedido agrupado pela data.
select * from pedido

select data_pedido, sum(valor) from pedido group by data_pedido

-- 22. O somatório do valor do pedido agrupado por cliente, vendedor e transportadora.
select idcliente, idvendedor, idtransportadora, sum(valor) from pedido group by idcliente, idvendedor, idtransportadora

-- 23. O somatório do valor do pedido que esteja entre 01/04/2008 e 10/12/2009 e que seja maior que R$ 200,00. 
select sum(valor) from pedido where data_pedido between '2008-04-01' and '2009-12-10' and valor > 200 

-- 24. A média do valor do pedido do vendedor André.
select * from vendedor -- André = 1

select avg(valor) from pedido where idvendedor = 1
select idvendedor, avg(valor) from pedido where idvendedor = 1 group by idvendedor

-- 25. A média do valor do pedido da cliente Jéssica.
select * from cliente -- Jessica = 15

select avg(valor) from pedido where idcliente = 15

-- 26. A quantidade de pedidos transportados pela transportadora Trans Atlantica.
select * from transportadora

select count(*) from pedido where idtransportadora = 3
select count(idpedido) from pedido where idtransportadora = 3

-- 27. A quantidade de pedidos agrupados por vendedor.
select idvendedor, count(idpedido) from pedido group by idvendedor

-- 28. A quantidade de pedidos agrupados por cliente.
select idcliente, count(idpedido) from pedido group by idcliente

-- 29. A quantidade de pedidos entre 15/04/2008 e 25/04/2008.
select count(idpedido) from pedido where data_pedido between '2008-04-15' and '2008-04-25'

-- 30. A quantidade de pedidos que o valor seja maior que R$ 1.000,00.
select count(idpedido) from pedido where valor > 1000

-- 31. A quantidade de microcomputadores vendida.
select * from produto -- Microcomputador = 1

select * from pedido_produto
select count(idproduto) from pedido_produto where idproduto = 1 -- ERRADO!! ESTÁ CONTANDO APENAS QUANTOS MICROCOMPUTADORES FORAM VENDIDO NÃO SUAS QUANTIDADES NO PEDIDO
select sum(quantidade) from pedido_produto where idproduto = 1 -- CERTO!! ESTÁ SOMANDO AS QUANTIDADES NOS PEDIDOS
-- 32. A quantidade de produtos vendida agrupado por produto.
select idproduto, sum(quantidade) from pedido_produto group by idproduto

-- 33. O somatório do valor dos produtos dos pedidos, agrupado por pedido.
select idpedido, sum(valor_unitario) from pedido_produto group by idpedido

-- 34. A quantidade de produtos agrupados por pedido.
select idpedido, sum(quantidade) from pedido_produto group by idpedido

-- 35. O somatório do valor total de todos os produtos do pedido. 
select sum(valor_unitario) from pedido_produto

-- 36. A média dos produtos do pedido 6.
select avg(valor_unitario) from pedido_produto where idpedido = 6

-- 37. O valor do maior produto do pedido.
select * from pedido_produto order by valor_unitario desc limit 1
select max(valor_unitario) from pedido_produto

-- 38. O valor do menor produto do pedido.
select * from pedido_produto order by valor_unitario asc limit 1
select min(valor_unitario) from pedido_produto

-- 39. O somatório da quantidade de produtos por pedido.
select idpedido as Pedido, sum(quantidade) as Quantidade_Produtos from pedido_produto group by idpedido

-- 40. O somatório da quantidade de todos os produtos dos pedidos.
select sum(valor_unitario) from pedido_produto

