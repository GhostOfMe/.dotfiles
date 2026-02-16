#!/bin/bash

AWESOME_PATH="$HOME/.config/awesome/"
ROFI_PATH="$HOME/.config/rofi/themes/"
ALACRITTY_PATH="$HOME/.config/alacritty/"
case "$1" in
    "nord")
        rm $ALACRITTY_PATH"current_colors.toml"
        ln $ALACRITTY_PATH"nord_colors.toml" $ALACRITTY_PATH"current_colors.toml"
        
        rm $ROFI_PATH"current_colors.rasi"
        ln $ROFI_PATH"nord_colors.rasi" $ROFI_PATH"current_colors.rasi"
        
        rm $AWESOME_PATH"theme_current.lua"
        ln $AWESOME_PATH"themes/nord.lua" $AWESOME_PATH"theme_current.lua"
        echo 'awesome.restart()' | awesome-client
        ;;
    "rose_pine")
        rm $ALACRITTY_PATH"current_colors.toml"
        ln $ALACRITTY_PATH"rose_pine_colors.toml" $ALACRITTY_PATH"current_colors.toml"
        
        rm $ROFI_PATH"current_colors.rasi"
        ln $ROFI_PATH"rose_pine_colors.rasi" $ROFI_PATH"current_colors.rasi"
        
        rm $AWESOME_PATH"theme_current.lua"
        ln $AWESOME_PATH"themes/rose_pine.lua" $AWESOME_PATH"theme_current.lua"
        echo 'awesome.restart()' | awesome-client
        ;;
    *) exit 1 ;;
esac

