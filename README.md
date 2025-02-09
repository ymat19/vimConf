### nix, home-manager setup
```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

### apply
```
home-manager -f home-manager/home.nix switch
```

### etc
```
sudo apt-get install xsel
```
