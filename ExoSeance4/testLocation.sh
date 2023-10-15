#!/usr/bin/bash

# chemin="../ExoSeance1/ExerciceCours1/ann/"

# $1 est l'année donnée en argumant à la commande en ligne de commande

cat ../ExoSeance1/ExerciceCours1/ann/$1/* | grep Location | uniq | wc -l