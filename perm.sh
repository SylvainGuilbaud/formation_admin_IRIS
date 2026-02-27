#!/bin/sh
# This script is used to set the correct permissions on the persistent volume 
# in order to allow the IRIS container to read and write to it without issues.

# Get the last directory of $PWD to replace docker_ in volume_name
PROJECT_NAME=$(basename "$PWD" | tr '[:upper:]' '[:lower:]')

set_permissions() {
    local volume_name="${PROJECT_NAME}_$1"
    local mount_point="/$1"
    docker run --rm -v "${volume_name}:${mount_point}" alpine sh -c \
        "chown -R 51773:51773 ${mount_point} && chmod -R u+rwX,g+rwX ${mount_point}"
}

# Set permissions for the persistent volume
set_permissions "databases_training"
set_permissions "journal_training"
set_permissions "journal2_training"
set_permissions "WIJ_training"  
set_permissions "databases_prod_1"
set_permissions "journal_prod_1"
set_permissions "journal2_prod_1"
set_permissions "WIJ_prod_1"
set_permissions "databases_prod_2"
set_permissions "journal_prod_2"
set_permissions "journal2_prod_2"
set_permissions "WIJ_prod_2"