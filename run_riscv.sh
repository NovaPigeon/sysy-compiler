#!/usr/bin/env bash
input_file=$1
intern_file=$2
output_file=$3

./build/compiler -riscv $input_file -o $intern_file
clang $intern_file -c -o tmp.o -target riscv32-unknown-linux-elf -march=rv32im -mabi=ilp32
ld.lld tmp.o -L$CDE_LIBRARY_PATH/riscv32 -lsysy -o $output_file
#qemu-riscv32-static $output_file
#echo $?

