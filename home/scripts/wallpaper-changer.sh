#!/bin/bash
#
# Created by djazz // Dangershy
# Dependencies: feh
#

#
# RANDOM LOCAL IMAGE
#

FOLDER="$HOME/wallpapers"

# files=($FOLDER/*)

# selected=${files[RANDOM % ${#files[@]}]}
# echo "$selected"

#
# UNSPLASH
#

# rm ~/wallpapers/unsplash.png
# wget https://source.unsplash.com/3840x2160/?mountains,nature -O ~/wallpapers/unsplash.png
# selected="/home/amadeus/wallpapers/unsplash.png"
# wal -c # remove cached palettes (color scheme won't change otherwise)

# feh --bg-fill "$selected"

wal -i "$FOLDER"
