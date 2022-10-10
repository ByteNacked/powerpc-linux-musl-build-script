#!/bin/bash

SYSROOT=$(powerpc-linux-musl-gcc --print-sysroot)
echo "Running $0 script, SYSROOT is: '$SYSROOT'"

make -C ./libunwind-stub

export CARGO_TARGET_POWERPC_UNKNOWN_LINUX_MUSL_LINKER='powerpc-linux-musl-gcc'
export RUSTFLAGS="
    -C panic=abort
    -C linker-flavor=gcc
    -L ./libunwind-stub/
    -L${SYSROOT}/lib/
    -L${SYSROOT}/../lib/gcc/powerpc-linux-musl/11.2.1/
"
cargo b --target ./powerpc-unknown-linux-musl.json -Z build-std=panic_abort,std $@

