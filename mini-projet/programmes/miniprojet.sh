#!/usr/bin/env bash

# $1 est le chemin donné en argumant à la commande en ligne de commande
#chemin=$1
# chemin="../urls/fr.txt"


chemin_urls=$1


if [ $# -ne 1 ]; then
	echo "On attend un argument exactement : veuillez donner un chemin valide vers le fichier donné en argument au script"
	exit
elif [ -f $1 ]; then echo "on a bien un fichier"
else 
	echo "on attend un fichier qui existe"
	exit
fi	


lineno=1
while read -r URL;
do
	echo -e "\tURL : $URL";
	# réponse HTTP
	code=$(curl -ILs $URL | grep -e "^HTTP/" | grep -Eo "[0-9]{3}" | tail -n 1)
	
	# récupération encodage
	charset=$(curl -Ls $URL | grep -Eo "charset=.+" | cut -d'"' -f2)

	 # résultat selon code de réponse HTTP
	if [ "$code" -eq 200 ]; then
		result="OK"
	else
		result="Erreur"
	fi

	if [[ -z $charset ]]
	then
		echo -e "\tencodage non détecté.";
	else
		echo -e "\tencodage : $charset";
	fi

	((lineno++));
done < "$fichier_urls"

