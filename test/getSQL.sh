#!/bin/bash

if [ "$2" = "training" ]; then
    BASE_URL="http://localhost:10000/sqltofhir/sql"
else
    BASE_URL="http://localhost:18880/iris-prod-1/sqltofhir/sql"    
fi

USERNAME="_system"
PASSWORD="SYS"
ITERATIONS=${1:-10}

# Loop
for i in $(seq 1 $ITERATIONS); do
    ID="$i"
    # Send GET request  
    echo "Iteration $i: Sending SQL $BASE_URL/$ID ..."
    curl -X GET "$BASE_URL/$ID" \
        -H "Content-Type: application/json" \
        -u "$USERNAME:$PASSWORD"
    echo ""
done
echo "Completed $ITERATIONS GET requests"
