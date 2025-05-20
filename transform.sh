#!/usr/bin/env bash

# get the tool
test ! -f gdal2tiles.py \
  && curl https://raw.githubusercontent.com/commenthol/gdal2tiles-leaflet/master/gdal2tiles.py \
  > gdal2tiles.py \
  && echo "'python-gdal' library required - please install"


# The following script produces invalid tiles on leaflet
# gdal2tiles.py -p raster -z 0-3 -w leaflet treasure-map.jpg output/

rm -rf public/map
export GDAL_ALLOW_LARGE_LIBJPEG_MEM_ALLOC=1
python ./gdal2tiles.py -l -p raster -z 0-3 -w none images/treasure-map.jpg public/map

