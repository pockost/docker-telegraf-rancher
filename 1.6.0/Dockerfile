FROM telegraf:1.5.3-alpine

RUN apk add --no-cache curl jq

COPY entrypoint.sh /entrypoint.sh
COPY telegraf.conf /etc/telegraf/
