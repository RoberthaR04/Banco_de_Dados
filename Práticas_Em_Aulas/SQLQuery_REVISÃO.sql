CREATE DATABASE AULADB
GO
USE AULADB
GO
CREATE TABLE Clientes
(

   ClienteCodigo int IDENTITY (1,1),
   ClienteNome varchar(20)
)

INSERT Clientes(ClienteCodigo, ClienteNome) VALUES (1, 'aluno')