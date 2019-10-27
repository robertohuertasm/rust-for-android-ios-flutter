#!/usr/bin/env bash
# building
cbindgen src/lib.rs -l c > rustylib.h
cargo lipo --release

# moving files to the ios project
inc=../ios/include
libs=../ios/libs

rm -rf ${inc} ${libs}

mkdir ${inc}
mkdir ${libs}

cp rustylib.h ${inc}
cp target/universal/release/librustylib.a ${libs}
