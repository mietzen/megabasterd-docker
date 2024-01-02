#!/bin/sh

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

# Make sure mandatory directories exist.
mkdir -p /config/logs

# Set default configuration on new install.
if [ ! -f /config/MegaBasterd/jar/MegaBasterd.jar ]; then
    cp -r /defaults/MegaBasterd /config
fi

# Take ownership of the output directory.
take-ownership --not-recursive /output
