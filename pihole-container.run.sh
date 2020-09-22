#!/bin/sh

ansible-playbook -b -i localhost, -e container_state=running pihole-container.yml
