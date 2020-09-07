#!/bin/bash

# Skrypt porównuje zawartości dwóch zadanych katalogów (argumenty skryptu). Przy porównaniu
# ignoruje podkatalogi. W wyniku wyświetla na ekranie listę plików identycznych w obu katalogach.

if [ $# -ne 2 ]; then
    echo "Niepoprawna liczba argumentów"
    exit 1
fi

if [ ! -d $1 -o ! -d $2 ]; then
    echo "Argumenty muszą być katalogami"
    exit 2
fi

diff -s $1 $2