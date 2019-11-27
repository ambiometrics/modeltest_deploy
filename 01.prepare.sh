#!/bin/sh
#This instructions are based on the README at following location https://github.com/ddarriba/modeltest
#info about windows
#https://github.com/ddarriba/modeltest/wiki/Download-and-Install
#download the code creating a sources directory
#instalar msys2 no funciono
#cmake instalar y usar -D para definir variables
#igual no funciona

rm sources -rf
git clone --recursive https://github.com/ddarriba/modeltest.git sources

#compile the PTHREAD version, there are a MPI version but this does not make any sense for bosque because is machine independent
cd sources
mkdir build && cd build
cmake \
-DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc \
-DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ \
-DCMAKE_SYSTEM_NAME=Windows \
-DCMAKE_FIND_ROOT_PATH=/usr/x86_64-w64-mingw32 \
-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY ..
make

#The executable is in sources/bin/modeltest-ng
#copy it on linux64 folder for linux
cd ../..
rm -rf release
mkdir release -p
cp sources/bin/modeltest-ng release
touch release/modeltest.unavailable
