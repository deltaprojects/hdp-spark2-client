#!/bin/bash

version=$1
if [[ ! "${version:-}" ]]; then
  echo "Need version arg"
  exit 1
fi

docker build -t deltaprojects/hdp-spark2-client .
## tag docker image with new version
docker tag deltaprojects/hdp-spark2-client deltaprojects/hdp-spark2-client:$version

## push docker image to docker registry
docker push deltaprojects/hdp-spark2-client
git tag -a "hdp-spark2-client-${version}" -m "hdp-spark2-client-${version}"
git push --tags
