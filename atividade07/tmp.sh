#!/bin/bash

cd diretorioMonitorado
FILES=$(ls)
QTDFILES=$(ls | wc -l)
# echo $FILES
# NEWFILES=$FILES 
# echo $NEWFILES
while true 
do
    NEWQTDFILES=$(ls | wc -l)
    NEWFILES=$(ls)
    if [[ $NEWQTDFILES -gt $QTDFILES ]]; then
        diff <(echo $FILES) <(echo $NEWFILES)
        FILES=$NEWFILES
        QTDFILES=$NEWQTDFILES
    fi
done

#Remover espacos duplicados
# sed 's/  */ /g'