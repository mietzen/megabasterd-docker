# megabasterd-docker

A containerized app for megbasterd from https://github.com/tonikelope/megabasterd

## docker-compose
```
version: '3'
services:
  megabasterd:
    image: mietzen/megabasterd
    ports:
      - "5800:5800"
    volumes:
      - "./config:/config"
      - "./output:/output"
```
