#!/bin/bash


if [ "$#" -ne 3 ]; then
    echo "Error: parameters problem">&2
    exit 1
fi

if [ ! -d "$2" ]; then
    echo "Error: Sender does not exist.">&2
    exit 2
fi


if [ ! -d "$1" ] ; then
    echo "Error: Receiver does not exist.">&2
    exit 3
fi

./P.sh "$1"
if grep -Fxq "$2" "$1/friends"; then
   	 echo "$2: $3" >> "$1/wall" 
        echo "OK: Message posted to wall"
        ./V.sh "$1"
	exit 4	
else
        echo " Error: '$2' is not a friend of '$1'">&2
	./V.sh "$1"
        exit 5
fi
./V.sh "$1"
exit 0

