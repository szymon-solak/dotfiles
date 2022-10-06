#!/bin/bash
swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.focused==true) | .name'
