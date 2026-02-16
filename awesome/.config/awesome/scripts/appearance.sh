#!/bin/sh

SCRIPT_DIRECTORY="$HOME/.config/awesome/scripts/"
category_chosen=$(printf "Color Scheme\nWibar\nTransparency\nGaps" | rofi -dmenu -i)


case "$category_chosen" in
    "Color Scheme")  
        scheme_chosen=$(printf "Nord\nRosé Pine" | rofi -dmenu -i) 
        case "$scheme_chosen" in 
            "Nord") 
                $SCRIPT_DIRECTORY"/change_scheme.sh" "nord" ;;
            "Rosé Pine") 
                $SCRIPT_DIRECTORY"/change_scheme.sh" "rose_pine" ;;
            *) exit 1 ;;
        esac
        ;;
    "Wibar")  ;;
    "Transparency")  ;;
    "Gaps")  ;;
    *) exit 1 ;;
esac