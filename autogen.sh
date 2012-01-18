#!/bin/sh
# Run this to generate all the initial makefiles, etc.

autoreconf --force \
    --install \
    -Wall,error \
    --include=./.autocrap

./configure
