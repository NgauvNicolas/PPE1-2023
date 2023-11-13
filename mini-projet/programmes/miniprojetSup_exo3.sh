#!/usr/bin/env bash

# Prend 1er argument (le chemin vers le fichier texte) et le stocke dans variable 'chemin_txt'
  # Par exemple, ici on a : ./../docs/candide.txt
chemin_txt=$1
# 2nd argument (nombre de mots) du script
nb_mots=$2
# Fichier de sortie pour les bigrammes
fic_sortie="bigrammes.txt"

# Chemin vers le script miniprojetSup_exo1.sh
script="./miniprojetSup_exo1.sh"

# Vérification du nb d'arguments donné au script : il en faut au moins 1
if [ $# -lt 1 ]; then
  echo "Format attendu : $script <source> [nombre_mots_souhaité]"
  exit 1
fi

# Si 2nd argument pas spécifié, définir valeur par défaut à 25
if [ -z $nb_mots ]; then
    nb_mots=25
fi

# Exécute miniprojet2_ex1.sh avec fichier texte donné en argument et redirige sortie vers fichier sortie1
"$script" "$chemin_txt" > sortie1

# Supprime la première ligne de sortie1 et stocke le résultat dans sortie2
  # Supprimer la première ligne nous permet d'avoir le décalage souhaité entre les lignes de sortie 1 et sortie 2
    # Ligne n de sortie2 = ligne (n+1) de sortie1
tail -n+2 sortie1 > sortie2

# Paste pour concaténer lignes de sortie1 et sortie2
# Ensuite trie, compte les occurrences, trie de nouveau et prend les $nb_mots premiers bigrammes, et enfin envoie la sortie déns le fichier de sortie bigrammes.txt
paste sortie1 sortie2 | sort | uniq -ci | sort -nr | head -$nb_mots > "$fic_sortie"

# Supprime fichiers temporaires sortie1 et sortie2
rm sortie1 sortie2
