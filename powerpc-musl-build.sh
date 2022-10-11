#!/bin/bash

SYSROOT=$(powerpc-linux-musl-gcc --print-sysroot)
echo "Running $0 script, SYSROOT is: '$SYSROOT'"

make -C ./libunwind-stub

#    -C linker-flavor=gcc
#     -L ./libunwind-stub/

export CARGO_TARGET_POWERPC_UNKNOWN_LINUX_MUSL_LINKER='powerpc-linux-musl-ld'
export RUSTFLAGS="
    --sysroot=/home/romanm/opt/powerpc-linux-musl-cross/bin/../powerpc-linux-musl
    --cfg has_std
    -C panic=abort
    -L./libunwind-stub
    -L${SYSROOT}/../lib/gcc/powerpc-linux-musl/11.2.1
    -L${SYSROOT}/../lib/gcc
    -L${SYSROOT}/../lib/gcc/powerpc-linux-musl/11.2.1/../../../../powerpc-linux-musl/lib
    -L${SYSROOT}/../powerpc-linux-musl/lib
    -C link-args=-start-group
    -C link-args=-lgcc
    -C link-args=-lgcc_eh
    -C link-args=-lc
    -C link-args=-end-group
"
cargo b --target ./powerpc-unknown-linux-musl.json -Z build-std=panic_abort,std $@

