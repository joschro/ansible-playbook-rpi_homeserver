#!/bin/sh

myName=
myHostname=
myServerIP=

ip li sh | grep cni-podman0 || ip link add cni-podman0 type bridge
podman volume ls | grep pihole_pihole || podman volume create pihole_pihole
podman volume ls | grep pihole_dnsmasq || podman volume create pihole_dnsmasq

podman run -d \
        --privileged \
        --restart=always \
        --name=$myName \
        --hostname $myHostname \
        -e TZ=Europe/Berlin \
        -e WEBPASSWORD={{ mywebpasswd }} \
        -e SERVERIP=$myServerIP \
        -v pihole_pihole:/etc/pihole:Z \
        -v pihole_dnsmasq:/etc/dnsmasq.d:Z \
        --dns=127.0.0.1 --dns=1.1.1.1 \
        -p 80:80 \
        -p 67:67/udp \
        -p $myServerIP:53:53/udp \
        pihole/pihole
# --memory 512m --cpus 1

# optional:
# encrypt /var/lib/containers/storage/volumes on mmcblk0p4
