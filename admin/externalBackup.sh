#!/bin/bash

# External backup script for iris-training
# Uses iris freeze/thaw to ensure data consistency during backup

CONTAINER_NAME="${1:-iris-training}"
NAME="${CONTAINER_NAME/iris-/}"
INSTANCE="iris"
SOURCE_DIR="${CONTAINER_NAME}:/databases"
BACKUP_DIR="./backup/"${CONTAINER_NAME}
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DEST="${BACKUP_DIR}/${TIMESTAMP}"
LOG_FILE="${BACKUP_DIR}/${CONTAINER_NAME}-backup-${TIMESTAMP}.log"
WIJ_DIR="${CONTAINER_NAME}:/WIJ"
JOURNAL_DIR="${CONTAINER_NAME}:/journal"
JOURNAL2_DIR="${CONTAINER_NAME}:/journal2"

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
docker cp "${SOURCE_DIR}" "${BACKUP_DEST}" >> "${LOG_FILE}" 2>&1
docker cp "${WIJ_DIR}" "${BACKUP_DEST}" >> "${LOG_FILE}" 2>&1
docker cp "${JOURNAL_DIR}" "${BACKUP_DEST}" >> "${LOG_FILE}" 2>&1
docker cp "${JOURNAL2_DIR}" "${BACKUP_DEST}" >> "${LOG_FILE}" 2>&1
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

# Step 4: ExternalSetHistory - adds an entry to the backup history and counts that backup in the journal purge criteria
echo "$(date) - Setting backup history for ${CONTAINER_NAME}" | tee -a "${LOG_FILE}"
docker exec -ti "${CONTAINER_NAME}" iris session iris -U %SYS "##class(Backup.General).ExternalSetHistory(\"${LOG_FILE}\", \"External Backup of ${NAME} on ${TIMESTAMP}\")" 
if [ $? -ne 0 ]; then
    echo "$(date) - ERROR: Failed to set backup history for ${CONTAINER_NAME}" | tee -a "${LOG_FILE}"
    exit 1
fi
echo "$(date) - Backup history set successfully for ${CONTAINER_NAME}" | tee -a "${LOG_FILE}"
exit 0