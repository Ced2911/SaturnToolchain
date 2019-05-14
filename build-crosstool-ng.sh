#!/bin/sh
mkdir ${WD}/src -p
cd ${WD}/crosstool-ng/
./bootstrap
./configure --enable-local
make 
./ct-ng build
