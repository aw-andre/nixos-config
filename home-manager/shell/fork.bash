TUI=("vim" "nvim" "gemini" "lldb" "gdb")
ARGS=()

# Read options
if [[ "$1" == "-w" ]]; then
	if [[ ! "$2" =~ ^[0-9]$ ]]; then
		echo "Must pass a digit!"
		exit 1
	fi

	WINDOW="$2"
	shift 2
fi

ARGS+=("$@")
BIN="${ARGS[0]}"

# Get existing windows before launch (for workspace moving)
if [[ -v WINDOW ]]; then
	EXISTING_WINDOWS=$(hyprctl clients -j | jq -r '.[].address')
fi

# Launch command
if [[ "${TUI[*]}" =~ $BIN ]]; then
	kitty -e zsh -ci "${ARGS[@]}" &>/dev/null &
else
	"${ARGS[@]}" &>/dev/null &
fi
disown

# Move to workspace if specified
if [[ -v WINDOW ]]; then
	# Wait for any new window to appear
	until NEW_WINDOW=$(hyprctl clients -j | jq -r '.[].address' | grep -v -F "$EXISTING_WINDOWS" | head -1) && [[ -n "$NEW_WINDOW" ]]; do
		sleep 0.1
	done
	hyprctl dispatch movetoworkspacesilent "$WINDOW",address:"$NEW_WINDOW" &>/dev/null
fi
