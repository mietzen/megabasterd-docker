#!/usr/bin/env bash

set -xe

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Setup"
docker run -d --rm \
    --name megabasterd \
    --platform ${PLATFORM} \
    "${DOCKER_USER}/megabasterd:${VERSION}-${ARCH}-${BUILD_NR}"

# Install tools needed for inspect
docker exec -u 0 megabasterd apk --no-cache add net-tools procps

# Wait for container to launch jvm
sleep 10

echo "Test"
inspec exec ./test/integration -t docker://megabasterd

echo "Teardown"
docker container stop megabasterd
