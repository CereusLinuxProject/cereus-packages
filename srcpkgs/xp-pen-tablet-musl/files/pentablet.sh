#!/bin/sh
appname='pentablet'
dirname=/glibc/usr/lib/pentablet
LD_LIBRARY_PATH=$dirname/lib
export LD_LIBRARY_PATH
voidnsrun -r /glibc $dirname/$appname "$@"
