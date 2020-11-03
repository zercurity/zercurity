#!/bin/bash
set -e

INSTALL_PATH="/var/lib/zercurity"
ENV_FILE="$INSTALL_PATH/production.env"
SYSTEM_SERVICE="/etc/systemd/system/zercurity.service"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Please run ./setup.sh first."
  exit 1
fi

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

# Install new compose file
sudo cp ./docker-compose.yml "$INSTALL_PATH/docker-compose.yml"

# shellcheck disable=SC2154
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

sudo docker-compose --env-file $ENV_FILE  pull

if ( systemctl is-enabled --quiet zercurity ); then
  echo "Restarting Zercurity."
  sudo systemctl restart zercurity
else
  echo "Zercurity service not available. Please restart manually.
  "
  echo "sudo docker-compose --env-file $ENV_FILE up"
fi

echo "Removing old containers .."

docker image prune -f
