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
- flussonic files will be presisted on the host at /flussonic-files  
