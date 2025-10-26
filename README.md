# cross-rs-arm64

ARM64-Docker images for targets:

* aarch64-unknown-linux-gnu

* x86_64-unknown-linux-gnu

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

Build cross-rs to correctly use the new images:

```
just build-cross
```
