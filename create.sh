#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error: parameters problem" >&2
    exit 1
fi
./P.sh "$1"
if [ -d "$1" ]; then
	echo "Error:User already exists" >&2

	./V.sh "$1"
	exit 2
fi
if [ ! -d  "$1" ]; then 
     mkdir "$1"
     touch "$1"/wall
     touch "$1"/friends
     echo "OK: User created successfully" 
	./V.sh "$1"
     exit 0
fi

