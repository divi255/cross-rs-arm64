# cross-rs-arm64

ARM64-Docker images for targets:

* aarch64-unknown-linux-gnu

* x86_64-unknown-linux-gnu

* armv7-unknown-linux-gnueabihf

* arm-unknown-linux-gnueabihf (same Dockerfile/layers as armv7; Debian triplet `arm-linux-gnueabihf`. For Pi Zero / ARMv6 set `rustflags` e.g. `-C target-cpu=arm1176jzf-s`)

* armv7-unknown-linux-gnueabi / arm-unknown-linux-gnueabi (soft-float; `Dockerfile.rust.armel`, triplet `arm-linux-gnueabi`. Ubuntu 22.04 has no `:armel` multilib dev packages for gstreamer/ssl — hf image if you need those)

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
linux/arm64` for aarch64, x86_64 musl, and **arm gnueabi(hf)** so Apple
Silicon / ARM64 hosts use your local layers instead of pulling amd64):

```
just build-cross
```

If you insist on the **stock** `cross` from crates.io, rebuild the armv7 image
for amd64 instead:  
`docker build --platform linux/amd64 -t ghcr.io/cross-rs/armv7-unknown-linux-gnueabihf:main -t ghcr.io/cross-rs/arm-unknown-linux-gnueabihf:main -f Dockerfile.rust.armhf .`

Soft-float: `docker build --platform linux/arm64 -t ghcr.io/cross-rs/armv7-unknown-linux-gnueabi:main -t ghcr.io/cross-rs/arm-unknown-linux-gnueabi:main -f Dockerfile.rust.armel .`
