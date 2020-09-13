#!/bin/bash

# krypt wyświetla statystykę dotyczącą rozmiarów plików we wskazanym katalogu. 
# Wyświetlana jest liczba plików małych, średnich oraz dużych w katalogu, 
# ponadto wyliczany jest sumaryczny rozmiar plików dla wymienionych kategorii.

if [ $# -ne 1 ]; then
    echo "Niepoprawna liczba argumentów!"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Argument musi być katalogiem!"
    exit 2
fi

# Pliki male
WYNIK=`find $1 -type f -size -5k -printf "%P\n"`
i=0
total_size=0

for plik in $WYNIK
do
    i=$((i+1))
    size=`stat --format=%s $1/$plik`
    total_size=$(($total_size+$size))
done
echo "Liczba plików małych:         $i"
echo "Sumaryczny rozmiar plików:    $total_size"
echo "-----------------------------------------"


# Pliki średnie
WYNIK=`find $1 -type f -size +5k -size 1024k`
i=0
total_size=0

for plik in $WYNIK
do
    i=$((i+1))
    size=`stat --format=%s $1/$plik`
    total_size=$(($total_size+$size))
done
echo "Liczba plików średnich:       $i"
echo "Sumaryczny rozmiar plików:    $total_size"
echo "-----------------------------------------"


# Pliki duże
WYNIK=`find $1 -type f -size +1024k -printf "%P\n"`
i=0
for plik in $WYNIK
do
    i=$((i+1))
    size=`stat --format=%s $1/$plik`
    total_size=$(($total_size+$size))
done
echo "Liczba plików dużych:         $i"
echo "Sumaryczny rozmiar plików:    $total_size"