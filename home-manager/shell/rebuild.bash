set -e
cd ~/files/nixos-config/
cd home-manager/nixvim && git reset --hard origin/master
cd -
git add .
sudo nixos-rebuild switch --flake '.?submodules=1#andreaw' --show-trace
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
popd &>/dev/null
