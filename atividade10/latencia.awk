# Você vai desenvolver o script latencia.awk. Esse script vai receber como parâmetro o nome de um
# arquivo de texto, contendo um endereço IP por linha.
# O script deve usar o comando ping para enviar dez pacotes ICMP para cada endereço do
# arquivo, calculando o valor médio do tempo de resposta. Ao final, deve imprimir uma lista de IP
# ordenada do menor para o maior tempo médio de resposta, informando além do endereço, o
# tempo de resposta médio.
# # os IPs abaixo são fantasia.
# $ cat enderecos_ip.txt
# 8.8.8.8
# 192.168.0.1
# 54.230.57.207
# $ awk -f latencia.awk enderecos_ips.txt
# 192.168.0.1 11.1ms
# 54.230.57.207 55.4ms
# 8.8.8.8 94.0ms

#!/usr/bin/awk -f
{
    IPS[NR] = $0
}

END {
    for (ip in IPS) {
        "ping -f -c 10 " IPS[ip] " | tail -n 1 | cut -d '/' -f 5" | getline time
        print IPS[ip], time "ms" | "sort -n -k2"
    }
}

