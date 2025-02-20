export PAGER="nvim -R"
export MANPAGER="nvim +Man!"

rebuild () (
  set -eK
  sudo nixos-rebuild switch --flake .#andreaw --show-trace
  gen=$(nixos-rebuild list-generations | grep current)
  git commit -am "$gen"
)
