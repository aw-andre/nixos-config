TUI=("vim" "nvim" "gemini" "lldb" "gdb")
ARGS=()

while [[ $# -gt 0 ]]; do
	case "$1" in
	-w)
		if [[ ! "$2" =~ ^[0-9]$ ]]; then
			echo "Must pass a digit!"
			exit 1
		fi

		WINDOW="$2"
		shift 2
		;;
	*)
		ARGS+=("$1")
		shift
		;;
	esac
done

set -- "${ARGS[@]}"

BIN="$1"
shift

if [[ "${TUI[*]}" =~ $BIN ]]; then
	CMD="kitty -e $BIN $*"
else
	CMD="$BIN $*"
fi

$CMD &>/dev/null &
PID=$!
disown

if [[ -v WINDOW ]]; then
	until hyprctl clients -j | jq -e ".[] | select(.pid == $PID)" &>/dev/null; do
		sleep 0.1
	done

	hyprctl dispatch movetoworkspacesilent "$WINDOW",pid:"$PID" &>/dev/null
fi
