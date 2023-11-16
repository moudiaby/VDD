
import mysql.connector
import random
import string
from datetime import datetime, timedelta


conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="e-commerce"
)

cursor = conn.cursor()

cursor.execute("SELECT idClient FROM clients")
clients = cursor.fetchall()
statuts = ["en cours", "payée", "livrée", "annulée"]
for client in clients:
    nombre_commandes = random.randint(0, 5) 
    for _ in range(nombre_commandes):
        idClient = client[0]
        dateCommande = datetime(2020, 1, 1).date() + timedelta(days=random.randint(0, 981))  
        statut = random.choice(statuts)  
        cursor.execute("INSERT INTO commandes (idClient, dateCommande, statut) VALUES (%s, %s, %s)",
               (idClient, dateCommande, statut))


conn.commit()
conn.close()