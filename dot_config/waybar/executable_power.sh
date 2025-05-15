#!/usr/bin/bash
echo - | awk "{printf \"%.0f\", \
$((\
$(cat /sys/class/power_supply/BAT0/current_now) * \
$(cat /sys/class/power_supply/BAT0/voltage_now))) / 1000000000000 }"
#printf "%.2f" $(echo "$x + 0.05" | bc)
