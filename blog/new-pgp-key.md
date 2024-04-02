# New PGP key, and new directory

Due to btrfs deciding to corrupt itself, I've lost my master keys for `02EF A1CE 3C3E 4AAD 7A86  3AB8 ED24 985C A884 CD61`. It has not been compromised (as far as I know, at least), and everything done with the old key is still valid. Although the current subkeys are valid for another 6-ish months (until 2024-10-09), I'll be moving to a new key proactively.

**My new key is `CFCF 6723 A8ED 791C 5FD2  5CB5 8589 69DC CC2E 792D`.**

This commit will be signed and pushed with the old key, `0xED24985CA884CD61`, then afterwards I will immediately be switching to the new key, `0x858969DCCC2E792D`. The old key will be removed from my YubiKey and replaced with the new one, and I will be unable to read anything encrypted to the old key.

---

There's also now a [/data/](/data/) directory, which as of the time of writing, just contains [my old key](/data/old-pubkey-02EFA1CE3C3E4AAD7A863AB8ED24985CA884CD61.asc) and [a detached signature](/data/new-pgp-key.asc) for the markdown version of this file (at commit `5e7ff5e5ad14adc21e2f0ea09d20f3598ae6901c`) signed with `0xED24985CA884CD61` saying I'm moving to `0x858969DCCC2E792D`.

**My current PGP public key will always be at [/pubkey.asc](/pubkey.asc).**

*Note*: Assuming this actually gets done on April 1st, no, this isn't an April Fools joke. If I were to do an April Fools joke, it would absolutely have a disclaimer from the second it goes up that it's an April Fools joke, but that's a rant for another time
