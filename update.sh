#!/bin/bash
set -e

INSTALL_PATH="/var/lib/zercurity"
ENV_FILE="$INSTALL_PATH/production.env"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Please run ./setup.sh first."
  echo "https://github.com/zercurity/"
  exit 1
fi

if ! ( command -v docker > /dev/null ); then
  echo "Docker is not installed."
  echo "https://docs.docker.com/engine/install/debian/"
  exit 1
fi

if ! ( command -v docker-compose > /dev/null ); then
  echo "Docker Compose is not installed"
  echo "sudo pip3 install docker-compose"
  exit 1
fi

if ! ( command -v pip3 > /dev/null && pip3 list --format columns | grep docker-compose > /dev/null ); then
  echo "!! WARNING !!"
  echo "Docker compose is installed. However, not using pip3."
  echo "Please ensure you are using the latest version of docker-compose
as earlier versions do not support the --env-file parameter."
  echo "If you receive help information from the docker-compose command
then it is most likely out-of-date."
  echo ""
  echo "sudo apt remove docker-compose"
  echo "sudo pip3 install docker-compose"
  echo "!! WARNING !!"
  sleep 1
fi

if ! ( command -v git > /dev/null ); then
  echo "Git is not installed"
  echo "Ubuntu/Debian: sudo apt install git"
  echo "RHEL: sudo yum install git"
  exit 1
fi

# shellcheck disable=SC2046
export $(sudo cat $ENV_FILE | grep -v '#' | awk '/=/ {print $1}')

# Check folders exist
if [[ ! -d "$INSTALL_PATH/certs/$ZERCURITY_DOMAIN/" ]]; then
  sudo mkdir -p "$INSTALL_PATH/certs/$ZERCURITY_DOMAIN/"
fi
if [[ ! -d "$INSTALL_PATH/secrets/$ZERCURITY_DOMAIN/" ]]; then
  sudo mkdir -p "$INSTALL_PATH/secrets/$ZERCURITY_DOMAIN/"
fi
if [[ ! -d "$INSTALL_PATH/data/backend/download.$ZERCURITY_DOMAIN/" ]]; then
  sudo mkdir -p "$INSTALL_PATH/data/backend/download.$ZERCURITY_DOMAIN/"
fi

echo "Updating local files .."

git pull

# Install new compose file
sudo cp ./docker-compose.yml "$INSTALL_PATH/docker-compose.yml"

# shellcheck disable=SC2154
if ! ( getent group docker | grep -q "\b$(whoami)\b" ) && (( EUID != 0 )); then
  echo "User not in the docker group. Or not root.
Use the following command to add your user to the docker group:
  "
  echo "sudo usermod -aG docker $(whoami)"
  exit 1
fi

if ! ( systemctl is-active --quiet docker ); then
  echo "Docker service not running. Please start the docker service
"
  echo "sudo systemctl start docker"
  exit 1
fi

echo "Updating containers .."

sudo docker-compose --env-file $ENV_FILE pull

if ( systemctl is-enabled --quiet zercurity ); then
  echo "Restarting Zercurity .."
  sudo systemctl restart zercurity
else
  echo "Zercurity service not available. Please restart manually.
"
  echo "sudo systemctl restart zercurity"
  echo "
or
  "
  echo "sudo docker-compose --env-file $ENV_FILE up"
fi

echo "Removing old containers .."

docker image prune -f

echo "Checking deployment status .."

sleep 10

curl -k -s "https://api.$ZERCURITY_DOMAIN/v1/healthcheck" | \
    python3 -c "import sys, json; print(json.dumps(json.load(sys.stdin)['version'], indent=2))"
