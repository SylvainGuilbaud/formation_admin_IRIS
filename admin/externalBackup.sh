#!/bin/bash

# External backup script for IRIS-DEV
# Uses iris freeze/thaw to ensure data consistency during backup

CONTAINER_NAME="${1:-iris-dev}"

INSTANCE="iris"
SOURCE_DIR="./databases/"${CONTAINER_NAME}
BACKUP_DIR="./backup/"${CONTAINER_NAME}
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DEST="${BACKUP_DIR}/${TIMESTAMP}"
LOG_FILE="${BACKUP_DIR}/${CONTAINER_NAME}-backup-${TIMESTAMP}.log"

# Create backup directory if it doesn't exist
mkdir -p "${BACKUP_DIR}"

echo "$(date) - Starting external backup of ${CONTAINER_NAME}" | tee -a "${LOG_FILE}"

# Step 1: Freeze IRIS instance
echo "$(date) - Freezing IRIS instance: ${INSTANCE}" | tee -a "${LOG_FILE}"
docker exec -ti "${CONTAINER_NAME}" iris freeze "${INSTANCE}" >> "${LOG_FILE}" 2>&1
if [ $? -ne 0 ]; then
    echo "$(date) - ERROR: Failed to freeze IRIS instance ${INSTANCE}" | tee -a "${LOG_FILE}"
    exit 1
fi
echo "$(date) - IRIS instance frozen successfully" | tee -a "${LOG_FILE}"

# Step 2: Copy databases
echo "$(date) - Copying databases from ${SOURCE_DIR} to ${BACKUP_DEST}" | tee -a "${LOG_FILE}"
mkdir -p "${BACKUP_DEST}"
cp -R "${SOURCE_DIR}" "${BACKUP_DEST}" >> "${LOG_FILE}" 2>&1
COPY_STATUS=$?

# Step 3: Thaw IRIS instance (always executed, even if copy failed)
echo "$(date) - Thawing IRIS instance: ${INSTANCE}" | tee -a "${LOG_FILE}"
docker exec -ti "${CONTAINER_NAME}" iris thaw "${INSTANCE}" >> "${LOG_FILE}" 2>&1
if [ $? -ne 0 ]; then
    echo "$(date) - ERROR: Failed to thaw IRIS instance ${INSTANCE}" | tee -a "${LOG_FILE}"
    exit 1
fi
echo "$(date) - IRIS instance thawed successfully" | tee -a "${LOG_FILE}"

# Check copy status
if [ ${COPY_STATUS} -ne 0 ]; then
    echo "$(date) - ERROR: Failed to copy databases from ${SOURCE_DIR}" | tee -a "${LOG_FILE}"
    exit 1
fi

echo "$(date) - External backup completed successfully. Backup stored in: ${BACKUP_DEST}" | tee -a "${LOG_FILE}"
exit 0