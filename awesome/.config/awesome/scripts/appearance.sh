#!/bin/sh

SCRIPT_DIRECTORY="$HOME/.config/awesome/scripts/"
AWESOME_DIRECTORY="$HOME/.config/awesome/"
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
    "Wibar") 
        wibar_chosen=$(printf "Simple\nColorful" | rofi -dmenu -i)
        case "$wibar_chosen" in
            "Simple") 
                rm $AWESOME_DIRECTORY"wibar_current.lua"
                ln $AWESOME_DIRECTORY"appearance/wibar.lua" $AWESOME_DIRECTORY"wibar_current.lua"
                echo 'awesome.restart()' | awesome-client
                ;;
            "Colorful")
                rm $AWESOME_DIRECTORY"wibar_current.lua"
                ln $AWESOME_DIRECTORY"appearance/wibar_color.lua" $AWESOME_DIRECTORY"wibar_current.lua"
                echo 'awesome.restart()' | awesome-client
                ;;
        esac
        ;;
    "Transparency")  
    # TODO
    ;;
    "Gaps")  
    # TODO
    ;;
    *) exit 1 ;;
esac