#!/bin/sh

alias ls='ls --color'
ls 

for i in $(\ls) ; do 
    echo $i
done