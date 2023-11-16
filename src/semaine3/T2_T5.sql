-- Active: 1699886317122@@127.0.0.1@3306@e-commerce
CREATE TABLE Categories(
   idCategorie INT,
   nomCategorie VARCHAR(50),
   idCategorieMere INT NOT NULL,
   PRIMARY KEY(idCategorie),
   FOREIGN KEY(idCategorieMere) REFERENCES Categories(idCategorie)
);

CREATE TABLE Commandes(
   idCommande INT,
   dateCommande VARCHAR(50),
   statut VARCHAR(50),
   idClient VARCHAR(50),
   PRIMARY KEY(idCommande),
   FOREIGN KEY(idClient) REFERENCES Clients(idClient)
);

CREATE TABLE Produits(
   idProduit VARCHAR(50),
   nomproduit VARCHAR(200),
   prix VARCHAR(19),
   poids VARCHAR(12),
   idCategorie INT,
   PRIMARY KEY(idProduit),
   FOREIGN KEY(idCategorie) REFERENCES Categories(idCategorie)
);

CREATE TABLE LignesCommandes(
   noligne INT,
   quantite INT,
   idCommande INT,
   idProduit INT,
   PRIMARY KEY(noligne),
   UNIQUE(idProduit),
   FOREIGN KEY(idCommande) REFERENCES Commandes(idCommande),
   FOREIGN KEY(idProduit) REFERENCES Produits(idProduit)
);