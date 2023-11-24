# Considere um arquivo notas.txt com o seguinte conteúdo:
# Aluno:Nota1:Nota2:Nota3
# João Marcelo:10.0:10.0:10.0
# Alisson Barbosa:1.0:2.0:3.0
# Jeandro Bezerra:7.0:8.0:9.0
# Marcos Dantas:5.0:4.0:6.0
# Michel Sales:3.0:4.0:2.0
# Crie um script chamado disciplina.awk que realize a seguinte ação:
# $ awk -F: -f disciplina.awk notas.txt
# Aluno:Situação:Média
# João Marcelo:Aprovado:10.0
# Alisson Barbosa:Reprovado:2.0
# Jeandro Bezerra:Aprovado:8.0
# Marcos Dantas:Final:5.0
# Michel Sales:Reprovado:3.0
# Média das Provas: 5.2 5.6 6.0

#!/usr/bin/awk
BEGIN {
    print "Aluno:Situação:Média"
}

NR > 1 {
    media = ($2 + $3 + $4) / 3
    if (media >= 7) {
        situacao = "Aprovado"
    } else if (media >= 4) {
        situacao = "Final"
    } else {
        situacao = "Reprovado"
    }
    # print $1 ":" situacao ":" media
    printf "%s:%s:%.1f\n", $1, situacao, media
    ap1 += $2
    ap2 += $3
    ap3 += $4
}

END {
    QTD = NR - 1
    printf "Média das Provas: %.1f %.1f %.1f\n", ap1/QTD, ap2/QTD, ap3/QTD
}