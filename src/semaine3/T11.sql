-- Active: 1699886317122@@127.0.0.1@3306@e-commerce
#Enlever l'unité
-- Ajout d'une nouvelle colonne pour le prix sans unité
ALTER TABLE produits
ADD COLUMN nouveau_prix DECIMAL(10, 2);

-- Mettre à jour le nouveau_prix en convertissant l'ancien prix en DECIMAL
UPDATE produits
SET nouveau_prix = CAST(SUBSTRING(prix, LENGTH('$') + 1) AS DECIMAL(10, 2));

-- Supprimer l'ancienne colonne de prix
ALTER TABLE produits
DROP COLUMN prix;

-- Renommer la nouvelle colonne en tant que prix
ALTER TABLE produits
CHANGE COLUMN nouveau_prix prix DECIMAL(10, 2);

-- Supprimer les lignes où le prix est inférieur ou égal à 0
DELETE FROM produits
WHERE prix <= 0;



-- Mise à jour de la colonne poids pour convertir les onces en livres
UPDATE produits
SET poids = CASE
              WHEN LOWER(poids) LIKE '%ounces%' THEN 
                CAST(SUBSTRING(poids, 1, LENGTH(poids) - LENGTH('ounces')) AS DECIMAL(10, 2)) / 16
              ELSE poids -- Laisse la valeur inchangée si aucune conversion nécessaire
            END
WHERE LOWER(poids) LIKE '%ounces%';

-- Mise à jour de la colonne poids pour supprimer le mot "pounds" et convertir en DECIMAL
UPDATE produits
SET poids = CAST(REPLACE(poids, 'pounds', '') AS DECIMAL(10, 2))
WHERE LOWER(poids) LIKE '%pounds%';

-- Supprimer les lignes où la valeur de poids est une chaîne de caractères vide
DELETE FROM produits
WHERE poids = '';

