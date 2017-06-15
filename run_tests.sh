#!/bin/bash
set -e

pushd $(dirname "$0")

IMAGES=("centos:6" "centos:7" "ubuntu:14.04" "ubuntu:16.04" "ubuntu:16.10" "alpine:3.4" "alpine")

for IMAGE in "${IMAGES[@]}"; do
    echo "Run for $IMAGE"
    sed "s/%IMAGE%/$IMAGE/" test/Dockerfile.template > test/Dockerfile
    docker build -t test-standard-users -f test/Dockerfile .
    docker rmi test-standard-users
done

rm -f test/Dockerfile

popd
