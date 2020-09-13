#!/bin/bash

# Skrypt wyszukuje i zlicza w danym drzewie katalogów pliki wskazanego
# użytkownika oraz podaje sumaryczny rozmiar tych plików.


if [ $# -ne 1 ]; then
    echo "Niepoprawna liczba argumentów"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Argument musi być katalogiem"
    exit 2
fi

i=0
WYNIK=$(find $1 -type f)

for file in $WYNIK
do
    i=$((i+1))
done

echo "Liczba plików w drzewie katalogów `realpath $1`: $i"