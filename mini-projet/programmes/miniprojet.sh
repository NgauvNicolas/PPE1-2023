#!/usr/bin/env bash

# $1 est le chemin donné en argumant à la commande en ligne de commande
#chemin=$1
# chemin="../urls/fr.txt"

# Le chemin vers le fichier source d'URLs : ../urls/fic.txt
chemin_urls=$1
# Le fichier HTML qui va contenir le tableau des URLs : fic.html
fic_tab=$2

if [ $# -ne 2 ]; then
	echo "On attend deux arguments exactement : veuillez donner un chemin valide vers le fichier texte source d'URLs, ainsi que le nom du fichier HTML dans lequel stocker le tableau d'URLs"
	exit
elif [ -f $1 ]; then 
	echo "on a bien un fichier source"
else 
	echo "on attend un fichier source d'URLs qui existe"
	exit
fi	
# Il faut que le dossier '../tableaux/' existe au préalable, car c'est dans ce dossier qu'on va créer et/ou modifier le fichier HTML

basename=$(basename -s .txt $chemin_urls)
echo 	"<html>
	<head>
		<meta charset=\"UTF-8\" />
		<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.min.css\">
		<title>Tableau des URLs</title>
	</head>
	<body>
		<h1 class=\"title\">Tableau URLs $basename</h1>
		<table class=\"table is-bordered\">
			<thead><tr><th>Ligne</th><th>Code HTTP</th><th>URL</th><th>Encodage</th></thead>" > "../tableaux/$fic_tab"
# On pourra rajouter plus tard d'autres catégories au tableau, comme les aspirations, dumps, occurences, contextes, concordance, etc.S


lineno=0
# Ici, chaque ligne du résultat est bien introduite par une tabulation
while read -r URL;
do
	((lineno++));
	echo -e "\tURL $lineno : $URL";
	# Réponse HTTP
	code=$(curl -ILs $URL | grep -e "^HTTP/" | grep -Eo "[0-9]{3}" | tail -n 1)
	
	# Récupération encodage
	charset=$(curl -Ls $URL | grep -Eo "charset=.+" | cut -d'"' -f2)

	 # Résultat selon code de réponse HTTP : à voir pour une utilisation ultérieure ?
	if [ "$code" -eq 200 ]; then
		result="Valide"
	else
		result="Erreur"
	fi

	if [[ -z $charset ]]; then
		echo -e "\tencodage non détecté.";
	else
		echo -e "\tencodage : $charset";
	fi

	# Les tabulations dans le echo sont là pour respecter l'indentation dans le fichier HTML qui stocke les URLs sous forme de tableau : pas obligatoires mais plus lisible avec
	echo "			<tr><td>$lineno</td><td>$code</td><td><a href=\"$URL\">$URL</a></td><td>$charset</td></tr>" >> "../tableaux/$fic_tab"

done < "$chemin_urls"

