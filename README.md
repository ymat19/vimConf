### nix, home-manager setup
```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install
```

### apply
```
echo "\"$HOME\"" > home-manager/home-dir.nix
home-manager -f home-manager/home.nix switch
```

### etc
```
# enable clipboard on linux
sudo apt-get install xsel

# fix lazygit error on linux
sudo chmod a+rw /dev/tty

# add ghq base (wip)
git config --global --add ghq.root $(realpath ../)
```

### docs
https://home-manager-options.extranix.com/?query=&release=release-24.05
https://search.nixos.org/packages?channel=24.11&from=0&size=50&sort=relevance&type=packages&query=vimPlugins
