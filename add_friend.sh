#!/bin/bash

if [ ! -d "$1" ]; then
	echo "nok: user '$1' does not exist"
	exit 1
fi

if [ ! -d "$2" ]; then 
	echo "nok: user '$2' does not exist"
	exit 1
fi

if grep -Fxq "$2" "$1/friends.txt"; then
	echo "nok: user '$2' is already a friend of '$1'"
else
	echo "$2" >> "$1/friends.txt"
	echo "ok: friend added!"
fi
