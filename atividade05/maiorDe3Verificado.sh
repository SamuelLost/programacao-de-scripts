#!/bin/bash

# Faça um script chamado maiorDe3Veri cado.sh que receba três números como parâmetros e
# retorne o maior. Não pode utilizar o comando sort. Esse script tem que reclamar caso um dos
# parâmetros não seja número. Por exemplo:
# $ ./maiorDe3Verificado.sh 4 6 5
# 6
# $ ./maiorDe3Verificado.sh casa 10 11
# Opa!!! casa não é número.

if [ $# -ne 3 ]; then
    echo "Número de parâmetros inválido"
    echo "Uso: $0 <número> <número> <número>"
    exit 1
fi

# expr $1 + 0 > /dev/null 2>&1 # 2>&1 redireciona o erro para o sucesso


if [ ! expr $1 + 0 &> /dev/null ]; then # &> /dev/null redireciona o erro para o nada e o sucesso para o nada
    echo "Opa!!! $1 não é número."
    exit 1
fi

if [ ! expr $2 + 0 &> /dev/null ]; then
    echo "Opa!!! $2 não é número."
    exit 1
fi

if [ ! expr $3 + 0 &> /dev/null ]; then
    echo "Opa!!! $3 não é número."
    exit 1
fi

if [ $1 -gt $2 ] && [ $1 -gt $3 ]; then
    echo $1
elif [ $2 -gt $1 ] && [ $2 -gt $3 ]; then
    echo $2
else
    echo $3
fi

exit 0