# cross-rs-arm64

ARM64-Docker images for targets:

* aarch64-unknown-linux-gnu

* x86_64-unknown-linux-gnu

* armv7-unknown-linux-gnueabihf (same image suits `arm-unknown-linux-gnueabihf`; triplet `arm-linux-gnueabihf`)

Contain additional packages (libssl-dev, gstreamer-dev) to facilitate
cross-compilation.

Ubuntu 22.04 LTS-based. Useful for development workstations running on
ARM64-Linux or Apple Silicon.

## How to use

Clone the repository.

Build docker images (replace the standard x86-64 cross images to use
automatically with all projects by default):

```
just build-docker
```

Build cross-rs to correctly use the new images (sets Docker `--platform
linux/arm64` for aarch64, x86_64 musl, and **armv7 / arm gnueabihf** so Apple
Silicon / ARM64 hosts use your local layers instead of pulling amd64):

```
just build-cross
```

If you insist on the **stock** `cross` from crates.io, rebuild the armv7 image
for amd64 instead:  
`docker build --platform linux/amd64 -t ghcr.io/cross-rs/armv7-unknown-linux-gnueabihf:main -f Dockerfile.rust.armhf .`
