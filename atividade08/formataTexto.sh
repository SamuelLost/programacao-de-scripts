#!/bin/bash

# Escreva um script chamado formataTexto.sh que recebe quatro parâmetros:
# 1. Primeiro Parâmetro: um das três opções sublinhado, negrito ou reverso.
# 2. Segundo Parâmetro: um número que representa a cor de acordo com o comando tput.
# 3. Terceiro Parâmetro: dois número s separados por vírgula.
# 4. Quarto Parâmetro: um texto a ser impresso. 

# Por exemplo:
# $ ./formataTexto.sh negrito 1 20,20 “Scripts”
# Imprime o texto na posição 20,20, na cor vermelha e em negrito

OPTION=$1
COLOR=$2
POSITION=$3
TEXT=$4

HEIGHT=$(echo $POSITION | cut -d',' -f1)
WIDTH=$(echo $POSITION | cut -d',' -f2)

case $OPTION in
    sublinhado)
        OPTION='smul'
        ;;
    negrito)
        OPTION='bold'
        ;;
    reverso)
        OPTION='smso'
        ;;
    *)
        echo "Opção inválida"
        exit 1
        ;;
esac

tput setaf $COLOR
tput $OPTION
tput cup $HIGH $WIDTH
echo "$TEXT"