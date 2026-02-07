function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#run "urxvtd"

#run "picom -b --config  $HOME/.config/picom/picom.sample.conf --experimental-backends"

run "redshift"
run "caffeine"

nitrogen --restore

# nitrogen --random "/home/user/Pictures/wallpapers/nord/" --set-zoom-fill
#setxkbmap -option grp:alt_shift_toggle us,ru
#run 'setxkbmap -option grp:alt_shift_toggle "us,ru"'
