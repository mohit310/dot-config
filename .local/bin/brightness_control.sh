#!/bin/bash

# Configuration
# ----------------------------------------------------------------------
# Brightness control device. Run 'brightnessctl info' to find your device name.
DEVICE="amdgpu_bl0"
# Step size for brightness change (in percentage)
STEP="5%"
# Unique ID to replace the previous notification instantly
MSG_ID="991002"
# Notification timeout in milliseconds (e.g., 2000ms = 2 seconds)
TIMEOUT="2000"

# --- Function to send the notification ---
send_notification() {
    # Get the current brightness value as a percentage
    BRIGHTNESS=$(brightnessctl -d "$DEVICE" -m | cut -d',' -f4 | tr -d '%')
    
    # Set the icon based on the brightness level
    if [ "$BRIGHTNESS" -eq 0 ]; then
        ICON="display-brightness-off-symbolic"
    elif [ "$BRIGHTNESS" -lt 33 ]; then
        ICON="display-brightness-low-symbolic"
    elif [ "$BRIGHTNESS" -lt 66 ]; then
        ICON="display-brightness-medium-symbolic"
    else
        ICON="display-brightness-high-symbolic"
    fi

    # Send the notification with a progress hint
    dunstify -a "BrightnessControl" \
        -r "$MSG_ID" \
        -t "$TIMEOUT" \
        -i "$ICON" \
        "Display Brightness" \
        "Current Level: $BRIGHTNESS%" \
        -h int:value:"$BRIGHTNESS"
}

# --- Main logic to handle arguments ---
case $1 in
    up)
        # Increase brightness by the configured step (e.g., +5%)
        brightnessctl -d "$DEVICE" set "+$STEP"
        send_notification
        ;;
    down)
        # Decrease brightness by the configured step (e.g., 5%-)
        # We use a trailing minus sign to ensure the lowest value is honored
        brightnessctl -d "$DEVICE" set "$STEP"-
        send_notification
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac
