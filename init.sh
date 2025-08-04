#!/bin/bash

echo "⏳ Initialisation de Zammad..."

# Lancer les services
docker-compose up -d

# Attendre que la DB soit prête
sleep 20

# Initialiser la base
docker-compose exec -T zammad bash -c "
  zammad run rake db:create db:migrate
  zammad run rake assets:precompile
  zammad run rake db:seed
"

echo "✅ Zammad est prêt à l'adresse http://localhost:3000"
