#!/bin/bash

# Skrypt wyszukuje w zadanych dwóch drzewach katalogów pliki wyróżniające oba katalogi,
# tj. takie pliki, które występują w pierwszym dzewie ale nie w drugim i odwrotnie. 
# Ponadto skrypt wyświetla pliki, który występują w obu drzewach ale mają różną zawartość.

if [ $# -ne 2 ]; then
    echo "Niepoprawna liczba argumentów!"
    exit 1
fi

if [ ! -d $1 -o ! -d $2 ]; then
    echo "Argumenty muszą być katalogami!"
    exit 2
fi


WYNIK=`find $1 $2 -type f -printf "%P\n" | sort | uniq -u`

echo "Pliki w katalogu $1, których nie ma w katalogu $2:"
for plik in $WYNIK
do
    if [ -f $1/$plik ]; then
        echo $plik
    fi
    
done

echo "Pliki w katalogu $2, których nie ma w katalogu $1:"
for plik in $WYNIK
do
    if [ -f $2/$plik ]; then
        echo $plik
    fi
    
done

WYNIK=`find $1 $2 -type f -printf "%P\n" | sort | uniq -d`

echo "Te same pliki, ale różna zawartość:"
for plik in $WYNIK
do
    cmp $1/$plik $2/$plik
done
