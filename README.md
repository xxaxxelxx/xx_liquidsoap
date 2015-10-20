# Liquidsoap for use with Docker

[xxaxxelxx/xx_Liquidsoap](https://index.docker.io/u/xxaxxelxx/xx_liquidsoap/)

## Synopsis
This repo is the base for an [automated docker build](https://hub.docker.com/r/xxaxxelxx/xx_Liquidsoap/).

The running docker container provides a preconfigured Liquidsoap for very special streaming purposes usable for a distributed architecture.
It presumably will not fit for you, but it is possible to tune it. If you need some additional information, feel free to ask.

The [xxaxxelxx/xx_liquidsoap](https://hub.docker.com/r/xxaxxelxx/xx_liquidsoap/) repo is an essential part of a complex compound used for streaming.


## Compound elements
[xxaxxelxx/xx_bridgehead](https://hub.docker.com/r/xxaxxelxx/xx_bridgehead/)  
[xxaxxelxx/xx_icecast](https://hub.docker.com/r/xxaxxelxx/xx_icecast/)  
**[xxaxxelxx/xx_liquidsoap](https://hub.docker.com/r/xxaxxelxx/xx_liquidsoap/)**




## Usage






It supports three modes.

***
### PROXY mode
Container operates as a proxy for player containers.

#### ENVIRONMENT
> ATTENTION: Always set your own passwords to prevent any unauthorized access!!!

- IC_ADMIN_PASS=*myadminpass*
- IC_SOURCE_PASS=*mysourcepass*
- IC_RELAY_PASS=*myrelaypass*
- IC_PORT=*80*
- MASTER_SERVER_PORT=*80*
- SIMULCAST_MASTER_SERVER_BBR=*0.0.0.0*
- SIMULCAST_MASTER_SERVER_TDY=*0.0.0.0*
- SIMULCAST_MASTER_SERVER_OW=*0.0.0.0*
- CHANNEL_MASTER_SERVER_BBR=*0.0.0.0*
- CHANNEL_MASTER_SERVER_TDY=*0.0.0.0*
- CHANNEL_MASTER_SERVER_OW=*0.0.0.0*

#### EXPOSED
- 8000

#### USER
- Liquidsoap2:Liquidsoap

#### Run it
```bash
$ docker run -d -p 80:8000 -e IC_ADMIN_PASS=myspecialadminpass -e IC_SOURCE_PASS=*myspecialsourcepass -e IC_RELAY_PASS=*myspecialrelaypass -e SIMULCAST_MASTER_SERVER=address -e CHANNEL_MASTER_SERVER=address --name mycontainername xxaxxelxx/xx_Liquidsoap proxy
```
***

### PLAYER mode
Container operates as a player and get his streams from a proxy.

#### ENVIRONMENT
> ATTENTION: Always set your own passwords to prevent any unauthorized access!!!

- IC_ADMIN_PASS=*myadminpass*
- IC_SOURCE_PASS=*mysourcepass*
- IC_RELAY_PASS=*myrelaypass*
- IC_PORT=*80*
- SIMULCAST_PROXY_SERVER_BBR=*0.0.0.0*
- SIMULCAST_PROXY_SERVER_TDY=*0.0.0.0*
- SIMULCAST_PROXY_SERVER_OW=*0.0.0.0*
- CHANNEL_PROXY_SERVER_BBR=*0.0.0.0*
- CHANNEL_PROXY_SERVER_TDY=*0.0.0.0*
- CHANNEL_PROXY_SERVER_OW=*0.0.0.0*

#### EXPOSED
- $IC_PORT

#### USER
- Liquidsoap2:Liquidsoap

#### Run it
```bash
$ docker run -d -p 80:8000 -e IC_ADMIN_PASS=myspecialadminpass -e IC_SOURCE_PASS=*myspecialsourcepass -e IC_RELAY_PASS=*myspecialrelaypass --name mycontainername xxaxxelxx/xx_Liquidsoap player
```
***

### BASH mode
**IS FOR TESTING PURPOSES**

Will not start any Liquidsoap process but prepares the environment.

#### ENVIRONMENT
> ATTENTION: Always set your own passwords to prevent any unauthorized access!!!

- IC_ADMIN_PASS=*myadminpass*
- IC_SOURCE_PASS=*mysourcepass*
- IC_RELAY_PASS=*myrelaypass*
_ IC_PORT=*80*

#### EXPOSED
- $IC_PORT

#### USER
- Liquidsoap2:Liquidsoap

#### Run it
```bash
$ docker run -it -p 80:8000 -e IC_ADMIN_PASS=myspecialadminpass -e IC_SOURCE_PASS=*myspecialsourcepass -e IC_RELAY_PASS=*myspecialrelaypass -e SIMULCAST_PROXY_SERVER=address -e CHANNEL_PROXY_
SERVER=address --name mycontainername xxaxxelxx/xx_Liquidsoap
```
***

## License

[MIT](https://github.com/xxaxxelxx/xx_Liquidsoap/blob/master/LICENSE.md)


