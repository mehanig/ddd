#!/bin/sh

set -e
set -x

docker build -t mjibson/deepdream .
docker run --rm -it -v `pwd`/images:/images mjibson/deepdream
