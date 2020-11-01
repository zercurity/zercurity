#!/bin/bash

if [[ ! -f "production.env" ]]; then
  cp ./example.env production.env
fi

source ./production.env

if [[ -z "${ZERCURITY_DOMAIN}" ]]; then
  echo "The environment variable \"ZERCURITY_DOMAIN\" is not set.
A domain name is required in order to continue. e.g. zercurity.local.
Please enter one now .."
  read -r ZERCURITY_DOMAIN
  echo "ZERCURITY_DOMAIN=$ZERCURITY_DOMAIN" >> ./production.env
fi

export ZERCURITY_DOMAIN=$ZERCURITY_DOMAIN

echo "Starting up as \"$ZERCURITY_DOMAIN\" .."

mkdir -p "certs/$ZERCURITY_DOMAIN/"
mkdir -p "data/backend/download.$ZERCURITY_DOMAIN/"
mkdir -p "data/postgres/"

sudo -- sh -c "echo \"127.0.0.1 $ZERCURITY_DOMAIN app.$ZERCURITY_DOMAIN api.$ZERCURITY_DOMAIN download.$ZERCURITY_DOMAIN\" >> /etc/hosts"

./update.sh
