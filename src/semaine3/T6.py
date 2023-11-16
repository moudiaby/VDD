
import mysql.connector 
import random 
# Connexion à la base de données 
cnx = mysql.connector.connect( 
host="localhost", 
user="root", 
password="", 
database="e-commerce", 
) 
curseur = cnx.cursor() 
req1 = "SELECT country, name FROM villes"
curseur.execute(req1)
resultat = curseur.fetchall()

   
curseur.execute("SELECT idClient FROM clients")
id_clients = [row[0] for row in curseur.fetchall()]

    
for id_client in id_clients:
        valeur = random.choice(resultat)
        ville = valeur[1]
        pays = valeur[0]

        
        req_update = "UPDATE clients SET ville = %s, pays = %s WHERE idClient = %s"
    
       
        curseur.execute(req_update, (ville, pays, id_client))


# # Valider les changements et fermer la connexion 
cnx.commit() 
curseur.close() 
cnx.close()