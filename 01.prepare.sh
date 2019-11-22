#!/bin/sh
#This instructions are based on the README at following location https://github.com/ddarriba/modeltest

#download the code creating a sources directory
git clone --recursive https://github.com/ddarriba/modeltest.git sources

#compile the PTHREAD version, there are a MPI version but this does not make any sense for bosque because is machine independent
cd sources
mkdir build && cd build
cmake ..
make

#The executable is in sources/bin/modeltest-ng
#copy it on linux64 folder for linux
cd ../..
rm -rf release
mkdir release -p
cp sources/bin/modeltest-ng release
