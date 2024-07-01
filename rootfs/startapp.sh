#!/bin/sh

cd /config/MegaBasterd
/usr/bin/java \
            -XX:-UsePerfData \
            -Dawt.useSystemAAFontSettings=gasp \
            -Djava.awt.headless=false \
            -jar ./MegaBasterd.jar
