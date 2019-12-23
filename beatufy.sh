#!/bin/bash

find . -regex '.*\.\(f90\)' -exec  fprettify {} \;
