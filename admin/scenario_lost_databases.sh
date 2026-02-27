#!/bin/bash
# Script to simulate the loss of IRISAPP database in IRIS containers
CONTAINER_NAME="${1:-iris-training}"
LOG_FILE="./lost_databases_${CONTAINER_NAME}.log"
DATABASES_TO_DELETE="IRISAPP"
echo "This scenario will simulate the deletion of ${DATABASES_TO_DELETE} database files and attempt to recover them using the backup and restore process."
echo "Step 1: Deleting ${DATABASES_TO_DELETE} database files from container: ${CONTAINER_NAME} ..."
docker exec -ti "${CONTAINER_NAME}" rm -rf /databases/mgr/${DATABASES_TO_DELETE} | tee -a "${LOG_FILE}"   
echo "Step 2: Attempting to restore the IRIS instance using the backup and restore process..."
./restore.sh "${CONTAINER_NAME}" "${DATABASES_TO_DELETE}" | tee -a "${LOG_FILE}"
echo "Step 3: Verifying the restoration of the ${DATABASES_TO_DELETE} database..."
docker exec -ti "${CONTAINER_NAME}" ls /databases/mgr/${DATABASES_TO_DELETE}* | tee -a "${LOG_FILE}"
echo "Scenario completed. Check ${LOG_FILE} for details of the operations performed and the results."