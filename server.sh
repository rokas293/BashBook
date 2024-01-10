#!/bin/bash

# Create a named pipe for receiving requests
mkfifo server.pipe

# Function to cleanup and exit
cleanup_and_exit() {
	rm -f server.pipe
	exit 0
}

# Trap Control+C to cleanup and exit
trap cleanup_and_exit EXIT

# Function to acquire a lock
acquire_lock() {
	lockfile="$1"
	./acquire.sh "$lockfile"
}

# Function to release a lock
release_lock() {
	lockfile="$1"
	./release.sh "$lockfile"
}

# Loop to handle clients
while true; do
	# Get client request from server.pipe
	read -r request id args < server.pipe

	# Acquire a lock for user data modification
	acquire_lock "user_data.lock"

	# Process the request
	case "$request" in
		create)
			./create.sh "$id"
			;;
		add)
			./add_friend.sh "$id" "$args"
			;;
		post)
			./post_messages.sh "$id" "$args"
			;;
		display)
			./display_wall.sh "$id"
			;;
		*)
			#Invalid request
			echo "nok: bad request" > "$id.pipe"
			;;
	esac

	# Release the lock
	release_lock "user_data.lock"

	# Send response back to the client
	echo "$response" > "$id.pipe"
done
