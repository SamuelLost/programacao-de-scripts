echo "O nome da máquina é $(hostname) e hoje é $(date +%A), $(date +%d-%m-%Y)" 

echo "$(date +[%H:%M:%S]) O sistema iniciou" > saida.log

!numero_do_comando_no_arquivo_history #Executa o comando da numeração do arquivo history

ln -s /home/usuario/arquivo /home/usuario/atalho #Cria um atalho para o arquivo, link simbólico ou soft link
ln /home/usuario/arquivo /home/usuario/atalho #Cria um atalho para o arquivo, link físico ou hard link

mkdir -p dir0/dir{1,2,3} #Cria os diretórios dir1, dir2 e dir3 dentro do diretório dir0

grep -c "palavra" arquivo #Conta quantas vezes a palavra aparece no arquivo
grep -i "palavra" arquivo #Procura a palavra no arquivo, ignorando maiúsculas e minúsculas
grep -l "palavra" arquivo #Lista os arquivos que contém a palavra
grep -v "palavra" arquivo #Lista as linhas que não contém a palavra
grep -o "palavra" arquivo #Lista apenas a palavra

find /home/samuel -name "a*" -type d
find /home/samuel -ctime +1 #arquivos criados a mais de um dia
find /home/samuel -name "a*" -exec cp {} dir/ \; #Copia os arquivos que começam com a letra "a" para o diretório dir

sort -k2 arquivo #Ordena o arquivo pela segunda coluna
sort -t "@" -k2 arquivo #Ordena o arquivo pela segunda coluna, considerando o "@" como separador

chmod u+x, g-x, o-x arquivo #Remove a permissão de execução para o grupo e outros e adiciona a permissão de execução para o usuário
chgrp ubuntu arquivo #Altera o grupo do arquivo para ubuntu
chmod g-w+rx, o-rwx arquivo #Remove a permissão de escrita para o grupo e adiciona a permissão de leitura e execução para o grupo e remove todas as permissões para outros

date +%H:%M:%S #Exibe a hora atual no formato HH:MM:SS
date +%d/%m/%Y #Exibe a data atual no formato DD/MM/AAAA

du -sh /home/samuel #Exibe o tamanho do diretório /home/samuel

tar -cvf site.tar /teste #Cria o arquivo site.tar com o diretório /teste (Linearização)
gzip site.tar #Compacta o arquivo site.tar
tar -czvf site.tar.gz /teste #Cria o arquivo site.tar.gz com o diretório /teste (Linearização e compactação)

tar -cjvf site.tar.bz2 /teste #Cria o arquivo site.tar.bz2 com o diretório /teste (Linearização e compactação)

tar -xjvf site.tar.bz2 #Descompacta o arquivo site.tar.bz2

sudo hostnamectl set-hostname nome_do_host #Altera o nome do host

grep -v '^$' #Remove linhas vazias

# Expressões regulares
# casa | Casa -> Alternancia
# (c|C)asas? -> Agrupamento. O precedente do ? é o 's', ele pode aparecer 0 ou 1 vez
# (1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0)*
# a* -> epsilon (vazio), a, aa...
# a+ -> a, aa, aaa...

# Expressões regulares no grep
# ^ -> Inicio da linha
# $ -> Fim da linha
# \b -> Limite de palavra
# \B -> Não é limite de palavra
# . -> Qualquer caractere
grep -E 'R$' alunos.txt #Procura as linhas que terminam com R
grep -E '^5' alunos.txt #Procura as linhas que começam com 5
grep -E -v '^5' alunos.txt #Procura as linhas que não começam com 5
grep -E '\bA' alunos.txt #Procura as linhas que começam com A
grep -E 'A\b' alunos.txt #Procura as linhas que terminam com A
grep -E '\BA' alunos.txt #Procura as linhas que não começam com A
grep -E '5.*' alunos.txt #Procura as linhas que começam com 5 e tem qualquer coisa depois
grep -E '[WZ]' alunos.txt #Procura as linhas que tem W ou Z
grep -E '(W|Z)' alunos.txt #Procura as linhas que tem W ou Z
grep -E '[^WZ]' alunos.txt #Procura as linhas que não tem W nem Z
grep -E '^[0-9]*.[ABCD]' alunos.txt #Procura as linhas que começam com qualquer número, tem qualquer coisa no meio e termina com A, B, C ou D
grep -E '^[0-9]*.[ABCD].*A$' alunos.txt #Procura as linhas que começam com qualquer número, tem qualquer coisa no meio e termina com A, B, C ou D e tem A no final

# Quantificadores
# ? | Torna a entidade opcional
grep -E 'L{2}' alunos.txt # Conta o numero de caracteres
grep -E '[0-9]{6}' alunos.txt 
grep -c -E '^5' alunos.txt
grep -E '^[[:digit:]]' alunos.txt # [:digit:] -> [0-9]

grep -E '[[:punct:]]$' olamundo.py # [:punct:] -> [.,;:?!]
grep -E '[[:alpha:]]' olamundo.py # [:alpha:] -> [a-zA-Z] -> pega acentos e cedilha

'(vice-)?(presidente|governador|prefeito)'

grep -E '([[:alpha:]])\1' olamundo.py # \1 -> pega o primeiro grupo de captura
grep -E '([[:alpha:]])Z\1' olamundo.py # \1 -> pega o primeiro grupo de captura

grep -E '^[0-9]*A' alunos.txt #Procura as linhas que começam com qualquer número, tem qualquer coisa no meio e termina com A, B, C ou D e tem A no final
grep -E '\bA' alunos.txt #Procura as linhas que começam com A
grep -E '\.br$' alunos.txt #Procura as linhas que terminam com .br
grep -E '[[:upper]][[:space:]]+[[:lower:]]+[0-9].*\@' # Procura as linhas que começam com letra maiúscula, tem um ou mais espaços, tem uma ou mais letras minúsculas, tem um ou mais números e tem um @

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

nohup ./script.sh & #Executa o script em background e não mata o processo quando o terminal é fechado
./mensagem.sh "[`date +%H:%M:%S`] Iniciando o script" >> log.txt #Redireciona a saída do script para o arquivo log.txt


# Leitura e escrita 
tput setaf 1 #Muda a cor da fonte para vermelho
tput setaf 2 #Muda a cor da fonte para verde
tput cup 10 10 #Move o cursor para a linha 10 e coluna 10

read -p "Digite seu nome: " nome #Lê o nome digitado pelo usuário
read -s -p "Digite sua senha: " senha #Lê a senha digitada pelo usuário sem mostrar na tela
read -n1 -p "Digite uma letra: " letra #Lê apenas um caractere digitado pelo usuário
read -t 5 -p "Digite seu nome: " nome #Lê o nome digitado pelo usuário em 5 segundos

printf "Olá, %s\n" $nome #Imprime o nome digitado pelo usuário

#Do processo filho pro processo pai: source ./script.sh
#Do processo pai pro processo filho: export VARIAVEL="valor"
# Mexendo na vari[avel] PATH
#mkdir python
# PATH=/home/samuel/python:$PATH    

for i in arq{A..Z}{1..5}.txt; do
    echo $i
done

vet=(1 2 3 4 5)
echo ${vet[@]}
echo ${#vet[@]}
