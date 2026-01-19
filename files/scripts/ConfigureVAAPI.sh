#!/usr/bin/env bash

# Enable UUPD (Universal Update)
# Normally this is supposed to be provided by bling (https://blue-build.org/reference/modules/bling/)
# but it isn't (for now). So we install it through recipe.yml, then configure it here.

# For this script to work; 
# ublue-os-update-services must be removed and uupd must be installed through recipe.yml

# Tell this script to exit if there are any errors.
set -oue pipefail
echo "LIBVA_DRIVER_NAME=nvidia;CUDA_DISABLE_PERF_BOOST=1" >> /etc/environment
