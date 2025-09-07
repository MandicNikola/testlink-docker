#!/bin/bash

set -e  # prekini ako neka komanda padne

# 0. Provera da li Docker postoji
if ! command -v docker &> /dev/null; then
    echo "❌ Docker nije instaliran ili nije u PATH. Instaliraj Docker pre pokretanja ove skripte."
    exit 1
else
    echo "✅ Docker je pronađen."
fi

# 1. Pređi na Desktop korisnika
cd ~/Desktop
echo ">> Trenutni direktorijum: $(pwd)"

# 2. Ako folder postoji -> obriši ga
if [ -d "testlink-docker" ]; then
  echo ">> Brišem postojeći folder testlink-docker..."
  rm -rf testlink-docker
fi

# 3. Kloniranje repozitorijuma
echo ">> Kloniram repozitorijum..."
git clone https://github.com/MandicNikola/testlink-docker

# 4. Ulazak u direktorijum
cd testlink-docker

echo ">> Brišem Docker volumene (ako postoje)..."
docker compose down -v || true

# 5. Brisanje volumena
# docker volume rm -f testlink_data mariadb_testlink_data || true

# 6. Pokretanje sa build-om
echo ">> Pokrećem docker compose za TestLink sa build-om..."
docker compose up --build -d

cd student-ftn

echo ">> Pokrećem docker compose down za StudentFTN sa build-om..."
docker compose down -v

echo ">> Pokrećem docker compose za StudentFTN sa build-om..."
docker compose up --build -d




