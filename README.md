# ansible-playbook-rpi_homeserver
set up CentOS/Fedora based Raspberry Pi 3 or 4 as a tiny home server

Instructions
------------
* get CentOS for e.g. Raspberry Pi 4:

  * download image from https://people.centos.org/pgreco/CentOS-Userland-8-stream-aarch64-RaspberryPI-Minimal-4/

  * using Linux, copy image to SD card, e.g.

    `xzcat CentOS-Userland-8-stream-aarch64-RaspberryPI-Minimal-4-sda.raw.xz | dd status=progress bs=4M of=/dev/sda && sync;sync;sync`

* insert SD card into Raspberry Pi and boot

* login after initial setup and open terminal:
  
  in case you need to change the keyboard layout:
  ```
  loadkeys de
  ```
  
  install base environment with cockpit, a management web ui:
  ```
  wget https://github.com/joschro/ansible-playbook-rpi_homeserver/archive/master.zip
  unzip master.zip
  cd ansible-playbook-rpi_homeserver
  sh run.sh
  ```
  optional modules, depending on the use case:
  ```
  ansible-playbook pihole-container.yml
  ansible-playbook tang-container.yml
  ```
