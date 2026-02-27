#!/bin/sh
# This script is used to set the correct permissions on the persistent_data volume 
# in order to allow the IRIS container to read and write to it without issues.
docker run --rm -v docker_persistent_data:/persistent_data alpine sh -c \
"chown -R 51773:51773 /persistent_data && chmod -R u+rwX,g+rwX /persistent_data"