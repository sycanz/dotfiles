#!/bin/bash

# Configuration
WIDTH=25
SCROLL_DELAY=0.2

# State
OFFSET=0
OLD_TEXT=""

while true; do
    # 1. Get player info
    player_status=$(playerctl status 2> /dev/null)
    
    if [ -z "$player_status" ]; then
        echo ""
        sleep 2
        continue
    fi

    artist=$(playerctl metadata artist 2> /dev/null)
    title=$(playerctl metadata title 2> /dev/null)
    
    # Logic for display text
    if [ -n "$artist" ] && [ -n "$title" ]; then
        RAW_TEXT="$artist - $title"
    elif [ -n "$title" ]; then
        RAW_TEXT="$title"
    else
        RAW_TEXT="Unknown"
    fi

    # 2. Handle song changes
    if [ "$RAW_TEXT" != "$OLD_TEXT" ]; then
        OFFSET=0
        OLD_TEXT="$RAW_TEXT"
    fi

    # 3. Determine Icon
    if [ "$player_status" = "Playing" ]; then
        ICON="󰐍"
    elif [ "$player_status" = "Paused" ]; then
        ICON="󰏥"
    else
        ICON="󰓛"
    fi

    # 4. Output with Scrolling Logic
    # We keep the ICON and COLOR outside the slice
    if [ ${#RAW_TEXT} -le $WIDTH ]; then
        echo "$ICON %{F#cdd6f4}$RAW_TEXT"
        sleep 1
    else
        # Add 10 spaces of padding between loops
        PADDED_TEXT="$RAW_TEXT          $RAW_TEXT"
        DISPLAY_TEXT="${PADDED_TEXT:$OFFSET:$WIDTH}"
        
        echo "$ICON %{F#cdd6f4}$DISPLAY_TEXT"
        
        # Increment offset
        OFFSET=$(( (OFFSET + 1) % (${#RAW_TEXT} + 10) ))
        sleep $SCROLL_DELAY
    fi
done
