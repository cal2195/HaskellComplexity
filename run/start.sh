#!/bin/bash

for i in {1..5}
do
    mkdir -p cloud$i
    cd cloud$i
    ~/.local/bin/use-cloudhaskell-exe worker 127.0.0.1 800$i &
    cd ..
done
