#!/bin/bash

AWESOME_PATH="$HOME/.config/awesome/"
ROFI_PATH="$HOME/.config/rofi/themes/"
ALACRITTY_PATH="$HOME/.config/alacritty/"
GTK_PATH="$HOME/.config/gtk-3.0/settings.ini"

case "$1" in
    "nord")

        GTK_NEW="gtk-theme-name=Nordic" 
        GTK_ICONS_NEW="gtk-icon-theme-name=Nordzy"
            
        ALACRITTY_NEW=$ALACRITTY_PATH"nord_colors.toml"
        
        ROFI_NEW=$ROFI_PATH"nord_colors.rasi"
        
        AWESOME_NEW=$AWESOME_PATH"themes/nord.lua"
    
        ;;
    "rose_pine")

        GTK_NEW="gtk-theme-name=rose-pine-gtk"
        GTK_ICONS_NEW="gtk-icon-theme-name=rose-pine-icons"
        
        ALACRITTY_NEW=$ALACRITTY_PATH"rose_pine_colors.toml"
        
        ROFI_NEW=$ROFI_PATH"rose_pine_colors.rasi"
        
        AWESOME_NEW=$AWESOME_PATH"themes/rose_pine.lua"
        
        ;;
    *) exit 1 ;;    
esac

sed -i "s/.*gtk-theme-name.*/$GTK_NEW/" $GTK_PATH
sed -i "s/.*gtk-icon-theme-name.*/$GTK_ICONS_NEW/" $GTK_PATH

rm $ALACRITTY_PATH"current_colors.toml"
ln $ALACRITTY_NEW $ALACRITTY_PATH"current_colors.toml"

rm $ROFI_PATH"current_colors.rasi"
ln $ROFI_NEW $ROFI_PATH"current_colors.rasi"

rm $AWESOME_PATH"theme_current.lua"
ln $AWESOME_NEW $AWESOME_PATH"theme_current.lua"

echo 'awesome.restart()' | awesome-client


