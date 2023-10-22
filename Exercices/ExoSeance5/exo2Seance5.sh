#!/usr/bin/bash


# $1 est l'année donnée en argument à la commande en ligne de commande
# $2 est le type d'entité que l'on veut, donnée en argumant à la commande en ligne de commande

ANNEE_FIC=$1
NB_LOC=$2

if [ -z "$1" ]; then
	echo "Le premier argument est vide : veuillez donner une année"
	exit
elif [ "$1" != "2016" ] && [ "$1" != "2017" ] && [ "$1" != "2018" ] && [ "$1" != "*" ]; then
	echo "Le premier argument est incorrect : veuillez donner une année valide (2016, 2017, 2018 ou *)"
	exit
elif [ -z "$2" ]; then
	echo "Le deuxième argument est vide : veuillez donner le nombre de lieu à afficher"
	exit
else
	cat ../ExoSeance1/ExerciceCours1/ann/$1/*.ann | grep Location | cut -f 3 | head -n $2 | sort | uniq -c | sort -nr
fi


