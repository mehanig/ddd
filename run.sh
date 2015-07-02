#!/bin/sh

set -e
set -x

docker build -t ddd .
docker run --rm -it -v `pwd`/images:/images ddd
