# Liquidsoap for use with Docker

[xxaxxelxx/xx_Liquidsoap](https://index.docker.io/u/xxaxxelxx/xx_liquidsoap/)

## Synopsis
This repo is the base for an [automated docker build](https://hub.docker.com/r/xxaxxelxx/xx_Liquidsoap/).

The running docker container provides a preconfigured Liquidsoap for very special streaming purposes usable for a distributed architecture.
It presumably will not fit for you, but it is possible to tune it. If you need some additional information, feel free to ask.

The [xxaxxelxx/xx_liquidsoap](https://hub.docker.com/r/xxaxxelxx/xx_liquidsoap/) repo is an essential part of a complex compound used for streaming.
It's main purpose is the parallel transcoding of a master stream received from a *xx_icecast* docker container into different formats and sending them back.

**xx_liquidsoap** docker images are build from [liquidsoap-1.1.1 sources] (http://sourceforge.net/projects/savonet/files/)

## Supported formats
* MP3
* AAC
* OGG VORBIS
* OPUS

## Compound elements
[xxaxxelxx/xx_bridgehead](https://hub.docker.com/r/xxaxxelxx/xx_bridgehead/)  
[xxaxxelxx/xx_icecast](https://index.docker.io/u/xxaxxelxx/xx_icecast/)  
**[xxaxxelxx/xx_liquidsoap](https://index.docker.io/u/xxaxxelxx/xx_liquidsoap/)**

## Usage
The container runs as user liquidsoap and dis not expose any ports.

### Run it
```bash
$ docker run -d --name mycontainername_myradio --link ICECAST_PLAYER_CONTAINER:ALIAS xxaxxelxx/xx_liquidsoap myradio
```
***




## License

[MIT](https://github.com/xxaxxelxx/xx_Liquidsoap/blob/master/LICENSE.md)


