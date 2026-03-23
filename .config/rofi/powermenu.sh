#!/bin/bash
options=" Shutdown\n Reboot\n Suspend\n Lock\n Logout"
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power")
case "$chosen" in
    *Lock) i3lock ;;
    *Logout) i3-msg exit ;;
    *Suspend) systemctl suspend ;;
    *Reboot) systemctl reboot ;;
    *Shutdown) systemctl poweroff ;;
esac

