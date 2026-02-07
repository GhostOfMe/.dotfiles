#!/usr/bin/env bash

if ! pgrep cava ;
  then
    awesome-client 'awful=require("awful");
        awful.spawn("alacritty --class tui-player --option window.position.x=680 window.position.y=32 window.dimensions.columns=72 window.dimensions.lines=8 -e cava")'
  fi

if ! pgrep cmus ;
  then
    awesome-client 'awful=require("awful");
        awful.spawn("alacritty --class tui-player --option window.position.x=680 window.position.y=200 window.dimensions.columns=72 window.dimensions.lines=30 -e cmus")'
  fi
