
import mysql.connector
import random

cnx = mysql.connector.connect(host='localhost', user='root', password='', database='e-commerce')
cursor = cnx.cursor()

#Récupération des identifiants existants dans la table Produits

cursor.execute("SELECT idProduit FROM produits")
idProduit = [row[0] for row in cursor.fetchall()]

#Récupération des identifiants de commande depuis la table COMMANDES
cursor.execute("SELECT idCommande FROM commandes")
commandes = cursor.fetchall()

insert_query = "INSERT INTO Lignes_commande (noligne, quantite, idProduit, idCommande) VALUES (%s, %s, %s, %s)"

#Pour chaque commande, générer entre 1 et 3 lignes
for (idCommande,) in commandes:
    nb_lignes = random.randint(1, 3)
    for noligne in range(1, nb_lignes + 1):
#Choisir aléatoirement un ID existant parmi ceux récupérés
        idproduit = random.choice(idProduit)
        quantite = random.randint(1, 4)
        cursor.execute(insert_query, (noligne,quantite, idproduit,idCommande))

    cnx.commit()

cursor.close()
cnx.close()