#!/bin/bash

# Faça um script chamado contaPalavras.sh que recupere do usuário o nome de um arquivo de
# texto e para cada palavra do arquivo diga quantas vezes ela aparece no texto. Utilize vetores. Exemplo:
# cat arquivo.txt
# a casa que vivo é boa.
# boa casa é.
#  $ ./contaPalavras.sh
#  Informe o arquivo: arquivo.txt
#  casa: 2
#  boa: 2
#  é: 2
#  a: 1
#  que: 1
#  vivo: 1

# read -p 'Informe o arquivo: ' arquivo
arquivo=$1

palavras_arquivo=($(cat $arquivo | tr -s ' ' '\n' | tr -d '[:punct:]' | sort | uniq))

declare -A contadores

while IFS= read -r linha; do
    for palavra in $linha; do
        palavra=$(echo $palavra | tr -d '[:punct:]')
        if [[ ${palavras_arquivo[@]} =~ $palavra ]]; then
            ((contadores[$palavra]++))
        fi
    done
done < $arquivo

for count in ${!contadores[@]}; do
    echo "$count: ${contadores[$count]}"
done | sort -t':' -k2nr