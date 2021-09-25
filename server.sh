#!/bin/bash

serverpipe="server.pipe"
mkfifo $serverpipe

while true; do
    read -a args < $serverpipe
clientpipe="/home/cs13336431/Git/project-LeahE128/${args[0]}.pipe"
    case "${args[1]}" in
        create)
            ./create.sh "${args[2]}">$clientpipe;;
        add)
            ./add.sh "${args[2]}" "${args[3]}">$clientpipe;;
        post)
           ./post.sh "${args[2]}" "${args[3]}" "$(echo ${args[@]:4})">$clientpipe;;
        show)
            ./show.sh "${args[2]}">$clientpipe;;
        shutdown)
		echo "shutting_down" >$clientpipe
		rm $serverpipe
		exit 0 ;;
	*)
	echo "Error: Bad Request"
	rm $serverpipe
	exit 1;;
    esac
done
rm $serverpipe
