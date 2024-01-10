#!/bin/bash

if [ -z "$1" ]; then
	echo "nok: no identifier provided"
	exit 1
fi

if [ -d "$1" ]; then
	echo "nok: user already exists"
else
	mkdir "$1"
	touch "$1/wall.txt" "$1/friends.txt"
	echo "ok: user created!"
fi
