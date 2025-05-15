#!/usr/bin/bash

source /home/cooperbousum/.profile

is_login=$1
wall_path=$(printenv WALLPAPER)

set_black() {
  swww img /home/cooperbousum/Downloads/A_black_image.jpg --transition-type wipe --transition-duration 0
}

set_wall() {
  swww img $wall_path --transition-type outer --transition-duration 2
}

if [[ $is_login = 1 ]]; then
  HYPRLOCKBG=/home/cooperbousum/Downloads/PIA23803.png
  printenv HYPRLOCKBG
else
  HYPRLOCKBG=screenshot
  printenv HYPRLOCKBG
fi

activeworkspace=$(hyprctl -j activeworkspace)
windows=$(jq -r '.windows' <<<"$activeworkspace")
if [[ $windows = 0 ]]; then
  echo "nowindows"
  set_black && pidof hyprlock || hyprlock
  set_wall
elif [[ $windows > 0 ]]; then
  echo "windows"
  pidof hyprlock || hyprlock
fi
