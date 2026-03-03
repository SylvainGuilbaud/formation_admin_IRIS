#!/bin/bash

# Configuration
BASE_URL="localhost:10000"
NAMESPACE="IRISAPP"
SWAGGER_FILE="./REST/swagger/sqltofhir.json"
USERNAME="SuperUser"
PASSWORD="SYS"
APP_NAME="sqltofhir"

# Check if swagger file exists
if [ ! -f "$SWAGGER_FILE" ]; then
    echo "Error: Swagger file not found at $SWAGGER_FILE"
    exit 1
fi

# POST request to create REST application
curl -s -X POST \
    "http://${BASE_URL}/api/mgmnt/v2/${NAMESPACE}/${APP_NAME}" \
    -H "Content-Type: application/json" \
    -u "${USERNAME}:${PASSWORD}" \
    -d @"${SWAGGER_FILE}" 

echo "Done."