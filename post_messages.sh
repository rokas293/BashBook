#!/bin/bash

if [ ! -d "$1" ]; then
	echo "nok: user '$1' does not exist"
	exit 1
fi

if [ ! -d "$2" ]; then
	echo "nok: user '$2' does not exist"
	exit 1
fi

if ! grep -Fxq "$1" "$2/friends.txt"; then
	echo "nok: user '$1' is not a friend of '$2'"
	exit 1
fi

echo "$1: $3" >> "$2/wall.txt"
echo "ok: message posted!"
