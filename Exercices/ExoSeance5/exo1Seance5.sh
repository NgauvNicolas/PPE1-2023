#!/usr/bin/bash


# $1 est l'année donnée en argument à la commande en ligne de commande
# $2 est le type d'entité que l'on veut, donnée en argumant à la commande en ligne de commande

ANNEE_FIC=$1
TYPE_ENT=$2

if [ -z "$1" ]; then
	echo "Le premier argument est vide : veuillez donner une année"
	exit
elif [ "$1" != "2016" ] && [ "$1" != "2017" ] && [ "$1" != "2018" ]; then
	echo "Le premier argument est incorrect : veuillez donner une année valide (2016, 2017 ou 2018)"
	exit
elif [ -z "$2" ]; then
	echo "Le deuxième argument est vide : veuillez donner le type de l'entité recherchée"
	exit
elif [ "$2" != "Organization" ] && [ "$2" != "Location" ] && [ "$2" != "Date" ] && [ "$2" != "Person" ] && [ "$2" != "Hour" ] && [ "$2" != "Product" ]; then
	echo "Le second argument est incorrect : veuillez donner un type d'entité valide (Organization, Location, Date, Person, Hour ou Product)"
	exit
else
	echo "Pour l'année $ANNEE_FIC et l'entité $TYPE_ENT : "
	cat ../ExoSeance1/ExerciceCours1/ann/$1/* | grep $2 | uniq | wc -l
fi

