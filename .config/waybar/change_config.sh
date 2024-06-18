#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <folder>"
    exit 1
fi

ln -sf $1/config.jsonc ./config.jsonc
ln -sf $1/style.css ./style.css

killall waybar && nohup waybar 1>/dev/null 2>/dev/null &

