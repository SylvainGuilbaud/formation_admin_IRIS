#!/bin/bash

# Obtenir le nom de la machine
name=$(uname -n)
prod="iris-prod-1"

if [ "$name" == $prod ]; then
    docker compose down
else
    docker compose down   
fi
