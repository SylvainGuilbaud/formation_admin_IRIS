#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Building Docker images...${NC}"
# Parse command line arguments
IMAGE_IRIS_DEV_PREVIEW=${IMAGE_IRIS_DEV_PREVIEW:-"iris:dev"}
IMAGE_IRIS_PROD_PREVIEW=${IMAGE_IRIS_PROD_PREVIEW:-"iris:prod"}

# Accept overrides from command line arguments
if [ $# -ge 1 ]; then
    IMAGE_IRIS_DEV_PREVIEW=$1
fi
if [ $# -ge 2 ]; then
    IMAGE_IRIS_PROD_PREVIEW=$2
fi

echo -e "${YELLOW}Using IMAGE_IRIS_DEV_PREVIEW=${IMAGE_IRIS_DEV_PREVIEW}${NC}"
echo -e "${YELLOW}Using IMAGE_IRIS_PROD_PREVIEW=${IMAGE_IRIS_PROD_PREVIEW}${NC}"
# Build development image
echo -e "${YELLOW}Building dev image...${NC}"
docker build -t formation-admin-iris:dev -f iris-dev/Dockerfile .
echo -e "${GREEN}Dev image built successfully${NC}"

# Build production image
echo -e "${YELLOW}Building prod image...${NC}"
docker build -t formation-admin-iris:prod -f iris-prod/Dockerfile .
echo -e "${GREEN}Prod image built successfully${NC}"

# Build notebook image
echo -e "${YELLOW}Building notebook image...${NC}"
docker build -t formation-admin-iris:notebook -f notebook/Dockerfile .
echo -e "${GREEN}Notebook image built successfully${NC}"