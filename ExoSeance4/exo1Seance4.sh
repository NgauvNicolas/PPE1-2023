#!/usr/bin/bash


# $1 est l'année donnée en argumant à la commande en ligne de commande
# $2 est le type d'entité que l'on veut, donnée en argumant à la commande en ligne de commande
cat ../ExoSeance1/ExerciceCours1/ann/$1/* | grep $2 | uniq | wc -l