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
 
nohup ./script.sh & #Executa o script em background e não mata o processo quando o terminal é fechado
./mensagem.sh "[`date +%H:%M:%S`] Iniciando o script" >> log.txt #Redireciona a saída do script para o arquivo log.txt