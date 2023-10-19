#!/bin/bash
# Escreva um script chamado alertaDiretorio.sh que recebe como parâmetros um valor inteiro que
# serve como intervalo de tempo em segundos e um nome que indica o caminho de um diretório.
# A cada intervalo, a quantidade de arquivos em um diretório será analisada. Caso a quantidade de
# arquivos se altere entre duas veri cações, o script deve atualizar um arquivo
# chamado dirSensors.log com as seguintes informações:
# 1. A data que a alteração foi percebida.
# 2. Quantos arquivos existiam.
# 3. Quantos existem agora.
# 4. Quais foram alterados, adicionados ou removidos.

# Na mesma pasta da atividade, crie um diretório chamado diretorioMonitorado para testar.
# Para ajudar a testar, você pode deixar seu script executando em uma sessão screen ou tmux,
# monitorando o diretório a cada 5 segundos. Exemplo de execução:
# $ ./alertaDiretorio.sh 5 diretorioMonitorado
# [25-01-2021 12:59:51] Alteração! 3->2. Removidos: notas.txt
# [25-01-2021 13:04:51] Alteração! 2->4. Adicionados: a.txt, b.txt
# [25-01-2021 13:09:51] Alteração! 4->3. Removidos: a.txt
# [25-01-2021 13:14:51] Alteração! 3->2. Removidos: b.txt

INTERVALO=$1
DIRETORIO=$2
ARQUIVO_LOG="$(pwd)/dirSensors.log"
# ARQUIVO_LOG="dirSensors.log"
# echo $ARQUIVO_LOG

if [ $# -ne 2 ]; then
    echo "usage: $0 <intervalo> <diretorio>"
    exit 1
fi

if [ ! -f "$ARQUIVO_LOG" ]; then
    touch "$ARQUIVO_LOG"
fi

cd $DIRETORIO
QTDFILES=$(ls | wc -l)
FILES=$(ls)

while true; do
    NEWQTDFILES=$(ls | wc -l)
    NEWFILES=$(ls)

    if [ $NEWQTDFILES -gt $QTDFILES ]; then
        fileAdded=""
        for file in $NEWFILES; do
            if echo $FILES | grep -v -q $file; then
                fileAdded+="${file}, "

            fi
        done
        # fileAdded=${fileAdded::-2}
        fileAdded=$(echo $fileAdded | sed 's/,$//')
        echo "[$(date +"%d-%m-%Y %H:%M:%S")] Alteração! $QTDFILES->$NEWQTDFILES. Adicionados: $fileAdded" | tee -a "$ARQUIVO_LOG"
        FILES=$NEWFILES
        QTDFILES=$NEWQTDFILES
    fi

    if [ $NEWQTDFILES -lt $QTDFILES ]; then
        fileRemoved=""
        for file in $FILES; do
            if echo $NEWFILES | grep -v -q $file; then
                fileRemoved+="${file}, "
            fi
        done
        # fileRemoved=${fileRemoved::-2}
        fileRemoved=$(echo $fileRemoved | sed 's/,$//')
        echo "[$(date +"%d-%m-%Y %H:%M:%S")] Alteração! $QTDFILES->$NEWQTDFILES. Removidos: $fileRemoved" | tee -a "$ARQUIVO_LOG"
        FILES=$NEWFILES
        QTDFILES=$NEWQTDFILES
    fi

    sleep $INTERVALO
done
