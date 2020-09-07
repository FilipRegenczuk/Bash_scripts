#!/bin/bash

# Skrypt łączy w jeden wszystkie pliki należące do zadanego katalogu (parametr wywołania skryptu), 
# o zadanym rozszerzeniu (drugi parametr skryptu). Kolejność, w jakiej pliki są łączone jest nieistotna.
# Treść każdego pliku poprzedzona jest nagłówkiem z jego nazwą.


if [ $# -ne 2 ]; then
    echo "Niepoprawna liczba argumentów"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Pierwszy argument musi być katalogiem!"
    exit 2
fi

typ=$2
touch SUMA

for file in `ls $1`
do

    if [ ${file#*.} = $typ ]; then
        echo "Plik $file:" >> SUMA
        cat $1/$file >> SUMA

    fi
done