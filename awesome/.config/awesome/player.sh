#!/usr/bin/env bash

if ! pgrep cava ;
  then
    awesome-client 'awful=require("awful");
        awful.spawn("alacritty --class tui-player --position 680 32 --dimensions 72 8 -e cava")'
  fi

if ! pgrep cmus ;
  then
    awesome-client 'awful=require("awful");
        awful.spawn("alacritty --class tui-player --position 680 200 --dimensions 72 30 -e cmus")'
  fi
