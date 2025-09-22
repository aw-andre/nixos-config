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
CMD="$(printf '%q ' "${ARGS[@]}")"

PREV=$(hyprctl activeworkspace -j | jq -r '.id')
hyprctl dispatch workspace "$WINDOW" &>/dev/null

# Launch command
if [[ "${TUI[*]}" =~ $BIN ]]; then
	kitty -e zsh -ci "eval $CMD"
else
	eval "$CMD"
fi

hyprctl dispatch workspace "$PREV" &>/dev/null
