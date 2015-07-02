#!/bin/sh

set -x

# http://stackoverflow.com/a/26028597/864236
ln /dev/null /dev/raw1394

ipython /ddd/deepdreams.py