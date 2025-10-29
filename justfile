all:
  @echo "Select target"

build-docker: build-docker-x86_64 build-docker-aarch64

build-docker-x86_64:
  docker build -t ghcr.io/cross-rs/x86_64-unknown-linux-gnu:main -f Dockerfile.rust.x86_64 .

build-docker-aarch64:
  docker build -t ghcr.io/cross-rs/aarch64-unknown-linux-gnu:main -f Dockerfile.rust.aarch64 .

build-docker-x86_64-legacy:
  docker build -t bmauto/u20-x86_64 -f Dockerfile.rust.x86_64-u20 .

build-cross:
  [ ! -d ./cross ] && git clone https://github.com/cross-rs/cross || echo "Cross repo already exists"
  cd cross && git reset --hard
  patch -p1 -d cross < ./cross.patch
  cd cross && cargo xtask codegen && cargo build --release
  cp -f ./cross/target/release/cross ./cross/target/release/cross-util ~/.cargo/bin/

clean:
  rm -rf cross
