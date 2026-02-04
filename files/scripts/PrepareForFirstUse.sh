#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

# Removes unneeded toolbox stuff since it's already removed in recipe.yml
rm -f /etc/profile.d/toolbox.sh

# Enables font stemming (https://blog.aktsbot.in/no-more-blurry-fonts.html)
echo 'FREETYPE_PROPERTIES="cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"' >> /etc/environment

# Configure bluetooth
# Enables Fast Connectable, lets devices connect faster to us at startup/after suspend (/etc/bluetooth.main.conf)
# Enables the bluetooth adapter to wake the computer from suspend (https://wiki.archlinux.org/title/Bluetooth#Wake_from_suspend)
sed -i 's/#FastConnectable = false/FastConnectable = true/' /etc/bluetooth/main.conf
echo 'ACTION=="add", SUBSYSTEM=="usb", DRIVERS=="usb", ATTR{bDeviceClass}=="e0", ATTR{bDeviceProtocol}=="01", ATTR{bDeviceSubClass}=="01", ATTR{power/wakeup}="enabled"' > /etc/udev/rules.d/91-bluetooth-wakeup.rules

# DUMMY FIX for anything weird that might happen in the future
#current_date=$(date +%Y%m%d)
#cutoff_date="20260206" # 06.02.2026 (DD/MM/YYYY)
#if [ "$current_date" -lt "$cutoff_date" ]; then
#    dnf downgrade -y wireplumber-0.5.12-1.fc43
#fi
