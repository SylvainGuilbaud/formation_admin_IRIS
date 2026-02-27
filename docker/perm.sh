docker run --rm -v docker_persistent_data:/persistent_data alpine sh -c \
"chown -R 51773:51773 /persistent_data && chmod -R u+rwX,g+rwX /persistent_data"