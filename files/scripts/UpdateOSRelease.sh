#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

# Updates the os-release file to better reflect the image version
OS_RELEASE_FILE="/usr/lib/os-release"
NAME=$(grep '^NAME=' "$OS_RELEASE_FILE" | cut -d'=' -f2 | tr -d '"')
VARIANT=$(grep '^VARIANT=' "$OS_RELEASE_FILE" | cut -d'=' -f2 | tr -d '"')
VERSION_ID=$(grep '^VERSION_ID=' "$OS_RELEASE_FILE" | cut -d'=' -f2 | tr -d '"')

# Use OSTREE_VERSION in the OS Build field in gnome-settings 
#OS_BUILD=$(grep '^OSTREE_VERSION=' "$OS_RELEASE_FILE" | cut -d'=' -f2 | tr -d "'")
# Use the date and time of build in the OS Build field in gnome-settings
OS_BUILD=$(date +"%d/%m/%Y %H:%M %Z")


# Set NAME to Fedora Linux
#NAME="Fedora Linux"
sed -i.bak "s/^NAME=.*/NAME=\"$NAME\"/" "$OS_RELEASE_FILE"
# Update PRETTY_NAME and add/edit IMAGE_VERSION
sed -i.bak "s/^PRETTY_NAME=.*/PRETTY_NAME=\"$NAME $VERSION_ID ($VARIANT)\"/" "$OS_RELEASE_FILE"
# Add IMAGE_VERSION if it doesn't exist, or update it if it does
if grep -q '^IMAGE_VERSION=' "$OS_RELEASE_FILE"; then
  sed -i "s/^IMAGE_VERSION=.*/IMAGE_VERSION=\"$OS_BUILD\"/" "$OS_RELEASE_FILE"
else
  echo "IMAGE_VERSION=\"$OS_BUILD\"" >> "$OS_RELEASE_FILE"
fi
