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

#Produits le plus vendu (la on amis les 3 premiers)
SELECT idProduit, COUNT(*) AS Meilleures_ventes
FROM produits
GROUP BY idProduit
ORDER BY Meilleures_ventes DESC
LIMIT 3;



