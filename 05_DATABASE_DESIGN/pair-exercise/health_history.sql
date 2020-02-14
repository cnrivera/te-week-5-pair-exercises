USE master
GO

DROP DATABASE IF EXISTS HealthHistory

CREATE DATABASE HealthHistory
GO

USE HealthHistory

BEGIN TRANSACTION;

CREATE TABLE pets
(
pet_id int identity (100, 1),
name varchar (50) NOT NULL,
type varchar (50) DEFAULT 'unknown' NOT NULL,
age int NOT NULL,

constraint pk_pet_id primary key(pet_id),
);

CREATE TABLE owners
(
owner_id int identity (100, 1),
pet_id int NOT NULL,
last_name varchar(50) NOT NULL,
first_name varchar(50) NOT NULL,

constraint pk_owner_id primary key (owner_id),
constraint fk_pet_owner_id foreign key (pet_id) references pets(pet_id)
);

CREATE TABLE visits
(
procedure_id int identity (1, 1) NOT NULL,
pet_id int NOT NULL,
visit_date datetime NOT NULL,
visit_procedure VARCHAR(200) NOT NULL,

constraint pk_procedure_id primary key (procedure_id),
constraint fk_pet_visit_id foreign key (pet_id) references pets(pet_id)
);

SET IDENTITY_INSERT pets ON;


INSERT INTO pets (pet_id, name, type, age) VALUES (246, 'ROVER', 'DOG', 12);


COMMIT;