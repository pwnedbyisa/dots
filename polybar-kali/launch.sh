#!/bin/bash

# plagarized directly from the polybar wiki
# since i'm not using a WM this is launched on start with xfce through the applications menu in settings

# Terminate already running bar instances
# ipc enabled
polybar-msg cmd quit
# Otherwise
# killall -q polybar

# Launch bar
echo "---" | tee -a /tmp/polybar.log
polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bars launched..."
