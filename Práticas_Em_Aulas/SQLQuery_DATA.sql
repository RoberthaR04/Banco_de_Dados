--CREATE DATABASE EMPRERSA
--USE EMPRESA

--drop table departamentos
create table departamentos
(
    id_departamento INT,
    nome_departamento char(50)
);
insert departamentos values (1,'RH'),(2,'TI'),(3,'FINANCEIRO'),(4,'DIRETORIA');
--drop table funcionarios
create table funcionarios
(
    id_funcionario INT,
    nome_funcionario char(50),
    id_gerente INT,
    id_departamento INT
);
INSERT funcionarios VALUES (1,'José',null,4),(2,'Pedro',1,3),(3,'Maria',1,1);


 INSERT funcionarios VALUES (4,'Dornel',1,NULL);