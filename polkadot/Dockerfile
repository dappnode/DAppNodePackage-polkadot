ARG UPSTREAM_VERSION

FROM parity/polkadot:${UPSTREAM_VERSION}  

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# entrypoint.sh starts as root to fix the ownership of restored backup files, then runs the node
# as the image's polkadot user
USER root

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
