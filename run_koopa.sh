#!/usr/bin/env bash
./build/compiler -koopa hello.c -o hello.koopa
koopac hello.koopa | llc --filetype=obj -o hello.o
clang hello.o -L$CDE_LIBRARY_PATH/native -lsysy -o hello
./hello
echo $?
