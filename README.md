# Containerized MegaBasterd

A containerized [MegaBasterd](https://github.com/tonikelope/megabasterd) using [jlesage/docker-baseimage-gui](https://github.com/jlesage/docker-baseimage-gui).

This repo has active CI/CD, updates are fully automatically build, tested, merged and released as mutli arch image.

Supported archichectures:
- amd64
- arm64

## Docker Compose

Create a `docker-compose.yaml`:

```yaml
version: '3'
services:
  megabasterd:
    image: mietzen/megabasterd:latest
    container_name: megabasterd
    restart: unless-stopped
    ports:
      - 5800:5800
    volumes:
      - ./config:/config
      - ./output:/output
```

Run with: `docker compose up`
