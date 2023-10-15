#!/usr/bin/bash

# chemin="../ExoSeance1/ExerciceCours1/ann/"

cat ../ExoSeance1/ExerciceCours1/ann/$1/* | grep Location | uniq | wc -l