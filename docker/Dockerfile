FROM alpine:latest

RUN apk add --no-cache bash apache2-utils

COPY --chmod=0755 *.sh /usr/bin/

WORKDIR /data
