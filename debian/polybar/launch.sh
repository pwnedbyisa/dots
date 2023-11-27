#!/bin/bash

# plagarized directly from the polybar wiki

# Terminate already running bar instances
# ipc enabled
polybar-msg cmd quit
# Otherwise
# killall -q polybar

# Launch bar
echo "---" | tee -a /tmp/polybar.log
polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bars launched..."
