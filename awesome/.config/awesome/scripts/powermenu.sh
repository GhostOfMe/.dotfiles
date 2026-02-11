#!/bin/sh

chosen=$(printf "󰤂 Power Off\n Restart\n Suspend (no sudo)\n Suspend\n Log Out" | rofi -dmenu -i)

case "$chosen" in
    "󰤂 Power Off") shutdown now ;;
    " Restart") reboot ;;
    " Suspend (no sudo)") systemctl suspend ;;
    " Suspend") doas systemctl suspend ;;
    " Log Out") echo 'awesome.quit()' | awesome-client ;;
    *) exit 1 ;;
esac
