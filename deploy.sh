!/bin/bash

# Define cores para o terminal ficar organizado
VERDE='\033[0;32m'
AZUL='\033[0;34m'
AMARELO='\033[1;33m'
SEM_COR='\033[0m'

echo -e "${AZUL}🚀 [1/3] Puxando atualizações do GitHub...${SEM_COR}"
git pull

echo -e "${AMARELO}📦 [2/3] Reconstruindo as imagens Docker...${SEM_COR}"
# Dica: se o build demorar muito, você pode tirar o --no-cache para usar o cache de pacotes
docker compose -f copeiro.yml build --no-cache

echo -e "${VERDE}🔄 [3/3] Forçando a atualização no Docker Swarm...${SEM_COR}"
# Baseado no nome exato que apareceu no seu log anterior
docker service update --force copeiro_copeiro_frontend

echo -e "${VERDE}✨ Deploy finalizado com sucesso! O Swarm está reiniciando o container em background.${SEM_COR}"
echo -e "Dica: Use 'docker stack ps copeiro' para acompanhar o status."
