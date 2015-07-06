A docker image for the Google Deepdream visualization:

[http://googleresearch.blogspot.ch/2015/07/deepdream-code-example-for-visualizing.html](http://googleresearch.blogspot.ch/2015/07/deepdream-code-example-for-visualizing.html)

# Usage

```
docker run --rm -v `pwd`/images:/images mjibson/deepdream URL [LAYER] [ITERATIONS] [OCTAVES] [SCALE]
```

1. Mount an `/images` volume to hold the results.
1. Pass a URL that points to a JPG.
1. Optionally pass a layer to use. Defaults to `inception_4c/output`. See the [ipython notebook](https://github.com/google/deepdream/blob/master/dream.ipynb) for more.
1. Optionally pass the number of iterations and octaves, and the scale. Defaults to 10, 4, and 1.4, respectively. See the ipython notebook for details.

## Example:

```
docker run --rm -v `pwd`/images:/images mjibson/deepdream 'https://www.google.com/logos/2013/zamboni-1005006-hp.jpg' 'inception_3b/5x5_reduce'
```
