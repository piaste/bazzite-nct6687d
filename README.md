# Bazzite-nct6687d

# Purpose

On 2025-01-31, Bazzite [dropped](https://github.com/ublue-os/bazzite/commit/dfe2c4cc12f9263ba5a8ee0fe123f2ba1af82e59#diff-5fcdf9b4580789697d834d1456a22bcfaa236d668fc180cad4775afc36ed5914) the third party kernel module for the NCT6687-R[^1] chip, which controls fan speed and temperature on certain B550-based motherboards. The drop was based on some crashes being attributed to the module.

However, if you did not experience crashes, then dropping the module caused your fans to default back to BIOS-set noise and power levels, instead of being controlled by e.g. CoolerControl curves.

This is an *extremely* simple custom image that takes the `bazzite:stable` image and adds back the module from the official `ublue-os/akmods` repository. Nothing else. If I ever need to add anything else, I will move it to a new name.

[^1]: Confusingly, there is also an older NCT6687-D chip, which is [supported by the Linux kernel directly](https://www.spinics.net/lists/linux-hwmon/msg10143.html). Despite being called "nct6687d", the kernel module is actually for the NCT6687-R chip, which AFAIK is only present on a couple of MSI motherboards.

# Installation

Nothing special. Just do a regular rebase:

```rpm-ostree rebase ostree-image-signed:docker://ghcr.io/piaste/bazzite-nct6687d:latest```

The repo sticks with the defaults in `ublue-os/image-template` and will rebuild weekly.
