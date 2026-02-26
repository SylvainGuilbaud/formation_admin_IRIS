#!/bin/bash

# Configuration
BASE_URL="http://localhost:10000/irisapp/fhir/r4/Patient"

ITERATIONS=${2:-10}
USERNAME="_system"
PASSWORD="SYS"
ITERATIONS=${1:-10}

# Arrays for random values
FIRST_NAMES=("Jean" "Marie" "Pierre" "Sophie" "Cécile" "Michel" "Francoise" "Luc" "Claire" "David" "Isabelle" "Nicolas" "Émilie" "Alain" "Caroline")
LAST_NAMES=("DUCHEMIN" "MARTIN" "BERNARD" "THOMAS" "ROBERT" "RICHARD" "PETIT" "DUBOIS" "MOREAU" "LAURENT" "SIMON" "MICHEL" "LEFEBVRE" "LEROY" "ROUX")
GENDERS=("male" "female")
PREFIXES=("Mr." "Mrs." "Dr." "Prof.")
CITY=("PARIS" "LYON" "MARSEILLE" "TOULOUSE" "NICE" "NANTES" "STRASBOURG" "MONTPELLIER" "BORDEAUX" "LILLE" "RENNES" "SAINT-ETIENNE" "LE HAVRE")
STATE=("Île-de-France" "Auvergne-Rhône-Alpes" "Provence-Alpes-Côte d'Azur" "Occitanie" "Pays de la Loire" "Grand Est" "Hauts-de-France" "Bretagne" "Normandie" "Centre-Val de Loire" "Bourgogne-Franche-Comté" "Corse")
POSTAL_CODE=("75001" "69001" "13001" "31000" "06000" "44000" "67000" "34000" "33000" "37000" "21000" "20000")
COUNTRY=("FR" "US" "DE" "IT" "ES" "GB" "CA" "AU" "BR" "IN")
ADDRESS_LINES=("1 rue de la Paix" "10 avenue des Champs-Élysées" "5 boulevard Saint-Michel" "20 place de la République" "15 rue du Faubourg Saint-Honoré" "8 avenue de l'Opéra" "12 rue de Rivoli" "3 boulevard Haussmann" "18 place Vendôme" "7 rue de la Victoire")

# Function to generate random date
generate_random_date() {
    local year=$((1950 + RANDOM % 75))
    local month=$((1 + RANDOM % 12))
    local day=$((1 + RANDOM % 28))
    printf "%04d-%02d-%02d" $year $month $day
}

# Loop
for i in $(seq 1 $ITERATIONS); do
    ID="1000000$i"
    FIRST_NAME="${FIRST_NAMES[$RANDOM % ${#FIRST_NAMES[@]}]}"
    LAST_NAME="${LAST_NAMES[$RANDOM % ${#LAST_NAMES[@]}]}"
    GENDER="${GENDERS[$RANDOM % ${#GENDERS[@]}]}"
    BIRTH_DATE=$(generate_random_date)
    PREFIX="${PREFIXES[$RANDOM % ${#PREFIXES[@]}]}"
    
    # Create JSON payload
    JSON=$(cat <<EOF
{
    "resourceType": "Patient",
    "id": "$ID",
    "identifier": [
        {
            "system": "http://hospital.smarthealthit.org",
            "value": "$ID"
        },
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
    "name": [
        {
            "use": "official",
            "family": "$LAST_NAME",
            "given": ["$FIRST_NAME"],
            "prefix": ["$PREFIX"]
        }
    ],
    "gender": "$GENDER",
    "birthDate": "$BIRTH_DATE",
    "address": [
          {
            "line": [
              "${ADDRESS_LINES[$RANDOM % ${#ADDRESS_LINES[@]}]}"
            ],
            "city": "${CITY[$RANDOM % ${#CITY[@]}]}",
            "state": "${STATE[$RANDOM % ${#STATE[@]}]}",
            "postalCode": "${POSTAL_CODE[$RANDOM % ${#POSTAL_CODE[@]}]}",
            "country": "${COUNTRY[$RANDOM % ${#COUNTRY[@]}]}"
          }
        ],
     "meta": {
        "lastUpdated": "2026-02-24T11:07:14Z",
        "versionId": "4"
    }
}
EOF
)
    
    # Send PUT request
    echo "Iteration $i: Sending Patient $ID ..."
    curl -X PUT "$BASE_URL/$ID" \
        -H "Content-Type: application/fhir+json" \
        -u "$USERNAME:$PASSWORD" \
        -d "$JSON"
    
    echo ""
done

echo "Completed $ITERATIONS requests"