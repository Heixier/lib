#!/bin/bash

HOME="${HOME:-/home/rsiah}"

XWINWRAP="$HOME/.local/bin/xwinwrap"
CVLC="/usr/bin/cvlc"
GSETTINGS="/usr/bin/gsettings"

IMAGE="shiroko.png"
IMAGE_PATH="$HOME/media/walls/static/$IMAGE"
IMAGE_DEST="$HOME/.local/share/backgrounds/$IMAGE"

ICON="shiroko_icon.gif"
ICON_PATH="$HOME/media/icons/live/$ICON"

LIVE="shiroko.mp4"
LIVE_PATH="$HOME/media/walls/live/$LIVE"

LOCK="shiroko.gif"
LOCK_PATH="$HOME/media/walls/live/$LOCK"

# Setup lock screen and profile picture
cp "$LOCK_PATH" /tmp/codam-web-greeter-user-wallpaper
cp "$ICON_PATH" /tmp/codam-web-greeter-user-avatar

# Setup wallpaper
cp "$IMAGE_PATH" "$IMAGE_DEST"
gsettings set org.gnome.desktop.background color-shading-type 'solid'
gsettings set org.gnome.desktop.background picture-options 'zoom'
gsettings set org.gnome.desktop.background picture-uri-dark "file://$IMAGE_DEST"
gsettings set org.gnome.desktop.background picture-uri "file://$IMAGE_DEST"

# Kill any vlc instances
killall vlc 2>/dev/null

# Start animation
$XWINWRAP -fs -fdt -ni -b -nf -un -o 1.0 -- $CVLC --no-video-title-show --drawable-xid WID --loop --no-audio "$LIVE_PATH" >/dev/null 2>&1 &

# Cleanup
bash ~/Core/malware/pranks/antidotes/kill_parrots.sh
pactl set-sink-mute @DEFAULT_SINK@ 1
