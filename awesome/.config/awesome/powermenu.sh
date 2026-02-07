#!/bin/sh

chosen=$(printf "󰤂 Power Off\n Restart\n󰌾 Lock\n󰒲 Suspend\n󰍃 Log Out" | rofi -dmenu -i)

case "$chosen" in
    "󰤂 Power Off") shutdown now ;;
    " Restart") reboot ;;
    "󰌾 Lock") systemctl suspend ;;
    "󰒲 Suspend") doas systemctl suspend ;;
    "󰍃 Log Out") echo 'awesome.quit()' | awesome-client ;;
    *) exit 1 ;;
esac
