#!/bin/bash

# 1.1. Skrypt zmienia nazwy wszystkich plików w zadanym katalogu (parametr wywołania skryptu),
# do których posiadamy prawo zapisu, przez dopisanie dodatkowego członu .old. Wcześniej kasuje
# wszystkie pliki, które mają już takie rozszerzenie.



# Sprawdzenie czy liczba parametrow jest rowna 1
if [ "$#" != "1" ]; then
    echo "Niepoprawna liczba parametrow!"
    exit 1
fi

# Sprawdzenie czy podany parametr wskazuje na istniejacy katalog 
if [ ! -d $1 ]; then
    echo "Nie ma takiego katalogu!"
    exit 2
fi

rm -f $1/*.old	
for file in `ls $1`
do
    if [ -w file ]; then
        mv $1/${file} $1/${file}.old
    fi
done