echo "O nome da máquina é $(hostname) e hoje é $(date +%A), $(date +%d-%m-%Y)" 

echo "$(date +[%H:%M:%S]) O sistema iniciou" > saida.log

ls /boot /root > sucesso.log 2> erro.log
# 2> redireciona o erro para o arquivo erro.log

ls /boot /root &> tudo.log
# &> redireciona o erro e o sucesso para o arquivo tudo.log

ls /boot /root 2>&1 total.log
# 2>&1 redireciona o erro para o sucesso

cat <<FIM > arquivo.txt
Esse é um arquivo de texto
que será criado pelo script
FIM

ls /boot | grep 1025

ed arquivo.txt
# / para pesquisar
# 1,$ p para imprimir

ed -p: # Para imprimir o prompt
1,2 s/a/A/g # Substitui a por A nas linhas 1 e 2 do arquivo

sed 's/expressaoregular/cadeia/' arquivo.txt

sed 's/Campus/Unidade/' arquivo.txt # Substitui a primeira ocorrência nas linhas de Campus por Unidade
sed '1,2 s/Campus/Unidade/g' arquivo.txt # Substitui a primeira ocorrência nas linhas 1 e 2 de Campus por Unidade g para global

sed 'y/abc/ABC/' arquivo.txt # Substitui a primeira ocorrência de a por A, b por B e c por C. Os dois parâmetros devem ter o mesmo tamanho

sed '2a TEXTO' arquivo.txt # Adiciona TEXTO na linha 2
sed -i '2a TEXTO' arquivo.txt # Adiciona TEXTO na linha 2 e salva no arquivo
sed -r # Expressões regulares estendidas

sed -n '/ssh/p' arquivo.txt # Imprime as linhas que contém ssh

cut -d ':' -f3 tabela.txt | sed -n '2,$ p' # Imprime a terceira coluna da tabela.txt a partir da segunda linha

tr -s ' ' < arquivo.txt # Substitui os espaços em branco por um único espaço

paste -d ':' arquivo1.txt arquivo2.txt # Junta os arquivos com o delimitador :
paste -d ':' arquivo1.txt arquivo2.txt | sed -r 's/[[:blank:]]/:/'

expr 2 + 2 # Expressão aritmética
expr 2 \* 2 # Multiplicação
expr 2 / 2 # Divisão
expr length "string" # Tamanho da string

bc <<EOF
scale=2
2/3
EOF

echo "2/3" | bc -l

# Parâmetros
# $0 - Nome do script - $0 $1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ...
# $1 - Primeiro parâmetro
# $# - Quantidade de parâmetros
# $* - Todos os parâmetros

./param.sh script "redes de computadores" 2020 # O que está entre aspas é um único parâmetro

grep -l 0-9 * # Lista os arquivos que contém números
grep -l '[[:digit:]]' *
ls | xargs grep -l 0-9 # Lista os arquivos que contém números

xargs # transforma a entrada padrão em argumentos

ls -l | grep samuel.alencar | tr -s ' ' | cut -d ' ' -f9 | xargs rm -i # Remove os arquivos do usuário samuel.alencar

ls -l $1 2>%1 > /dev/null # Redireciona o erro para o sucesso e o sucesso para o nada
ls -l $1 &> /dev/null # Redireciona o erro e o sucesso para o nada

# Avaliação em curto-circuito
# O operador && avalia a expressão da esquerda para a direita e retorna o resultado da
# última expressão avaliada. Se todas as expressões forem avaliadas como verdadeiras, o
# resultado da última expressão é retornado. Se alguma expressão for avaliada como falsa,
# o resultado da expressão falsa é retornado e as expressões restantes não são avaliadas.
mkdir /root/atividade04 && echo "Diretório criado com sucesso!"
[ ! -d novoDir ] && mkdir novoDir

# O operador || avalia a expressão da esquerda para a direita e retorna o resultado da
# última expressão avaliada. Se alguma expressão for avaliada como verdadeira, o
# resultado da expressão verdadeira é retornado e as expressões restantes não são
# avaliadas. Se todas as expressões forem avaliadas como falsas, o resultado da última
# expressão é retornado.
mkdir /root/atividade04 || echo "Sem permissão!"

# Estruturas de repetição
# while
while [ condição ]; do
    # Comandos
done

# until
until [ condição ]; do
    # Comandos
done

# for
for variável in lista; do
    # Comandos
done

# for com seq
for variável in $(seq 1 10); do
    # Comandos
done

# for com seq e incremento
for variável in $(seq 1 2 10); do
    # Comandos
done

# for com seq e decremento
for variável in $(seq 10 -2 1); do
    # Comandos
done

# seq -10 1

# IFS - Internal Field Separator
# IFS é uma variável de ambiente que define o separador de campos. O valor padrão é
# espaço, tabulação e nova linha. O IFS é usado pelo shell para determinar como
# reconhecer palavras como argumentos quando é feita a expansão de parâmetros.
IFS=":"
for i in 1:2:3:4:5; do
    echo $i
done
###############################
OLDIFS=$IFS
IFS=":"
for i in $(cat /etc/passwd); do
    echo $i
done
IFS=$OLDIFS

w -h | cut -d ' ' -f1 | xargs # xargs deixa no formato de lista