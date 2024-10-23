#!/bin/bash

CONTAINER_NAME=iris-prod-1
MAX_RETRIES=30
RETRY_INTERVAL=5

check_container() {
  docker inspect -f '{{.State.Running}}' $CONTAINER_NAME 2>/dev/null
}

wait_for_container() {
  local retries=0
  until [ "$(check_container)" == "true" ] || [ $retries -eq $MAX_RETRIES ]; do
    echo "En attente du démarrage du conteneur $CONTAINER_NAME..."
    sleep $RETRY_INTERVAL
    ((retries++))
  done

  if [ $retries -eq $MAX_RETRIES ]; then
    echo "Échec du démarrage du conteneur $CONTAINER_NAME après $MAX_RETRIES tentatives."
    exit 1
  fi

  echo "Le conteneur $CONTAINER_NAME est démarré et prêt !"
}

# Obtenir le nom de la machine pour déterminer le fichier iris.key à copier
name=$(uname -n)
targetname="targetname"

if [ "$name" == $targetname ]; then
    source_file="./key/iris-amd.key"
    echo "Fichier $source_file sélectionné"
elif [ "$name" == "FRMBP16M1GUILBAUD" ]; then
    source_file="./key/iris-arm.key"
    echo "Fichier $source_file sélectionné"
else
    echo "Serveur non pris en charge : $name"
    exit 1
fi

# Créer les répertoires si nécessaire et copier le fichier
for dir in "./iris-prod/key"; do
    mkdir -p "$dir"  # Crée le répertoire s'il n'existe pas
    cp "$source_file" "$dir/iris.key"
    echo "Fichier $source_file copié vers $dir/iris.key"
done

if [ "$name" == $targetname ]; then
    export TARGETARCH="amd64"
    docker compose up -d   
else
    export TARGETARCH="arm64"
    docker compose up -d  
    wait_for_container 
    docker exec -ti $CONTAINER_NAME sh /iris-prod-1/iris-prod-local.sh
fi
