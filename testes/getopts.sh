#!/bin/bash
while getopts "a:bc" OPTVAR
# : indica que a opção a espera um argumento
do
    echo $OPTVAR $OPTARG
done

# ./criardir.sh -d teste -n 4