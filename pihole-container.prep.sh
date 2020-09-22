#!/bin/sh

mkdir -p roles
cat >>roles/requirements.yml<<EOF
---

- src: ikke_t.container_image_cleanup
  name: container_image_cleanup

- src: ikke_t.podman_container_systemd
  name: podman_container_systemd
EOF

ansible-galaxy install --roles-path roles -r roles/requirements.yml
