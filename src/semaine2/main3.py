import random
import mysql.connector


connect = mysql.connector.connect(host='localhost', database='e-commerce', user='root', password='')

cursor = connect.cursor()
cursor.execute("SELECT * FROM villes LIMIT 20")
 
#Récupération de toutes les lignes de la table
data = cursor.fetchall()


#Choix aléatoire dans une liste
liste = data
element_aleatoire = random.choice(liste)
print(element_aleatoire)
