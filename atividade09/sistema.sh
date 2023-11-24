# O objetivo é criar um script chamado sistema.sh para permitir monitorar o desempenho de um
# servidor Linux.
# 1. Ele deve exibir um menu com opções para o usuário.
# 2. Ao digitar uma das opções, a tela deve ser limpa, um comando executado, o resultado
# exibido e o script fica esperando o usuário.
# 3. Após o usuário apertar enter retornar para o menu inicial.
# As opções devem ser, de acordo com http://techblog.netflix.com/2015/11/linux-performanceanalysis-in-60s.html:
    # 1. Tempo ligado (uptime)
    # 2. Últimas Mensagens do Kernel (dmesg $|$ tail -n 10)
    # 3. Memória Virtual (vmstat 1 10)
    # 4. Uso da CPU por núcleo (mpstat -P ALL 1 5)
    # 5. Uso da CPU por processos (pidstat 1 5)
    # 6. Uso da Memória Física (free -m)
    # 7. Sair
# Use funções para criar uma função chamada menu para exibir as opções

#!/bin/bash

menu(){
    clear
    echo "+----------------------------------------+"
    echo "|                                        |"
    echo "| 1 - Tempo ligado (uptime)              |"
    echo "| 2 - Últimas Mensagens do Kernel        |"
    echo "| 3 - Memória Virtual                    |"
    echo "| 4 - Uso da CPU por núcleo              |"
    echo "| 5 - Uso da CPU por processos           |"
    echo "| 6 - Uso da Memória Física              |"
    echo "| 7 - Sair                               |"
    echo "|                                        |"
    echo "+----------------------------------------+"

    read -p "Digite uma opção: " opcao
    case $opcao in
        1) 
            tempoLigado ;;
        2) 
            ultimasMensagens ;;
        3) 
            memoriaVirtual ;;
        4) 
            usoCpuNucleo ;;
        5) 
            usoCpuProcessos ;;
        6) 
            usoMemoriaFisica ;;
        7) 
            exit ;;
        *) 
            echo "Opção inválida" ; sleep 2 ; menu ;;
    esac
}

tempoLigado(){
    clear
    uptime
    read -p "Pressione enter para retornar..." enter
    if [ -z $enter ]; then
        menu
    fi

}

ultimasMensagens(){
    clear
    dmesg | tail -n 10
    read -p "Pressione enter para retornar..." enter
    if [ -z $enter ]; then
        menu
    fi
}

memoriaVirtual(){
    clear
    vmstat 1 10
    read -p "Pressione enter para retornar..." enter
    if [ -z $enter ]; then
        menu
    fi
}

usoCpuNucleo(){
    clear
    mpstat -P ALL 1 5
    read -p "Pressione enter para retornar..." enter
    if [ -z $enter ]; then
        menu
    fi
}

usoCpuProcessos(){
    clear
    pidstat 1 5
    read -p "Pressione enter para retornar..." enter
    if [ -z $enter ]; then
        menu
    fi
}

usoMemoriaFisica(){
    clear
    free -m
    read -p "Pressione enter para retornar..." enter
    if [ -z $enter ]; then
        menu
    fi
}

menu