# Flussonic Docker Utility
## Goal
- [Flussonic](https://flussonic.com) provides serveral load-balancing, clustering and kubernetes options to build complex archetictures with Flussonic
- This repo is oriented to easily bootstrap an initial docker container environment [using the official flussonic docker image](https://hub.docker.com/r/flussonic/flussonic)
 to be suitable for providers who look for simple environment around containerization.
## Requirements
- Look at [Flussonic Docs](https://flussonic.com/doc) if you didn't! 
- Remove any docker container engine on your system (specially from default apt source or snap)
- Follow docker instructions to install docker engine based on your distro.
- install git to your distro
- Secure and optimize the os the way you like

## Fresh Install
```
git clone <THIS REPO URI>
```

```
sh start-flussonic-container.sh
```
> by default the script will map port 5000 so you should access flussonic using that port
## Using
- stop the container `docker stop flussonic`
- restart the container `docker restart flussonic`
- remove the container `docker stop flussonic && docker rm flussonic`
- by default the script creates `/flussonic` to presist the following:
  -  config in the container located at `/etc/flussonic`
  -  pulse database in the container located at `/var/lib/flussonic` 
  > this makes it safe to remove/update the docker container without affecting the configurations 
## Migrating
### OLD SERVER
- Backup `/etc/flussonic` and optionally `/var/lib/flussonic` 
```
tar -cf flussonic_backup.tar -C /etc/flussonic . -C /var/lib/flussonic .
```
> in case you are migrating from an environment made with this utility
```
tar -cf flussonic_backup.tar -C /flussonic/etc/flussonic . -C /flussonic/var/lib/flussonic .

```
### NEW SERVER
- Create directory /flussonic and extract the created tar backup file
  