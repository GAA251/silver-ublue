#!/bin/sh

check() {
  return 0
}

depends() {
  # This module obviously requires the bluetooth module
  # the bluetooth module also has its own requirements but dracut loads them anyway
  echo bluetooth
  return 0
}

install() {
  inst_hook pre-udev 50 "$moddir/bluetoothkeys.sh"
}
