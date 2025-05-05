set -e
cd ~/files/configs/laptop-config
cd home-manager/nixvim && git fetch origin && git reset --hard origin/master
cd -
git add .
sudo nixos-rebuild switch --flake '.?submodules=1#andreaw' --show-trace
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
