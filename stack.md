# My Stack

## Hardware

- CPU: Intel i5-12400
- Motherboard: MSI PRO B660-A
- RAM: 2x 8GB DDR4-3200
- SSD: 500GB ADATA (for cache)
- HDDs:
  - 3x 4TB Toshiba X300s (for bulk storage)
  - 1x 8TB Seagate Barracuda Compute (for parity), would not recommend due to SMR.
- PSU: Corsair RM750x
- UPS: CyberPower CP1500PFCLCD
- Case: Some obscure thing from Cybertron (now CLX Gaming)
- iGPU: Intel UHD 750

## Software

- OS: Debian 12 (Bookworm)
- Basically everything runs in Docker, may move to Podman.
- Storage: 3x 4TB, 1x 8TB parity drive, 512GB cache drive, boots off 120GB SSD.
  - Using SnapRAID + mergerfs.
  - ~12TB of storage usable.
- [PC Part Picker Link](https://pcpartpicker.com/user/Cheap_Fleet/saved/pR82kL)

## Website

- Running on nginx in Docker
- Behind Caddy as a reverse proxy
- Written in markdown, then converted to HTML using pandoc.
  - Script for this [here](https://git.askiiart.net/askiiart/askiiart-net/src/branch/main/md2html.py)
- Syntax highlighting using [`prism.js`](https://prismjs.com)
- [In a git repo](https://git.askiiart.net/askiiart/askiiart-net)

## Docker registry

- Currently just redirecting to [Docker Hub](https://hub.docker.com/u/askiiart), using the Caddy config from [here](https://httptoolkit.com/blog/docker-image-registry-facade/) ([direct link to Caddyfile](https://github.com/httptoolkit/docker-registry-facade/blob/main/Caddyfile))
- I'll probably set up a proper self-hosted registry later, but I haven't gotten to it yet. And I've only got 2.5 MBps up, so that can probably wait until Docker does something dumb.
