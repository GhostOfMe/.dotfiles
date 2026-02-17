#!/bin/bash

SCRIPT_PATH="$HOME/.config/awesome/scripts/"
AWESOME_PATH="$HOME/.config/awesome/"

category_chosen=$(printf "Color Scheme\nWibar\nTransparency\nGaps (All Tags)\nGaps (Current Tag)" | rofi -dmenu -i -p "Appearance")
case "$category_chosen" in
    "Color Scheme")  
        
        scheme_chosen=$(printf "Nord\nRosé Pine" | rofi -dmenu -i -p  "Color Scheme") 
        case "$scheme_chosen" in 
            "Nord")         $SCRIPT_PATH"/change_scheme.sh" "nord" ;;
            "Rosé Pine")    $SCRIPT_PATH"/change_scheme.sh" "rose_pine" ;;
            *) exit 1 ;;
        esac
        
        ;;
    "Wibar") 
        
        wibar_chosen=$(printf "Simple\nColorful" | rofi -dmenu -i -p "Wibar")
        case "$wibar_chosen" in
            "Simple") 
                
                rm $AWESOME_PATH"wibar_current.lua"
                ln $AWESOME_PATH"appearance/wibar.lua" $AWESOME_PATH"wibar_current.lua"
                echo 'awesome.restart()' | awesome-client
                
                ;;
            "Colorful")
                
                rm $AWESOME_PATH"wibar_current.lua"
                ln $AWESOME_PATH"appearance/wibar_color.lua" $AWESOME_PATH"wibar_current.lua"
                echo 'awesome.restart()' | awesome-client
                
                ;;
        esac
        ;;
    "Transparency")  
    # TODO
    ;;
    "Gaps (All Tags)")  
        
        gaps_chosen=$(printf "0\n1\n2\n3\n4\n5\n6\n7\n8" | rofi -dmenu -i -p  "Gaps")
        if ! [[ $gaps_chosen =~ ^[0-9]+$ ]]; then exit 1 
        fi
        if [ $gaps_chosen -gt 9 ]; then exit 1
        fi
        if [ $gaps_chosen -lt 0 ]; then exit 1
        fi
        
        echo 'for _, t in pairs(require("awful").screen.focused().tags) do t.gap = '$gaps_chosen ' end'| awesome-client
        echo "return "$gaps_chosen > $AWESOME_PATH"appearance/gaps.lua"
    ;;
    "Gaps (Current Tag)")  
        
        gaps_chosen=$(printf "0\n1\n2\n3\n4\n5\n6\n7\n8" | rofi -dmenu -i -p  "Gaps")
        if ! [[ $gaps_chosen =~ ^[0-9]+$ ]]; then exit 1 
        fi
        if [ $gaps_chosen -gt 9 ]; then exit 1
        fi
        if [ $gaps_chosen -lt 0 ]; then exit 1
        fi
        
        echo 'require("awful").screen.focused().selected_tag.gap = '$gaps_chosen | awesome-client
    ;;
    *) exit 1 ;;
esac