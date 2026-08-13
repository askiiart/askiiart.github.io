# Fixing Steam PGP for APT (FEX-Emu)

For whatever reason, after installing Steam according to FEX-Emu's instructions, its key was either outdated or missing entirely. To fix this, just grab the key from [Steam's repo](https://repo.steampowered.com/steam/archive/stable/steam.gpg).

```sh
sudo wget -O /usr/share/keyrings/steam.gpg https://repo.steampowered.com/steam/archive/stable/steam.gpg
```
