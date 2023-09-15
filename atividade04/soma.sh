# Crie um arquivo de texto chamado compras.txt com o seguinte conteúdo:
# Playstation5 4999
# MacBook 9799
# GalaxyS20Ultra 5499
# iPad 3499
# SmartTV554k 2799
# Em seguida, crie um script chamado soma.sh que faça a soma valor total dos produtos
# comprados. Não use laços, apenas pipe e os comandos vistos em aula.

# Resposta:
cat compras.txt | cut -d " " -f2 | paste -s -d '+' | bc