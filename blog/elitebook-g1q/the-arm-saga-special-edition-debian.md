# The ARM saga - Special Edition: Debian

Plus some context in the form of bits I hadn't gotten around to writing about.

---

## Debian yayyy

By now, support for my laptop has been added to the mainline kernel, and it *should* work on Debian forky (currently in testing). However, I found that for whatever reason (most likely the installer itself is rarely updated), the devicetree is [missing from Debian's kernel](http://http.us.debian.org/debian/dists/forky/main/installer-arm64/current/images/device-tree/qcom/). To get around this, I copied the devicetree from postmarketOS's package to the boot partition (after deleting `grubaa64.efi` to clear up some space), and then adding it to the arguments in grub with `devicetree (cd0,msdos2)/dtb/x1e80100-hp-elitebook-ultra-g1q.dtb` - although of course this means I had to rely on the boot order being set properly, as the keyboard doesn't work in grub if I use the boot menu.

After doing that, it seems to work flawlessly, aside from the lack of networking of course. For just installing Debian I'm relying on a USB ethernet adapter, but in a bit we'll get to the actual details and what I haven't gotten around to writing since the last post.

## post-install

Of course, after installing it's lacking the devicetree, so I have to add that myself. But of course, postmarketOS is now broken (previously working, article coming about that), so I can't just boot that up and fix Debian. Luckily, Ubuntu has great ARM support, so I was just able to boot into that instead.

To make this *much* easier to do with kernel updates (rather than being static), I chose to switch to systemd-boot. So I mounted the disk at `/mnt`, then mounted everything else as normal (copying the Gentoo handbook):

```sh
mount /dev/nvme0n1p3 /mnt
mount /dev/nvme0n1p2 /mnt/boot/efi
mount --types proc /proc /mnt/proc
mount --rbind /sys /mnt/sys
mount --make-rslave /mnt/sys
mount --rbind /dev /mnt/dev
mount --make-rslave /mnt/dev
mount --bind /run /mnt/run
mount --make-slave /mnt/run 
```

Then I just installed systemd-boot...

```sh
apt update
apt install systemd-boot
```

And the other part of this article that matters - configured it to actually be helpful. I set `/etc/kernel/devicetree` to `qcom/x1e80100-hp-elitebook-ultra-g1q.dtb`.

Then set `/etc/kernel/cmdline` to `root=UUID=12345678-abcd-1234-abcd-123456789abc rw clk_ignore_unused pd_ignore_unused arm64.nopauth quiet splash console=tty0`

And ran `kernel-install remove <kernel version>` and `kernel-install add <kernel version> /boot/vmlinuz` to re-add the kernel.

Note this did not go anywhere near as smoothly as this article makes it seem, this is just my best effort at amalgamating my knowledge after many failures.

But yeah, it works actually!

## The Problems

Currently, my specific laptop is not in the `firmware-qcom-soc` package, and seemingly *this specific variant* of my WiFi chip isn't supported by `firmware-atheros` either. Hence I have no graphics acceleration, nor any WiFi. To fix this, I just created [a package](https://git.askiiart.net/pkg-repo/firmware-elitebook-ultra-g1q) with a symlink fixing the GPU firmware path, and which replaces `firmware-atheros`'s firmware with [this](https://github.com/jglathe/qca-swiss-army-knife/raw/4be38939a006c76e12436636843135713112de1c/tools/scripts/ath11k/board-2.bin.zst).

```sh
sudo wget -O /etc/apt/sources.list.d/askiiart.sources https://askiiart.net/repos/debian/askiiart.sources
sudo apt install firmware-elitebook-ultra-g1q
```

This also went far, far less smoothly than this makes it seem - I had to go through 2 different tools for creates *both* the package and repo, and each one took plenty of troubleshooting. But eventually, it worked and this is the end result.

### Battery

There's also no battery sensing, but that's not a Debian-specific problem. There's just no support for it in upower yet as far as I know, and it works on neither postmarketOS, nor Ubuntu.

---

P.S. Once there's a new kernel I'll test out if that/systemd-boot is working correctly/updates properly, but as for now, yeag it seems to be good
