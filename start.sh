#!/bin/sh

set -e

# http://stackoverflow.com/a/26028597/864236
ln /dev/null /dev/raw1394

if [ -z "$1" ]
then
	echo must specify image URL
	exit 1
fi

curl $1 > /ddd/img.jpg

ipython /ddd/deepdreams.py $2
