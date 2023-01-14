#!/bin/sh
docker run --restart unless-stopped \
    -d \
    --name flussonic \
    --hostname flussonic \
    -p 5000:80 \
    -v /flussonic/etc/flussonic:/etc/flussonic \
    flussonic/flussonic
