#!/usr/bin/bash
podman build -t zlib-ng:latest .
podman create --name zlib-ng zlib-ng:latest
# /lib
podman cp zlib-ng:/zlib-ng/libz.so.1.2.11.zlib-ng .
podman cp zlib-ng:/zlib-ng/libz.a .
rm libz.so libz.so.1
ln -s libz.so.1.2.11.zlib-ng libz.so.1
ln -s libz.so.1 libz.so
# /usr/include
podman cp zlib-ng:/zlib-ng/zconf.h .
podman cp zlib-ng:/zlib-ng/zlib.h .
# /usr/lib/pkgconfig
podman cp zlib-ng:/zlib-ng/zlib.pc .
podman rm zlib-ng
