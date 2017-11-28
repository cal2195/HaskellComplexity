#!/bin/bash

for ((i = 1; i <= $1; i++))
do
    mkdir -p cloud$i
    cd cloud$i
    use-cloudhaskell-exe worker 127.0.0.1 800$i &
    cd ..
done
