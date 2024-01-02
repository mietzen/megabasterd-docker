#!/bin/sh

cd /config
/usr/bin/java \
            -XX:-UsePerfData \
            -Dawt.useSystemAAFontSettings=gasp \
            -Djava.awt.headless=false \
            -jar MegaBasterd/MegaBasterd.jar 2>&1
