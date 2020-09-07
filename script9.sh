#!/bin/bash

# Skrypt usuwa wszystkie pliki puste (o zerowej wielkości) w zadanym katalogu (parametr wywołania skryptu). 
# Skrypt tworzy w zadanym pliku listę skasowanych plików. Nie analizuje dołączeń symbolicznych.

if [ $# -ne 2 ]; then
    echo "Niepoprawna liczba argumentów!"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Argument musi byc katalogiem!"
    exit 2
fi

for file in `ls $1`
do
    if [ -f $1/$file -a ! -s $1/$file ]; then
        rm $1/$file
        echo "Usunięto plik: $1/$file" >> $2
    fi
done