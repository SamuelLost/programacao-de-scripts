#!/bin/bash

DIRETORIO=
QT=

while getopts "d:n:" OPTVAR
do
    case ${OPTVAR} in
        d) DIRETORIO=$OPTARG ;;
        n) QT=$OPTARG ;;
    esac
done

[ -d ${DIRETORIO} ] || mkdir ${DIRETORIO}

for i in `seq 1 ${QT}`
do
    touch ${DIRETORIO}/arq${i}.txt
done