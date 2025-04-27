#!/bin/bash

HOME="${HOME:-/home/rsiah}"

IMAGE="shiroko.png"
IMAGE_PATH="$HOME/media/walls/static/$IMAGE"

LIVE="shiroko.mp4"
LIVE_PATH="$HOME/media/walls/live/$LIVE"

LOCK="shiroko.gif"
LOCK_PATH="$HOME/media/walls/live/$LOCK"

XWINWRAP="$HOME/.local/bin/xwinwrap"
CVLC="/usr/bin/cvlc"

# Setup wallpapers
cp "$LOCK_PATH" /tmp/codam-web-greeter-user-wallpaper
cp "$IMAGE_PATH" $HOME/.local/share/backgrounds/"$IMAGE"

$XWINWRAP -fs -fdt -ni -b -nf -un -o 1.0 -- $CVLC --no-video-title-show --drawable-xid WID --loop --no-audio "$LIVE_PATH"

# Cleanup
bash ~/Core/malware/pranks/antidotes/kill_parrots.sh
pactl set-sink-mute @DEFAULT_SINK@ 1
