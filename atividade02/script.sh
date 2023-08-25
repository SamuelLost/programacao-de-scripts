#!/bin/bash

dir_atividade02=$(pwd)
dir_disciplinas="$dir_atividade02/disciplinas"
dir_professores="$dir_atividade02/professores"
dir_historico="$dir_atividade02/historico"

mkdir -p "$dir_disciplinas" "$dir_professores" "$dir_historico"

if [[ -d "$dir_disciplinas/*" && -d "$dir_professores/*" && -d "$dir_historico/*" ]]; then
    rm -r "$dir_disciplinas"/* "$dir_professores"/* "$dir_historico"/*
else 
    rm -r "$dir_disciplinas" "$dir_professores" "$dir_historico"
    mkdir -p "$dir_disciplinas" "$dir_professores" "$dir_historico"
fi

wget https://www.quixada.ufc.br/docente/ -qO docentes.html

professores=$(grep -o '<a href="https://www.quixada.ufc.br/docente/[^"]*"' docentes.html \
                | cut -d "/" -f5 | cut -d '"' -f1 | uniq | tr "-" "_")


IFS=$'\n' professores=($professores) #Transforma a string em array

# Adicionar professores que saíram
professores+=("diego_caitano_de_pinho") 
professores+=("emiliano_sousa_pontes")

# Ordernar professores
professores=($(printf '%s\n' "${professores[@]}" | LC_COLLATE=C sort))

# printf "%s\n" "${professores[@]}"
# Iterar pelos nomes
for i in "${!professores[@]}"; do
    if [[ "${professores[i]}" == "joao" ]]; then
        professores[i]+="_vilnei_de_oliveira_filho"
    fi
    if [[ "${professores[i]}" == "diana_medina" ]]; then
        professores[i]="diana_patricia_medina_pereira"
    fi
done

# cd professores/
# printf "%s\n" "${professores[@]}" | xargs -I {} touch {}.txt
> lista_de_professores.txt # Limpa o arquivo
for nome in "${professores[@]}"; do
    touch $dir_professores/"$nome".txt
    echo "$nome" >> lista_de_professores.txt
done

cd $dir_atividade02

cat lista_de_disciplinas.txt | xargs -I {} touch $dir_disciplinas/{}.txt
cat lista_de_disciplinas.txt | xargs -I {} mkdir -p $dir_historico/{}

# Disciplinas não registradas no histórico
rm -r $dir_historico/{trabalho_de_conclusao_de_curso_1,projeto_de_pesquisa_cientifica_e_tecnologica,trabalho_de_conclusao_de_curso_2}

cd $dir_historico

# Disciplinas do primeiro semestre
cd introducao_a_engenharia_de_computacao
ln -s ../../disciplinas/introducao_a_engenharia_de_computacao.txt programa
ln -s ../../professores/wagner_guimaraes_al_alam.txt professor

cd ../matematica_basica
ln -s ../../disciplinas/matematica_basica.txt programa
ln -s ../../professores/francisco_erivelton_fernandes_de_aragao.txt professor

cd ../fundamentos_de_programacao
ln -s ../../disciplinas/fundamentos_de_programacao.txt programa
ln -s ../../professores/maria_viviane_de_menezes.txt professora

cd ../etica_direito_e_legislacao
ln -s ../../disciplinas/etica_direito_e_legislacao.txt programa 
ln -s ../../professores/emiliano_sousa_pontes.txt professor

cd ../pre_calculo
ln -s ../../disciplinas/pre_calculo.txt programa
ln -s ../../professores/andre_ribeiro_braga.txt professor

cd ../circuitos_digitais
ln -s ../../disciplinas/circuitos_digitais.txt programa
ln -s ../../professores/elvis_miguel_galeas_stancanelli.txt professor

# Disciplinas do segundo semestre
cd ../calculo_diferencial_e_integral_1
ln -s ../../disciplinas/calculo_diferencial_e_integral_1.txt programa
ln -s ../../professores/antonio_joel_ramiro_de_castro.txt professor

cd ../matematica_discreta
ln -s ../../disciplinas/matematica_discreta.txt programa
ln -s ../../professores/arthur_rodrigues_araruna.txt professor

cd ../estrutura_de_dados
ln -s ../../disciplinas/estrutura_de_dados.txt programa
ln -s ../../professores/davi_romero_de_vasconcelos.txt professor

cd ../algebra_linear
ln -s ../../disciplinas/algebra_linear.txt programa
ln -s ../../professores/paulo_henrique_macedo_de_araujo.txt professor

cd ../introducao_a_arquitetura_de_computadores
ln -s ../../disciplinas/introducao_a_arquitetura_de_computadores.txt programa
ln -s ../../professores/wagner_guimaraes_al_alam.txt professor

# Disciplinas do terceiro semestre
cd ../probabilidade_e_estatistica
ln -s ../../disciplinas/probabilidade_e_estatistica.txt programa
ln -s ../../professores/paulo_armando_cavalcante_aguilar.txt professor

cd ../arquitetura_e_organizacao_de_computadores_1
ln -s ../../disciplinas/arquitetura_e_organizacao_de_computadores_1.txt programa
ln -s ../../professores/wagner_guimaraes_al_alam.txt professor

cd ../calculo_diferencial_e_integral_2
ln -s ../../disciplinas/calculo_diferencial_e_integral_2.txt programa
ln -s ../../professores/antonio_joel_ramiro_de_castro.txt professor

cd ../sistemas_operacionais_1
ln -s ../../disciplinas/sistemas_operacionais_1.txt programa
ln -s ../../professores/andre_ribeiro_braga.txt professor

cd ../tecnicas_programacao_para_sistemas_embarcados_1
ln -s ../../disciplinas/tecnicas_programacao_para_sistemas_embarcados_1.txt programa
ln -s ../../professores/francisco_helder_candido_dos_santos_filho.txt professor

# Disciplinas do quarto semestre
cd ../arquitetura_e_organizacao_de_computadores_2
ln -s ../../disciplinas/arquitetura_e_organizacao_de_computadores_2.txt programa
ln -s ../../professores/roberto_cabral_rabelo_filho.txt professor

cd ../redes_de_computadores
ln -s ../../disciplinas/redes_de_computadores.txt programa
ln -s ../../professores/antonio_rafael_braga.txt professor

cd ../calculo_diferencial_e_integral_3
ln -s ../../disciplinas/calculo_diferencial_e_integral_3.txt programa
ln -s ../../professores/antonio_joel_ramiro_de_castro.txt professor

cd ../equacoes_diferenciais
ln -s ../../disciplinas/equacoes_diferenciais.txt programa
ln -s ../../professores/antonio_joel_ramiro_de_castro.txt professor

cd ../sistemas_operacionais_2
ln -s ../../disciplinas/sistemas_operacionais_2.txt programa
ln -s ../../professores/andre_ribeiro_braga.txt professor

# Disciplinas do quinto semestre
cd ../logica_para_computacao
ln -s ../../disciplinas/logica_para_computacao.txt programa
ln -s ../../professores/maria_viviane_de_menezes.txt professora

cd ../analise_de_circuitos
ln -s ../../disciplinas/analise_de_circuitos.txt programa
ln -s ../../professores/paulo_armando_cavalcante_aguilar.txt professor

cd ../eletricidade_e_magnetismo
ln -s ../../disciplinas/eletricidade_e_magnetismo.txt programa
ln -s ../../professores/antonio_joel_ramiro_de_castro.txt professor

cd ../sistemas_digitais_para_computadores
ln -s ../../disciplinas/sistemas_digitais_para_computadores.txt programa
ln -s ../../professores/thiago_werlley_bandeira_da_silva.txt professor

# Disciplinas do sexto semestre
cd ../linguagens_formais_e_automatos
ln -s ../../disciplinas/linguagens_formais_e_automatos.txt programa
ln -s ../../professores/carlos_roberto_rodrigues_filho.txt professor

cd ../sistemas_distribuidos
ln -s ../../disciplinas/sistemas_distribuidos.txt programa
ln -s ../../professores/marcos_dantas_ortiz.txt professor

cd ../eletronica_fundamental_1
ln -s ../../disciplinas/eletronica_fundamental_1.txt programa
ln -s ../../professores/elvis_miguel_galeas_stancanelli.txt professor

cd ../sinais_e_sistemas
ln -s ../../disciplinas/sinais_e_sistemas.txt programa
ln -s ../../professores/andre_ribeiro_braga.txt professor

# Disciplinas do sétimo semestre
cd ../eletronica_fundamental_2
ln -s ../../disciplinas/eletronica_fundamental_2.txt programa
ln -s ../../professores/elvis_miguel_galeas_stancanelli.txt professor

cd ../microcontroladores
ln -s ../../disciplinas/microcontroladores.txt programa
ln -s ../../professores/thiago_werlley_bandeira_da_silva.txt professor

cd ../sistemas_de_tempo_real
ln -s ../../disciplinas/sistemas_de_tempo_real.txt programa
ln -s ../../professores/francisco_helder_candido_dos_santos_filho.txt professor

cd ../sistemas_de_automacao_e_controle
ln -s ../../disciplinas/sistemas_de_automacao_e_controle.txt programa
ln -s ../../professores/paulo_armando_cavalcante_aguilar.txt professor

# Disciplinas do oitavo semestre
cd ../instrumentacao
ln -s ../../disciplinas/instrumentacao.txt programa
ln -s ../../professores/luis_rodolfo_reboucas_coutinho.txt professor

cd ../tecnicas_programacao_para_sistemas_embarcados_2
ln -s ../../disciplinas/tecnicas_programacao_para_sistemas_embarcados_2.txt programa
ln -s ../../professores/francisco_helder_candido_dos_santos_filho.txt professor

cd ../sistemas_embarcados
ln -s ../../disciplinas/sistemas_embarcados.txt programa
ln -s ../../professores/andre_ribeiro_braga.txt professor

# Disciplinas do nono semestre
cd ../engenharia_de_software
ln -s ../../disciplinas/engenharia_de_software.txt programa
ln -s ../../professores/emanuel_ferreira_coutinho.txt professor