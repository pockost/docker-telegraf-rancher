#!/bin/bash
set -e

export INFLUX_TELEGRAF_HOST=$(curl -s --unix-socket /var/run/docker.sock http/info | jq -r '.Name')

if [[ -n "$MOUNT_POINTS" ]]; then

  IFS=', ' read -r -a mount_points <<< $MOUNT_POINTS

  result=""

  for i in "${mount_points[@]}"; do
    if [[ -z "$result" ]]; then
      result="\"$i\""
    else
      result="$result, \"$i\""
    fi
  done

  sed -i "s|# mount_points = \[\"\/\"\]|mount_points = \[$result\]|" /etc/telegraf/telegraf.conf

fi

if [ "${1:0:1}" = '-' ]; then
  set -- telegraf "$@"
fi

exec "$@"
