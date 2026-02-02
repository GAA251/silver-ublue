#!/bin/sh
#/boot/_bluetooth/[bluetooth dongle mac]/[bluetooth keyboard mac]/info
#don't want initramfs to choke if the keys arent copied yet
if [ -d "/boot/_bluetooth" ]; then
  warn "Bluetooth keys detected"
  cp -R /boot/_bluetooth/* /var/lib/bluetooth/
  warn "Copied but to test I'm dropping you to the emergency shell. Things will continue as soon as you leave"
  emergency_shell
fi
