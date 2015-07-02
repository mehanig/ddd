#!/bin/sh

set -e
set -x

docker build -t mjibson/deepdream .
docker run --rm -it -v `pwd`/images:/images mjibson/deepdream 'https://www.google.com/logos/2013/zamboni-1005006-hp.jpg' 'inception_3b/5x5_reduce'
