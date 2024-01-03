# Containerized MegaBasterd

A containerized [MegaBasterd](https://github.com/tonikelope/megabasterd) using [jlesage/docker-baseimage-gui](https://github.com/jlesage/docker-baseimage-gui).

This repo has active CI/CD, updates are fully automatically build, tested, merged and released.

## docker-compose

Create a `docker-compose.yaml`:

```yaml
version: '3'
services:
  megabasterd:
    image: mietzen/megabasterd:latest
    name: megabasterd
    restart: unless-stopped
    user: 1000:1000
    ports:
      - 5800:5800
    volumes:
      - ./config:/config
      - ./output:/output
```

Run with: `docker compose up`
