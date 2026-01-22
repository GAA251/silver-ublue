#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

# Removes unneeded toolbox stuff since it's already removed in recipe.yml
rm -f /etc/profile.d/toolbox.sh

# Enables font stemming (https://blog.aktsbot.in/no-more-blurry-fonts.html)
echo 'FREETYPE_PROPERTIES="cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"' >> /etc/environment

# TEMP!!!!
# PLEASE REMOVE THIS AFTER THIS IS FIXED:
# https://gitlab.gnome.org/GNOME/libgnome-volume-control/-/issues/34
# Downgrades wireplumber to v0.5.12-1 until gnome stops crashing the second it switches to a bluetooth device
dnf downgrade wireplumber-0.5.12-1.fc43
