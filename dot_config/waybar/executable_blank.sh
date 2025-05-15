#!/usr/bin/bash
waybar_path=$HOME/.config/waybar
prevwindows=0

set_second_conf() {
  cp $waybar_path/secondconf.jsonc $waybar_path/config.jsonc
  cp $waybar_path/secondstyle.css $waybar_path/style.css
  hyprctl keyword animation layersOut, 1, 10, easeOutQuint, slide right && killall waybar || true && hyprctl keyword animation layersIn, 1, 25, easeOutQuint, slide bottom && hyprctl dispatch exec waybar --quiet
}

set_first_conf() {
  cp $waybar_path/firstconf.jsonc $waybar_path/config.jsonc
  cp $waybar_path/firststyle.css $waybar_path/style.css
  hyprctl keyword animation layersOut, 1, 10, easeOutQuint, slide right && killall waybar || true && hyprctl keyword animation layersIn, 1, 5, easeOutQuint, slide bottom && hyprctl dispatch exec waybar --quiet
}

reload_conf() {
  activeworkspace=$(hyprctl -j activeworkspace)
  windows=$(jq -r '.windows' <<<"$activeworkspace")
  if [[ $windows = 0 ]]; then
    set_second_conf
  elif [[ $windows > 0 ]] && [[ $prevwindows = 0 ]]; then
    set_first_conf
  fi
  prevwindows=$windows
}

set_second_conf

handle() {
  case $1 in
  workspace*) reload_conf ;;
  closewindow*) reload_conf ;;
  openwindow*) reload_conf ;;
  configreloaded*) reload_conf ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
