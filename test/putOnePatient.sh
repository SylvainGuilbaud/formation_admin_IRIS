#!/bin/bash

if [ "$2" = "training" ]; then
    BASE_URL="http://localhost:10000/irisapp/fhir/r4/Patient"
else
    BASE_URL="http://localhost:18880/iris-prod-1/irisapp/fhir/r4/Patient"    
fi
ID=$1
USERNAME="_system"
PASSWORD="SYS"

    JSON=$(cat <<EOF
{
  "resourceType": "Patient",
  "id": "$ID",
  "identifier": [
    { "system": "http://hospital.smarthealthit.org", "value": "$ID" },
    {
      "type": {
        "coding": [
          {
            "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code": "MR",
            "display": "Medical Record Number"
          }
        ],
        "text": "Medical Record Number"
      },
      "system": "http://hospital.smarthealthit.org",
      "value": "$ID"
    },
    {
      "type": {
        "coding": [
          {
            "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code": "SS",
            "display": "Social Security Number"
          }
        ],
        "text": "Social Security Number"
      },
      "system": "http://hl7.org/fhir/sid/us-ssn",
      "value": "$ID"
    }
  ],
  "name": [{ 
    "use": "official", 
    "family": "ADoe", 
    "given": ["AJane"] 
  }]
}

EOF
)
    
# Send PUT request
echo "Sending Patient..."
curl -X PUT "$BASE_URL/$ID" \
    -H "Content-Type: application/fhir+json" \
    -u "$USERNAME:$PASSWORD" \
    -d "$JSON"

echo "Completed request"