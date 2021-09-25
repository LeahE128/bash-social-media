#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Error: parameters problem">&2
    exit 1
fi

if [ ! -d "$1" ]  && [ ! -d "$2"  ]; then
	echo "'$2' and '$1' do not exist">&2
        exit 2
fi
if [ ! -d "$1" ]; then
    echo "Error: User does not exist.">&2
    exit 3
fi
if [ ! -d "$2" ] ; then
    echo "Error: friend does not exist.">&2
    exit 4
fi
./P.sh "$1"
if grep -e "$2" "$1"/friends; then
    echo "Error: '$2' is already friends with '$1'">&2
	./V.sh "$1"
    exit 5
else
	echo "$2" >> "$1"/friends
	echo "OK: friend added"
	./V.sh "$1"
	exit 0
fi



