# Nesta questão, você deve desenvolver uma agenda em um script chamado agenda.sh que
# gerencie nomes e e-mails em um arquivo de texto. Esse arquivo de texto deve ser
# chamado agenda.db e tem o seguinte formato:
# João Marcelo:joao.marcelo@ufc.br
# Jeandro Bezerra:jeandro@ufc.br
# Alisson Barbosa:alisson.uece@gmail.com
# Michel Sales: michelsb@gmail.com
# O script agenda.sh deve suportar três operações: adicionar, remover, listar. A operação, os nomes
# e e-mails devem ser passados por parâmetros. Além disso, o script deve avisar quando o
# arquivo agenda.db for criado pela primeira vez. Abaixo, um exemplo da execução:

# $ ./agenda.sh listar
# Arquivo vazio!!!
# $ ./agenda.sh adicionar "João Marcelo" "joao.marcelo@ufc.br"
# Arquivo criado!!!
# Usuário João Marcelo adicionado.
# $ ./agenda.sh adicionar "Jeandro Bezerra" "jeandro@ufc.br"
# Usuário Jeandro Bezerra adicionado.
# $ ./agenda.sh adicionar "Michel Sales" "michelsb@gmail.com"
# Usuário Michel Sales adicionado.
# ./agenda.sh listar
# João Marcelo:joao.marcelo@ufc.br
# Jeandro Bezerra:jeandro@ufc.br
# Michel Sales: michelsb@gmail.com
# ./agenda.sh remover joao.marcelo@ufc.br
# Usuário João Marcelo removido.
# ./agenda.sh listar
# Jeandro Bezerra:jeandro@ufc.br
# Michel Sales: michelsb@gmail.com

# Em outras palavras:
# 1. Adicionar: parâmetro adicionar e mais dois parâmetros, nome e e-mail.
# 2. Listar: apenas o parâmetro listar.
# 3. Remover: parâmetro remover e mais um parâmetro, e-mail.No caso da remoção de um
# usuário que não existe, o script deve apenas avisar o fato e não alterar o arquivo.
# Não precisa se preocupar em ordenar o arquivo agenda.db, a não que isso facilite sua tarefa.

# Use o comando sed para adicionar e remover linhas do arquivo. 
# Use o comando cut para separar o nome do e-mail.
# Use o comando grep -q para verificar se uma linha existe no arquivo.

case $1 in
    adicionar)
        if [ $# -ne 3 ]; then
            #echo "Número de parâmetros inválido"
            echo "Uso: $0 adicionar <nome> <email>"
            exit 1
        fi
        if [ ! -f agenda.db ]; then
            touch agenda.db
            echo "Arquivo criado!!!"
        fi
        grep -q "$2:$3" agenda.db
        if [ $? -eq 0 ]; then
            echo "Usuário já existe!!!"
            exit 1
        fi
        echo "$2:$3" >> agenda.db
        echo "Usuário $2 adicionado."
        ;;
    listar)
        if [ ! -f agenda.db ]; then
            echo "Arquivo não existe!!!"
            exit 1
        fi
        # Arquivo vazio
        if [ ! -s agenda.db ]; then
            echo "Arquivo vazio!!!"
            exit 1
        fi
        cat agenda.db
        ;;
    remover)
        if [ $# -ne 2 ]; then
            echo "Número de parâmetros inválido"
            echo "Uso: $0 remover <email>"
            exit 1
        fi
        if [ ! -f agenda.db ]; then
            echo "Arquivo não existe!!!"
            exit 1
        fi
        # Arquivo vazio
        if [ ! -s agenda.db ]; then
            echo "Arquivo vazio!!!"
            exit 1
        fi
        grep -q "$2" agenda.db
        if [ $? -ne 0 ]; then
            echo "Usuário não existe!!!"
            exit 1
        fi
        echo "Usuário $(grep "$2" agenda.db | cut -d ':' -f1) removido."
        sed -i "/$2/d" agenda.db
        ;;
    *)
        echo "Usage: $0 {adicionar|listar|remover}"
        ;;
esac