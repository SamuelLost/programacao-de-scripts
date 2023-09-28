#!/bin/bash

# Você vai desenvolver o script latencia.sh. Esse script vai receber como parâmetro o nome de um
# arquivo de texto, contendo um endereço IP por linha.
# O script deve usar o comando ping para enviar dez pacotes ICMP para cada endereço do
# arquivo, calculando o valor médio do tempo de resposta. Ao final, deve imprimir uma lista de IP
# ordenada do menor para o maior tempo médio de resposta, informando além do endereço, o
# tempo de resposta médio. Observação: não pode usar awk.
NUM_PACOTES=10
INTERVALO=0,2

if [ $# -ne 1 ]; then
    echo "Uso: $0 <arquivo>"
    exit 1
fi

if [ ! -f $1 ]; then
    echo "Arquivo $1 não existe"
    exit 1
fi

for ip in $(cat $1); do
    media=$(ping -i $INTERVALO -c $NUM_PACOTES $ip | tail -n 1 | cut -d '/' -f5)
    #media=$(sudo ping -f -c $NUM_PACOTES $ip | tail -n 1 | cut -d '/' -f5)
    echo "${ip} ${media}ms" >> lista_ip_media.txt
done
cat lista_ip_media.txt | sort -n -k2
rm lista_ip_media.txt 
