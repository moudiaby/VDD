-- Active: 1699886317122@@127.0.0.1@3306@e-commerce
CREATE TABLE clients SELECT User Id AS idClient, First Name AS nom, Last Name AS prenom, sex AS sexe , Email AS email, Phone AS telephone, Date of birth AS dateNaissance FROM custormers

ALTER TABLE clients CHANGE COLUMN User id idClients VARCHAR(50);

ALTER TABLE clients
ADD ville VARCHAR(37),
ADD pays VARCHAR(44),
ADD mdp VARCHAR(40);
