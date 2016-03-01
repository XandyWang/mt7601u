#!/bin/sh
mv /usr/bin/gcc /usr/bin/gcc.bak.ap
ln -s /usr/bin/gcc-4.8 /usr/bin/gcc
gcc --version
mv /usr/bin/g++ /usr/bin/g++.bak.ap
ln -s /usr/bin/g++-4.8 /usr/bin/g++
g++ --version

cp -v /lib/modules/$(uname -r)/build/Module.symvers src/os/linux
make clean && make all && make install
rm -rvf src/os/linux/Module.symvers
rm /usr/bin/gcc
rm /usr/bin/g++
mv /usr/bin/gcc.bak.ap /usr/bin/gcc
mv /usr/bin/g++.bak.ap /usr/bin/g++

gcc --version
g++ --version
