# Docker image for SoftEther VPN

This will deploy a fully functional [SoftEther VPN](https://www.softether.org) server as a docker image.

Available on [Docker Hub](https://registry.hub.docker.com/u/frosquin/softether/).

## Download

    docker pull frosquin/softether

## Build
    sh docker_build.sh

## Run


Simplest version:

    docker run -d --net host --cap-add NET_ADMIN --name softether frosquin/softether

With external config file:

    touch /etc/vpnserver/vpn_server.config
    docker run -d -v /etc/vpnserver/vpn_server.config:/usr/local/vpnserver/vpn_server.config --net host --cap-add NET_ADMIN --name softether frosquin/softether

If you want to keep the logs in a data container:

    docker volume create --name softether-logs
    docker run -d --net host --cap-add NET_ADMIN --name softether -v softether-logs:/var/log/vpnserver frosquin/softether

All together now:

    touch /etc/vpnserver/vpn_server.config
    docker volume create --name softether-logs
    docker run -d -v /etc/vpnserver/vpn_server.config:/usr/local/vpnserver/vpn_server.config  -v softether-logs:/var/log/vpnserver --net host --cap-add NET_ADMIN --name softether frosquin/softether


## Vpn Server setting
Using vpn server setting application in docker.
    `docker exec -it softegter ./vpncmd`
    <a href="AWS(EC2)でSoftEtherを使ってL2TP_IPsecなVPNを構築する (Mac)_-_Qiita.pdf">Document</a>

    web url -> "https://qiita.com/showwin/items/92861057a8b62611444d"

### 流れ
1.  仮想ハブ作成
2.  ユーザ作成
3.  ipsec on `ipsecenable`
4.  ddns 確認 ` DynamicDnsGetStatus`
5.  securenat on `SecureNatEnable`
