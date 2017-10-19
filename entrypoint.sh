#!/bin/sh
set -e

export INFLUX_TELEGRAF_HOST=$(curl "http://rancher-metadata/2015-07-25/self/host/hostname")

if [ "${1:0:1}" = '-' ]; then
  set -- telegraf "$@"
fi

exec "$@"
