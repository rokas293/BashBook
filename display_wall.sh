#!/bin/bash

if [ ! -d "$1" ]; then
	echo "nok: user '$1' does not exist"
	exit 1
fi

echo "start_of_file"
cat "$1/wall.txt"
echo "end_of_file"
