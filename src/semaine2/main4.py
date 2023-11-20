import random

voyelles = ['a', 'e', 'i', 'o', 'u']
consonnes = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z']

def generer_nom_aleatoire(longueur):
    nom = ''
    est_voyelle = bool(random.getrandbits(1))  # Choisit aléatoirement entre voyelle et consonne pour commencer
    for _ in range(longueur):
        if est_voyelle:
            nom += random.choice(voyelles)
            est_voyelle = False
        else:
            nom += random.choice(consonnes)
            est_voyelle = True
    return nom

#Exemple d'utilisation pour générer 10 noms aléatoires
for _ in range(10):
    print(generer_nom_aleatoire(5))