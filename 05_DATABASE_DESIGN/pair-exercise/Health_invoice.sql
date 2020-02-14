USE master
GO

DROP DATABASE IF EXISTS HealthInvoice

CREATE DATABASE HealthInvoice
GO

USE HealthInvoice

BEGIN TRANSACTION;

CREATE TABLE pets
(
pet_id int identity (100, 1),
name varchar (50) NOT NULL,

constraint pk_pet_id primary key(pet_id),
);

CREATE TABLE owners
(
owner_id int identity (100, 1),
pet_id int NOT NULL,
last_name varchar(50) NOT NULL,
first_name varchar(50) NOT NULL,
street varchar(50) NOT NULL,
city varchar(50) NOT NULL,
district varchar(50) NOT NULL,
postal_code varchar(50) NOT NULL,

constraint pk_owner_id primary key (owner_id),
constraint fk_pet_owner_id foreign key (pet_id) references pets(pet_id)
);

CREATE TABLE visits
(
invoice_number int identity (100, 1) NOT NULL,
pet_id int NOT NULL,
owner_id int NOT NULL,
visit_date datetime NOT NULL,
visit_procedure VARCHAR(200) NOT NULL,
hospital_name VARCHAR(100) NOT NULL,

constraint fk_owner_id foreign key (owner_id) references owners(owner_id),
constraint pk_invoice_number_id primary key (invoice_number),
constraint fk_pet_visit_id foreign key (pet_id) references pets(pet_id)
);

COMMIT;