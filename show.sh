#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error: parameters problem">&2
    exit 1
fi
./P.sh "$1"
if [ ! -d "$1" ] ; then
    echo "Error: User does not exist.">&2
	./V.sh "$1"
    exit 2

else
	echo "wallStart"
        cat "$1"/wall
	echo "wallEnd"
	./V.sh "$1"
        exit 0
fi


