#!/bin/bash
CONTAINER=${1:-iris-training}

if [ "$1" = "prod1" ]; then
    CONTAINER=iris-prod-1
elif [ "$1" = "prod2" ]; then
    CONTAINER=iris-prod-2
fi

docker inspect --format='{{.State.Health.Status}}' "$CONTAINER"

if [ $? -ne 0 ]; then
  echo "Container $CONTAINER not found"
  exit 1
fi
