USE [Loja]
GO

--Passo 1.b

insert into dbo.Usuario
			(login, senha)

		Values
			('op1', 'b3Ax'),
			('op2', 'b3Ay');

--Passo 1.c

insert into dbo.Produto
			(nome, quantidade, precoVenda)

		Values
			('Banana', 100, 5.00),
			('Laranja', 500, 2.00),
			('Manga', 800, 4.00);


--Passo 2.b

insert into dbo.Pessoa
           (nome, logradouro, cidade, estado, telefone, email)
    values
           ('Joao', 'Rua 12, Casa 3, Quitanda', 'Riacho do Sul', 'PA', '1111-1111', 'joao@riacho.com'),
		   ('JJC', 'Rua 11, Centro', 'Riacho do Norte', 'PA', '1212-1212', 'jjc@riacho.com');

--Passo 2.c

insert into dbo.pessoaFisica
			(cpf, Pessoa_idPessoa)
select '11111111111', p.idPessoa
from dbo.Pessoa p
where p.idPessoa = 3;

--Passo 2.d

insert into dbo.pessoaJuridica
			(cnpj, Pessoa_idPessoa)
select '22222222222222', p.idPessoa
from dbo.Pessoa p
where p.idPessoa = 4;


--Passo 3

insert into dbo.Movimento
			(quantidade, tipo, valorUnitario, Produto_idProduto, Pessoa_idPessoa, Usuario_idUsuario)
select 
