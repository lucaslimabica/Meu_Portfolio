#!/bin/bash

# Define cores para o terminal ficar organizado
VERDE='\033[0;32m'
AZUL='\033[0;34m'
AMARELO='\033[1;33m'
SEM_COR='\033[0m'

echo -e "${AZUL}🚀 [1/3] Puxando atualizações do GitHub...${SEM_COR}"
git pull

echo -e "${AMARELO}📦 [2/3] Reconstruindo as imagens Docker localmente...${SEM_COR}"
# Mantive o build do compose que você fez, ele funciona perfeito para buildar a imagem local
docker compose -f meu_portfolio.yml build --no-cache

echo -e "${VERDE}🔄 [3/3] Atualizando a Stack no Docker Swarm...${SEM_COR}"
# Em vez de 'service update --force', usamos o stack deploy. 
# Ele vai notar a imagem nova buildada e atualizar o serviço 'meu_portfolio_meu_portfolio' automaticamente.
docker stack deploy -c meu_portfolio.yml meu_portfolio

echo -e "${VERDE}✨ Deploy finalizado com sucesso! O Swarm está atualizando o container em background.${SEM_COR}"
echo -e "Dica: Use 'docker stack ps meu_portfolio' para acompanhar o status."
