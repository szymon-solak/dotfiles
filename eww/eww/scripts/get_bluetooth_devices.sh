#!/bin/bash
devices=$(bluetoothctl devices | cut -d ' ' -f2)
device_info=()

for device in $devices; do
	info=$(bluetoothctl info "$device" | tail -n +2 | jq -Rs 'split("\n\t") | map(sub("\t"; "")) | map(split(": ")) | reduce .[] as $item ({}; .[$item[0]] = $item[1])')
	info_with_address=$(echo "$info" | jq --arg address "$device" '. += { "Address": $address }')
	device_info+=("$info_with_address")
done

echo "${device_info[@]}" | jq -s '[. | sort_by(.Connected) | reverse[]]'

