#!/bin/bash

# Restore script for iris-training
# Restores databases from a specified backup directory

CONTAINER_NAME="${1:-iris-training}"
BACKUP_DIR="./backup"

if [ ! -d "${BACKUP_DIR}/${CONTAINER_NAME}" ]; then
    echo "ERROR: Backup directory ${BACKUP_DIR}/${CONTAINER_NAME} does not exist."
    exit 1
fi
TIMESTAMP=$(ls -1t "${BACKUP_DIR}/${CONTAINER_NAME}" | while read entry; do
    if [ -d "${BACKUP_DIR}/${CONTAINER_NAME}/${entry}" ]; then
        echo "${entry}"
        break
    fi
done)

if [ -z "${TIMESTAMP}" ]; then
    echo "ERROR: No backup directory found in ${BACKUP_DIR}/${CONTAINER_NAME}."
    exit 1
fi

BACKUP_PATH="${BACKUP_DIR}/${CONTAINER_NAME}/${TIMESTAMP}"

if [ ! -d "${BACKUP_PATH}" ]; then
    echo "ERROR: Backup directory ${BACKUP_PATH} does not exist."
    exit 1
fi

DATABASES_PATH="${BACKUP_PATH}/databases"
if [ ! -d "${DATABASES_PATH}" ]; then
    echo "ERROR: Databases directory ${DATABASES_PATH} does not exist in the backup."
    exit 1
fi

DATABASE_TO_RESTORE="${2:-IRISAPP}"
echo "Database to restore: ${DATABASE_TO_RESTORE}"

echo "Restoring IRIS database ${DATABASE_TO_RESTORE} from backup: ${BACKUP_PATH}"
# Step 1: Stop the IRIS container
echo "Stopping IRIS container: ${CONTAINER_NAME}"
docker stop "${CONTAINER_NAME}"
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to stop IRIS container ${CONTAINER_NAME}"
    exit 1
fi  

# Step 2: Copy backup files to the container
echo "Copying backup files to container: ${CONTAINER_NAME}"
docker cp "${BACKUP_PATH}/databases/mgr/${DATABASE_TO_RESTORE}" "${CONTAINER_NAME}:/databases/mgr/." >> /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to copy backup files to container ${CONTAINER_NAME}"
    exit 1
fi
docker exec -ti "${CONTAINER_NAME}" rm -f /databases/mgr/${DATABASE_TO_RESTORE}/iris.lck >> /dev/null 2>&1

# Step 3: Start the IRIS container
echo "Starting IRIS container: ${CONTAINER_NAME}"
docker start "${CONTAINER_NAME}"
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to start IRIS container ${CONTAINER_NAME}"
    exit 1
fi