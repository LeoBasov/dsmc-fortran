#!/bin/bash

find . -regex '.*\.\(f90\)' -exec  fprettify {} \;
mkdir build
cd build/
cmake ../
make
