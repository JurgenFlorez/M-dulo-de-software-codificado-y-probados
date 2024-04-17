create database hlf;
use hlf;
create table usuarios (
	id int auto_increment primary key not null,
    email varchar(100) not null,
    password varchar(100) not null
);
insert into usuarios (email, password) values ("admin@gmail.com", "admin");

