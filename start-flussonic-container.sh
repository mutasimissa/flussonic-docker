#!/bin/sh
flussonicEtcDir="/flussonic/etc/flussonic"
flussonicVarDir="/flussonic/var/lib/flussonic"
dockerHubImage="flussonic/flussonic"
if [ -d "$flussonicEtcDir" ]; then
    echo "didn't find $flussonicEtcDir , creating default /etc/flussonic configuration ..."
    mkdir -p "$flussonicEtcDir"
    rsync -avu --delete "$(pwd)/flussonic-default-files/etc/" "/flussonic/etc"
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
    -v $flussonicEtcDir:/etc/flussonic:rw \
    -v $flussonicVarDir:/var/lib/flussonic:rw \
    $dockerHubImage
