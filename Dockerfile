FROM alpine:3.13.1
LABEL maintainer "niuyuxian"

RUN apk add --no-cache --update wireguard-tools openssh \
    && mkdir /etc/wireguard/{util, config}

COPY wg-genkey.sh /etc/wireguard/util/wg-genkey.sh
COPY wg-startup.sh /etc/wireguard/util/wg-startup.sh

RUN chmod 700 /etc/wireguard/util/wg-startup.sh


VOLUME /etc/wireguard/config

EXPOSE 32180/udp

ENTRYPOINT [ "/etc/wireguard/util/wg-startup.sh" ]