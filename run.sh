#!/usr/bin/env bash

# Build the container
clear
echo "Building %%service-name%% microservice"
(docker-compose build && \
clear && \
# Run the container
echo "Running %%service-name%% microservice" && \
docker-compose up -d --force-recreate --remove-orphans && \
clear && \
# Display results
docker-compose ps) || \
"Unable to run %%service-name%% service"
