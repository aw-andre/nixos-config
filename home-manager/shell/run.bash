TUI=("vim" "nvim" "gemini" "lldb" "gdb")
BIN="$1"
shift

if [[ "${TUI[*]}" =~ $BIN ]]; then
	CMD="kitty -e $BIN $*"
else
	CMD="$BIN $*"
fi

$CMD &>/dev/null &
disown
