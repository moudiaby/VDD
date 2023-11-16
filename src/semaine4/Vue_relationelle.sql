-- Active: 1699886317122@@127.0.0.1@3306@e-commerce

#Vue des produits les plus vendus 
CREATE VIEW Vue_Produits_Plus_Vendus AS
SELECT idProduit, SUM(quantite) AS Total_Ventes
FROM lignes_commande
GROUP BY idProduit
ORDER BY Total_Ventes DESC
LIMIT 100;

#Vue des meilleurs clients

