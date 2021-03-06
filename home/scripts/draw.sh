#!/bin/sh
#
# draw - draw terminals

b=$(bspc config border_width)
c=$(bspc config focused_border_color)

hacksaw              \
    -ns "$b" -c "$c" | {
    IFS=+x read -r w h x y

    # make the newly spawned window floating & with the right geometry
    bspc rule -a \* -o state=floating \
        rectangle="$((w - 2 * b))x$((h - 2 * b))+$x+$y"
}

alacritty &
