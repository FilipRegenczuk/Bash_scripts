#!/bin/bash

# Skrypt numerujący wszystkie pliki w zadanym katalogu (parametr wywołania skryptu), 
# do których mamy prawo wykonywania (execute), przez dodanie dodatkowego członu rozszerzenia
# o postaci .numer_kolejny. Numeracja przebiega według wielkości plików.

if [ $# -ne 1 ]; then
    echo "Nie poprawna liczba argumentow"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Podany argument nie jest katalogiem"
    exit 2
fi

i=0

for file in `ls -S $1`
do   
    mv $1/${file} $1/${file}.$i
    i=$((i+1))
done