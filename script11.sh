#!/bin/bash

# Skrypt usuwa w zadanym drzewie katalogów podkatalogi a także podkatalogi, 
# które stały się puste po wcześniej usuniętych podkatalogach.

if [ $# -ne 1 ]; then
    echo "Niepoprawna liczba argumentów"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Argument musi być katalogiem"
    exit 2
fi

skasowano=1     # czy skasowano podkatalogi

while [ $skasowano -ne 0 ]
do
    skasowano=0
    find $1 -type d -empty | while read wynik
    do
        rmdir $wynik
        skasowano=1
    done
        echo "Skasowano"
        
done