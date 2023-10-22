#!/usr/bin/bash

# chemin="../ExoSeance1/ExerciceCours1/ann/"

# $1 est l'année donnée en argumant à la commande en ligne de commande
ANNEE_FIC=$1

if [ -z "$1" ]; then
	echo "Le premier argument est vide : veuillez donner une année"
	exit
elif [ "$1" != "2016" ] && [ "$1" != "2017" ] && [ "$1" != "2018" ]; then
	echo "Le premier argument est incorrect : veuillez donner une année valide (2016, 2017 ou 2018)"
	exit
else
	echo "Pour l'année $ANNEE_FIC : "
	cat ../ExoSeance1/ExerciceCours1/ann/$1/* | grep Location | uniq | wc -l
fi


