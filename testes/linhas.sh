#!/bin/bash

DIR=$1
touch temp

for arq in $(ls $DIR)
do
    echo "$(wc -l $DIR/$arq | cut -f1 -d ' ') $arq" >> temp
done 
sort -n temp
rm temp