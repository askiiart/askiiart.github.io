# The ARM saga: part 0

Part 0's gonna be really short, simple, and disorganized, just going over some things quick. Also, this is as far as I understand it, which isn't very far; I could be wrong, and if I have any corrections or anything, then this page will be updated.

## Basics

ARM laptops are different from x86 ones (duh), rather than the core system being universal and stuff just requiring different drivers, Linux on ARM requires device trees like [this](https://github.com/aarch64-laptops/build/pull/135/commits/394fae75a113093f9680eb815e683818254e1fa0). These device trees are then added to the kernel and it Just Works... except currently, the Elitebook G1q device tree isn't in the kernel, and it's not expected to be until at least 6.16.

## Ubuntu Concept

Ubuntu has a concept image available [here](https://discourse.ubuntu.com/t/ubuntu-24-10-concept-snapdragon-x-elite/48800) that supports the Elitebook G1q's sister laptop, the Omnibook X 14. When I tried it on my laptop, I had to force it to use the Omnibook X 14's device tree, which matches up with what was reported [here](https://discourse.ubuntu.com/t/ubuntu-24-10-concept-snapdragon-x-elite/48800/573). Changing the grub argument from `$dtb` to `devicetree /casper/dtbs/x1e80100-hp-omnibook-x14.dtb`[^1] (which I found by just mounting the iso) worked to get it booted. However, it would throws a bunch of weird errors and try to netboot, then after going through all that, and waiting several minutes for the DHCP fail enough times (it has no networking at all), would drop me into an initramfs busybox session? So that's definitely some improvement over nothing, and an alternate way to do stuff if needed, but not ideal.

And I couldn't find a decent way to work this in, but: it also behaved a bit strangely, both the keyboard and a USB keyboard wouldn't be recognized in Grub ~50% of the time, not sure why. I *think* they would have worked once Ubuntu was actually started, but given Grub wouldn't auto-boot, I couldn't test this.

Another side note: I also tested Fedora's ARM image, unsurprisingly it didn't work at all.

## The Plan

Currently, the plan is as follows:

1. Either figure out how to compile the dtbs, or just steal them from the Ubuntu iso.
2. Add it to the kernel? Steal Ubuntu's kernel? Not sure how exactly this goes - and cross-compile it.
3. Figure out how to package the kernel?
4. Figure out how to generate custom Fedora isos.

These *will* be done out of order, with Fedora iso generation coming first, since I've been trying to figure that out for years anyways (the docs are amazing /s).

---

[^1] Note that this seems to be mislabeled, as AFAIK both these laptops only have the X1E-78-100, not the X1E-80-100.
