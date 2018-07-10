#!/bin/sh

echo Will generate a galery

for filename in /Data/*.txt; do
    for ((i=0; i<=3; i++)); do
        echo $filename is cool
    done
done