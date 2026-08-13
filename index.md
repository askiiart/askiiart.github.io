# askiiart's site

Just some random nerd that does tech stuff

- [Forgejo](https://git.askiiart.net/askiiart) (previously my main git thing, but after much downtime a lot of my stuff is now on github)
- [GitHub](https://github.com/askiiart) (most stuff on forgejo is mirrored here)

## Site Links

- [Package repositories](/repos/) - just some repos, mostly focused on Fedora just because that's what I daily drive currently.
  - Supported by (mainly) CI running updates, see [here](https://git.askiiart.net/pkg-repo)

## Pages

- This page
- [Blog](/blog/)
  - [Marlin Boot Animations](/blog/marlin-boot-animations.html) - Make your Marlin boot screen animated! Includes animation formatting documentation.
  - [300](/blog/300.html) - Figuring out 300 Multiple Choices
  - [The ARM/Elitebook G1q Saga](/blog/elitebook-g1q/) - I got an ARM laptop, and it's not in the kernel yet (it's barely supported at all).
    - [Part 0](/blog/elitebook-g1q/the-arm-saga-part-0.html)
    - [Part 1](/blog/elitebook-g1q/the-arm-saga-part-1.html) - it boots!
    - [Special Edition - Debian](/blog/elitebook-g1q/the-arm-saga-special-edition-debian.html) - it works *properly*, on Debian (forky)! (after some tweaks)
- [TIL](/til/) - Just little tidbits I learn, inspired by [Simon Willison's TIL](https://til.simonwillison.net/), which was itself inspired by [jbranchaud/til](https://github.com/jbranchaud/til).
  - [Using JSON with docker compose](/til/using-json-with-docker-compose.html) - Exactly what it sounds like.
  - [Akkoma in Docker](/til/akkoma-in-docker.html) - uh I figured out how to do Akkoma in Docker cuz it doesn't quite match the docs sometimes.
  - [Fixing Steam PGP for APT (FEX-Emu)](/til/apt-fixing-steam-pgp.md) - FEX-Emu's Steam instructions are a bit broken

## Projects

### Hardware

- [The Claw PNP](https://github.com/askiiart/the-claw-pnp) - A pick-and-place head for Openbuilds 2020 gantry plates, or the Ender-3 (and its variants). Theoretically capable of automatically assembling 0201s.
- [Guilty Devboard Xrd](https://github.com/askiiart/guilty-devboard-xrd) - a XIAO-like nRF54LM20A devboard, something of a middle ground between the XIAO nRF52840 Plus and XIAO nRF54LM20A - [**docs**](/docs/guilty-devboard-xrd.html)
- [Guilty Pad XX Λ Core Plus Yuri](https://github.com/askiiart/guilty-pad-xx-accent-core-plus-yuri) - A TKL keyboard with a screen and a knob, do whatever you want with it. Mostly done, but being reworked for the devboard.
  - This was the intended use case of Guilty Devboard Xrd, but I couldn't get enough pins while using the QFN package, and due to limited manufacturing capabilities (nRF54LM20A is not available for PCBA) BGA packages weren't an option.
- [GUILTY PAD -GAY-](https://github.com/askiiart/guilty-pad-gay) - a poorly named, very gay macro pad. Nothing particularly interesting here, but can be used with ZMK for extra functionality when paired with the full-size keyboard. Design is done.
- [Thrustmaster FGT translator](https://github.com/askiiart/thrustmaster-ferrari-challenge-wheel-translator) - An extremely basic devboard that can be used to adjust pedals for the Thrustmaster FGT wheel and its variants.

### Software

- [torznab-toolkit](https://github.com/askiiart/torznab-toolkit) - A library for creating Torznab APIs. Just provide the search functions, and Torznab will handle the API for you.
  - This is somewhat opinionated - Torznab is not a formal spec, rather a jumbled together mess of different people adapting the Newznab spec to fit torrents, with even attempts at a proper spec being incomplete - so the toolkit fills in some of the gaps where there's ambiguous or nonsense behavior. Fortunately for this library, Torznab clients have to be pretty tolerant of issues anyways, as very popular implementations of the Torznab API are very incomplete.
- [Cat2Text-rs](https://github.com/askiiart/cat2text-rs) - An extended port of [Cat2Text](https://github.com/askiiart/Cat2Text) (which encodes English text as cat noises) to Rust. Adds tons of functionality as well as better documentation and the ability to be used as a library, not just a binary.
- [better-commands-rs](https://github.com/askiiart/better-commands-rs) - A little helper crate for running commands via Rust. Can provide timestamps and which stream a line was printed to, as well as running code in real-time as the command runs.
- [This site runs on a textbook](https://textbook.askiiart.net/) - A site that, at one point, ran on a digital textbook. Disclaimer: no longer runs on that. Also, some of the details at the end are very out of date, it's been a while since I touched this.
