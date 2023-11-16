import mysql.connector

connect = mysql.connector.connect(host='localhost', database='e-commerce', user='root', password='')

cursor = connect.cursor()
cursor.execute("SELECT * FROM custormers LIMIT 20")
   
    # Récupérer et afficher les 20 premiers lignes de la tables villes  
for row in cursor.fetchall():
    print(row)
 
    cursor.close()
    connect.close()
        