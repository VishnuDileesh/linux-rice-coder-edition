#!/bin/bash

source ~/.profile
WPAPER=$(ls Wallpapers/ | shuf -n 1)
feh --bg-scale ~/Wallpapers/${WPAPER}
wal -i ~/Wallpapers/${WPAPER}
