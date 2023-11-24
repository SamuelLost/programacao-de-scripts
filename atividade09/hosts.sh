# Vamos criar um script chamado hosts.sh que nos ajude a relacionar nomes de máquinas à IPs.
# 1. O script deve guardar em um arquivo chamado hosts.db um par (nomedamaquina,IP) para
# cada entrada.
# 2. Você deve criar as seguintes funções para manipular o arquivo que são invocadas com os
# parâmetros indicados:
#   1. adicionar (parâmetros -a hostname -i IP)
#   2. remover (parâmetro -d hostname)
#   3. procurar (parâmetro hostname)
#   4. listar (parâmetro -l)
# As funções podem ser triviais, o objetivo é mais praticar a sintaxe de sua definição. Você precisa
# obrigatoriamente utilizar o comando getopts para tratar os parâmetros de entrada.
# Exemplo de execução do script:

# $ ./hosts.sh -a routerlab -i 192.168.0.1
# $ ./hosts.sh -a lab01 -i 192.168.0.100
# $ ./hosts.sh -a lab02 -i 192.168.0.101
# $ ./hosts.sh -l
# routerlab 192.168.0.1
# lab01 192.168.0.100
# lab02 192.168.0.101
# lab03 192.168.0.102
# $ ./hosts.sh -d routerlab
# $ ./hosts.sh -d lab01
# $ ./hosts.sh -l
# lab02 192.168.0.101
# lab03 192.168.0.102
# $ ./hosts.sh lab02
# 192.168.0.101
# $ ./hosts.sh -r 192.168.0.101
# lab02

#!/bin/bash
HOST_FILE="hosts.db"

verificar_arquivo() {
    [ -z $1 ] && { echo "Arquivo $1 não existe"; exit 1; }
    [ -s $1 ] || { echo "Arquivo $1 está vazio"; exit 1; }
}

# Função para adicionar um par (nomedamaquina,IP) para cada entrada.
adicionar() {
     # Procura o IP
    if grep -wq "$2" ${HOST_FILE}; then
        echo "IP já existe"
        exit 1
    fi
    echo "$1 $2" >> ${HOST_FILE}
}

# Função para remover um par (nomedamaquina,IP) para cada entrada.
remover() {
    verificar_arquivo ${HOST_FILE}
    if ! grep -q "$1" ${HOST_FILE}; then
        echo "O hostname $1 não existe no arquivo"
        exit 1
    else
        sed -i "/$1/d" ${HOST_FILE}
        if [ $? -eq 0 ]; then
            echo "Removido com sucesso"
        else
            echo "Não foi possível remover"
        fi
    fi
}

# Função para procurar um par (nomedamaquina,IP) para cada entrada.
procurar() {
    # verificar_arquivo ${HOST_FILE}
    [ -z ${HOST_FILE} ] && { echo "Arquivo $1 não existe"; exit 1; }
    case $1 in
        r)
            grep -w "$2" ${HOST_FILE} | cut -d " " -f 1
            ;;
        *)
            grep -w "$1" ${HOST_FILE} | cut -d " " -f 2
            ;;
    esac
}

# Função para listar um par (nomedamaquina,IP) para cada entrada.
listar() {
    verificar_arquivo hosts.db
    cat ${HOST_FILE}
    exit 0
}

IP=
HOSTNAME=

# Tratamento de parâmetros
while getopts "a:i:d:r:l" opt; do
    case $opt in
        a)
            HOSTNAME=$OPTARG
            ;;
        i)
            IP=$OPTARG
            adicionar $HOSTNAME $IP
            ;;
        d)
            remover $OPTARG
            ;;
        l)
            listar
            ;;
        r)
            procurar "${opt}" "${OPTARG}"
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            ;;
    esac
done

shift $((OPTIND-1)) # Remove os parâmetros já tratados
if [ $1 ]; then
    procurar $1
fi