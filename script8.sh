#!/bin/bash

# Skrypt pokazuje pliki z zadanego katalogu (parametr wywołania skryptu), wraz z jego podkatalogami. 
# Zawartość podkatalogów jest listowana w postaci ścieżka dostępu względem listowanego katalogu/nazwa 
# pliku. Liczba zagnieżdżeń podkatalogów ograniczana jest przez zmienną GLEBOKOSC.

if [ $# -ne 1 ]; then
    echo "Niepoprawna liczba argumentow"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Argument musi być katalogiem"
    exit 2
fi

ls $1 $1/*/*

