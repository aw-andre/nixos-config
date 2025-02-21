rebuild () (
  set -eK
  pushd ~/files/nixos-config/ &> /dev/null
  git add .
  sudo nixos-rebuild switch --flake .#andreaw --show-trace
  gen=$(nixos-rebuild list-generations | grep current)
  git commit -am "$gen"
  popd &> /dev/null
)

run () {
  "$@" &> /dev/null &
  disown
}

cd ~/files
