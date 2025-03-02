set -e
pushd ~/files/nixos-config/ &> /dev/null
nix flake update nixvim
git add .
sudo nixos-rebuild switch --flake .#andreaw --show-trace
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
popd &> /dev/null
