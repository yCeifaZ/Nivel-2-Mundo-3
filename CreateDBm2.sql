CREATE TABLE Produto (
  idProduto INTEGER  NOT NULL   IDENTITY ,
  nome VARCHAR(255)    ,
  quantidade INTEGER    ,
  precoVenda NUMERIC      ,
PRIMARY KEY(idProduto));
GO




CREATE TABLE Pessoa (
  idPessoa INTEGER  NOT NULL   IDENTITY ,
  nome VARCHAR(255)    ,
  logradouro VARCHAR(255)    ,
  cidade VARCHAR(255)    ,
  estado CHAR(2)    ,
  telefone CHAR(11)    ,
  email VARCHAR(255)      ,
PRIMARY KEY(idPessoa));
GO




CREATE TABLE Usuario (
  idUsuario INTEGER  NOT NULL   IDENTITY ,
  login VARCHAR(255)    ,
  senha VARCHAR(255)      ,
PRIMARY KEY(idUsuario));
GO




CREATE TABLE pessoaJuridica (
  idpessoaJuridica INTEGER  NOT NULL   IDENTITY ,
  Pessoa_idPessoa INTEGER  NOT NULL  ,
  CNPJ VARCHAR(14)      ,
PRIMARY KEY(idpessoaJuridica)  ,
  FOREIGN KEY(Pessoa_idPessoa)
    REFERENCES Pessoa(idPessoa));
GO


CREATE INDEX pessoaJuridica_FKIndex1 ON pessoaJuridica (Pessoa_idPessoa);
GO


CREATE INDEX IFK_Rel_02 ON pessoaJuridica (Pessoa_idPessoa);
GO


CREATE TABLE pessoaFisica (
  idpessoaFisica INTEGER  NOT NULL   IDENTITY ,
  Pessoa_idPessoa INTEGER  NOT NULL  ,
  CPF VARCHAR(11)      ,
PRIMARY KEY(idpessoaFisica)  ,
  FOREIGN KEY(Pessoa_idPessoa)
    REFERENCES Pessoa(idPessoa));
GO


CREATE INDEX pessoaFisica_FKIndex1 ON pessoaFisica (Pessoa_idPessoa);
GO


CREATE INDEX IFK_Rel_01 ON pessoaFisica (Pessoa_idPessoa);
GO


CREATE TABLE Movimento (
  idMovimento INTEGER  NOT NULL   IDENTITY ,
  Produto_idProduto INTEGER  NOT NULL  ,
  Pessoa_idPessoa INTEGER  NOT NULL  ,
  Usuario_idUsuario INTEGER  NOT NULL  ,
  quantidade INTEGER    ,
  tipo CHAR(15)    ,
  valorUnitario NUMERIC      ,
PRIMARY KEY(idMovimento)      ,
  FOREIGN KEY(Usuario_idUsuario)
    REFERENCES Usuario(idUsuario),
  FOREIGN KEY(Pessoa_idPessoa)
    REFERENCES Pessoa(idPessoa),
  FOREIGN KEY(Produto_idProduto)
    REFERENCES Produto(idProduto));
GO


CREATE INDEX Movimento_FKIndex1 ON Movimento (Usuario_idUsuario);
GO
CREATE INDEX Movimento_FKIndex2 ON Movimento (Pessoa_idPessoa);
GO
CREATE INDEX Movimento_FKIndex3 ON Movimento (Produto_idProduto);
GO


CREATE INDEX IFK_Rel_03 ON Movimento (Usuario_idUsuario);
GO
CREATE INDEX IFK_Responsavel ON Movimento (Pessoa_idPessoa);
GO
CREATE INDEX IFK_ItemMovimentado ON Movimento (Produto_idProduto);
GO



