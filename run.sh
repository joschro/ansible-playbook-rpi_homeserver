#!/bin/sh

rpm -q epel-release || sudo dnf install -y epel-release
rpm -q ansible || sudo dnf install -y ansible
ansible-playbook rpi-homeserver.yml
