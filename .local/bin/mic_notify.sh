#!/bin/bash

# Configuration for the notification
MSG_ID="991001"    # Unique ID to replace the previous notification instantly
APP_NAME="MicControl"
TIMEOUT="2000"     # 2 seconds visibility (in milliseconds)

# --- 1. Toggle the mute state for the default audio source (microphone) ---
# Use wpctl to toggle the mute status of the default source
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

# --- 2. Get the new mute status and prepare the notification ---
# Get the full status line from wpctl
STATUS_LINE=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)

# Extract the volume level (removes the trailing period, e.g., 0.75)
VOLUME=$(echo "$STATUS_LINE" | awk '{print $2}' | sed 's/\.$//')

# Check if the output contains "[MUTED]" to determine the status
if echo "$STATUS_LINE" | grep -q '\[MUTED\]'; then
    # Muted state
    TITLE="Microphone Muted"
    BODY="Status: Off"
    ICON="microphone-sensitivity-low-symbolic"
else
    # Unmuted state
    TITLE="Microphone Unmuted"
    BODY="Volume: $(echo "scale=0; $VOLUME * 100" | bc | awk '{print int($1)}')%"
    ICON="microphone-sensitivity-high-symbolic"
fi

# --- 3. Send the dunstify notification ---
dunstify -a "$APP_NAME" \
    -r "$MSG_ID" \
    -t "$TIMEOUT" \
    -i "$ICON" \
    "$TITLE" \
    "$BODY"
