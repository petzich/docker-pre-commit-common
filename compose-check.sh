#!/bin/sh

# This script is required because docker-compose expects the compose filename to be
# passed in before the command.

if [ -z "$1" ]; then
	echo "File name parameter missing"
	exit 1
else
	docker-compose -f "$1" config -q
fi
