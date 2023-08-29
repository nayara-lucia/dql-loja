-- 1. Somente o nome de todos os vendedores em ordem alfabética.
select * from vendedor
select nome from vendedor order by nome asc

--2. Os produtos que o preço seja maior que R$200,00, em ordem crescente pelo preço.
select * from produto
select nome, valor from produto where valor > 200 order by valor

--3. O nome do produto, o preço e o preço reajustado em 10%, ordenado pelo nome do produto.
select * from produto
select nome, valor from produto
select nome, valor, valor + (valor * 10) / 100 as Reajuste from produto order by nome

--4. Os municípios do Rio Grande do Sul.
select * from municipio
select * from uf

select * from municipio where iduf = 5

--5. Os pedidos feitos entre 10/04/2008 e 25/04/2008 ordenado pelo valor.
select * from pedido
select data_pedido, valor from pedido where data_pedido between '2008-04-10' and '2008-04-25' order by valor

--6. Os pedidos que o valor esteja entre R$1.000,00 e R$1.500,00.
select * from pedido
select data_pedido, valor from pedido where valor between 1000 and 1500

--7. Os pedidos que o valor não esteja entre R$100,00 e R$500,00.
select * from pedido
select valor from pedido where valor not between 100 and 500

--8. Os pedidos do vendedor André ordenado pelo valor em ordem decrescente.
select * from pedido
select * from vendedor

select idpedido,idvendedor, valor from pedido where idvendedor = 1 order by valor desc

--9. Os pedidos do cliente Manoel ordenado pelo valor em ordem crescente.
select * from cliente

select idcliente, idpedido, valor from pedido where idcliente = 1 order by valor asc

--10. Os pedidos da cliente Jéssica que foram feitos pelo vendedor André.
select * from cliente -- id da cliente é 15
select * from vendedor -- id do vendedor é 1

select idcliente, idvendedor, valor, data_pedido from pedido where idcliente = 15 and idvendedor = 1

--11. Os pedidos que foram transportados pela transportadora União Transportes.
select * from transportadora -- transportadora 2

select * from pedido where idtransportadora = 2

--12. Os pedidos feitos pela vendedora Maria ou pela vendedora Aline.
select * from vendedor -- Maria (5) Aline(7)

select * from pedido where idvendedor = 5 or idvendedor = 7

--13. Os clientes que moram em União da Vitória ou Porto União.
select * from municipio --Porto uniao (1), Uniao da vitoria(9)

select * from cliente where idmunicipio = 1 or idmunicipio = 9

--14. Os clientes que não moram em União da Vitória e nem em Porto União.
select * from cliente where idmunicipio <> 1 and idmunicipio <> 9

--15. Os clientes que não informaram o logradouro.
select * from cliente where logradouro is null

--16. Os clientes que moram em avenidas.
select * from cliente where logradouro like 'Av%'

--17. Os vendedores que o nome começa com a letra S.
select * from vendedor where nome like 'S%'

--18. Os vendedores que o nome termina com a letra A.
select * from vendedor where nome like '%a'

--19. Os vendedores que o nome não começa com a letra A.
select * from vendedor where nome not like 'A%'

--20. Os municípios que começam com a letra P e são de Santa Catarina.
select * from uf

select * from municipio where nome like 'P%' and iduf = 1

--21. As transportadoras que informaram o endereço.
select * from transportadora

select * from transportadora where logradouro is not null

--22. Os itens do pedido 01.
select * from pedido_produto

select idpedido, idproduto from pedido_produto where idpedido = 1

--23. Os itens do pedido 06 ou do pedido 10.
select idpedido, idproduto from pedido_produto where idpedido = 6 or idpedido = 10