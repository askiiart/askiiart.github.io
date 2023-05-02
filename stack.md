# My Stack

## Hardware

- CPU: Ryzen 5 3600
- Motherboard: Gigabyte B450M DS3H WIFI
- RAM: 2x 8GB DDR4-3200
- SSD: 500GB ADATA (for boot)
- HDDs: 3x 4TB Toshiba X300s (for bulk storage)
- PSU: Corsair CX450M (2015)
- UPS: CyberPower CP1500PFCLCD
- Case: Silverstone PS09 (would recommend!)
- Fans: One 80mm fan in rear (blows air out, model and details unknown), One AVC 8025 DS08025R12U in front (pulls air in)
- GPU: None

## Software

- OS: Proxmox VE 7.3.1
- Docker installed natively (not in VM or LXC container)
  - Using only docker-compose files
- ZFS is set up, the HDDs are in a RAIDZ1 pool
  - Equivalent to RAID-5
  - Speed: 2x read speed, normal write speed
  - 8TB of capacity available
  - Can lose any one drive without losing any data.

## Website

- Running on nginx in Docker
- Behind a reverse proxy via `nginx-proxy-manager`
- Written in markdown, then converted to HTML using `pandoc`
  - Script for this [here](https://git.askiiart.net/askiiart/askiiart-net/src/branch/main/md2html.py)
  - `pandoc` is one of the very few things I don't have in Docker (yet)
- [All in a git repo](https://git.askiiart.net/askiiart/askiiart-net)
