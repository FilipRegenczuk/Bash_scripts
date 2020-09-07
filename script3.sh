#!/bin/bash

# Skrypt usuwa wszystkie pliki w zadanym katalogu (parametr wywołania skryptu), 
# poza plikami wykonywalnymi, mającymi ustawiony bit execute.


if [ $# != 1 ]; then
    echo "Nie poprawna liczba argumentów!"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Nie istnieje podany katalog!"
    exit 2
fi

for file in `ls $1`
do
    if [ ! -x $file ]; then
        rm $1/$file
    fi
done
