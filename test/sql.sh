#!/bin/bash
# if [ "$2" = "training" ]; then
#     BASE_URL="http://localhost:10000/sqltofhir/sql/"
# else
#     BASE_URL="http://localhost:18880/iris-prod-1/sqltofhir/sql/"    
# fi
BASE_URL="http://localhost:10000/sqltofhir/sql"
ID=${1:-1}
USERNAME="_system"
PASSWORD="SYS"

echo "Sending $BASE_URL/$ID ..."
curl -X GET "$BASE_URL/$ID" \
        -H "Content-Type: application/json" \
        -u "$USERNAME:$PASSWORD"

echo ""