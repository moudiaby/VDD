-- Active: 1699886317122@@127.0.0.1@3306@e-commerce

#Nbr commandes annulée
SELECT COUNT(*) AS Commandes_annulée
FROM commandes
WHERE statut = 'annulée';

#Nbr de commandes payée
SELECT COUNT(*) AS Commandes_livrée
FROM commandes
WHERE statut = 'livrée';

#Nbr de commandes en cours
SELECT COUNT(*) AS commandes_en_cours
FROM commandes
WHERE statut = 'en cours';

#Affiche les 3 en meme temps
SELECT statut, COUNT(*) AS Nombre_de_Commandes
FROM Commandes
GROUP BY statut;

#Produits le plus vendu (la on amis les 3 premiers)
SELECT nomproduit, COUNT(*) AS Meilleures_ventes
FROM produits
GROUP BY nomproduit
ORDER BY Meilleures_ventes DESC
LIMIT 3;

#Produits le moins vendu (la on amis les 10 dernier)
SELECT nomproduit, COUNT(*) AS Meilleures_ventes
FROM produits
GROUP BY nomproduit
ORDER BY Meilleures_ventes ASC
LIMIT 10;

#Meilleurs client
SELECT idClient, COUNT(*) AS Meilleur_client
FROM commandes
GROUP BY idClient
ORDER BY Meilleur_client DESC
LIMIT 1;

#Pire client
SELECT idClient, COUNT(*) AS Meilleur_client
FROM commandes
GROUP BY idClient
ORDER BY Meilleur_client ASC
LIMIT 1;

#% d'homme parmis les clients
SELECT sexe, COUNT(*) * 100 / (SELECT COUNT(*) FROM clients) AS Pourcentage_Homme
FROM clients
WHERE Sexe = 'Male';

#% de femme parmis les clients
SELECT sexe, COUNT(*) * 100 / (SELECT COUNT(*) FROM clients) AS Pourcentage_Homme
FROM clients
WHERE Sexe = 'Female';

#Les deux en meme temps
SELECT Sexe, COUNT(*) * 100 / (SELECT COUNT(*) FROM Clients) AS Pourcentage
FROM Clients
GROUP BY Sexe;

#Prix moyen des produits(enlever l'unite pour pouvoir calculer moyenne)
SELECT AVG(prix) AS Moyenne
FROM produits;

#Poids moyen des produits 
SELECT AVG(Poids) AS Poids_Moyen
FROM Produits;

#Age moyen des client
SELECT AVG(EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM dateNaissance)) AS Age_Moyen
FROM clients;

#Pourcentages des produits vendu par amazon
SELECT Is_Amazon_Seller, COUNT(*) * 100 / (SELECT COUNT(*) FROM products) AS Pourcentage_Amazon
FROM products
WHERE Is_Amazon_Seller = 'Y'
GROUP BY Is_Amazon_Seller;

