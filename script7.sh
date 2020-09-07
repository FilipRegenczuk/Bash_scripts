#!/bin/bash

# Skrypt przesuwa wszystkie pliki z ustawionym prawem wykonywania (execute) z jednego katalogu do drugiego.
# Pozostałe pliki w katalogu nie są ruszane. Nazwy katalogów, źródłowego i docelowego, zadawane są jako parametry skryptu


if [ $# -ne 2 ]; then
    echo "Niepoprawna liczba argumentów!"
    exit 1
fi

if [ ! -d $1 ] || [ ! -d $2 ]; then
    echo "Oba argumenty muszą być katalogami!"
    exit 2
fi

for file in `ls $1`
do
    if [ -x "$1/$file" ]; then
        mv $1/$file $2
    fi
done
