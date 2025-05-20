#!/usr/bin/env bash
# 
# This script is for transforming image to tiles. 
# Currently the app assumes the image size is 1024x1024. 
# If a different size is preferred, 
# update `width` and `height` variables in `src/main.js`
#
# Example: 
# ./transform.sh images/treasure-map.jpg 0-3
#


check_arg() {
  local arg_value="$1"
  local arg_name="$2" # For better error messages, pass the expected name

  if [ -z "$arg_value" ]; then
    echo "Error: Missing required argument: '$arg_name'" >&2
    exit 1
  fi
}

# Check for the first argument ($1)
check_arg "$1" "<path to image>"

# Check for the second argument ($2)
check_arg "$2" "<zoom range (ex. 0-3)>"

rm -rf public/map
export GDAL_ALLOW_LARGE_LIBJPEG_MEM_ALLOC=1
gdal2tiles.py --xyz -p raster -z 0-3 -w leaflet $1 public/map/

