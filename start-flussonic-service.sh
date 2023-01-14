#!/bin/sh
flussonicEtcDir="/flussonic/etc/flussonic"
flussonicVarDir="/flussonic/var/lib/flussonic"
if [ -d "$flussonicEtcDir" ]; then
    echo "didn't find $flussonicEtcDir , creating default /etc/flussonic configuration ..."
    mkdir -p "$flussonicEtcDir"
    cp -r "$(pwd)/flussonic-default-files/etc/flussonic/*" "$flussonicEtcDir"
fi

if [ -d "$flussonicVarDir" ]; then
    echo "didn't find $flussonicVarDir , creating required /var/lib/flussonic paths ..."
    mkdir -p "$flussonicVarDir"
fi

docker run --restart unless-stopped \
    -d \
    --name flussonic \
    --hostname flussonic \
    -p 5000:80 \
    -v /flussonic/etc/flussonic:/etc/flussonic:rw \
    -v /flussonic/var/lib/flussonic:/var/lib/flussonic:rw \
    flussonic/flussonic
