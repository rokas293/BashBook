#!/bin/bash

if [ -z "$1" ]; then
	echo "ERROR: No user ID provided."
	exit 1
fi

id="$1"
request_pipe="server.pipe"
response_pipe="$id.pipe"

# Create a named pipe for receiving responses
mkfifo "$response_pipe"

# Function to cleanup and exit
cleanup_and_exit() {
	rm -f "$response_pipe"
	exit 0
}

# Trap Control+C to cleanup and exit
trap cleanup_and_exit EXIT

# Loop to send requests and receive responses
while true: do
	# Read user input
	read -p "Enter your request (create, add, post, display): " request
	read -p "Enter additional arguments if any: " args

	# Check if the request is well-formed
	if [ -z "$request" ]; then
		echo "Invalid request. Please try again."
		continue
	fi

	# Send the request to the server
	echo "$request $id $args" > "$request_pipe"

	# Read the response from the server
	response=$(cat "$response_pipe")

	# Process and display the response
	case "$response" in
		"ok:"*)
			echo "SUCCESS: ${response#ok:}"
			;;
		"nok:*)
			echo "ERROR: ${response#nok:}"
			;;
		*)
			echo "Unexpected response from the server: $response"
			;;
	esac
done
