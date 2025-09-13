#!/usr/bin/bash

source /home/cooperbousum/.profile

is_login=$1
wall_path=$(printenv WALLPAPER)

set_black() {
  swww img /home/cooperbousum/.config/utilfiles/A_black_image.jpg --transition-type wipe --transition-duration 0
}

#set_wall() {
#
#}

if [[ $is_login = 1 ]]; then
  HYPRLOCKBG=/home/cooperbousum/.config/utilfiles/10-14-Day-Thumb.jpg
  printenv HYPRLOCKBG
else
  HYPRLOCKBG=screenshot
  printenv HYPRLOCKBG
fi

activeworkspace=$(hyprctl -j activeworkspace)
windows=$(jq -r '.windows' <<<"$activeworkspace")
if [[ $windows = 0 ]]; then
  echo "nowindows"
  pidof hyprlock || hyprlock
  #set_wall
elif [[ $windows > 0 ]]; then
  echo "windows"
  pidof hyprlock || hyprlock
fi
