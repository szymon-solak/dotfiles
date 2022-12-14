#!/bin/bash
devices=$(bluetoothctl devices)
is_connected="Connected: yes"

while IFS= read -r device; do
	address=$(echo "$device" | cut -d ' ' -f 2)
	device_info=$(bluetoothctl info "$address")

	if [[ $device_info == *$is_connected* ]]; then 
		echo true
		exit
	fi;
done <<< "$devices"

echo false
