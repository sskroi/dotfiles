#!/bin/bash

theme=${1}
cd ${HOME}/.config/waybar/${theme}
stow .

killall waybar && nohup waybar 1>/dev/null 2>/dev/null &

