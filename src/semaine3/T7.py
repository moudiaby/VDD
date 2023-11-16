
import mysql.connector
import random
import secrets
import string

# Connexion à la base de données
cnx = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="e-commerce",
)
curseur = cnx.cursor()

# Récupérer la liste des clients
curseur.execute("SELECT idClient FROM clients")
id_clients = [row[0] for row in curseur.fetchall()]

# Fonction pour générer un mot de passe aléatoire
def generate_password(length=8):
    characters = string.ascii_letters + string.digits + string.punctuation
    password = ''.join(secrets.choice(characters) for i in range(length))
    return password

# Mettre à jour les mots de passe pour chaque client
for id_client in id_clients:
    mdp = generate_password()
    
    req_update = "UPDATE clients SET mdp = %s WHERE idClient = %s"
    curseur.execute(req_update, (mdp, id_client))

# Valider les changements et fermer la connexion
cnx.commit()
curseur.close()
cnx.close()