#!/bin/bash

echo "Updating containers .."

docker-compose --env-file ./production.env  pull

echo "Removing old containers .."

docker image prune -f
