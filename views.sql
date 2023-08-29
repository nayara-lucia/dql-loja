-- Views
create view cliente_profissao as 
select 
	cln.nome as cliente,
	prf.nome as profissao
from
	cliente as cln
left outer join
	profissao as prf on cln.idprofissao = prf.idprofissao
	
select * from cliente_profissao where profissao = 'Professor'
select cliente from cliente_profissao

-- EXERCICIOS
--1. O nome, a profissão, a nacionalidade, o complemento, o município, a unidade de federação, o bairro, o CPF,o RG, a data de nascimento, o gênero (mostrar “Masculino” ou “Feminino”), o logradouro, o número e as observações dos clientes.
create view base_clientes as 
select
	cln.nome as Cliente,
	cln.cpf,
	cln.rg,
	cln.data_nascimento,
	(select case cln.genero when 'M' then 'Masculino' when 'F' then 'Feminino' end as genero),
	prf.nome as Profissao,
	nac.nome as Nacionalidade,
	comp.nome as Complemento,
	mun.nome as Municipio,
	uf.sigla,
	brr.nome as Bairro
from
	cliente as cln
left outer join
	profissao as prf on cln.idprofissao = prf.idprofissao
left outer join
	nacionalidade as nac on cln.idnacionalidade = nac.idnacionalidade
left outer join
	complemento as comp on cln.idcomplemento = comp.idcomplemento
left outer join
	municipio as mun on cln.idmunicipio = mun.idmunicipio
left outer join
	uf on cln.iduf = uf.iduf
left outer join
	bairro as brr on cln.idbairro = brr.idbairro

select * from base_clientes
	
--2. O nome do município e o nome e a sigla da unidade da federação.
create view municipio_uf as
select
	mnc.nome as municipio,
	uf.nome as unidade_federacao,
	uf.sigla
from
	municipio mnc
left outer join
	uf on mnc.iduf = uf.iduf

--3. O nome do produto, o valor e o nome do fornecedor dos produtos.
select * from produto_fornecedor

create view produto_fornecedor as
select 
	pdt.nome as Produto,
	pdt.valor as Valor,
	frn.nome as Fornecedor
from 
	produto as pdt
left outer join
	fornecedor as frn on pdt.idfornecedor = frn.idfornecedor

--4. O nome da transportadora, o logradouro, o número, o nome da unidade de federação e a sigla da unidade de federação das transportadoras.
create view transportadora_uf as
select
	trn.nome as transportadora,
	trn.logradouro,
	trn.numero,
	uf.nome as unidade_federacao,
	uf.sigla
from
	transportadora trn
left outer join
	municipio mnc on trn.idmunicipio = mnc.idmunicipio
left outer join
	uf on mnc.iduf = uf.iduf
	
select * from transportadora_uf where sigla = 'PR'

--5. A data do pedido, o valor, o nome da transportadora, o nome do cliente e o nome do vendedor dos pedidos.
select
	pdd.data_pedido,
	pdd.valor,
	trn.nome as transportadora,
	cln.nome as cliente,
	vnd.nome as vendedor
from
	pedido pdd
left outer join
	transportadora trn on pdd.idtransportadora = trn.idtransportadora
left outer join
	cliente cln on pdd.idcliente = cln.idcliente
left outer join
	vendedor vnd on pdd.idvendedor = vnd.idvendedor
