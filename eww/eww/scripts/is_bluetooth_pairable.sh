#!/bin/bash
bluetooth_status=$(bluetoothctl show)
is_pairable="Pairable: yes"

if [[ $bluetooth_status == *$is_pairable* ]]; then 
	echo true
else 
	echo false
fi;
