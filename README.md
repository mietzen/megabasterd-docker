# megabasterd-docker

A containerized app for [MegaBasterd](https://github.com/tonikelope/megabasterd) using [jlesage/docker-baseimage-gui](https://github.com/jlesage/docker-baseimage-gui).

## docker-compose
```
version: '3'
services:
  megabasterd:
    image: mietzen/megabasterd:latest
    name: megabasterd
    restart: unless-stopped
    ports:
      - "5800:5800"
    volumes:
      - "./config:/config"
      - "./output:/output"
```
