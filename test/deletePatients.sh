#!/bin/bash

if [ "$2" = "training" ]; then
    BASE_URL="http://localhost:10000/irisapp/fhir/r4/Patient"
else
    BASE_URL="http://localhost:18880/iris-prod-1/irisapp/fhir/r4/Patient"    
fi

USERNAME="_system"
PASSWORD="SYS"
ITERATIONS=${1:-10}

# Loop
for i in $(seq 1 $ITERATIONS); do
    ID="1000000$i"
    # Send DELETE request
    
    echo "Iteration $i: Sending Patient $ID ..."
    curl -X DELETE "$BASE_URL/$ID" \
        -H "Content-Type: application/fhir+json" \
        -u "$USERNAME:$PASSWORD"
    
    echo ""
done

echo "Completed $ITERATIONS DELETE requests"