NUM=$(hyprctl monitors -j | jq length)

if [ $NUM -gt 1 ]; then
	hyprctl keyword monitor 'desc:Apple Computer Inc Color LCD, disable'
fi
