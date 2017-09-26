#!/bin/bash

#. ./config

BNET="miyalab"
IP="192.168.1.154"

mkdir -p /srv/softether/etc/vpnserver/
mkdir -p /srv/softether/local/vpnserver/
touch /srv/softether/etc/vpnserver/vpn_server.config
touch /srv/softether/local/vpnserver/security_log
touch /srv/softether/local/vpnserver/packet_log
touch /srv/softether/local/vpnserver/server_log

docker run --detach \
	--volume /srv/softether/vpnserver/vpn_server.config:/usr/local/vpnserver/vpn_server.config \
	--volume /srv/softether/vpnserver/security_log:/var/log/vpnserver/security_log \
	--volume /srv/softether/vpnserver/packet_log:/var/log/vpnserver/packet_log \
	--volume /srv/softether/vpnserver/server_log:/var/log/vpnserver/server_log \
	--privileged \
	--network ${BNET} \
	--ip ${IP} \
	--name  softether \
	frosquin/softether