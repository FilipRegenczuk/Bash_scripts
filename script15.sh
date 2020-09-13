#!/bin/bash

# Skrypt znajduje w zadanym katalogu wszystkie pliki wskazanego użytkownika, 
# których rozmiar jest większy od rozmiaru podawanego jako argument wywołania skryptu.

if [ $# -ne 3 ]; then
    echo "Niepoprawna liczba argumentów!"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Pierwszy argument musi być katalogiem!"
    exit 2
fi

find $1 -type f -user $2 -size +$3c