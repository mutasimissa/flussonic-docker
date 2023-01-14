#!/bin/sh
mkdir -p /flussonic/etc/flussonic &&
    mkdir -p /flussonic/var/lib/flussonic &&
    docker run --restart unless-stopped \
        -d \
        --name flussonic \
        --hostname flussonic \
        -p 5000:80 \
        -v /flussonic/etc/flussonic:/etc/flussonic \
        flussonic/flussonic
