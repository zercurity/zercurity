#!/bin/bash

if ! ( systemctl --all --type service | grep -q "docker" ); then
  echo "Docker is not installed."
  exit 1
fi

if ! ( command -v docker-compose > /dev/null ); then
  echo "Docker Compose is not installed"
  exit 1
fi

if ! ( command -v git > /dev/null ); then
  echo "Git is not installed"
  exit 1
fi

echo "Updating local files .."

git pull

if ! ( getent group docker | grep -q "\b${whoami}\b" ) && (( EUID != 0 )); then
  echo "User not in the docker group. Or not root.
  Use the following command to add your user to the docker group:
  "
  echo "sudo usermod -aG docker ${whoami}"
  exit 1
fi

if ! ( systemctl is-active --quiet docker ); then
  echo "Docker service not running. Please start the docker service
  "
  echo "sudo systemctl start docker"
  exit 1
fi

echo "Updating containers .."

docker-compose --env-file ./production.env  pull

echo "Removing old containers .."

docker image prune -f

if ! ( systemctl is-active --quiet zercurity ); then
  echo "Zercurity service not installed. Please "
fi