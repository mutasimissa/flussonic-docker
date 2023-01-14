#!/bin/sh
httpPort=5000
name=flussonic
flussonicBaseDir="/flussonic-files"
flussonicEtcDir="$flussonicBaseDir/etc/flussonic"
dockerHubImage="flussonic/flussonic"
if ! [ -d "$flussonicEtcDir" ]; then
    echo "didn't find $flussonicEtcDir , creating default /etc/flussonic configuration ..."
    mkdir -p "$flussonicEtcDir"
    rsync -avu --delete "$(pwd)/flussonic-default-files/etc/" "$flussonicBaseDir/etc"
fi

if lsof -Pi :$httpPort -sTCP:LISTEN -t >/dev/null; then
    echo "Port in use"
    exit 123
fi

docker run --restart unless-stopped \
    -d \
    --name $name \
    --hostname $name \
    -p $httpPort:80 \
    -v $flussonicEtcDir:/etc/flussonic:rw \
    $dockerHubImage
