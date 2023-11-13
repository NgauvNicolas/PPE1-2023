#!/usr/bin/env bash

# Prend le 1er argument (le chemin vers le fichier texte) et le stocke dans la variable 'text'
	# Par exemple, ici on a : ./../docs/candide.txt

chemin_txt=$1

# cat affiche le contenu du fichier spécifié par chemin_txt
# tr effectue plusieurs transformations sur le texte :
	# tr -d '[:punct:]' supprime ponctuation
	# tr '[:upper:]' '[:lower:]'' convertit lettres majuscules en minuscules
	# tr ' ' '\n' remplace espaces par sauts de ligne, on obtient alors des mots
# grep -v '^$' filtre lignes vides (mots vides) pour obtenir la liste des mots propres
	# grep -v inverser la mise en correspondance, pour sélectionner les lignes ne correspondant pas au motif
cat "$chemin_txt" | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | tr ' ' '\n' | grep -v '^$'
