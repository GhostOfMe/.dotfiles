function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#run "urxvtd"

#run "picom -b --config  $HOME/.config/picom/picom.sample.conf --experimental-backends"

run "redshift"
nitrogen --random "/home/user/Pictures/wallpapers/nord/" --set-auto
#setxkbmap -option grp:alt_shift_toggle us,ru
#run 'setxkbmap -option grp:alt_shift_toggle "us,ru"'
