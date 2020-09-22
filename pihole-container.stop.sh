#!/bin/sh

ansible-playbook -b -i localhost, -e container_state=absent pihole-container.yml
