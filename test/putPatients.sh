#!/bin/bash

if [ "$2" = "training" ]; then
    BASE_URL="http://localhost:10000/irisapp/fhir/r4/Patient"
else
    BASE_URL="http://localhost:18880/iris-prod-1/irisapp/fhir/r4/Patient"    
fi

USERNAME="_system"
PASSWORD="SYS"
ITERATIONS=${1:-10}

# Arrays for random values for firstnames
FIRST_NAMES+=("Jean" "Marie" "Pierre" "Sophie" "Cécile" "Michel" "Francoise" "Luc" "Claire" "David")
FIRST_NAMES+=("Isabelle" "Nicolas" "Émilie" "Alain" "Caroline" "James" "John" "Robert" "Michael" "William")
FIRST_NAMES+=("David" "Richard" "Joseph" "Thomas" "Charles" "Mary" "Patricia" "Jennifer" "Linda" "Barbara")
FIRST_NAMES+=("Elizabeth" "Susan" "Jessica" "Sarah" "Karen" "Juan" "Jose" "Carlos" "Luis" "Antonio")
FIRST_NAMES+=("Miguel" "Francisco" "Manuel" "Maria" "Carmen" "Rosa" "Isabel" "Ana" "Klaus" "Hans")
FIRST_NAMES+=("Gunter" "Wolfgang" "Helmut" "Brigitte" "Ursula" "Petra" "Silvia" "Marco" "Giuseppe" "Paolo")
FIRST_NAMES+=("Giovanni" "Antonio" "Maria" "Giovanna" "Francesca" "Rosa" "Elena" "Yuki" "Haruto" "Sakura")
FIRST_NAMES+=("Kenji" "Aiko" "Wei" "Li" "Mei" "Fang" "Jing" "Raj" "Priya" "Amit")
FIRST_NAMES+=("Sunita" "Vikram" "Omar" "Fatima" "Ahmed" "Layla" "Hassan" "Kofi" "Amara" "Chioma")
FIRST_NAMES+=("Emeka" "Ngozi" "Thabo" "Nomvula" "Sipho" "Zanele" "Bongani" "Lucas" "Gabriel" "Isabella")
FIRST_NAMES+=("Pedro" "Valentina" "Diego" "Camila" "Sebastián" "Daniela" "Mateo" "Aroha" "Tane" "Hemi")
FIRST_NAMES+=("Mere" "Rangi" "Wiremu" "Hana" "Paora" "Ngaio" "Tūhoe")
FIRST_NAMES+=("Oluwaseun" "Chukwuemeka" "Adaeze" "Seun" "Tunde" "Bola" "Yetunde" "Adaobi" "Chidi" "Nkem")
FIRST_NAMES+=("Amara" "Kwame" "Abena" "Kofi" "Ama" "Yaw" "Esi" "Kojo" "Akua" "Kwesi")
FIRST_NAMES+=("Fatou" "Moussa" "Aminata" "Mamadou" "Aissatou" "Ibrahima" "Mariama" "Ousmane" "Rokhaya" "Cheikh")
FIRST_NAMES+=("Leilani" "Kaimana" "Kealoha" "Makoa" "Nalani" "Kahale" "Kailani" "Maui" "Nohea" "Palani")
# Arrays for random values for lastnames
LAST_NAMES+=("DUCHEMIN" "MARTIN" "BERNARD" "THOMAS" "ROBERT" "RICHARD" "PETIT" "DUBOIS" "MOREAU" "SIMON")
LAST_NAMES+=("MICHEL" "LEFEBVRE" "LEROY" "ROUX" "SMITH" "JOHNSON" "WILLIAMS" "BROWN" "JONES" "GARCIA")
LAST_NAMES+=("MILLER" "DAVIS" "RODRIGUEZ" "MARTINEZ" "HERNANDEZ" "LOPEZ" "GONZALEZ" "WILSON" "ANDERSON")
LAST_NAMES+=("MUELLER" "SCHMIDT" "SCHNEIDER" "FISCHER" "WEBER" "MEYER" "WAGNER" "BECKER" "SCHULZ" "HOFFMANN")
LAST_NAMES+=("ROSSI" "RUSSO" "FERRARI" "BIANCHI" "ROMANO" "COLOMBO" "COSTA" "CONTI" "DE LUCA" "MANCINI")
LAST_NAMES+=("SANCHEZ" "PEREZ" "FERNANDEZ" "GARCIA" "TOLEDO" "GUTIERREZ" "MORALES" "VARGAS")
LAST_NAMES+=("TANAKA" "SUZUKI" "WATANABE" "ITO" "YAMAMOTO" "WANG" "LI" "ZHANG" "CHEN" "LIU")
LAST_NAMES+=("PATEL" "SHARMA" "SINGH" "KUMAR" "GUPTA" "AL-RASHID" "AL-FARSI" "HASSAN" "IBRAHIM" "MANSOUR")
LAST_NAMES+=("MENSAH" "OKAFOR" "DIALLO" "TRAORÉ" "NDIAYE" "DLAMINI" "NKOSI" "MOKOENA" "MOLEFE" "ZULU")
LAST_NAMES+=("SILVA" "OLIVEIRA" "SOUZA" "SANTOS" "FERREIRA" "MORALES" "REYES" "TORRES" "FLORES" "HERRERA")
LAST_NAMES+=("TANE" "PARATA" "NGATA" "HENARE" "WAITITI" "NGĀTI" "HĀPAI" "MĀHAKI" "TŪHOE" "RONGOMATĀNE")

GENDERS=("male" "female")
PREFIXES=("Mr." "Mrs." "Dr." "Prof.")
# Arrays for random values for cities
CITY=("PARIS" "LYON" "MARSEILLE" "TOULOUSE" "NICE" "NANTES" "STRASBOURG" "MONTPELLIER" "BORDEAUX" "LILLE")
CITY+=("RENNES" "SAINT-ETIENNE" "LE HAVRE" "LONDON" "NEW YORK" "LOS ANGELES" "CHICAGO" "TORONTO" "SYDNEY" "MELBOURNE")
CITY+=("TOKYO" "BEIJING" "SHANGHAI" "MUMBAI" "DELHI" "SAO PAULO" "RIO DE JANEIRO" "BUENOS AIRES" "MEXICO CITY" "BOGOTA")
CITY+=("CAIRO" "LAGOS" "NAIROBI" "JOHANNESBURG" "CAPE TOWN" "MOSCOW" "BERLIN" "MADRID" "ROME" "AMSTERDAM")
CITY+=("BRUSSELS" "VIENNA" "STOCKHOLM" "OSLO" "COPENHAGEN" "WARSAW" "PRAGUE" "BUDAPEST" "LISBON" "ATHENS")
CITY+=("ISTANBUL" "DUBAI" "SINGAPORE" "HONG KONG" "SEOUL" "BANGKOK" "JAKARTA" "MANILA" "KARACHI" "DHAKA")
CITY+=("CASABLANCA" "ACCRA" "ADDIS ABABA" "DAR ES SALAAM" "KINSHASA" "AUCKLAND" "WELLINGTON" "SUVA" "PORT MORESBY")
CITY+=("LIMA" "SANTIAGO" "BOGOTA" "CARACAS" "MONTEVIDEO" "ASUNCION")

# Arrays for random values for states/regions/provinces
STATE=("Île-de-France" "Auvergne-Rhône-Alpes" "Provence-Alpes-Côte d'Azur" "Occitanie" "Pays de la Loire" "Grand Est" "Hauts-de-France" "Bretagne" "Normandie" "Centre-Val de Loire" "Bourgogne-Franche-Comté" "Corse")
STATE+=("Bavaria" "North Rhine-Westphalia" "Baden-Württemberg" "Saxony")
STATE+=("Lombardy" "Tuscany" "Sicily")
STATE+=("Catalonia" "Andalusia" "Madrid")
STATE+=("England" "Scotland" "Wales")
STATE+=("California" "Texas" "New York" "Florida")
STATE+=("Ontario" "Quebec" "British Columbia")
STATE+=("New South Wales" "Victoria" "Queensland")
STATE+=("São Paulo" "Rio de Janeiro" "Minas Gerais")
STATE+=("Buenos Aires" "Córdoba" "Mendoza")
STATE+=("Jalisco" "Nuevo León" "Veracruz")
STATE+=("Gauteng" "Western Cape" "KwaZulu-Natal")
STATE+=("Lagos" "Kano" "Nairobi County" "Addis Ababa" "Cairo Governorate")
STATE+=("Maharashtra" "Uttar Pradesh" "Karnataka" "Tamil Nadu")
STATE+=("Tokyo" "Osaka" "Aichi")
STATE+=("Guangdong" "Shandong" "Jiangsu")
STATE+=("Western Australia" "Auckland" "Canterbury" "Wellington")

# Arrays for random values for postal codes
POSTAL_CODE=("75001" "69001" "13001" "31000" "06000" "44000" "67000" "34000" "33000" "37000" "21000" "20000")
POSTAL_CODE+=("10001" "90210" "60601" "77001" "85001" "30301" "98101" "02101" "19101" "20001")
POSTAL_CODE+=("SW1A 1AA" "EC1A 1BB" "W1A 0AX" "M1 1AE" "B1 1BB" "LS1 1BA" "E1 6AN" "WC2N 5DU")
POSTAL_CODE+=("10115" "20095" "80331" "50667" "01067" "70173" "60311" "40210" "30159" "90402")
POSTAL_CODE+=("75001" "75008" "75016" "69001" "13001" "06000" "31000" "67000" "33000" "44000")
POSTAL_CODE+=("00118" "20121" "80121" "50123" "10121" "40121" "16121" "90133" "30122" "70121")
POSTAL_CODE+=("28001" "08001" "41001" "29001" "46001" "48001" "15001" "47001" "50001" "18001")
POSTAL_CODE+=("100000" "200000" "300000" "110000" "210000" "310000" "400000" "500000" "610000" "710000")
POSTAL_CODE+=("100-0001" "150-0001" "160-0001" "530-0001" "460-0001" "600-0001" "700-0001" "810-0001")
POSTAL_CODE+=("110001" "400001" "600001" "700001" "500001" "560001" "380001" "302001" "226001" "440001")
POSTAL_CODE+=("01310-100" "20040-020" "30112-010" "40020-020" "69010-060" "80010-010" "90010-160")
POSTAL_CODE+=("1000" "1425" "5000" "8000" "4000" "2000" "3000" "6000" "7000" "9000")
POSTAL_CODE+=("2000" "2010" "3000" "4000" "5000" "6000" "6800" "7000" "7300" "0001")
POSTAL_CODE+=("1000" "2000" "3000" "4000" "5000" "6000" "7000" "8000" "0100" "0200")

# Arrays for random values for countries
COUNTRY+=("FR" "DE" "IT" "ES" "GB" "NL" "BE" "PT" "AT" "CH" "SE" "NO" "DK" "FI" "PL" "CZ" "HU" "RO" "GR" "TR")
COUNTRY+=("US" "CA" "MX" "BR" "AR" "CO" "CL" "PE" "VE" "EC" "BO" "PY" "UY" "GT" "CU" "DO" "HN" "SV" "NI" "CR")
COUNTRY+=("NG" "ZA" "EG" "KE" "ET" "GH" "TZ" "DZ" "MA" "SD" "UG" "CI" "CM" "MZ" "MG" "AO" "SN" "ZM" "ZW" "TN")
COUNTRY+=("CN" "IN" "JP" "KR" "ID" "PK" "BD" "VN" "TH" "PH" "MY" "SA" "AE" "IQ" "IR" "SY" "JO" "LB" "KW" "QA")
COUNTRY+=("AU" "NZ" "PG" "FJ" "SB" "VU" "WS" "TO" "KI" "FM")

ADDRESS_LINES=("1 rue de la Paix" "10 avenue des Champs-Élysées" "5 boulevard Saint-Michel" "20 place de la République" "15 rue du Faubourg Saint-Honoré")
ADDRESS_LINES+=("8 avenue de l'Opéra" "12 rue de Rivoli" "3 boulevard Haussmann" "18 place Vendôme" "7 rue de la Victoire")
ADDRESS_LINES+=("10 Downing Street" "221B Baker Street" "1 Oxford Street" "42 Wallaby Way")
ADDRESS_LINES+=("15 Unter den Linden" "23 Kurfürstendamm" "7 Via Veneto" "15 Calle de Alcalá" "20 Rua Augusta")
ADDRESS_LINES+=("5 Grote Marktstraat" "12 Ringstrasse" "8 Nybrogatan" "3 Karl Johans gate" "17 Strøget")
ADDRESS_LINES+=("45 Nowy Świat" "10 Václavské náměstí" "6 Váci utca")
ADDRESS_LINES+=("888 Fifth Avenue" "123 Main Street" "456 Sunset Boulevard" "1600 Pennsylvania Avenue" "742 Evergreen Terrace")
ADDRESS_LINES+=("100 Queen Street West" "999 Bay Street")
ADDRESS_LINES+=("50 Av. Paulista" "100 Rua das Flores" "500 Avenida 9 de Julio" "200 Paseo de la Reforma" "150 Avenida Corrientes" "300 Avenida Providencia")
ADDRESS_LINES+=("25 Nelson Mandela Square" "10 Long Street" "5 Uhuru Highway" "20 Kenyatta Avenue" "15 Liberation Road" "8 Lagos Island Street")
ADDRESS_LINES+=("30 Nile Corniche" "12 Mohammed V Boulevard" "7 Habib Bourguiba Avenue" "50 Tahrir Square")
ADDRESS_LINES+=("100 Nanjing Road" "50 Wangfujing Street" "8 Omotesando" "15 Gangnam-daero" "200 Orchard Road" "10 Sukhumvit Road" "5 Rizal Avenue" "30 Bund")
ADDRESS_LINES+=("20 Connaught Place" "15 MG Road")
ADDRESS_LINES+=("1 Martin Place" "200 Queen Street" "50 Lambton Quay" "10 Bourke Street" "5 Edward Street")

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