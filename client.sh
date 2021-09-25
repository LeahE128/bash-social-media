#!/bin/bash
clientid="$1"
request="$2"
user="$3"
friend="$4"
message="$5"

if [ "$#" -lt 2 ] ; then
	echo "This script requires at least 2  parameters">&2
	exit 1
fi

clientpipe="$clientid.pipe"
mkfifo $clientpipe
serverpipe="/home/cs13336431/Git/project-LeahE128/server.pipe"

if [[ "$request" = create ]]; then
	echo "$clientid $request $user">$serverpipe

elif [[ "$request" = add ]]; then
        echo "$clientid $request $user $friend">$serverpipe 

elif [[ "$request" = post ]]; then
        echo "$clientid $request $user $friend $message">$serverpipe

elif [[ "$request" = show ]]; then
        echo "$clientid $request $user">$serverpipe  

elif [[ "$request" = shutdown ]]; then
        echo "$clientid $request">$serverpipe
fi 
while read output; do
	echo "$output"

done<"$clientpipe"
rm $clientpipe
