# Escreva um script chamado saudacao.sh que imprima a seguinte saudação ao ser executado:
# Olá joaomarcelo,
# Hoje é dia 31, do mês 08 do ano de 2023.
# Instruções:
# 1. No lugar de joaomarcelo, deve ser exibido o usuário que está executando o script.
# 2. A data exibida deve ser a data atual da execução, sendo que o script deve
# funcionar sem alterações seja qual for o dia que for executado.
# 3. Dica: você pode usar os comandos echo, who e date.
# 4. Veja mais informações sobre o date em Formatando o Date.
# Por último, toda vez que o script for executado, além de exibir a saudação na tela, deve
# anexar a saudação ao arquivo saudacao.log no mesmo diretório de execução.

# Resposta:
echo "Olá $(whoami),\nHoje é dia $(date +%d), do mês $(date +%m) do ano de $(date +%Y)." | tee -a saudacao.log