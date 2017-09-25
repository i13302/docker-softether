#!/bin/bash

BNET="miyalab"

touch /srv/softether/erc/vpnserver/vpn_server.config
docker run -d \
	--volume /srv/softether/vpnserver/vpn_server.config:/usr/local/vpnserver/vpn_server.config \
	--privileged \
	--network ${BNET} \
	--ip ${192.168.1.154} \
	--name  softether \
	frosquin/softether