#!/bin/bash

# Usage: ./release.sh lockfile

lockfile="$1"

# Remove the lock file
rm -f "$lockfile"
