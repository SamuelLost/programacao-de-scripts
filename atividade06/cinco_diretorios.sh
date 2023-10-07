#!/bin/bash

#Nesta questão, o nome do script será cinco_diretorios.sh. Ao ser executado, o script deve realizar
#as seguintes tarefas:
#1. Criar um diretório chamado cinco.
#2. Criar cinco subdiretórios cinco/dir1 até cinco/dir5.
#3. Em cada subdiretório, faça quatro arquivos, arq1.txt até arq4.txt:
    #1. O arquivo arq1.txt deve ter uma linha contendo apenas o dígito 1.
    #2. O arquivo arq2.txt deve ter duas linhas, cada uma contendo o dígito 2.
    #3. O arquivo arq3.txt deve ter três linhas, cada uma contendo o dígito 3.
    #4. O arquivo arq4.txt deve ter quatro linhas, cada uma contendo o dígito 4.

#Você não pode repetir chamadas ao mkdir 6 vezes e executar 20 comandos um atrás do
#outro para criar os 20 arquivos. Você deve obrigatoriamente utilizar laços aninhados para criar a
#estrutura.
if [ $# -ne 0 ]; then
    echo "Uso: $0"
    exit 1
fi

if [ -d cinco ]; then
    rm -r cinco
fi

mkdir cinco
cd cinco
for i in $(seq 1 5); do
    mkdir dir$i
    cd dir$i
    for j in $(seq 1 4); do
        for k in $(seq 1 $j); do
            echo $j >> arq$j.txt
        done
    done
    cd ..
done
cd ..
# tree cinco
# rm -r cinco