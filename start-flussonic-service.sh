#!/bin/sh
mkdir -p /flussonic/etc/flussonic &&
mkdir -p /flussonic/var/lib/flussonic &&
docker run \
    -d --restart unless-stopped \
    --name flussonic \
    --hostname flussonic \
    -p 5000:80 \
    -v /flussonic/etc/flussonic:/etc/flussonic:rw \
    -v /flussonic/var/lib/flussonic:/var/lib/flussonic:rw \
    flussonic/flussonic
