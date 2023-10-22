#!/usr/bin/bash

# $1 est le type d'entité que l'on veut, donnée en argumant à la commande en ligne de commande
TYPE_ENT=$1
./exo1Seance5.sh 2016 $1
./exo1Seance5.sh 2017 $1
./exo1Seance5.sh 2018 $1

if [ -z "$1" ]; then
	echo "L'argument est vide : veuillez donner le type de l'entité recherchée"
	exit
elif [ "$1" != "Organization" ] && [ "$1" != "Location" ] && [ "$1" != "Date" ] && [ "$1" != "Person" ] && [ "$1" != "Hour" ] && [ "$1" != "Product" ]; then
	echo "L'argument est incorrect : veuillez donner un type d'entité valide (Organization, Location, Date, Person, Hour ou Product)"
	exit
else
	echo "Pour l'année 2016 et l'entité $TYPE_ENT : "
	./exo1Seance5.sh 2016 $1
	echo "Pour l'année 2017 et l'entité $TYPE_ENT : "
	./exo1Seance5.sh 2017 $1
	echo "Pour l'année 2018 et l'entité $TYPE_ENT : "
	./exo1Seance5.sh 2018 $1
fi