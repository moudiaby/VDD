CREATE TABLE Clients(
   idClient INT,
   prénom VARCHAR(50),
   email VARCHAR(50),
   téléphone INT,
   dateNaissance VARCHAR(50),
   mdp VARCHAR(50),
   ville VARCHAR(50),
   pays VARCHAR(50),
   nom VARCHAR(50),
   PRIMARY KEY(idClient),
   UNIQUE(email),
   UNIQUE(téléphone)
);

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
   idClient INT,
   PRIMARY KEY(idCommande),
   FOREIGN KEY(idClient) REFERENCES Clients(idClient)
);

CREATE TABLE Produits(
   idProduit INT,
   nomproduit VARCHAR(50),
   prix DECIMAL(3,2),
   poids DECIMAL(10,2),
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

