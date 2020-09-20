# ansible-playbook-rpi_homeserver
set up CentOS/Fedora based Raspberry Pi 3 or 4 as a tiny home server

Instructions
------------
* get CentOS for e.g. Raspberry Pi 4:

  * download image from https://people.centos.org/pgreco/CentOS-Userland-8-stream-aarch64-RaspberryPI-Minimal-4/

  * using Linux, copy image to SD card, e.g.

    `xzcat CentOS-Userland-8-stream-aarch64-RaspberryPI-Minimal-4-sda.raw.xz | dd status=progress bs=4M of=/dev/sda && sync;sync;sync`

* insert SD card into Raspberry Pi and boot

* login using user "root" and password "centos"
  
* in case you need to change the keyboard layout:
  ```
  loadkeys de
  ```

* change the password for security reasons:
  ```
  passwd
  ```

* in case network access is not planned using a LAN cable but wireless instead, connect to your Wifi:
  ```
  nmtui
  ```

* to do the base setup and install cockpit, a management web ui:
  ```
  wget https://github.com/joschro/ansible-playbook-rpi_homeserver/archive/master.zip
  unzip master.zip
  cd ansible-playbook-rpi_homeserver
  sh run.sh
  ```

* after successful setup, reboot:
  ```
  reboot
  ```

* login again with user "root" and the password you chose above

* install optional modules, depending on the use case:
  ```
  ansible-playbook pihole-container.yml
  ansible-playbook tang-container.yml
  ```
