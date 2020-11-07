#! /usr/bin/env bash

if ! pgrep picom ; then
  picom -b --config  $HOME/.config/picom/picom.sample.conf --experimental-backends
else
  killall picom
fi
