#!/usr/bin/env bash

set -e

# Template variables
service_name="%%service-name%%"
service_port="%%service-port%%"

network_name="%%network-name%%"

# Initializing function
function init() {
	clear
	echo "Initializing project '${name} microservice' with default port ${port}"
	(config && parse && clean && echo "Successfully initialized service") || \
	echo "Failed to initialize service"
}

# Set file permissions
function config() {
	echo "Setting file permissions"
	(chmod a+x run.sh && \
	echo "Successfully set run.sh") ||
	echo "Failed to set run.sh"
}

# Parse the project files
function parse() {
	echo "Processing project files"
	# Replace occurences
	for file in ./*.*
	do
		echo "Parsing $file"
		sed -i -e "s/${service_name}/${name}/g" "$file"
		sed -i -e "s/${service_port}/${port}/g" "$file"
		sed -i -e "s/${network_name}/${network}/g" "$file"
	done
}

# Remove any temporal files
function clean() {
	echo "Cleaning temporal files"

	# Clean git template repository information
	rm -rf .git
	# Initialize empty git
	git init

	# Delete template initialization files
	rm README.md
	mv READMEE.md README.md
	rm ms.init.sh
	rm ms.core.sh
}
