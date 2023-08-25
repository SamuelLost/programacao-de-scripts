#!/bin/bash

# Questão 1
# Considere o arquivo auth.log. Crie um arquivo logins.sh e o coloque na pasta atividades/atividade03 
# do seu computador. Nele devem existir os comandos abaixo, um por linha:
#
# a) Um comando grep que encontre todas as linhas com mensagens que não são do sshd.

case $1 in

1) 
    grep -E -v 'sshd' auth.log ;;

# b) Um comando grep que encontre todas as linhas com mensagens que indicam um login de
# sucesso via sshd cujo nome do usuário começa com a letra j.

# grep -E 'sshd.*(session opened for user).j[a-z]*' auth.log
2)
    grep -E 'sshd.*(opened for user).j+' auth.log ;;

# c) Um comando grep que encontre todas as vezes que alguém tentou 
# fazer login via root através do sshd.

3)
    grep -E 'sshd.*(Disconnect).*(root)' auth.log ;;

# d) Um comando grep que encontre todas as vezes que alguém conseguiu fazer login com
# sucesso nos dias 11 ou 12 de Outubro.

4) 
    grep -E '^Oct (11|12).*sshd.*(opened for user)' auth.log ;;

esac