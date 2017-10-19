FROM telegraf:alpine

RUN apk update && apk add curl

COPY entrypoint.sh /entrypoint.sh
COPY telegraf.conf /etc/telegraf/
