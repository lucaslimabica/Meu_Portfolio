#!/bin/bash

# Define cores para o terminal ficar organizado
VERDE='\033[0;32m'
AZUL='\033[0;34m'
SEM_COR='\033[0m'

echo -e "${AZUL}🚀 [1/2] Puxando atualizações do GitHub...${SEM_COR}"
git pull

echo -e "${VERDE}🔄 [2/2] Atualizando a Stack no Docker Swarm...${SEM_COR}"
docker stack deploy -c meu_portfolio.yml meu_portfolio

echo -e "${VERDE}✨ Deploy finalizado com sucesso!${SEM_COR}"
echo -e "Dica: Use 'docker stack ps meu_portfolio' para acompanhar o status."