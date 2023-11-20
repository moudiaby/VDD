
import mysql.connector

#Connexion à la base de données
cnx = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="e-commerce",
)

curseur = cnx.cursor()


#Sélectionne des valeurs differentes de "category" de "Products"
curseur.execute("SELECT DISTINCT Category FROM Products")
categories = curseur.fetchall()

for category in categories:
    category_parts = category[0].split(" | ")  #Divise la chaîne en catégories en utilisant le séparateur "|"
    categorie_mere = None  #Initialisé à None

    for categorie in category_parts:
        #Vérifie si la catégorie existe déjà
        select_query = "SELECT idCategorie FROM categories WHERE nomCategorie = %s"
        curseur.execute(select_query, (categorie,))
        result = curseur.fetchone()

        if result:
            #La catégorie existe, utilisez son ID comme catégorie mère
            categorie_mere = result[0]
        else:
            #La catégorie n'existe pas, insérez-la et utilisez la valeur par défaut pour "idCategorieMere"
            insert_query = "INSERT INTO Categories (nomCategorie, idCategorieMere) VALUES (%s, %s)"
            curseur.execute(insert_query, (categorie, categorie_mere if categorie_mere is not None else 0))
            cnx.commit()
            categorie_mere = curseur.lastrowid

#Fermez le curseur et la connexion
curseur.close()
cnx.close()