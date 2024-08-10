#!/bin/sh

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

# Make sure mandatory directories exist.
mkdir -p /config/logs

# Set default configuration on new install.
if [ ! -f /config/MegaBasterd/MegaBasterd.jar ]; then
    cp -r /defaults/MegaBasterd /config
    # Generate initial settings from 8.21 db
    mkdir -p /config/MegaBasterd/.megabasterd8.21
    mkdir -p /config/MegaBasterd/.megabasterd_old_backups
    cat /config/MegaBasterd/config.sql | sqlite3 /config/MegaBasterd/.megabasterd8.21/megabasterd.db
    rm -rf /config/MegaBasterd/config.sql
else
    # Check for upgrades
    if [ ! $(cmp -s /defaults/MegaBasterd/MegaBasterd.jar /config/MegaBasterd/MegaBasterd.jar) ]; then
        rm -rf /config/MegaBasterd/MegaBasterd.jar
        cp /defaults/MegaBasterd/MegaBasterd.jar /config/MegaBasterd/MegaBasterd.jar
    fi
fi

# Take ownership of the output directory.
take-ownership --not-recursive /output
