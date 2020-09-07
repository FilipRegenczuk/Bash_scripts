#!/bin/bash

# Skrypt łączy w jeden pliki z listy umiszczonej w pliku o zadanej nazwie (parametr wywołania skryptu).
# Kolejność, w jakiej pliki są łączone - ściśle według listy. Treść każdego pliku poprzedzona jest
# nagłówkiem z jego nazwą. Plik wynikowy ma nazwę pliku pierwotnie zawierającego listę.

if [ $# -ne 1 ]; then
    echo "Niepoprawna liczba argumentow"
    exit 1
fi

if [ ! -f $1 ]; then
    echo "Podany parametr to nie plik"
    exit 2
fi

for filename in `cat $1`
do
    echo "Plik $filename:" >> $1
    echo `cat $filename` >> $1
done