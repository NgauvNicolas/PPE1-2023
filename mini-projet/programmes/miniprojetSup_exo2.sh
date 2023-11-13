#!/usr/bin/env bash

# 1er argument (chemin vers fichier texte) et 2nd argument (nombre de mots) du script
chemin_txt=$1
nb_mots=$2

# Chemin vers le script miniprojetSup_exo1.sh
script="./miniprojetSup_exo1.sh"

# Vérification du nb d'arguments donné au script : il en faut au moins 1
if [ $# -lt 1 ]; then
  echo "Format attendu : $script <source> [nombre_mots_souhaité]"
  exit 1
fi

# Si le 2nd argument pas spécifié, définir valeur par défaut à 25
if [ -z $nb_mots ]; then
    nb_mots=25
fi

# Exécuter script miniprojetSup_exo1.sh avec fichier texte donné en argument et stocker résultat dans variable words
mots=$($script $chemin_txt)

# Trouver mots les plus fréquents en comptant occurrences, en les triant, en les regroupant et en prenant nb_mots premiers mots
freq_mots=$(echo "$mots" | tr " " "\n" | sort | uniq -ic | sort -rn | head -$nb_mots)
# Afficher résultat dans terminal pour voir
echo "$freq_mots"

# Sauvegarder les mots les plus courants dans un fichier freq_mots.txt.
echo "$freq_mots" > freq_mots.txt
