#!/bin/bash

# Usage: ./acquire.sh lockfile

lockfile="$1"

# Try to acquire the lock
while true; do
	if ln -s $$ "$lockfile" $> /dev/null; then
		break
	else
		# Sleep for a short duration and try again
		sleep 0.1
	fi
done
