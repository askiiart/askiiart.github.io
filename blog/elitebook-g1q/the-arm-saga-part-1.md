# The ARM saga: part 1

Progress update and guide

---

Turns out in the time I was looking away, 1) the Elitebook got added to the mainline kernel (somewhere in the 6.16 release candidates), and 2) Ubuntu released an updated Snapdragon Concept image - and not just that, I managed to find [new builds](https://people.canonical.com/~platform/images/ubuntu-concept/). Unfortunately, the version of Ubuntu I tested doesn't support it yet, but it's a good start.

To work around this though, you can just add in the Elitebook device tree manually (I ~~stole~~ borrowed it from the postmarketOS package `linux-postmarketos-qcom-sm7635` and copied it to the drive), then updated the grub config file:

```txt
  regexp "HP EliteBook Ultra G1q 14.*" "$system_product_name"
  if [ $? == 0 ]; then
    cmdline="clk_ignore_unused pd_ignore_unused cma=128M"
    dtb="devicetree /casper/dtbs/x1e80100-hp-elitebook-ultra-g1q.dtb"
  fi
```

I'm still gonna give Ubuntu flak for making new builds without actually changing anything meaningful, though. At this point, the mainline kernel has had better compatibility for over a month.

## What's broken

Out of some quick testing, these things were still broken:

- Wifi
- Battery level
- Audio
- Processor isn't listed in GNOME settings for whatever reason

Based off the Postmarket OS page for the [ASUS Vivobook S 15](https://wiki.postmarketos.org/wiki/ASUS_Vivobook_S_15_(asus-s5507q)), I wouldn't be surprised if video hardware encoding/decoding was broken too.

But for the most part, it's working as far as I've seen - at least, not crashing. There's certainly some errors in `journalctl`, ones that I might not report because Ubuntu's bug reporting is horrible, but it works.
