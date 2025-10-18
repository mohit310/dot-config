#!/bin/bash

# Notification ID to replace the previous volume notification, so they don't stack.
# '9993' is a commonly used ID for this purpose.
msgTag="9993"

# Get the default sink ID
# This is usually the first sink, or you can find the default with 'wpctl status'
#DEFAULT_SINK=$(wpctl status | grep -A 5 'Audio' | grep -m 1 '\[vol' | awk '{print $3}' | tr -d '.')

# Function to send the notification
send_notification() {
    # Get volume and mute status from the default sink
    volume_line=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
    volume_int=$(echo $volume_line | awk '{print $2 * 100}' | cut -d'.' -f1)
    
    # Check for mute status
    if echo $volume_line | grep -q MUTED; then
        icon="audio-volume-muted-symbolic"
        dunstify -a "Volume" -i $icon -r "$msgTag" \
            -h int:value:$volume_int "Volume: Muted ($volume_int%)"
    else
        # Choose icon based on volume level
        if [ "$volume_int" -eq 0 ]; then
            icon="audio-volume-off-symbolic"
        elif [ "$volume_int" -lt 33 ]; then
            icon="audio-volume-low-symbolic"
        elif [ "$volume_int" -lt 66 ]; then
            icon="audio-volume-medium-symbolic"
        else
            icon="audio-volume-high-symbolic"
        fi
        
        # Send the notification with a progress bar
        dunstify -a "Volume" -i $icon -r "$msgTag" \
            -h int:value:$volume_int "Volume: $volume_int%" \
            -t 2000
    fi
}

# Execute the volume command
case "$1" in
    up)
        # Increase volume by 5%
	wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        send_notification
        ;;
    down)
        # Decrease volume by 5%
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        send_notification
        ;;
    mute)
        # Toggle mute
	wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        send_notification
        ;;
esac
