#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

# Removes unneeded toolbox stuff since it's already removed in recipe.yml
rm -f /etc/profile.d/toolbox.sh

# Enables font stemming (https://blog.aktsbot.in/no-more-blurry-fonts.html)
echo 'FREETYPE_PROPERTIES="cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"' >> /etc/environment
