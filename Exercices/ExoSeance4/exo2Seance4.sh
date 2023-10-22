#!/usr/bin/bash

cat ../ExoSeance1/ExerciceCours1/ann/*/*.ann | grep Location | cut -f 3 | head -n 15 | sort | uniq -c | sort -nr