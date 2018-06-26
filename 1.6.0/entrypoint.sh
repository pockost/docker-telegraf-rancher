#!/bin/sh
set -e

export INFLUX_TELEGRAF_HOST=$(curl -s --unix-socket /var/run/docker.sock http/info | jq -r '.Name')

if [ "${1:0:1}" = '-' ]; then
  set -- telegraf "$@"
fi

exec "$@"
