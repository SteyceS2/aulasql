#CRIANDO BANCO

create database bd_clientes;

#USANDO BANCO
use bd_clientes;

#CRIANDO TABELA
create table tbl_clientes(
cod_cliente int not null primary key auto_increment,
nome varchar (40) not null,
sexo char(1) not null);

insert into tbl_clientes(nome, sexo)
values ("caetano", "M"), ("Davidson", "M"), ("Piatucha", "F");

select * from tbl_clientes;

DELIMITER $$
CREATE PROCEDURE sp_lista_clientes (IN opcao INT)
BEGIN 
IF opcao = 0 THEN
SELECT * from tbl_clientes WHERE sexo = 'F';
ELseif opcao = 1 THEN 
SELECT * FROM tbl_clientes 	WHERE sexo = 'M';
ELSE
SELECT * FROM tbl_clientes;
END IF;
END $$
DELIMITER ;

SHOW procedure status

CALL sp_lista_clientes(0);
CALL sp_lista_clientes(1);
CALL sp_lista_clientes(2);

#EXEMPLO 2 SORED PROCEDURE
DELIMITER $$
create procedure sp_busca_cliente_por_nome
(in nome_parcial varchar(100))
begin
      select * from tbl_clientes
    where nome like concat('%', nome_parcial, '%');
end $$
DELIMITER ;

call sp_busca_clientes_por_nome("Piatucha"); 

create table tbl_cliente2(
id int not null primary key auto_increment,
nome varchar (100) not null,
idade int not null,
sexo char(1),
email varchar (100) not null,
telefone varchar(15) not null,
endereco varchar(255));

insert into tbl_cliente2 (nome, idade, sexo, email, telefone, endereco)
values ("Gabrielli", 87, "F", "gabys@gmail.com", "14 3567-5438", "R 2 bairro 849"),
("João", 17,"M","joao@gmail.com", "12 222222222","rua doddj bairo 667");


DELIMITER $$
CREATE PROCEDURE cliente_idd (in opcao INT)
BEGIN 
IF opcao = 0 THEN
SELECT * from tbl_cliente2 WHERE idade > '10';
ELseif opcao = 1 THEN 
SELECT * FROM tbl_cliente2 	WHERE idade < '18';
ELSE
SELECT * FROM tbl_cliente2;
END IF;
END $$
DELIMITER ;

CALL cliente_idd(0);
CALL cliente_idd(1);
CALL cliente_idd(3);



