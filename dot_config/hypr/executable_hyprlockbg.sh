#!/usr/bin/bash

is_login=$1
if [[ $is_login -eq 0 ]]; then
  printenv WALLPAPER
else
  echo "screenshot"
fi
