#!/bin/bash
set -e

if ! ( command -v sudo > /dev/null ); then
  echo "sudo is required in order to install and configure Zercurity
Please run the commands below to install sudo:
"
  echo "su -"
  echo "apt -y install sudo"
  echo "echo '$(whoami) ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/$(whoami) ;"
  echo "chmod 440 /etc/sudoers.d/$(whoami) ;"
  echo "exit"
  exit 1
fi

INSTALL_PATH="/var/lib/zercurity"
ENV_FILE="$INSTALL_PATH/production.env"
SYSTEM_SERVICE="/etc/systemd/system/zercurity.service"

if [[ ! -d "$INSTALL_PATH" ]]; then
  echo "Installing Zercurity to: $INSTALL_PATH"
  sudo mkdir -p "$INSTALL_PATH"
fi

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Default environment file: $ENV_FILE"
  sudo cp ./example.env "$ENV_FILE"
  sudo chmod 600 "$ENV_FILE"
fi

# Check sudo permissions
# sudo -l

# shellcheck disable=SC2046
export $(sudo cat $ENV_FILE | grep -v '#' | awk '/=/ {print $1}')

if [[ -z "${ZERCURITY_DOMAIN}" ]]; then
  echo "The environment variable \"ZERCURITY_DOMAIN\" is not set.
A domain name is required in order to continue. e.g. zercurity.local.
Please enter one now .."
  read -r ZERCURITY_DOMAIN
  export ZERCURITY_DOMAIN=$ZERCURITY_DOMAIN
  echo "ZERCURITY_DOMAIN=$ZERCURITY_DOMAIN" | sudo tee -a "$ENV_FILE"
fi

if [[ -z "${SECRET}" ]]; then
  ZERCURITY_SECRET=$(tr -dc 'a-zA-Z0-9' < /dev/urandom | fold -w 32 | head -n 1)
  export SECRET=$ZERCURITY_SECRET
  echo "SECRET=$ZERCURITY_SECRET" | sudo tee -a "$ENV_FILE"
fi

echo "Starting up as \"$ZERCURITY_DOMAIN\" .."

sudo mkdir -p "$INSTALL_PATH/certs/$ZERCURITY_DOMAIN/"
sudo mkdir -p "$INSTALL_PATH/secrets/$ZERCURITY_DOMAIN/"
sudo mkdir -p "$INSTALL_PATH/data/backend/download.$ZERCURITY_DOMAIN/"
sudo mkdir -p "$INSTALL_PATH/data/postgres/"

if [[ ! -f "$SYSTEM_SERVICE" ]]; then
  sudo cp zercurity.service "$SYSTEM_SERVICE"
  sudo systemctl daemon-reload
  sudo systemctl enable zercurity
fi

sudo -- sh -c "echo \"127.0.0.1 $ZERCURITY_DOMAIN app.$ZERCURITY_DOMAIN api.$ZERCURITY_DOMAIN download.$ZERCURITY_DOMAIN\" >> /etc/hosts"

./update.sh

echo "Zercurity has now been successfully setup."
echo ""
echo "Please visit each of the following URLs to both ensure
a successful deployment but also accept the self-signed
certificates. Otherwise, the app will not load:"
echo ""
echo "-> https://api.$ZERCURITY_DOMAIN/"
echo "-> https://download.$ZERCURITY_DOMAIN/"
echo "-> https://app.$ZERCURITY_DOMAIN/"
echo ""
echo "You can create your first user with the following command:"
echo ""
echo "docker exec zercurity_backend_1 ./zercurity --register --name \"$(whoami)\" --email \"your@email.com\""
echo ""