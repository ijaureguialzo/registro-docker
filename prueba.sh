#!/bin/sh

REGISTRY="${1:-registro-docker.test}"

docker login $REGISTRY

for image in alpine:latest alpine:edge alpine:3.20 alpine:3.19 alpine:3.18 alpine:3.17; do
  docker pull $image
  docker tag $image $REGISTRY/$image
  docker push $REGISTRY/$image
done
