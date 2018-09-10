#!/usr/bin/env bash

# Initialize the microservice

set -e

source ms.core.sh

# Validate that enough parameters where passed
if [[ "$#" -lt 3 ]]; then
	echo "Please provide all required parameters"
	exit 1
fi

# Get arguments
while [[ $# -gt 0 ]]; do
	case "$1" in
	--service-name)
		if [[ $2 == "" ]]; then
			echo "Provide value for '--service-name'"
			exit 1
		fi
		name=$2
		shift
		;;
	--service-port)
		if [[ $2 == "" ]]; then
			echo "Provide value for '--service-port'"
			exit 1
		fi
		port=$2
		shift
		;;
	--network-name)
		if [[ $2 == "" ]]; then
			echo "Provide a value for '--network-name'"
			exit 1
		fi
		network=$2
		shift
		;;
	*)
		echo "invalid argument: $1"
		exit 1
	esac
	shift
done

# Initialize service
init
