# HOW-TO: PowerPC (32bit) linux MUSL Rust build script

## Prerequsites

Download  `powerpc-unknown-linux-musl-gcc` toolchain from here - [https://musl.cc/#binaries](https://musl.cc/#binaries).
Unpack and add the installation path to PATH env variable.

```sh

powerpc-unknown-linux-musl-gcc --version

```

## Run

Run powerpc-musl-build.sh.

Also, you can pass addtional cargo options to it.

```sh

./powerpc-musl-build.sh --examples my_cool_example

```


