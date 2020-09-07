#!/bin/bash

# Skrypt tworzy nowe pliki w zadanym katalogu (parametr wywołania skryptu), według listy 
# umieszczonej w pliku (drugi parametr wywołania skryptu). Nowe pliki mają pustą zawartość. 
# Jeżeli któryś plik już istnieje, to nie jest niszczony.


if [ $# != 2 ]; then
    echo "Niepoprawna liczba argumentow"
    exit 1
fi

if [ ! -f $1 ] && [ ! -d $2 ]; then
    echo "Nie ma takiego pliku lub folderu"
    exit 1
fi

for filename in `cat $1`
do
    touch $2/$filename
done