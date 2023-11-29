#!/bin/bash

server="https://ntfy.sh/1lFkAWnlHjK2SMMA"
previous_notifications=""
notification_check_interval=5
battery_check_interval=300

while true; do
    current_notifications=$(termux-notification-list | grep -E "title|content" | sed -E 's/"title": "(.*)",/"\1 :/;N;s/"content": "(.*)",/"\1"\n/;s/"//g')

    if [ "$previous_notifications" != "$current_notifications" ]; then
        curl -H "X-Title: New Notification" -d "$current_notifications" "$server"
        # You can perform any desired actions with the new notifications here
    fi

    previous_notifications="$current_notifications"

    battery_level=$(termux-battery-status | grep -oP '(?<="percentage": )\d+')
    if [[ $battery_level -le 5 ]]; then
        curl -H "X-Title: Mobile Battery is Low" -d "Battery level is ${battery_level}%!" $server
        sleep $battery_check_interval
    elif [[ $battery_level -le 10  ]]; then
        curl -H "X-Title: Mobile Battery is Low" -d "Battery level is ${battery_level}%!" $server
        sleep $battery_check_interval
    elif [[ $battery_level -le 15 ]]; then
        curl -H "X-Title: Mobile Battery is Low" -d "Battery level is ${battery_level}%!" $server
        sleep $battery_check_interval
    elif [[ $battery_level -ge 98 ]]; then
        curl -H "X-Title: Mobile Battery is Full!" -d "Battery level is ${battery_level}%!" $server
        sleep $battery_check_interval
    else
        sleep $notification_check_interval
    fi
done
#!/bin/bash

server="https://ntfy.sh/1lFkAWnlHjK2SMMA"
previous_notifications=""
notification_check_interval=5
battery_check_interval=300

while true; do
    current_notifications=$(termux-notification-list | grep -E "title|content" | sed -E 's/"title": "(.*)",/"\1 :/;N;s/"content": "(.*)",/"\1"\n/;s/"//g')

    if [ "$previous_notifications" != "$current_notifications" ]; then
        curl -H "X-Title: New Notification" -d "$current_notifications" "$server"
        # You can perform any desired actions with the new notifications here
    fi

    previous_notifications="$current_notifications"

    battery_level=$(termux-battery-status | grep -oP '(?<="percentage": )\d+')
    if [[ $battery_level -le 5 ]]; then
        curl -H "X-Title: Mobile Battery is Low" -d "Battery level is ${battery_level}%!" $server
        sleep $battery_check_interval
    elif [[ $battery_level -le 10  ]]; then
        curl -H "X-Title: Mobile Battery is Low" -d "Battery level is ${battery_level}%!" $server
        sleep $battery_check_interval
    elif [[ $battery_level -le 15 ]]; then
        curl -H "X-Title: Mobile Battery is Low" -d "Battery level is ${battery_level}%!" $server
        sleep $battery_check_interval
    elif [[ $battery_level -ge 98 ]]; then
        curl -H "X-Title: Mobile Battery is Full!" -d "Battery level is ${battery_level}%!" $server
        sleep $battery_check_interval
    else
        sleep $notification_check_interval
    fi
done

