FROM telegraf:1.3.5-alpine

RUN apk update && apk add curl

COPY entrypoint.sh /entrypoint.sh
COPY telegraf.conf /etc/telegraf/
